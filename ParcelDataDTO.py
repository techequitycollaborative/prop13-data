from dataclasses import dataclass


class Point:
    def __init__(self, lat, long):
        self.lat = lat
        self.long = long


@dataclass
class ParcelDataDTO:
    county_id: int
    parcel_id: str
    property_location: str
    lat_long: Point
    year_built: int
    property_area_sqft: float
    use_code: str
    lot_area_sqft: float
    assessment_data_list: list
