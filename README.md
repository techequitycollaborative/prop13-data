# prop13-data

## Overview
This is a console app designed to process data from various county assessors' records into a postgres database.

Data records should be in whatever CSV structure is available on the assessor website.

## Setting up a local database
This application relies on a postgres database running the [PostGIS](https://postgis.net) extension.

If you want to execute the application against a local database (recommended) then you need to complete the following steps and then run the application in test mode (see below).

1. Download [Postgres](https://www.postgresql.org) and create a database called `estimation`.
2. Install the [PostGIS binaries](https://postgis.net/install/#binary-installers). A super easy way to do this on OSX is to run `$ brew install postgis`
3. Connect to the local `estimation` database and run `CREATE EXTENSION postgis;`
4. Execute the SQL script `parcel_tables_create.sql` from this repo.

## Running the application

**NOTE: Running this application NOT in test mode will make changes to the production database. Use caution if not using test mode.**

It's most straightforward to run this app through an IDE (like Pycharm). The app will guide you through a command line interface that ends in a bulk record update on the target database.

1. Copy down the Data folder from [Google Drive](https://drive.google.com/drive/folders/1uxNIQSXgw4_Fc7L-5fe-9CqLDxBnf7mN?usp=share_link) and place it in the directory alongside main.py
2. The application will look for CSV files in the `./Data/CountyName` folder (no space in any county name). You can also specify a custom path while the application is running if preferred.
3. Run the application and follow the prompts.
4. The application will log to the `./log` folder. All SQL statements and any errors will be written here for debugging.

## Development guide to add functionality for a new county

The app is designed to be highly modular, such that most classes can be reused for any county. The general flow is:
1. Get target database connection (we are using the SqlAlchemy library)
2. Select county (user input)
3. Locate CSV file for the appropriate county
4. Translate the CSV records into DTO objects (a new county will require a new translator - most new code will be here)
5. Pass the DTO objects into the database write method.
6. Database methods write the objects into the database (optionally overwriting)

Because the CSV format will be different between counties, for each county we need to write a converter from CSV -> AssessmentDataDTO and ParcelDataDTO classes

To add a new county:
1. Create a record converter in the `./converters` directory called CountyNameRecordConverter
2. Implement a method with the signature `convert_csv_record_to_dto(self, record_list, county_id)` that returns a dictionary with ParcelNumber as key and ParcelDataDTO as value. Note that ParcelDataDTO contains a list of AssessmentDataDTO objects.
3. Add the county to the `parcel.county` table in the database.
4. In main.py, modify `get_csv_filename` and `get_csv_converter` to handle the new county name.

The most complicated piece will be writing the record converter. The data structure in AssessmentDataDTO and ParcelDataDTO mirrors the database tables fairly closely. You can also use the SFCountyRecordConverter class as a reference.