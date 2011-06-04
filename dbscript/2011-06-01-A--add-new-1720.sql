START TRANSACTION;

insert ignore vehicle
set name = "1720",
  agency_id = "17",
  model_year = 2010,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = (select id from custom_model where name = "SDA III" and make_id = (select id from custom_make where name = "Horton")),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = "165972",
  license_plate = "208398M",
  recent_mileage = 0,
  target_pm_mileage = 3000,
  dmv_inspection_due = "2011-06-01",
  vin = "1FDXE4FP2ADA25757",
  be_four_or_all_wheel_drive = "FALSE",
  purchase_price = null,
  recent_mileage_update_time = "2011-06-01 12:00";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.17") as quarters_id,
  "2011-06-01 12:00" as start_datetime,
  null as note
from vehicle
where vin = "1FDXE4FP2ADA25757";

insert ignore vehicle_usability_history (vehicle_id,time_went_down,nature_id,mileage,down_comment)
select vehicle.id as vehicle_id
, "2011-06-01 12:00" as time_went_down
, (select id from vehicle_down_nature where name = "UPGRADE") as nature_id
, 0 as mileage
, null as down_comment
from vehicle
where vin = "1FDXE4FP2ADA25757";

COMMIT