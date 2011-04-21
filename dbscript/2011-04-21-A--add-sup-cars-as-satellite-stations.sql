START TRANSACTION
;
insert ignore agency (id,short_designator,medium_designator,long_designator,be_active,be_ems_post) values
(405,"005","EMS 05","EMS 05",FALSE,TRUE),
(406,"006","EMS 06","EMS 06",FALSE,TRUE),
(407,"007","EMS 07","EMS 07",FALSE,TRUE),
(417,"017","EMS 17","EMS 17",FALSE,TRUE)
;
insert ignore agency_satellite_station (agency_id,satellite_station_id) values
(0,405),
(0,406),
(0,407),
(0,417)
;
COMMIT