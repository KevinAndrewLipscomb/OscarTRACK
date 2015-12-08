START TRANSACTION
;
insert ignore agency (id,short_designator,medium_designator,long_designator,be_ems_post) values
(604,"C04","Cart 4","Cart 4",TRUE),
(605,"C05","Cart 5","Cart 5",TRUE),
(608,"C08","Cart 8","Cart 8",TRUE),
(614,"C14","Cart 14","Cart 14",TRUE)
;
insert ignore agency_satellite_station (agency_id,satellite_station_id) values
((select id from agency where short_designator = "R04"),'604'),
((select id from agency where short_designator = "R05"),'605'),
((select id from agency where short_designator = "R14"),'608'),
((select id from agency where short_designator = "R14"),'614')
;
COMMIT
