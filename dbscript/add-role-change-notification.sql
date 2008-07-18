START TRANSACTION;

insert ignore notification set name = "role-change";

insert role_notification_map (notification_id,role_id) values
((select id from notification where name = "role-change"),(select id from role where name = "Application Administrator")),
((select id from notification where name = "role-change"),(select id from role where name = "Department Human Resources Officer")),
((select id from notification where name = "role-change"),(select id from role where name = "Department BLS ID Coordinator")),
((select id from notification where name = "role-change"),(select id from role where name = "Squad Commander")),
((select id from notification where name = "role-change"),(select id from role where name = "Squad Manager"));

COMMIT