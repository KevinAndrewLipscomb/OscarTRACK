START TRANSACTION
;
insert ignore notification
set name = 'member-length-of-service-change'
, activity_description = "member length-of-service changes"
, activity_pecking_order = 168
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = "member-length-of-service-change"),(select id from role where name = "Application Administrator")),
((select id from notification where name = "member-length-of-service-change"),(select id from role where name = "Department Human Resources Officer")),
((select id from notification where name = "member-length-of-service-change"),(select id from role where name = "Squad Commander")),
((select id from notification where name = "member-length-of-service-change"),(select id from role where name = "Squad Manager")),
((select id from notification where name = "member-length-of-service-change"),(select id from role where name = "Squad Membership Coordinator")),
((select id from notification where name = "member-length-of-service-change"),(select id from role where name = "Squad Scheduler")),
((select id from notification where name = "member-length-of-service-change"),(select id from role where name = "Squad Recruitment-Retention Coordinator")),
((select id from notification where name = "member-length-of-service-change"),(select id from role where name = "Squad Section Sergeant")),
((select id from notification where name = "member-length-of-service-change"),(select id from role where name = "Department Leave Monitor"))
;
COMMIT