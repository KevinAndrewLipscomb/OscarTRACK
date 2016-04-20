START TRANSACTION
;
insert ignore notification
set name = 'report-monthly-als-interns'
, activity_description = 'monthly ALS internship reports sent'
, activity_pecking_order = 246
;
update notification
set activity_pecking_order = 152
where name = 'squad-truck-team-qualification-change'
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = 'report-monthly-als-interns'),(select id from role where name = 'Department ALS ID Coordinator'))
;
COMMIT
