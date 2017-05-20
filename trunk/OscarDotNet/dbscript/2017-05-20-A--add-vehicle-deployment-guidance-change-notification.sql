START TRANSACTION
;
insert ignore notification set name = 'vehicle-deployment-guidance-change'
, activity_description = 'vehicle deployment guidance changes'
, activity_pecking_order = 265
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = 'vehicle-deployment-guidance-change'),(select id from role where name = 'Department Fleet Supervisor')),
((select id from notification where name = 'vehicle-deployment-guidance-change'),(select id from role where name = 'Department Fleet Coordinator')),
((select id from notification where name = 'vehicle-deployment-guidance-change'),(select id from role where name = 'Squad Fleet Coordinator')),
((select id from notification where name = 'vehicle-deployment-guidance-change'),(select id from role where name = 'Squad Fleet Assistant'))
;
COMMIT
