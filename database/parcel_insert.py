from sqlalchemy import *
from geoalchemy2 import Geometry  # do not remove - necessary for the sqlalchemy autoload method
from tqdm import tqdm


class ParcelInserter:
    def __init__(self, db_engine: engine):
        self.db_engine = db_engine
        self.db_metadata = MetaData(schema="parcel")

    def get_counties(self):
        counties = []
        with self.db_engine.connect() as connection:
            county_table = Table("county", self.db_metadata, autoload_with=self.db_engine)
            select_stmt = select(county_table)
            res = connection.execute(select_stmt)
            for row in res:
                counties.append(row.tuple())
        return counties

    def insert_county(self, county_name):
        with self.db_engine.connect() as connection:
            county_table = Table("county", self.db_metadata, autoload_with=self.db_engine)
            select_stmt = select(county_table).where(county_table.columns.county_name.like(county_name))
            res = connection.execute(select_stmt)
            if res.rowcount == 0:
                stmt = insert(county_table).values(county_name=county_name)
                connection.execute(stmt)
            else:
                print(f"County {county_name} has already been inserted.")
            connection.commit()

    def insert_assessment(self, assessment_data_list):
        with self.db_engine.connect() as connection:
            assessment_table = Table("assessment_data", self.db_metadata, autoload_with=self.db_engine)
            for dto in assessment_data_list:
                stmt = insert(assessment_table).values(
                    parcel_id=dto.parcel_id,
                    closed_roll_year=dto.closed_roll_year,
                    sale_year=0 if dto.sale_year == "" else dto.sale_year,
                    assessed_land_value=dto.assessed_land_value,
                    assessed_improvement_value=dto.assessed_improvement_value
                )
                connection.execute(stmt)
            connection.commit()

    def insert_parcel(self, parcel_data_list):
        with self.db_engine.connect() as connection:
            parcel_table = Table("parcel", self.db_metadata, autoload_with=self.db_engine)
            with tqdm(total=len(parcel_data_list)) as pbar:
                for key in parcel_data_list.keys():
                    dto = parcel_data_list[key]
                    stmt = insert(parcel_table).values(
                        county_id=dto.county_id,
                        parcel_id=dto.parcel_id,
                        property_location=dto.property_location,
                        lat_long=f'POINT({dto.lat_long.lat} {dto.lat_long.long})',
                        year_built=0 if dto.year_built == "" else dto.year_built,
                        property_area_sqft=dto.property_area_sqft,
                        use_code=dto.use_code,
                        lot_area_sqft=dto.lot_area_sqft
                    )
                    res = connection.execute(stmt)
                    connection.commit()
                    inserted_parcel_pk = res.inserted_primary_key[0]
                    for assessment_dto in dto.assessment_data_list:
                        assessment_dto.parcel_id = inserted_parcel_pk
                    self.insert_assessment(assessment_data_list=dto.assessment_data_list)
                    pbar.update(1)

    def clear_tables(self):
        with self.db_engine.connect() as connection:
            parcel_table = Table("parcel", self.db_metadata, autoload_with=self.db_engine)
            assessment_table = Table("assessment_data", self.db_metadata, autoload_with=self.db_engine)
            stmt_assess = delete(assessment_table)
            connection.execute(stmt_assess)
            connection.commit()

            stmt = delete(parcel_table)
            connection.execute(stmt)
            connection.commit()
