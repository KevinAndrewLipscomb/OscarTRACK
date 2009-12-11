START TRANSACTION;

insert ignore chassis_model (make_id,name) values
((select id from chassis_make where name = "Honda"),"FourTrax");

insert ignore vehicle
set name = "0923",
  agency_id = "9",
  model_year = "2010",
  chassis_model_id = (select id from chassis_model where name = "G4500"),
  custom_model_id = (select id from custom_model where name = "SDA III Custom"),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = "0",
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.09") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.name = "0923"
  and be_active = TRUE;
insert ignore vehicle_usability_history (vehicle_id,time_went_down,nature_id,down_comment)
select vehicle.id as vehicle_id,
  NOW() as time_went_down,
  (select id from vehicle_down_nature where name = "UNVALIDATED") as nature_id,
  "Wheeled Coach reports assembly almost complete.  KVRS inspection in Orlando scheduled for 15DEC2009." as down_comment
from vehicle
where vehicle.name = "0923"
  and be_active = TRUE;

insert ignore vehicle
set name = "1729",
  agency_id = "17",
  model_year = "2008",
  chassis_model_id = (select id from chassis_model where name = "Expedition"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Utility car"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.17") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.name = "1729"
  and be_active = TRUE;

insert ignore vehicle
set name = "ATV 17",
  agency_id = "17",
  model_year = "2008",
  chassis_model_id = (select id from chassis_model where name = "FourTrax"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "ATV"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.17") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.name = "ATV 17"
  and be_active = TRUE;

COMMIT