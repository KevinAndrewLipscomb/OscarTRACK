START TRANSACTION
;
insert ignore role set name = "Department Squad Truck Team Scheduler"
, soft_hyphenation_text = ""
, pecking_order = 10650
;
insert ignore privilege set name = "schedule-squad-truck-team"
;
insert ignore role_privilege_map (role_id,privilege_id) values
((select id from role where name = "Department Squad Truck Team Scheduler"),(select id from privilege where name = "schedule-squad-truck-team")),
((select id from role where name = "Department Chief Scheduler"),(select id from privilege where name = "schedule-squad-truck-team")),
((select id from role where name = "Application Administrator"),(select id from privilege where name = "schedule-squad-truck-team")),
((select id from role where name = "Department Authority"),(select id from privilege where name = "schedule-squad-truck-team"))
;
COMMIT