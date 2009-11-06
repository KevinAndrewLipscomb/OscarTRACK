START TRANSACTION;

insert ignore role
set name = "Department Fleet Supervisor",
  tier_id = 1,
  pecking_order = 10825;

insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = "ambulance-fleet-condition-change"),(select id from role where name = "Department Fleet Supervisor"));

insert ignore role_member_map (role_id,member_id) values
((select id from role where name = "Department Fleet Supervisor"),(select id from member where first_name = "EDWARD" and last_name = "BRAZLE")),
((select id from role where name = "Department Fleet Supervisor"),(select id from member where first_name = "JEFF" and last_name = "BRENNAMAN"));

insert ignore role_privilege_map (role_id,privilege_id) values
((select id from role where name = "Department Fleet Supervisor"),(select id from privilege where name = "config-business-objects")),
((select id from role where name = "Department Fleet Supervisor"),(select id from privilege where name = "config-fleet-attributes")),
((select id from role where name = "Department Fleet Supervisor"),(select id from privilege where name = "config-vehicles")),
((select id from role where name = "Department Fleet Supervisor"),(select id from privilege where name = "append-vehicle-down-note"));

COMMIT