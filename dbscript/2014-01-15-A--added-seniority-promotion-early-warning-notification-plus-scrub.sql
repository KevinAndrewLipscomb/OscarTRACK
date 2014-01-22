START TRANSACTION
;
insert ignore notification
set name = "seniority-promotion-early-warning"
, activity_description = "automatic seniority promotion early warnings"
, activity_pecking_order = 165
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = "seniority-promotion-early-warning"),(select id from role where name = "Application Administrator")),
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
insert ignore privilege set name = "adjust-years-of-service"
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "adjust-years-of-service"),(select id from role where name = "Application Administrator")),
((select id from privilege where name = "adjust-years-of-service"),(select id from role where name = "Department Authority")),
((select id from privilege where name = "adjust-years-of-service"),(select id from role where name = "Department Human Resources Officer")),
((select id from privilege where name = "adjust-years-of-service"),(select id from role where name = "Squad Commander")),
((select id from privilege where name = "adjust-years-of-service"),(select id from role where name = "Squad Manager")),
((select id from privilege where name = "adjust-years-of-service"),(select id from role where name = "Department Leave Monitor"))
;
COMMIT