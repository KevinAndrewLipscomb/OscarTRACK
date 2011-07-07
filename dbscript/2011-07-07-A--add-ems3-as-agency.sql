START TRANSACTION
;
insert ignore agency set id = 403
, short_designator = "003"
, medium_designator = "EMS 03"
, long_designator = "EMS 03"
, be_ems_post = TRUE
;
insert ignore agency_satellite_station set agency_id = 0
, satellite_station_id = 403
;
COMMIT