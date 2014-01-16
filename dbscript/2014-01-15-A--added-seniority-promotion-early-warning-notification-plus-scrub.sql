START TRANSACTION
;
insert ignore notification
set name = "seniority-promotion-early-warning"
, activity_description = "automatic seniority promotion early warnings"
, activity_pecking_order = 165
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = "seniority-promotion-early-warning"),(select id from role where name = "Department Human Resources Officer")),
((select id from notification where name = "seniority-promotion-early-warning"),(select id from role where name = "Squad Commander")),
((select id from notification where name = "seniority-promotion-early-warning"),(select id from role where name = "Squad Manager")),
((select id from notification where name = "seniority-promotion-early-warning"),(select id from role where name = "Squad Membership Coordinator")),
((select id from notification where name = "seniority-promotion-early-warning"),(select id from role where name = "Squad Scheduler")),
((select id from notification where name = "seniority-promotion-early-warning"),(select id from role where name = "Squad Recruitment-Retention Coordinator")),
((select id from notification where name = "seniority-promotion-early-warning"),(select id from role where name = "Squad Section Sergeant")),
((select id from notification where name = "seniority-promotion-early-warning"),(select id from role where name = "Department Leave Monitor"))
;
update notification
set activity_description = "online training evaluations completed"
, activity_pecking_order = 138
where name = "eval-archived"
;
COMMIT