START TRANSACTION
;
insert ignore notification set name = 'vehicle-appointment'
, activity_description = 'vehicle service apointments'
, activity_pecking_order = 255
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = 'vehicle-appointment'),(select id from role where name = 'Department Fleet Supervisor')),
((select id from notification where name = 'vehicle-appointment'),(select id from role where name = 'Department Fleet Coordinator')),
((select id from notification where name = 'vehicle-appointment'),(select id from role where name = 'Squad Commander')),
((select id from notification where name = 'vehicle-appointment'),(select id from role where name = 'Assistant Squad Commander')),
((select id from notification where name = 'vehicle-appointment'),(select id from role where name = 'Squad Manager (possibly paid)')),
((select id from notification where name = 'vehicle-appointment'),(select id from role where name = 'Squad Fleet Coordinator')),
((select id from notification where name = 'vehicle-appointment'),(select id from role where name = 'Squad Fleet Assistant'))
;
insert ignore privilege set name = 'send-vehicle-appointment-notifications'
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'send-vehicle-appointment-notifications'),(select id from role where name = 'Application Administrator')),
((select id from privilege where name = 'send-vehicle-appointment-notifications'),(select id from role where name = 'Department Authority')),
((select id from privilege where name = 'send-vehicle-appointment-notifications'),(select id from role where name = 'Department Deputy Chief')),
((select id from privilege where name = 'send-vehicle-appointment-notifications'),(select id from role where name = 'Department Division Chief')),
((select id from privilege where name = 'send-vehicle-appointment-notifications'),(select id from role where name = 'Department Fleet Supervisor')),
((select id from privilege where name = 'send-vehicle-appointment-notifications'),(select id from role where name = 'Department Fleet Coordinator'))
;
COMMIT
