START TRANSACTION;

insert ignore chassis_make (name) values
("Texas Bragg");

insert ignore chassis_model (make_id,name) values
((select id from chassis_make where name = "Ford"),"E-350"),
((select id from chassis_make where name = "Ford"),"F-350"),
((select id from chassis_make where name = "Texas Bragg"),"Cart 04");

insert ignore custom_make (name) values
("TC&E-EVS");

insert ignore custom_model (make_id,name) values
((select id from custom_make where name = "TC&E-EVS"),"Storm 4");

insert ignore fuel (description) values
("(none)");

insert ignore vehicle
set name = "0429",
  agency_id = "4",
  model_year = 2005,
  chassis_model_id = (select id from chassis_model where name = "F-350"),
  custom_model_id = (select id from custom_model where name = "Storm 4"),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Utility car"),
  bumper_number = "146598",
  license_plate = "7692EV",
  recent_mileage = 7589,
  target_pm_mileage = 13245,
  dmv_inspection_due = "2010-09-30",
  vin = "1ftww31p55ed20835";
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.04") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.name = "0429"
  and be_active = TRUE;

insert ignore vehicle
set name = "CART 04",
  agency_id = "4",
  model_year = 2005,
  chassis_model_id = (select id from chassis_model where name = "Mule"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Special cart"),
  bumper_number = "146738",
  license_plate = null,
  recent_mileage = 218,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = null;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.04") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.name = "CART 04"
  and be_active = TRUE;

insert ignore vehicle
set name = "CART 04 TRAILER",
  agency_id = "4",
  model_year = null,
  chassis_model_id = (select id from chassis_model where name = "Cart 04"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "(none)"),
  kind_id = (select id from vehicle_kind where description = "Special cart"),
  bumper_number = "146808",
  license_plate = "7927EV",
  recent_mileage = 218,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = null;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.04") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.name = "CART 04"
  and be_active = TRUE;

update vehicle
set chassis_model_id = (select id from chassis_model where name = "E-350"),
  dmv_inspection_due = "2009-04-30"
where name = "0421"
  and be_active;

update vehicle
set chassis_model_id = (select id from chassis_model where name = "F-350"),
  recent_mileage = 118442
where name = "0422"
  and be_active;

COMMIT