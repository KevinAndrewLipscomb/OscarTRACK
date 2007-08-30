START TRANSACTION;

insert privilege set name = "config-users";

insert role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "config-users"),(select id from role where name = "Application Administrator"));

COMMIT