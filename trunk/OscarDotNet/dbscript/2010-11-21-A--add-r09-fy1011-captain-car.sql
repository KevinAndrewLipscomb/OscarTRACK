START TRANSACTION;

insert ignore vehicle
set name = "CAR 950",
  agency_id = "9",
  model_year = 2010,
  chassis_model_id = (select id from chassis_model where name = "Ridgeline"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Utility car"),
  bumper_number = NULL,
  license_plate = "XHC4761",
  recent_mileage = 487,
  target_pm_mileage = 3000,
  dmv_inspection_due = "2011-09-30",
  vin = "5FPYK1F54AB004584",
  be_four_or_all_wheel_drive = TRUE,
  purchase_price = "37550.75",
  recent_mileage_update_time = "2010-09-30 18:00";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "See note") as quarters_id,
  "2010-09-30 18:00" as start_datetime
from vehicle
where vehicle.name = "CAR 950"
  and be_active = TRUE;

COMMIT