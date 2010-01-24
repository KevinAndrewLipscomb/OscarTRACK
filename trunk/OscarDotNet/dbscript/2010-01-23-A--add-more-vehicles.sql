START TRANSACTION;

ALTER TABLE `chassis_model`
 DROP INDEX `name`,
 ADD UNIQUE INDEX `name` USING BTREE(`make_id`, `name`);

insert into chassis_model (make_id,name) values
((select id from chassis_make where name = "Wells Cargo"),"Cargo"),
((select id from chassis_make where name = "Avenger"),"Cargo");

insert into vehicle_kind set description = "Dive truck";

insert ignore vehicle
set name = "MRT1",
  agency_id = "203",
  model_year = null,
  chassis_model_id = (select id from chassis_model where name = "M2"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Dive truck"),
  bumper_number = null,
  license_plate = null,
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = null;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.22") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "MRT1"
  and be_active = TRUE;

insert ignore vehicle
set name = "MRT2",
  agency_id = "203",
  model_year = 1994,
  chassis_model_id = (select id from chassis_model where name = "Suburban"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Utility car"),
  bumper_number = "51258",
  license_plate = "2138EV",
  recent_mileage = 129290,
  target_pm_mileage = 132000,
  dmv_inspection_due = "2010-05-31",
  vin = "1GNGK26N3RJ351233";
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "MRT2"
  and be_active = TRUE;

insert ignore vehicle
set name = "CART 14 TRAILER",
  agency_id = "14",
  model_year = 2006,
  chassis_model_id = (select id from chassis_model where name = "6X16GW1BRK"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "(none)"),
  kind_id = (select id from vehicle_kind where description = "Utility trailer"),
  bumper_number = null,
  license_plate = "8124EV",
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = "2010-04-30",
  vin = "4YMUL16286V023638";
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "CART 14 TRAILER"
  and be_active = TRUE;

insert ignore vehicle
set name = "UNKNOWN TRAILER",
  agency_id = "0",
  model_year = 2001,
  chassis_model_id = (select id from chassis_model where name = "Utility"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "(none)"),
  kind_id = (select id from vehicle_kind where description = "Utility trailer"),
  bumper_number = "141620",
  license_plate = "88576L",
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = "17XPB081711014716";
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "UNKNOWN TRAILER"
  and be_active = TRUE;

insert ignore vehicle
set name = "KIDSAFE TRAILER",
  agency_id = "203",
  model_year = null,
  chassis_model_id = (select id from chassis_model where name = "Cargo" and make_id = (select id from chassis_make where name = "Wells Cargo")),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "(none)"),
  kind_id = (select id from vehicle_kind where description = "Cargo trailer"),
  bumper_number = null,
  license_plate = "88568L",
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = null;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "KIDSAFE TRAILER"
  and be_active = TRUE;

insert ignore vehicle
set name = "SAR TRAILER (OLD)",
  agency_id = "204",
  model_year = null,
  chassis_model_id = (select id from chassis_model where name = "Cargo" and make_id = (select id from chassis_make where name = "(unknown)")),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "(none)"),
  kind_id = (select id from vehicle_kind where description = "Cargo trailer"),
  bumper_number = "120834",
  license_plate = "57853L",
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = null;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "SAR TRAILER (OLD)"
  and be_active = TRUE;

insert ignore vehicle
set name = "SAR TRAILER",
  agency_id = "204",
  model_year = null,
  chassis_model_id = (select id from chassis_model where name = "Cargo" and make_id = (select id from chassis_make where name = "Avenger")),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "(none)"),
  kind_id = (select id from vehicle_kind where description = "Cargo trailer"),
  bumper_number = "141160",
  license_plate = "20997L",
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = "2009-09-30",
  vin = "4T6AB2420YM013850";
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "SAR TRAILER"
  and be_active = TRUE;

insert ignore vehicle
set name = "CAMPAIGN THERMOMETER TRAILER",
  agency_id = "14",
  model_year = null,
  chassis_model_id = (select id from chassis_model where name = "Utility" and make_id = (select id from chassis_make where name = "(unknown)")),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "(none)"),
  kind_id = (select id from vehicle_kind where description = "Utility trailer"),
  bumper_number = null,
  license_plate = "124615TL",
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = null;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "CAMPAIGN THERMOMETER TRAILER"
  and be_active = TRUE;

insert ignore vehicle
set name = "CST 14 TRAILER",
  agency_id = "14",
  model_year = 2008,
  chassis_model_id = (select id from chassis_model where name = "JT Summit"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "(none)"),
  kind_id = (select id from vehicle_kind where description = "Cargo trailer"),
  bumper_number = null,
  license_plate = "9353EV",
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = "2010-10-31",
  vin = "4FPUB162X8G129323";
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "CST 14 TRAILER"
  and be_active = TRUE;

COMMIT