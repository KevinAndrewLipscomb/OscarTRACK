START TRANSACTION
;
insert ignore privilege (name) values
("config-eval-attributes");
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "config-eval-attributes"),(select id from role where name = "Application Administrator")),
((select id from privilege where name = "config-eval-attributes"),(select id from role where name = "Department Authority"))
;
COMMIT