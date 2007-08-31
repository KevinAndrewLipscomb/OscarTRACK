START TRANSACTION;

insert privilege set name = "config-agencies";

insert role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "config-agencies"),(select id from role where name = "Application Administrator")),
((select id from privilege where name = "config-agencies"),(select id from role where name = "Department Authority"));

COMMIT