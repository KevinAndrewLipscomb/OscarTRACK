START TRANSACTION
;
insert ignore privilege set name = 'one-step-avail-force-post'
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'one-step-avail-force-post'),(select id from role where name = 'Department Chief Scheduler')),
((select id from privilege where name = 'one-step-avail-force-post'),(select id from role where name = 'Application Administrator')),
((select id from privilege where name = 'one-step-avail-force-post'),(select id from role where name = 'Department Division Chief')),
((select id from privilege where name = 'one-step-avail-force-post'),(select id from role where name = 'Department Deputy Chief')),
((select id from privilege where name = 'one-step-avail-force-post'),(select id from role where name = 'Department Authority'))
;
COMMIT
