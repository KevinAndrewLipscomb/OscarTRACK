START TRANSACTION;

insert ignore privilege (name) values
("retire-vehicles");

insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "retire-vehicles"),(select id from role where name = "Application Administrator"));

COMMIT