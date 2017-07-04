START TRANSACTION
;
insert ignore notification set name = 'general-departure'
, activity_description = 'general departures'
, activity_pecking_order = 244
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = 'general-departure'),(select id from role where name = 'Department Human Resources Officer'))
;
COMMIT
