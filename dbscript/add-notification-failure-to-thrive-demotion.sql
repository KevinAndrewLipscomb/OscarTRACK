START TRANSACTION;

insert ignore into notification
set name = "failure-to-thrive-demotion",
  activity_description = "lingering applicant demotions",
  activity_pecking_order = 175;

insert ignore into role_notification_map (role_id,notification_id) values
((select id from role where name = "Department Human Resources Officer"),(select id from notification where name = "failure-to-thrive-demotion")),
((select id from role where name = "Squad Membership Coordinator"),(select id from notification where name = "failure-to-thrive-demotion"));

COMMIT