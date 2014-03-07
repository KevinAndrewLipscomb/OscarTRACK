START TRANSACTION
;
insert ignore notification (name) values
('flight-medic-qualification-change'),
('marine-medic-qualification-change')
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = 'flight-medic-qualification-change'),(select id from role where name = 'Department ALS ID Coordinator')),
((select id from notification where name = 'marine-medic-qualification-change'),(select id from role where name = 'Department ALS ID Coordinator')),
((select id from notification where name = 'flight-medic-qualification-change'),(select id from role where name = 'Department Chief Scheduler'))
;
insert ignore privilege (name) values
('change-flight-medic-qual'),
('change-marine-medic-qual')
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'change-flight-medic-qual'),(select id from role where name = 'Department Authority')),
((select id from privilege where name = 'change-flight-medic-qual'),(select id from role where name = 'Application Administrator')),
((select id from privilege where name = 'change-flight-medic-qual'),(select id from role where name = 'Department Human Resources Officer')),
((select id from privilege where name = 'change-flight-medic-qual'),(select id from role where name = 'Department ALS ID Coordinator')),
((select id from privilege where name = 'change-flight-medic-qual'),(select id from role where name = 'Department Chief Scheduler')),
((select id from privilege where name = 'change-marine-medic-qual'),(select id from role where name = 'Department Authority')),
((select id from privilege where name = 'change-marine-medic-qual'),(select id from role where name = 'Application Administrator')),
((select id from privilege where name = 'change-marine-medic-qual'),(select id from role where name = 'Department Human Resources Officer')),
((select id from privilege where name = 'change-marine-medic-qual'),(select id from role where name = 'Department ALS ID Coordinator')),
((select id from privilege where name = 'change-marine-medic-qual'),(select id from role where name = 'Department Chief Scheduler'))
;
COMMIT