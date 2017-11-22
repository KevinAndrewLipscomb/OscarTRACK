START TRANSACTION
;
insert ignore privilege set name = 'config-uniforms'
;
insert ignore role
set name = 'Department Uniform Coordinator'
, tier_id = 1
, pecking_order = 10650
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'config-uniforms'),(select id from role where name = 'Department Authority')),
((select id from privilege where name = 'config-uniforms'),(select id from role where name = 'Department Deputy Chief')),
((select id from privilege where name = 'config-uniforms'),(select id from role where name = 'Application Administrator')),
((select id from privilege where name = 'config-uniforms'),(select id from role where name = 'Department Uniform Coordinator'))
;
COMMIT
