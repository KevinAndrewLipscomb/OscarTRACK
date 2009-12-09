START TRANSACTION;

insert ignore vehicle_kind
set description = "Parade piece";

insert ignore chassis_make
set name = "Spartan";

insert ignore chassis_model (make_id,name) values
((select id from chassis_make where name = "Cadillac"),"Fleetwood"),
((select id from chassis_make where name = "Spartan"), "Metro Star");

insert ignore custom_make (name) values
("Saulsbury"),
("Miller-Meteor");

insert ignore custom_model (make_id,name) values
((select id from custom_make where name = "Miller-Meteor"),"Lifeliner"),
((select id from custom_make where name = "Saulsbury"), "HDR Non Walk-In");

insert ignore vehicle
set name = "0120",
  agency_id = "1",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.01") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R01");

insert ignore vehicle
set name = "0121",
  agency_id = "1",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.01") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R01");

insert ignore vehicle
set name = "0122",
  agency_id = "1",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.22") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R01");

insert ignore vehicle
set name = "0222",
  agency_id = "2",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.02") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R02");

insert ignore vehicle
set name = "0420",
  agency_id = "4",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.04") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R04");

insert ignore vehicle
set name = "0421",
  agency_id = "4",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.04") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R04");

insert ignore vehicle
set name = "0422",
  agency_id = "4",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.04") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R04");

insert ignore vehicle
set name = "0520",
  agency_id = "5",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.05") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R05");

insert ignore vehicle
set name = "0522",
  agency_id = "5",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.05") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R05");

insert ignore vehicle
set name = "0620",
  agency_id = "6",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.06") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R06");

insert ignore vehicle
set name = "0621",
  agency_id = "6",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.06") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R06");

insert ignore vehicle
set name = "1320",
  agency_id = "13",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.13") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R13");

insert ignore vehicle
set name = "1321",
  agency_id = "13",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.13") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R13");

insert ignore vehicle
set name = "1420",
  agency_id = "14",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R14");

insert ignore vehicle
set name = "1421",
  agency_id = "14",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.08R") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R14");

insert ignore vehicle
set name = "1422",
  agency_id = "14",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R14");

insert ignore vehicle
set name = "1423",
  agency_id = "14",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R14");

insert ignore vehicle
set name = "1424",
  agency_id = "14",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R14");

insert ignore vehicle
set name = "1425",
  agency_id = "14",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.08R") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R14");

insert ignore vehicle
set name = "1426",
  agency_id = "14",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R14");

insert ignore vehicle
set name = "1429",
  agency_id = "14",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "F-550"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Utility car"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R14");

insert ignore vehicle
set name = "CART 14",
  agency_id = "14",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "Gator"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Special cart"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R14");

insert ignore vehicle
set name = "1621",
  agency_id = "16",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
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
where vehicle.agency_id = (select id from agency where short_designator = "R16");

insert ignore vehicle
set name = "1622",
  agency_id = "16",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
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
where vehicle.agency_id = (select id from agency where short_designator = "R16");

insert ignore vehicle
set name = "SQUAD 14",
  agency_id = "14",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "Metro Star"),
  custom_model_id = (select id from custom_model where name = "HDR Non Walk-In"),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Squad truck"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R14");

insert ignore vehicle
set name = "PARADE 14",
  agency_id = "14",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "Fleetwood"),
  custom_model_id = (select id from custom_model where name = "Lifeliner"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Parade piece"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.14") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R14");

insert ignore vehicle
set name = "1720",
  agency_id = "17",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
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
where vehicle.agency_id = (select id from agency where short_designator = "R17");

insert ignore vehicle
set name = "1721",
  agency_id = "17",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
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
where vehicle.agency_id = (select id from agency where short_designator = "R17");

insert ignore vehicle
set name = "1723",
  agency_id = "17",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
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
where vehicle.agency_id = (select id from agency where short_designator = "R17");

COMMIT