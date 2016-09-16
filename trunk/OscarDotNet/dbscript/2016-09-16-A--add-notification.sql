START TRANSACTION
;
delete from role_notification_map where notification_id = (select id from notification where name = 'report-monthly-bls-intern-schedule-assignments')
;
delete from notification where name = 'report-monthly-bls-intern-schedule-assignments'
;
COMMIT
