START TRANSACTION
;
insert ignore notification (name,activity_description) values
('squad-truck-team-qualification-change','squad truck team qualification changes')
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = 'squad-truck-team-qualification-change'),(select id from role where name = 'Department Schedule Auditor')),
((select id from notification where name = 'squad-truck-team-qualification-change'),(select id from role where name = 'Squad Commander')),
((select id from notification where name = 'squad-truck-team-qualification-change'),(select id from role where name = 'Squad Manager')),
((select id from notification where name = 'squad-truck-team-qualification-change'),(select id from role where name = 'Squad Scheduler')),
((select id from notification where name = 'squad-truck-team-qualification-change'),(select id from role where name = 'Squad Truck Team Scheduler'))
;
insert ignore privilege (name) values
('change-squad-truck-team-qual')
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'change-squad-truck-team-qual'),(select id from role where name = 'Department Authority')),
((select id from privilege where name = 'change-squad-truck-team-qual'),(select id from role where name = 'Application Administrator')),
((select id from privilege where name = 'change-squad-truck-team-qual'),(select id from role where name = 'Department Human Resources Officer')),
((select id from privilege where name = 'change-squad-truck-team-qual'),(select id from role where name = 'Squad Commander')),
((select id from privilege where name = 'change-squad-truck-team-qual'),(select id from role where name = 'Squad Manager')),
((select id from privilege where name = 'change-squad-truck-team-qual'),(select id from role where name = 'Squad Truck Team Scheduler'))
;
COMMIT