START TRANSACTION
;
insert ignore agency
set id = 209
, short_designator = "BKT"
, medium_designator = "Bike Team"
, long_designator = "SAR Bike Team"
, be_active = TRUE
, oscar_classic_enumerator = "BikeTeam"
, ems_system_id = 1
;
insert ignore role set name = "Bike Team Scheduler"
, pecking_order = 21447
;
insert ignore privilege set name = "schedule-bike-team"
;
insert ignore role_privilege_map (role_id,privilege_id) values
((select id from role where name = "Bike Team Scheduler"),(select id from privilege where name = "edit-schedule")),
((select id from role where name = "Bike Team Scheduler"),(select id from privilege where name = "schedule-bike-team")),
((select id from role where name = "Department Chief Scheduler"),(select id from privilege where name = "schedule-bike-team")),
((select id from role where name = "Application Administrator"),(select id from privilege where name = "schedule-bike-team")),
((select id from role where name = "Department Authority"),(select id from privilege where name = "schedule-bike-team"))
;
COMMIT
