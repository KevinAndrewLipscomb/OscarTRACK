START TRANSACTION
;
update role
set name = 'Squad Truck Team Scheduler'
, pecking_order = 21425
where name = 'Department Squad Truck Team Scheduler'
;
COMMIT