START TRANSACTION
;
insert ignore agency set id = 205
, short_designator = "AIR"
, medium_designator = "Air Medic"
, long_designator = "Air Medevac Team"
, be_active = FALSE
, be_ems_post = TRUE
;
insert ignore agency_satellite_station set agency_id = 0
, satellite_station_id = 205
;
COMMIT