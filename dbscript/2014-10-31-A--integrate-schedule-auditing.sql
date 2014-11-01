START TRANSACTION
;
insert ignore privilege set name = 'audit-schedule-assignments'
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'audit-schedule-assignments'),(select id from role where name = 'Application Administrator')),
((select id from privilege where name = 'audit-schedule-assignments'),(select id from role where name = 'Department Authority')),
((select id from privilege where name = 'audit-schedule-assignments'),(select id from role where name = 'Department Schedule Auditor'))
;
insert ignore role_member_map (role_id,member_id) values
((select id from role where name = 'Department Schedule Auditor'),(select id from member where cad_num = '800115')),
((select id from role where name = 'Department Schedule Auditor'),(select id from member where cad_num = '800322')),
((select id from role where name = 'Department Schedule Auditor'),(select id from member where cad_num = '800112'))
;
COMMIT