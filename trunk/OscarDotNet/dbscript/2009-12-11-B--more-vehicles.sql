START TRANSACTION;

insert ignore vehicle
set name = "SQUAD 16",
  agency_id = "16",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "M2"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Squad truck"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.16") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.name = "SQUAD 16"
  and be_active = TRUE;

COMMIT