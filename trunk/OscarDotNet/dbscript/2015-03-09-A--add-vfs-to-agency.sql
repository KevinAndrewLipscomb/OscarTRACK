START TRANSACTION
;
insert ignore agency
set id = 207
, short_designator = "VFS"
, medium_designator = "EMS-7"
, long_designator = "Volunteer Field Supervisor Team"
, be_active = TRUE
, oscar_classic_enumerator = "VolFldSupTeam"
, ems_system_id = 1
;
insert ignore role set name = "Volunteer Field Supervisor Team Scheduler"
, soft_hyphenation_text = ""
, pecking_order = 21438
;
insert ignore privilege set name = "schedule-volunteer-field-supervisor-team"
;
insert ignore role_privilege_map (role_id,privilege_id) values
((select id from role where name = "Volunteer Field Supervisor Team Scheduler"),(select id from privilege where name = "edit-schedule")),
((select id from role where name = "Volunteer Field Supervisor Team Scheduler"),(select id from privilege where name = "schedule-volunteer-field-supervisor-team")),
((select id from role where name = "Department Chief Scheduler"),(select id from privilege where name = "schedule-volunteer-field-supervisor-team")),
((select id from role where name = "Application Administrator"),(select id from privilege where name = "schedule-volunteer-field-supervisor-team")),
((select id from role where name = "Department Authority"),(select id from privilege where name = "schedule-volunteer-field-supervisor-team"))
;
--
-- The following map should've been entered when the SQT Scheduler role was created.
--
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from role where name = "Squad Truck Team Scheduler"),(select id from privilege where name = "edit-schedule"))
;
COMMIT