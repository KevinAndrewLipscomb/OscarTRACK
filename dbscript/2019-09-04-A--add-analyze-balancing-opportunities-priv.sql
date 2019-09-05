START TRANSACTION
;
insert ignore privilege set name = 'analyze-balancing-opportunities'
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'analyze-balancing-opportunities'),(select id from role where name = 'Department Authority')),
((select id from privilege where name = 'analyze-balancing-opportunities'),(select id from role where name = 'Department Deputy Chief')),
((select id from privilege where name = 'analyze-balancing-opportunities'),(select id from role where name = 'Department Division Chief')),
((select id from privilege where name = 'analyze-balancing-opportunities'),(select id from role where name = 'Application Administrator')),
((select id from privilege where name = 'analyze-balancing-opportunities'),(select id from role where name = 'Department Chief Scheduler'))
;
COMMIT
