START TRANSACTION;

insert ignore vehicle
set name = "0128",
  agency_id = "1",
  model_year = 2000,
  chassis_model_id = (select id from chassis_model where name = "E-350"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Utility car"),
  bumper_number = "141530",
  license_plate = "5960EV",
  recent_mileage = 49064,
  target_pm_mileage = 49455,
  dmv_inspection_due = "2010-09-30",
  vin = "1FBSS31L9YHA04787",
  be_four_or_all_wheel_drive = "FALSE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.22") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "0128"
  and be_active = TRUE;

insert ignore vehicle
set name = "MRT3",
  agency_id = "203",
  model_year = 2006,
  chassis_model_id = (select id from chassis_model where name = "F-350"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Utility car"),
  bumper_number = "146799",
  license_plate = "83483L",
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = "1FTWF31P46EB82268",
  be_four_or_all_wheel_drive = "TRUE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "EMS Admin") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "MRT3"
  and be_active = TRUE;
  
insert ignore chassis_make (name) values
("Willard"),
("Northwind"),
("Mercury"),
("Sea Ark"),
("Yamaha");

insert ignore chassis_model (make_id,name) values
((select id from chassis_make where name = "Willard"),"Sea Force 730"),
((select id from chassis_make where name = "Northwind"),"RIB - 24"),
((select id from chassis_make where name = "Zodiac"),"MK II GR"),
((select id from chassis_make where name = "Zodiac"),"DR-400"),
((select id from chassis_make where name = "Ford"),"Freestyle");

insert ignore vehicle
set name = "RB1",
  agency_id = "203",
  model_year = 1989,
  chassis_model_id = (select id from chassis_model where name = "Sea Force 730"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Boat"),
  bumper_number = "140682",
  license_plate = null,
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = null,
  be_four_or_all_wheel_drive = "FALSE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "VBFC Main") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "RB1"
  and be_active = TRUE;
  
insert ignore vehicle
set name = "RB2",
  agency_id = "203",
  model_year = 2009,
  chassis_model_id = (select id from chassis_model where name = "RIB - 24"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Boat"),
  bumper_number = "165609",
  license_plate = null,
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = null,
  be_four_or_all_wheel_drive = "FALSE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Lynnhaven Marina") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "RB2"
  and be_active = TRUE;
  
insert ignore vehicle
set name = "RB3",
  agency_id = "203",
  model_year = 1995,
  chassis_model_id = (select id from chassis_model where name = "MK II GR"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Boat"),
  bumper_number = "134885",
  license_plate = null,
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = null,
  be_four_or_all_wheel_drive = "FALSE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "EMS Admin") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "RB3"
  and be_active = TRUE;
  
insert ignore vehicle_quarters (medium_designator,long_designator,pecking_order,be_active) values
("SpecOps shed","Special Operations shed",40000,TRUE);
  
insert ignore vehicle
set name = "RB4",
  agency_id = "203",
  model_year = null,
  chassis_model_id = (select id from chassis_model where name = "DR-400"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Boat"),
  bumper_number = "165306",
  license_plate = null,
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = null,
  be_four_or_all_wheel_drive = "FALSE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "SpecOps shed") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "RB4"
  and be_active = TRUE;
  
insert ignore vehicle
set name = "RB5",
  agency_id = "203",
  model_year = null,
  chassis_model_id = (select id from chassis_model where name = "DR-400"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Boat"),
  bumper_number = "165204",
  license_plate = null,
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = null,
  be_four_or_all_wheel_drive = "FALSE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.06") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "RB5"
  and be_active = TRUE;
  
insert ignore vehicle
set name = "ADMIN 14",
  agency_id = "14",
  model_year = 2006,
  chassis_model_id = (select id from chassis_model where name = "Freestyle"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Utility car"),
  bumper_number = "146740",
  license_plate = "7897EV",
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = "1FMZK01116GA04420",
  be_four_or_all_wheel_drive = "FALSE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "ADMIN 14"
  and be_active = TRUE;
  
COMMIT