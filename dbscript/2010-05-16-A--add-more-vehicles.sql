START TRANSACTION;

insert ignore chassis_make (name) values
("Nissan Diesel"),
("EZ Loader");

insert ignore custom_make (name) values
("Boardman"),
("Supreme");

insert ignore chassis_model (make_id,name) values
((select id from chassis_make where name = "Freightliner"),"FL70"),
((select id from chassis_make where name = "Nissan Diesel"),"Condor"),
((select id from chassis_make where name = "EZ Loader"),"1ZE"),
((select id from chassis_make where name = "Yamaha"),"Rhino");

insert ignore custom_model (make_id,name) values
((select id from custom_make where name = "Boardman"),"MDR Walk-In"),
((select id from custom_make where name = "Supreme"),"Mass Casualty Vehicle"),
((select id from custom_make where name = "Medtec"),"SDA I");

insert ignore vehicle_kind (description) values
("SAR truck"),
("Boat trailer");

insert ignore vehicle
set name = "SQUAD 06",
  agency_id = "6",
  model_year = 1997,
  chassis_model_id = (select id from chassis_model where name = "FL70"),
  custom_model_id = (select id from custom_model where name = "MDR Walk-In" and make_id = (select id from custom_make where name = "Boardman")),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Squad truck"),
  bumper_number = "140507",
  license_plate = "2132EV",
  recent_mileage = 17865,
  target_pm_mileage = 20525,
  dmv_inspection_due = "2010-04-30",
  vin = "1FV6HLCA3WH944477",
  be_four_or_all_wheel_drive = "FALSE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.06") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "SQUAD 06"
  and be_active = TRUE;

insert ignore vehicle
set name = "1425",
  agency_id = "14",
  model_year = 2009,
  chassis_model_id = (select id from chassis_model where name = "C4500"),
  custom_model_id = (select id from custom_model where name = "SDA III" and make_id = (select id from custom_make where name = "Horton")),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = "165669",
  license_plate = "EV1548",
  recent_mileage = 5034,
  target_pm_mileage = 7700,
  dmv_inspection_due = "2011-02-28",
  vin = "1GBE4C1969F407182",
  be_four_or_all_wheel_drive = "FALSE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "1425"
  and be_active = TRUE;
  
insert ignore vehicle
set name = "ATV 01",
  agency_id = "0",
  model_year = null,
  chassis_model_id = (select id from chassis_model where name = "Rhino"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "ATV"),
  bumper_number = "165429",
  license_plate = null,
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = null,
  be_four_or_all_wheel_drive = "TRUE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "ATV 01"
  and be_active = TRUE;
  
insert ignore vehicle
set name = "ATV 03",
  agency_id = "0",
  model_year = null,
  chassis_model_id = (select id from chassis_model where name = "FourTrax"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "ATV"),
  bumper_number = null,
  license_plate = null,
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = null,
  be_four_or_all_wheel_drive = "TRUE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "ATV 03"
  and be_active = TRUE;
  
insert ignore vehicle
set name = "MCI 1",
  agency_id = "0",
  model_year = 2004,
  chassis_model_id = (select id from chassis_model where name = "Condor"),
  custom_model_id = (select id from custom_model where name = "Mass Casualty Vehicle" and make_id = (select id from custom_make where name = "Supreme")),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "MCI truck"),
  bumper_number = "146332",
  license_plate = "26-625L",
  recent_mileage = 7797,
  target_pm_mileage = 10782,
  dmv_inspection_due = "2010-12-31",
  vin = "JNAMC50H35AF50019",
  be_four_or_all_wheel_drive = "FALSE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.21") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "MCI 1"
  and be_active = TRUE;
  
insert ignore vehicle
set name = "SAR TRUCK",
  agency_id = "204",
  model_year = 1998,
  chassis_model_id = (select id from chassis_model where name = "F-350"),
  custom_model_id = (select id from custom_model where name = "SDA I" and make_id = (select id from custom_make where name = "Medtec")),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "SAR truck"),
  bumper_number = "140778",
  license_plate = "2135EV",
  recent_mileage = 164933,
  target_pm_mileage = 167840,
  dmv_inspection_due = "2010-11-30",
  vin = "1FDWF36F7XEB84951",
  be_four_or_all_wheel_drive = "FALSE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.22") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "SAR TRUCK"
  and be_active = TRUE;
  
insert ignore vehicle
set name = "RB4 TRAILER",
  agency_id = "203",
  model_year = 2008,
  chassis_model_id = (select id from chassis_model where name = "1ZE"),
  custom_model_id = null,
  fuel_id = (select id from fuel where description = "(none)"),
  kind_id = (select id from vehicle_kind where description = "Boat trailer"),
  bumper_number = "165398",
  license_plate = "43-083L",
  recent_mileage = null,
  target_pm_mileage = null,
  dmv_inspection_due = null,
  vin = "1ZEAAKHB18A160894",
  be_four_or_all_wheel_drive = "FALSE";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.06") as quarters_id,
  NOW() as start_datetime
from vehicle
where vehicle.name = "RB4 TRAILER"
  and be_active = TRUE;

COMMIT