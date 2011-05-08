START TRANSACTION
;
insert privilege set name = "see-other-member-schedule-detail"
;
insert role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "see-other-member-schedule-detail"),(select id from role where name = "Squad Scheduler")),
((select id from privilege where name = "see-other-member-schedule-detail"),(select id from role where name = "Squad Manager")),
((select id from privilege where name = "see-other-member-schedule-detail"),(select id from role where name = "Squad Assistant Manager")),
((select id from privilege where name = "see-other-member-schedule-detail"),(select id from role where name = "Squad Commander")),
((select id from privilege where name = "see-other-member-schedule-detail"),(select id from role where name = "Department Street Supervisor")),
((select id from privilege where name = "see-other-member-schedule-detail"),(select id from role where name = "Department Scheduler")),
((select id from privilege where name = "see-other-member-schedule-detail"),(select id from role where name = "Department Chief Scheduler")),
((select id from privilege where name = "see-other-member-schedule-detail"),(select id from role where name = "Application Administrator")),
((select id from privilege where name = "see-other-member-schedule-detail"),(select id from role where name = "Department Authority"))
;
COMMIT