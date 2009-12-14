START TRANSACTION;

delete from vehicle_quarters_history
  where vehicle_id = (select id from vehicle where name = "1320" and be_active);
delete from vehicle_usability_history
  where vehicle_id = (select id from vehicle where name = "1320" and be_active);
delete from vehicle
  where name = "1320" and be_active;

COMMIT