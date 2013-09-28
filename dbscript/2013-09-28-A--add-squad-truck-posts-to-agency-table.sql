START TRANSACTION
;
insert ignore agency (id,short_designator,medium_designator,long_designator,be_ems_post,door_code,ems_system_id) values
(506,"Q06","Squad 6","Squad 6",TRUE,"1,8,5,9,#",1),
(514,"Q14","Squad 14","Squad 14",TRUE,"Call,#,5,1,5,2",1),
(516,"Q16","Squad 16","Squad 16",TRUE,"2+4,3",1)
;
insert ignore agency_satellite_station (agency_id,satellite_station_id) values
((select id from agency where short_designator = "SQT"),'506'),
((select id from agency where short_designator = "SQT"),'514'),
((select id from agency where short_designator = "SQT"),'516')
;
COMMIT