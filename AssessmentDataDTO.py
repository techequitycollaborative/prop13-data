from dataclasses import dataclass


@dataclass
class AssessmentDataDTO:
    parcel_id: int
    closed_roll_year: int
    sale_year: int
    assessed_land_value: int
    assessed_improvement_value: int
