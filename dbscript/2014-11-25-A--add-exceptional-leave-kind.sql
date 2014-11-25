START TRANSACTION
;
INSERT ignore INTO `kind_of_leave_code_description_map` (`description`) VALUES ('Exceptional')
;
insert ignore into role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'audit-schedule-assignments'),(select id from role where name = 'Squad Commander')),
((select id from privilege where name = 'audit-schedule-assignments'),(select id from role where name = 'Squad Assistant Manager')),
((select id from privilege where name = 'audit-schedule-assignments'),(select id from role where name = 'Squad Manager')),
((select id from privilege where name = 'audit-schedule-assignments'),(select id from role where name = 'Squad Scheduler')),
((select id from privilege where name = 'audit-schedule-assignments'),(select id from role where name = 'Squad Analyst'))
;
COMMIT
