START TRANSACTION;

update notification
set activity_description = "vehicle status changes",
  activity_pecking_order = 246
where name = "vehicle-status-change";

update notification
set activity_description = "vehicle quarters changes",
  activity_pecking_order = 247
where name = "vehicle-quarters-change";

update notification
set activity_description = "citywide ambulance fleet condition alerts/alarms/advisories",
  activity_pecking_order = 248
where name = "ambulance-fleet-condition-change";

COMMIT