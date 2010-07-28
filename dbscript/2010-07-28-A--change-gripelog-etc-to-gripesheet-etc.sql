START TRANSACTION;

update notification
set name = "gripe-sheet-review",
  activity_description = "suggestions to review a vehicle GripeSheet"
where name = "gripe-log-review";

insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = "gripe-submission"),(select id from role where name = "Squad Fleet Coordinator")),
((select id from notification where name = "gripe-submission"),(select id from role where name = "Department Fleet Coordinator"));

COMMIT