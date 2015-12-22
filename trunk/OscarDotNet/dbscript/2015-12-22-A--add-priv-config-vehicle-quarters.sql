START TRANSACTION
;
insert ignore privilege set name = 'config-vehicle-quarters'
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'config-vehicle-quarters'),(select id from role where name = 'Application Administrator')),
((select id from privilege where name = 'config-vehicle-quarters'),(select id from role where name = 'Department Authority'))
;
COMMIT
