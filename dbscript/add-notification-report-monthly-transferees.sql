START TRANSACTION;

insert ignore notification
set name = "report-monthly-transferees",
  activity_description = "transfers still pending",
  activity_pecking_order = 245;

insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = "report-monthly-transferees"),(select id from role where name = "Department Human Resources Officer")),
((select id from notification where name = "report-monthly-transferees"),(select id from role where name = "Department BLS ID Coordinator")),
((select id from notification where name = "report-monthly-transferees"),(select id from role where name = "Squad Commander")),
((select id from notification where name = "report-monthly-transferees"),(select id from role where name = "Squad Training Officer")),
((select id from notification where name = "report-monthly-transferees"),(select id from role where name = "Squad Membership Coordinator")),
((select id from notification where name = "report-monthly-transferees"),(select id from role where name = "Squad Manager"));

COMMIT