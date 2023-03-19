from datetime import datetime
import logging

from converters.SFCountyRecordConverter import SFCountyRecordConverter
from database.db_connection_setup import DBConnectionSetup
from database.parcel_insert import ParcelInserter
from simple_term_menu import TerminalMenu
from pyinputplus import inputYesNo, inputPassword, inputFilepath
import csv


def configure_logger(log_file_name='./log/prop13importer'):
    current_datetime = datetime.now()
    datetime_string = current_datetime.strftime("%Y%m%d-%H%M%S")
    log_file_path = f'{log_file_name}_{datetime_string}.log'
    logging.basicConfig(level=logging.INFO,
                        format='%(asctime)s %(name)-12s %(levelname)-8s %(message)s',
                        datefmt='%m-%d %H:%M',
                        filename=log_file_path,
                        filemode='w')


def get_csv_filename(county_name):
    match county_name:
        case "San Francisco":
            return "./Data/SanFrancisco/Assessor_Roles_Full.csv"
    return None


def get_csv_converter(county_name):
    match county_name:
        case "San Francisco":
            return SFCountyRecordConverter()
    raise NotImplementedError(f"County name {county_name} does not have a CSV file converter.")


def main():
    configure_logger()

    # Get database creds and determine if we're running in test mode
    db_username = input("Please enter your DB username (for test mode, enter \"postgres\": ")
    db_password = inputPassword("Please enter your DB password (leave blank for test mode): ", blank=True)

    is_test = True if db_username == "postgres" else False

    # Create DB connection
    db_connection_setup = DBConnectionSetup(db_username=db_username, db_password=db_password, is_test=is_test)
    engine = db_connection_setup.get_engine()

    # Initialize our data access class
    parcel_insert = ParcelInserter(engine)

    # Create list of available counties to import data for
    counties = parcel_insert.get_counties()
    county_list = map(lambda c: c[1], counties)

    print("Please choose county:")
    county_cli = TerminalMenu(county_list)
    selected_county_index = county_cli.show()

    selected_county_id, selected_county_name, *rest = counties[selected_county_index]

    print(f"Processing for {selected_county_name} county.")

    # Get specific converter for the selected county
    converter = get_csv_converter(selected_county_name)

    # Get the CSV file we will be importing data from
    csv_file = get_csv_filename(selected_county_name)
    if csv_file:
        use_default_path = inputYesNo(f"Use default CSV file path? ({csv_file}) [Yy|Nn]: ")

    if not csv_file or use_default_path == "no":
        csv_file = inputFilepath("Input path to CSV relative to working directory: ")

    # Convert CSV files to DTO (data transfer object) classes that are compatible with the DB insert methods
    with open(csv_file) as csvfile:
        reader = csv.DictReader(csvfile)
        records = converter.convert_csv_record_to_dto(reader, selected_county_id)
        print(f"Processed {len(records)} records from {csvfile.name}.")

    # Determine if we want to overwrite existing records or not
    clear_tables = inputYesNo("Clear all tables before import? [Yy|Nn]: ")
    if clear_tables == "yes":
        print("Clearing tables...")
        parcel_insert.clear_tables()
        print("Finished clearing tables.")

    destination = "local database" if is_test else "server database"
    proceed = inputYesNo(f"Proceed with importing {len(records)} records to {destination}? [Yy|Nn]: ")

    # Insert records into the database
    if proceed == "yes":
        parcel_insert.insert_parcel(records)

    print("Import finished.")


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    main()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
