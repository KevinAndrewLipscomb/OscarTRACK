START TRANSACTION
;
insert ignore notification set name = "vehicle-added"
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = "vehicle-added"),(select id from role where name = "Application Administrator")),
((select id from notification where name = "vehicle-added"),(select id from role where name = "Department Fleet Supervisor")),
((select id from notification where name = "vehicle-added"),(select id from role where name = "Department Fleet Coordinator")),
((select id from notification where name = "vehicle-added"),(select id from role where name = "Squad Commander")),
((select id from notification where name = "vehicle-added"),(select id from role where name = "Squad Manager")),
((select id from notification where name = "vehicle-added"),(select id from role where name = "Squad Fleet Coordinator"))
;
COMMIT