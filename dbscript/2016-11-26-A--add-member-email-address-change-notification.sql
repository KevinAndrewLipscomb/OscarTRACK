START TRANSACTION
;
insert ignore notification
set name = 'member-email-address-change'
, activity_description = 'member email address changes'
, activity_pecking_order = 125
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = 'member-email-address-change'),(select id from role where name = 'Department Human Resources Officer')),
((select id from notification where name = 'member-email-address-change'),(select id from role where name = 'Squad Commander')),
((select id from notification where name = 'member-email-address-change'),(select id from role where name = 'Assistant Squad Commander')),
((select id from notification where name = 'member-email-address-change'),(select id from role where name = 'Squad Manager (possibly paid)')),
((select id from notification where name = 'member-email-address-change'),(select id from role where name = 'Squad Membership Coordinator')),
((select id from notification where name = 'member-email-address-change'),(select id from role where name = 'Squad Section Sergeant'))
;
COMMIT
