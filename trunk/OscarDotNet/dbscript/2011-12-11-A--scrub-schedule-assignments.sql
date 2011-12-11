START TRANSACTION
;
delete from schedule_assignment where MONTH(nominal_day) = 1
;
COMMIT