START TRANSACTION;

insert ignore vehicle
set name = "0922",
  agency_id = "9",
  model_year = 2010,
  chassis_model_id = (select id from chassis_model where name = "G4500"),
  custom_model_id = (select id from custom_model where name = "SDA III" and make_id = (select id from custom_make where name = "Wheeled Coach")),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = 761,
  target_pm_mileage = 3000,
  dmv_inspection_due = "2011-07-31",
  vin = "1GB9G5B69A1113270",
  be_four_or_all_wheel_drive = "FALSE",
  purchase_price = "126994",
  recent_mileage_update_time = "2010-07-30 18:00";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.09") as quarters_id,
  "2010-07-30 18:00" as start_datetime
from vehicle
where vehicle.name = "0922"
  and be_active = TRUE;

COMMIT