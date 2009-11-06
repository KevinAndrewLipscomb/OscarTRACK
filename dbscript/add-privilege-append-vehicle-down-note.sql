START TRANSACTION;

insert ignore privilege set name = "append-vehicle-down-note";

insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "append-vehicle-down-note"),(select id from role where name = "Application Administrator")),
((select id from privilege where name = "append-vehicle-down-note"),(select id from role where name = "Department Authority")),
((select id from privilege where name = "append-vehicle-down-note"),(select id from role where name = "Department Fleet Coordinator")),
((select id from privilege where name = "append-vehicle-down-note"),(select id from role where name = "Squad Commander")),
((select id from privilege where name = "append-vehicle-down-note"),(select id from role where name = "Squad Manager")),
((select id from privilege where name = "append-vehicle-down-note"),(select id from role where name = "Squad Fleet Coordinator"));

COMMIT