START TRANSACTION
;
insert ignore notification set name = 'report-monthly-bls-intern-schedule-assignments'
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = 'report-monthly-bls-intern-schedule-assignments'),(select id from role where name = 'Department Jump Seat Scheduler'))
;
COMMIT
