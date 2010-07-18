START TRANSACTION;

insert ignore privilege set name = "config-mini-fix-requests";

insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "config-mini-fix-requests"),(select id from role where name = "Squad Fleet Coordinator")),
((select id from privilege where name = "config-mini-fix-requests"),(select id from role where name = "Department Fleet Coordinator")),
((select id from privilege where name = "config-mini-fix-requests"),(select id from role where name = "Department Authority")),
((select id from privilege where name = "config-mini-fix-requests"),(select id from role where name = "Application Administrator"));

ALTER TABLE `vehicle_kind` ADD COLUMN `be_target_pm_mileage_meaningful` BOOLEAN NOT NULL default false;

update vehicle_kind
set be_target_pm_mileage_meaningful = true
where description in
  (
  "Ambulance",
  "Dive truck",
  "MCI truck",
  "Parade piece",
  "SAR truck",
  "Squad truck",
  "Supervisor car",
  "Support truck",
  "Utility car",
  "Zone car"
  );

insert ignore notification
set name = "vehicle-kind-change",
  activity_description = "vehicle kind changes",
  activity_pecking_order = 249;

insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = "vehicle-kind-change"),(select id from role where name = "Squad Fleet Coordinator")),
((select id from notification where name = "vehicle-kind-change"),(select id from role where name = "Squad Commander")),
((select id from notification where name = "vehicle-kind-change"),(select id from role where name = "Squad Manager")),
((select id from notification where name = "vehicle-kind-change"),(select id from role where name = "Department Fleet Coordinator")),
((select id from notification where name = "vehicle-kind-change"),(select id from role where name = "Application Administrator"));

COMMIT