START TRANSACTION
;
insert ignore agency
set id = 208
, short_designator = "MCI"
, medium_designator = "MCI"
, long_designator = "MCI Team"
, be_active = TRUE
, oscar_classic_enumerator = "MciTeam"
, ems_system_id = 1
;
insert ignore role set name = "MCI Team Scheduler"
, pecking_order = 21444
;
insert ignore privilege set name = "schedule-mci-team"
;
insert ignore role_privilege_map (role_id,privilege_id) values
((select id from role where name = "MCI Team Scheduler"),(select id from privilege where name = "edit-schedule")),
((select id from role where name = "MCI Team Scheduler"),(select id from privilege where name = "schedule-mci-team")),
((select id from role where name = "Department Chief Scheduler"),(select id from privilege where name = "schedule-mci-team")),
((select id from role where name = "Application Administrator"),(select id from privilege where name = "schedule-mci-team")),
((select id from role where name = "Department Authority"),(select id from privilege where name = "schedule-mci-team"))
;
COMMIT
