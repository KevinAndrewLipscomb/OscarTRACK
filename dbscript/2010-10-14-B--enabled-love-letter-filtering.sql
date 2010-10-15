START TRANSACTION;

insert ignore privilege set name = "convert-scene-visits-to-love-letter-targets";

insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "convert-scene-visits-to-love-letter-targets"),(select id from role where name = "Application Administrator"));

COMMIT