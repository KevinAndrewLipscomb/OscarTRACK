START TRANSACTION;

update vehicle
set recent_mileage = null
where be_active and name = "CART 04 TRAILER";

COMMIT