START TRANSACTION
;
delete FROM schedule_assignment where nominal_day >= '2017-10-01'
;
COMMIT
