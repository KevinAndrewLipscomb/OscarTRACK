START TRANSACTION
;
insert ignore notification set name = 'third-released'
, activity_description = 'third(s) released'
, activity_pecking_order = 163
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = 'third-released'),(select id from role where name = 'Department Chief Scheduler')),
((select id from notification where name = 'third-released'),(select id from role where name = 'Squad Scheduler')),
((select id from notification where name = 'third-released'),(select id from role where name = 'Department Street Supervisor'))
;
COMMIT
