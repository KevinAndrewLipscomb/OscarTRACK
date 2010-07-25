START TRANSACTION;

update notification set activity_pecking_order = 320 where name = "needs-enrollment-review";
update notification set activity_pecking_order = 310 where name = "role-change";
update notification set activity_pecking_order = 300 where name = "report-monthly-per-agency-serial-indicators";
update notification set activity_pecking_order = 290 where name = "vehicle-kind-change";
update notification set activity_pecking_order = 280 where name = "ambulance-fleet-condition-change";
update notification set activity_pecking_order = 270 where name = "vehicle-quarters-change";
update notification set activity_pecking_order = 250 where name = "vehicle-status-change";

insert ignore notification
set name = "minifix-log-review",
  activity_description = "suggestions to review a vehicle MiniFixLog",
  activity_pecking_order = 260;

insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = "minifix-log-review"),(select id from role where name = "Squad Fleet Coordinator")),
((select id from notification where name = "minifix-log-review"),(select id from role where name = "Department Fleet Coordinator"));

COMMIT