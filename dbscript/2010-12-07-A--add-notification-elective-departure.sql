START TRANSACTION
;
insert ignore notification set name = "elective-departure";
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = "elective-departure"),(select id from role where name = "Application Administrator")),
((select id from notification where name = "elective-departure"),(select id from role where name = "Squad Recruitment-Retention Coordinator"));
;
COMMIT