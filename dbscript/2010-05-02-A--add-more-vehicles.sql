START TRANSACTION;

insert ignore vehicle
set name = "0129",
  agency_id = "1",
  model_year = 1989,
  chassis_model_id = (select id from chassis_model where name = "C/K"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Utility car"),
  bumper_number = "140755",
  license_plate = "4939EV",
  recent_mileage = 43749,
  target_pm_mileage = 48401,
  dmv_inspection_due = "2010-09-30",
  vin = "2GCEK19K3K1223862";
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.01") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "0129"
  and be_active = TRUE;

insert ignore vehicle
set name = "RECRUITMENT TRAILER",
  agency_id = "0",
  model_year = 2007,
  chassis_model_id = (select id from chassis_model where name = "Cargo Sport"),
  custom_model_id = (select id from custom_model where name = "Recruitment trailer"),
  fuel_id = (select id from fuel where description = "(none)"),
  kind_id = (select id from vehicle_kind where description = "Special trailer"),
  bumper_number = "165047",
  license_plate = "8728EV",
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = "2011-04-30",
  vin = "4FPAB14297G119791";
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.22") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "RECRUITMENT TRAILER"
  and be_active = TRUE;

insert ignore vehicle
set name = "PARADE 01",
  agency_id = "1",
  model_year = "1967",
  chassis_model_id = (select id from chassis_model where name = "(standard)"),
  custom_model_id = (select id from custom_model where name = "P-82"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Parade piece"),
  bumper_number = null,
  license_plate = "912AE",
  recent_mileage = 11557,
  target_pm_mileage = null,
  dmv_inspection_due = "2005-04-30",
  vin = null;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.01") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "PARADE 01"
  and be_active = TRUE;

COMMIT