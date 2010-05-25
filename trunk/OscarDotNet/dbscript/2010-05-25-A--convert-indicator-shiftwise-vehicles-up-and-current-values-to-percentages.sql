START TRANSACTION;

update indicator_shiftwise_vehicles_up_and_current
set value = value*100;

COMMIT