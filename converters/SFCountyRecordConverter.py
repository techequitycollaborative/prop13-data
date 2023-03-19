from AssessmentDataDTO import AssessmentDataDTO
from ParcelDataDTO import ParcelDataDTO, Point


class SFCountyRecordConverter:

    def __init__(self):
        # this dict will have parcel number as key and ParcelDataDTO as value
        self.record_dict = {}

    def create_assessment_data_dto(self, record):
        return AssessmentDataDTO(
                            parcel_id=record["Parcel Number"],
                            closed_roll_year=record["Closed Roll Year"],
                            sale_year=record["Current Sales Date"].split('/')[0],
                            assessed_land_value=record["Assessed Land Value"],
                            assessed_improvement_value=record["Assessed Improvement Value"]
                        )

    def convert_csv_record_to_dto(self, record_list, county_id):
        for record in record_list:
            if record["Parcel Number"] not in self.record_dict:
                self.record_dict[record["Parcel Number"]] = ParcelDataDTO(
                    county_id=county_id,
                    parcel_id=record["Parcel Number"],
                    property_location=record["Property Location"],
                    lat_long=Point(0, 0) if record["the_geom"] == "" else self.create_point_from_csv_format(record["the_geom"]),  # broken
                    year_built=record["Year Property Built"],
                    property_area_sqft=record["Property Area"],
                    use_code=record["Use Code"],
                    lot_area_sqft=record["Lot Area"],
                    assessment_data_list=[
                        self.create_assessment_data_dto(record)
                    ]
                )
            else:
                self.record_dict[record["Parcel Number"]].assessment_data_list.append(
                    self.create_assessment_data_dto(record)
                )
        return self.record_dict

    def create_point_from_csv_format(self, record):
        record_parts = record.split()
        if record_parts[0] != "POINT":
            raise Exception("CSV record in incomplete format")
        lat = record_parts[1][1:]
        lon = record_parts[2][:-1]
        return Point(lat, lon)
