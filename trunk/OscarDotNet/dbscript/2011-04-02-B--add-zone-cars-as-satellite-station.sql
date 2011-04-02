START TRANSACTION
;
insert ignore agency (id,short_designator,medium_designator,long_designator,be_active,be_ems_post) values
(301,"Z01","Zone 1","Zone 1",FALSE,TRUE),
(302,"Z02","Zone 2","Zone 2",FALSE,TRUE),
(303,"Z03","Zone 3","Zone 3",FALSE,TRUE),
(304,"Z04","Zone 4","Zone 4",FALSE,TRUE),
(305,"Z05","Zone 5","Zone 5",FALSE,TRUE),
(306,"Z06","Zone 6","Zone 6",FALSE,TRUE),
(307,"Z07","Zone 7","Zone 7",FALSE,TRUE),
(308,"Z08","Zone 8","Zone 8",FALSE,TRUE),
(309,"Z09","Zone 9","Zone 9",FALSE,TRUE),
(310,"Z10","Zone 10","Zone 10",FALSE,TRUE),
(312,"Z12","Zone 12","Zone 12",FALSE,TRUE),
(314,"Z14","Zone 14","Zone 14",FALSE,TRUE),
(316,"Z16","Zone 16","Zone 16",FALSE,TRUE),
(317,"Z17","Zone 17","Zone 17",FALSE,TRUE),
(318,"Z18","Zone 18","Zone 18",FALSE,TRUE),
(319,"Z19","Zone 19","Zone 19",FALSE,TRUE),
(320,"Z20","Zone 20","Zone 20",FALSE,TRUE),
(321,"Z21","Zone 21","Zone 21",FALSE,TRUE),
(322,"Z22","Zone 22","Zone 22",FALSE,TRUE)
;
insert ignore agency_satellite_station (agency_id,satellite_station_id) values
(0,301),
(0,302),
(0,303),
(0,304),
(0,305),
(0,306),
(0,307),
(0,308),
(0,309),
(0,310),
(0,312),
(0,314),
(0,316),
(0,317),
(0,318),
(0,319),
(0,320),
(0,321),
(0,322)
;
COMMIT