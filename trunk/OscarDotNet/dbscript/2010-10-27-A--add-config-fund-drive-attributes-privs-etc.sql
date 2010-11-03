START TRANSACTION
;
insert ignore privilege set name = "config-fund-drive-attributes"
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "config-fund-drive-attributes"),(select id from role where name = "Application Administrator"))
;
COMMIT