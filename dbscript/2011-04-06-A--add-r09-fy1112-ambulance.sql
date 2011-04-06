START TRANSACTION;

insert ignore vehicle
set name = "PCU 0921",
  agency_id = "9",
  model_year = 2010,
  chassis_model_id = (select id from chassis_model where name = "G4500"),
  custom_model_id = (select id from custom_model where name = "SDA III" and make_id = (select id from custom_make where name = "Wheeled Coach")),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = 0,
  target_pm_mileage = 3000,
  dmv_inspection_due = "2012-04-30",
  vin = "1GB9G5B69A1125055",
  be_four_or_all_wheel_drive = "FALSE",
  purchase_price = "132680",
  recent_mileage_update_time = "2011-04-06 10:40";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "See note") as quarters_id,
  "2011-04-06 10:40" as start_datetime,
  "Wheeled Coach Orlando factory assembly line" as note
from vehicle
where vin = "1GB9G5B69A1125055";

insert ignore vehicle_usability_history (vehicle_id,time_went_down,nature_id,mileage,down_comment)
select vehicle.id as vehicle_id
, "2011-03-16 18:30" as time_went_down
, (select id from vehicle_down_nature where name = "UPGRADE") as nature_id
, 0 as mileage
, "Ordered.  PCU = Pre-Commissioning Unit." as down_comment
from vehicle
where vin = "1GB9G5B69A1125055";

COMMIT