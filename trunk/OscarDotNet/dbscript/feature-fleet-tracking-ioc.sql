START TRANSACTION;

DROP TABLE IF EXISTS vehicle_quarters_history;
DROP TABLE IF EXISTS vehicle_usability_history;

DROP TABLE IF EXISTS vehicle;
DROP TABLE IF EXISTS vehicle_quarters;

DROP TABLE IF EXISTS chassis_model;
DROP TABLE IF EXISTS custom_model;
DROP TABLE IF EXISTS fuel;
DROP TABLE IF EXISTS vehicle_down_nature;
DROP TABLE IF EXISTS vehicle_kind;

DROP TABLE IF EXISTS chassis_make;
DROP TABLE IF EXISTS custom_make;

CREATE TABLE IF NOT EXISTS vehicle_kind (
  id SERIAL,
  description VARCHAR(31) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (description)
)
ENGINE = InnoDB;

insert ignore vehicle_kind (description) values
("Ambulance"),
("Zone car"),
("Squad truck"),
("Support truck"),
("Boat"),
("Special cart"),
("Utility car"),
("Supervisor car"),
("Chief car"),
("ATV"),
("Air ambulance");

CREATE TABLE IF NOT EXISTS chassis_make (
  id SERIAL,
  name VARCHAR(31) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (name)
)
ENGINE = InnoDB;

insert ignore chassis_make (name) values
("Ford"),
("Chevrolet"),
("Dodge"),
("International"),
("Freightliner"),
("Mack"),
("Cadillac"),
("Honda"),
("John Deere"),
("Kawasaki"),
("Zodiac"),
("Bell");

CREATE TABLE IF NOT EXISTS chassis_model (
  id SERIAL,
  make_id BIGINT UNSIGNED NOT NULL,
  name VARCHAR(31) NOT NULL,
  PRIMARY KEY(id),
  INDEX (make_id),
  UNIQUE (name),
  CONSTRAINT `chassis_model_make_id` FOREIGN KEY `chassis_model_make_id` (`make_id`) REFERENCES `chassis_make` (`id`)
)
ENGINE = InnoDB;

insert ignore chassis_model (make_id,name) values
((select id from chassis_make where name = "Ford"),"E-450"),
((select id from chassis_make where name = "Ford"),"F-550"),
((select id from chassis_make where name = "Chevrolet"),"C4500"),
((select id from chassis_make where name = "Mack"),"MC"),
((select id from chassis_make where name = "Ford"),"Expedition"),
((select id from chassis_make where name = "Ford"),"Crown Vic PI"),
((select id from chassis_make where name = "Chevrolet"),"Impala"),
((select id from chassis_make where name = "John Deere"),"Gator"),
((select id from chassis_make where name = "Kawasaki"),"Mule"),
((select id from chassis_make where name = "Bell"),"407"),
((select id from chassis_make where name = "Dodge"),"Durango"),
((select id from chassis_make where name = "Chevrolet"),"G4500");

CREATE TABLE IF NOT EXISTS custom_make (
  id SERIAL,
  name VARCHAR(31) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (name)
)
ENGINE = InnoDB;

insert ignore custom_make (name) values
("Wheeled Coach"),
("Horton"),
("Medtec"),
("Swab"),
("CoVBPWAS"),
("Summit");

CREATE TABLE IF NOT EXISTS custom_model (
  id SERIAL,
  make_id BIGINT UNSIGNED NOT NULL,
  name VARCHAR(31) NOT NULL,
  PRIMARY KEY(id),
  INDEX (make_id),
  UNIQUE (name),
  CONSTRAINT `custom_model_make_id` FOREIGN KEY `custom_model_make_id` (`make_id`) REFERENCES `custom_make` (`id`)
)
ENGINE = InnoDB;

insert ignore custom_model (make_id,name) values
((select id from custom_make where name = "Wheeled Coach"),"Custom III"),
((select id from custom_make where name = "Swab"),"MDR"),
((select id from custom_make where name = "Horton"),"LDR"),
((select id from custom_make where name = "Horton"),"MDA 525"),
((select id from custom_make where name = "Horton"),"MPV 145 I"),
((select id from custom_make where name = "Horton"),"MPV III"),
((select id from custom_make where name = "CoVBPWAS"),"EMSZC"),
((select id from custom_make where name = "CoVBPWAS"),"EMSSC"),
((select id from custom_make where name = "Summit"),"EMS completion");

CREATE TABLE IF NOT EXISTS fuel (
  id SERIAL,
  description VARCHAR(31) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (description)
)
ENGINE = InnoDB;

insert ignore fuel (description) values
("Diesel"),
("Gasoline"),
("Jet A"),
("Propane"),
("Natural gas"),
("Biodiesel"),
("Hydrogen");

CREATE TABLE IF NOT EXISTS vehicle (
  id SERIAL,
  agency_id INTEGER UNSIGNED NOT NULL,
  name VARCHAR(63) NOT NULL,
  kind_id BIGINT UNSIGNED NOT NULL,
  bumper_number CHAR(6),
  model_year INTEGER UNSIGNED,
  chassis_model_id BIGINT UNSIGNED NOT NULL,
  custom_model_id BIGINT UNSIGNED,
  vin CHAR(17),
  fuel_id BIGINT UNSIGNED,
  license_plate VARCHAR(15),
  purchase_price DECIMAL(10,2),
  recent_mileage INTEGER UNSIGNED,
  be_active BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY(id),
  INDEX (agency_id),
  INDEX (name),
  INDEX (kind_id),
  UNIQUE (bumper_number),
  INDEX (model_year),
  INDEX (chassis_model_id),
  INDEX (custom_model_id),
  UNIQUE (vin),
  INDEX (fuel_id),
  INDEX (license_plate),
  INDEX (be_active),
  CONSTRAINT `vehicle_agency_id` FOREIGN KEY `vehicle_agency_id` (`agency_id`) REFERENCES `agency` (`id`),
  CONSTRAINT `vehicle_kind_id` FOREIGN KEY `vehicle_kind_id` (`kind_id`) REFERENCES `vehicle_kind` (`id`),
  CONSTRAINT `vehicle_chassis_model_id` FOREIGN KEY `vehicle_chassis_model_id` (`chassis_model_id`) REFERENCES `chassis_model` (`id`),
  CONSTRAINT `vehicle_custom_model_id` FOREIGN KEY `vehicle_custom_model_id` (`custom_model_id`) REFERENCES `custom_model` (`id`),
  CONSTRAINT `vehicle_fuel_id` FOREIGN KEY `vehicle_fuel_id` (`fuel_id`) REFERENCES `fuel` (`id`)
)
ENGINE = InnoDB;

insert ignore vehicle
set name = "0920",
  agency_id = "9",
  model_year = "2006",
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = (select id from custom_model where name = "MPV III"),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = "165178",
  license_plate = "8791EV",
  recent_mileage = "52481",
  vin = "1FDXE45P26HB29859";
insert ignore vehicle
set name = "0921",
  agency_id = "9",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = (select id from custom_model where name = "Custom III"),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle
set name = "0925",
  agency_id = "9",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = (select id from custom_model where name = "Custom III"),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle
set name = "0927",
  agency_id = "9",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "E-450"),
  custom_model_id = NULL,
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle
set name = "1620",
  agency_id = "16",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "C4500"),
  custom_model_id = (select id from custom_model where name = "MDA 525"),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle
set name = "1623",
  agency_id = "16",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "C4500"),
  custom_model_id = (select id from custom_model where name = "MPV III"),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Ambulance"),
  bumper_number = "146531",
  license_plate = "3230EV",
  recent_mileage = "105767",
  vin = "1GBE4V1225F517901";
insert ignore vehicle
set name = "AIR MEDIC",
  agency_id = "0",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "407"),
  custom_model_id = (select id from custom_model where name = "EMS completion"),
  fuel_id = (select id from fuel where description = "Jet A"),
  kind_id = (select id from vehicle_kind where description = "Air ambulance"),
  bumper_number = NULL,
  license_plate = "N911VB",
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle
set name = "BRIGADE 9",
  agency_id = "0",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "Expedition"),
  custom_model_id = (select id from custom_model where name = "EMSSC"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Supervisor car"),
  bumper_number = "146190",
  license_plate = "121228L",
  recent_mileage = NULL,
  vin = "1FMPU16L44LA88691";
insert ignore vehicle
set name = "EMS 5",
  agency_id = "0",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "Expedition"),
  custom_model_id = (select id from custom_model where name = "EMSSC"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Supervisor car"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle
set name = "EMS 6",
  agency_id = "0",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "Expedition"),
  custom_model_id = (select id from custom_model where name = "EMSSC"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Supervisor car"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle
set name = "EMS 7",
  agency_id = "0",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "Durango"),
  custom_model_id = (select id from custom_model where name = "EMSSC"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Supervisor car"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle
set name = "SQUAD 9",
  agency_id = "9",
  model_year = "1982",
  chassis_model_id = (select id from chassis_model where name = "MC"),
  custom_model_id = (select id from custom_model where name = "MDR"),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Squad truck"),
  bumper_number = "003638",
  license_plate = "2766EV",
  recent_mileage = "96259",
  vin = "1M2H125C3DM001118";
insert ignore vehicle
set name = "SUPPORT 9",
  agency_id = "9",
  model_year = "2000",
  chassis_model_id = (select id from chassis_model where name = "F-550"),
  custom_model_id = (select id from custom_model where name = "MPV 145 I"),
  fuel_id = (select id from fuel where description = "Diesel"),
  kind_id = (select id from vehicle_kind where description = "Support truck"),
  bumper_number = "141300",
  license_plate = "2767EV",
  recent_mileage = "88676",
  vin = "1FDAF57F2YEE09072";
insert ignore vehicle
set name = "ZONE 02",
  agency_id = "0",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "Crown Vic PI"),
  custom_model_id = (select id from custom_model where name = "EMSZC"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Zone car"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle
set name = "ZONE 06",
  agency_id = "0",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "Crown Vic PI"),
  custom_model_id = (select id from custom_model where name = "EMSZC"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Zone car"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle
set name = "ZONE 07",
  agency_id = "0",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "Crown Vic PI"),
  custom_model_id = (select id from custom_model where name = "EMSZC"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Zone car"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle
set name = "ZONE 08",
  agency_id = "0",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "Crown Vic PI"),
  custom_model_id = (select id from custom_model where name = "EMSZC"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Zone car"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle
set name = "ZONE 09",
  agency_id = "0",
  model_year = "2007",
  chassis_model_id = (select id from chassis_model where name = "Crown Vic PI"),
  custom_model_id = (select id from custom_model where name = "EMSZC"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Zone car"),
  bumper_number = "165106",
  license_plate = "143033L",
  recent_mileage = "84493",
  vin = "2FAHP71WX7X155263";
insert ignore vehicle
set name = "ZONE 14",
  agency_id = "0",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "Crown Vic PI"),
  custom_model_id = (select id from custom_model where name = "EMSZC"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Zone car"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle
set name = "ZONE 16",
  agency_id = "0",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "Crown Vic PI"),
  custom_model_id = (select id from custom_model where name = "EMSZC"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Zone car"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;
insert ignore vehicle
set name = "ZONE 19",
  agency_id = "0",
  model_year = "2002",
  chassis_model_id = (select id from chassis_model where name = "Crown Vic PI"),
  custom_model_id = (select id from custom_model where name = "EMSZC"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Zone car"),
  bumper_number = "141684",
  license_plate = "106624L",
  recent_mileage = "56553",
  vin = "2FAFP71W42X129502";
insert ignore vehicle
set name = "ZONE 21",
  agency_id = "0",
  model_year = NULL,
  chassis_model_id = (select id from chassis_model where name = "Crown Vic PI"),
  custom_model_id = (select id from custom_model where name = "EMSZC"),
  fuel_id = (select id from fuel where description = "Gasoline"),
  kind_id = (select id from vehicle_kind where description = "Zone car"),
  bumper_number = NULL,
  license_plate = NULL,
  recent_mileage = NULL,
  vin = NULL;

insert ignore privilege (name) values
("config-business-objects"),
("config-fleet-attributes"),
("config-vehicles");

insert ignore role (name,tier_id,pecking_order) values
("Department Fleet Coordinator",1,10850),
("Department Street Supervisor",1,10875),
("Squad Fleet Coordinator",2,32000);

insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name ="config-fleet-attributes"),(select id from role where name = "Application Administrator")),
((select id from privilege where name ="config-fleet-attributes"),(select id from role where name = "Department Authority")),
((select id from privilege where name ="config-fleet-attributes"),(select id from role where name = "Department Fleet Coordinator")),
((select id from privilege where name ="config-vehicles"),(select id from role where name = "Application Administrator")),
((select id from privilege where name ="config-vehicles"),(select id from role where name = "Department Authority")),
((select id from privilege where name ="config-vehicles"),(select id from role where name = "Department Fleet Coordinator")),
((select id from privilege where name ="config-vehicles"),(select id from role where name = "Squad Commander")),
((select id from privilege where name ="config-vehicles"),(select id from role where name = "Squad Manager")),
((select id from privilege where name ="config-vehicles"),(select id from role where name = "Squad Fleet Coordinator"));

insert ignore role_privilege_map (privilege_id,role_id)
select (select id from privilege where name = "config-business-objects") as privilege_id,
  role.id as role_id
from role
  join role_privilege_map on (role_privilege_map.role_id=role.id)
  join privilege on (privilege.id=role_privilege_map.privilege_id)
where privilege.name in ("config-agencies","config-fleet-attributes","config-vehicles");

insert ignore notification (name) values
("ambulance-fleet-condition-change"),
("vehicle-status-change"),
("vehicle-quarters-change");

insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = "ambulance-fleet-condition-change"),(select id from role where name = "Department Fleet Coordinator")),
((select id from notification where name = "ambulance-fleet-condition-change"),(select id from role where name = "Squad Fleet Coordinator")),
((select id from notification where name = "ambulance-fleet-condition-change"),(select id from role where name = "Squad Commander")),
((select id from notification where name = "ambulance-fleet-condition-change"),(select id from role where name = "Squad Manager")),
((select id from notification where name = "vehicle-status-change"),(select id from role where name = "Department Fleet Coordinator")),
((select id from notification where name = "vehicle-status-change"),(select id from role where name = "Squad Fleet Coordinator")),
((select id from notification where name = "vehicle-status-change"),(select id from role where name = "Squad Commander")),
((select id from notification where name = "vehicle-status-change"),(select id from role where name = "Squad Manager")),
((select id from notification where name = "vehicle-quarters-change"),(select id from role where name = "Department Fleet Coordinator")),
((select id from notification where name = "vehicle-quarters-change"),(select id from role where name = "Squad Fleet Coordinator")),
((select id from notification where name = "vehicle-quarters-change"),(select id from role where name = "Squad Commander")),
((select id from notification where name = "vehicle-quarters-change"),(select id from role where name = "Squad Manager"));

insert ignore role_member_map (role_id,member_id) values
((select id from role where name = "Department Street Supervisor"),(select id from member where last_name = "FUSCO" and first_name = "JOHN")),
((select id from role where name = "Department Street Supervisor"),(select id from member where last_name = "HODGE" and first_name = "DENNIS")),
((select id from role where name = "Department Street Supervisor"),(select id from member where last_name = "BRENNAMAN" and first_name = "JEFF")),
((select id from role where name = "Department Street Supervisor"),(select id from member where last_name = "CORLEY" and first_name = "JOSEPH")),
((select id from role where name = "Department Street Supervisor"),(select id from member where last_name = "ISLAM" and first_name = "RAJ")),
((select id from role where name = "Department Street Supervisor"),(select id from member where last_name = "DELP" and first_name = "ERNIE")),
((select id from role where name = "Department Street Supervisor"),(select id from member where last_name = "BAUST" and first_name = "DAVID")),
((select id from role where name = "Department Street Supervisor"),(select id from member where last_name = "GONZALEZ" and first_name = "PETER")),
((select id from role where name = "Department Fleet Coordinator"),(select id from member where last_name = "HORDESKI" and first_name = "JIM")),
((select id from role where name = "Squad Fleet Coordinator"),(select id from member where last_name = "PARKS" and first_name = "CHRISTOPHER")),
((select id from role where name = "Squad Fleet Coordinator"),(select id from member where last_name = "DAVIS" and first_name = "KAREEM"));

CREATE TABLE IF NOT EXISTS vehicle_down_nature (
  id SERIAL,
  name VARCHAR(31) NOT NULL,
  pecking_order TINYINT UNSIGNED NOT NULL,
  be_failure BOOLEAN NOT NULL,
  elaboration TEXT NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (name),
  UNIQUE (pecking_order),
  INDEX (be_failure)
)
ENGINE = InnoDB;

insert ignore vehicle_down_nature (name,pecking_order,be_failure,elaboration) values
("CRITICAL FAILURE",10,TRUE,"WHILE ASSIGNED TO A CASE, it became impossible or inadvisable to continue using the unit."),
("AGGRAVATING FAILURE",20,TRUE,"WHILE STAFFED, but NOT assigned to a case, it became impossible or inadvisable to continue using the unit."),
("SENTINEL FAILURE",30,TRUE,"While the unit was UNstaffed, it became impossible or inadvisable to continue using it."),
("EXTERNAL EVENT",40,FALSE,"Because of an ACCIDENT, EXTERNAL DAMAGE, OR GROSS MISUSE, it became impossible or inadvisable to continue using the unit.  (If a breakdown caused the accident, do not select this option.)"),
("PM",50,FALSE,"The unit is undergoing PREVENTATIVE MAINTENANCE and/or a GARAGE INSPECTION."),
("UPGRADE",60,FALSE,"The unit is being UPGRADED."),
("UNVALIDATED",255,FALSE,"The unit is down for a reason that is unrelated to repair, maintenance, garage inspection, or upgrade.");

CREATE TABLE IF NOT EXISTS vehicle_usability_history (
  id SERIAL,
  vehicle_id BIGINT UNSIGNED NOT NULL,
  time_went_down DATETIME NOT NULL,
  nature_id BIGINT UNSIGNED NOT NULL,
  mileage INTEGER UNSIGNED,
  down_comment TEXT,
  time_came_up DATETIME,
  up_comment TEXT,
  PRIMARY KEY(id),
  INDEX (vehicle_id),
  INDEX (time_went_down),
  UNIQUE (vehicle_id,time_went_down),
  INDEX (nature_id),
  CONSTRAINT `vehicle_quarters_history_vehicle_id` FOREIGN KEY `vehicle_quarters_history_vehicle_id` (`vehicle_id`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `vehicle_usability_history_nature_id` FOREIGN KEY `vehicle_usability_history_nature_id` (`nature_id`) REFERENCES `vehicle_down_nature` (`id`)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS vehicle_quarters (
  id SERIAL,
  medium_designator VARCHAR(31) NOT NULL,
  long_designator VARCHAR(63) NOT NULL,
  pecking_order SMALLINT UNSIGNED NOT NULL,
  be_active BOOLEAN DEFAULT TRUE NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (medium_designator),
  UNIQUE (long_designator),
  INDEX (pecking_order),
  INDEX (be_active)
)
ENGINE = InnoDB;

insert ignore vehicle_quarters (medium_designator,long_designator,pecking_order,be_active) values
("Sta.01","Ocean Park",0100,TRUE),
("Sta.02","Davis Corner",0200,TRUE),
("Sta.03","London Bridge",0300,TRUE),
("Sta.04","Chesapeake Beach",0400,TRUE),
("Sta.05","Courthouse",0500,TRUE),
("Sta.06","Creeds",0600,TRUE),
("Sta.07","Thalia",0700,TRUE),
("Sta.08F","Company 8",0850,TRUE),
("Sta.08R","Rescue 8",0800,TRUE),
("Sta.09","Kempsville",0900,TRUE),
("Sta.10","Woodstock",1000,TRUE),
("Sta.11","Beach Borough",1100,TRUE),
("Sta.12","Seatack",1200,TRUE),
("Sta.13","Blackwater",1300,TRUE),
("Sta.14","Virginia Beach",1400,TRUE),
("Sta.15","Knotts Island",1500,TRUE),
("Sta.16","Plaza",1600,TRUE),
("Sta.17","Sandbridge",1700,TRUE),
("Sta.18","Green Run",1800,TRUE),
("Sta.19","Stumpy Lake",1900,TRUE),
("Sta.20","Little Neck",2000,TRUE),
("Sta.21","General Booth",2100,TRUE),
("Sta.22","First Landing",2200,TRUE),
("Heliport","City helibase",10000,TRUE),
("Lynnhaven Marina","Lynnhaven Municipal Marina",20100,TRUE),
("VBFC Main","Va Beach Fishing Center (McCluskey's), 200 Winston Salem Ave",20200,TRUE),
("VBFC Southside","Va Beach Fishing Center (McCluskey's), 416 Southside Rd",20300,TRUE),
("Pungo Ferry dock","Pungo Ferry dock",20400,TRUE),
("EMS Admin","VBDEMS Headquarters",30000,TRUE),
("See note","Other",65000,TRUE);

CREATE TABLE IF NOT EXISTS vehicle_quarters_history (
  id SERIAL,
  vehicle_id BIGINT UNSIGNED NOT NULL,
  quarters_id BIGINT UNSIGNED NOT NULL,
  start_datetime DATETIME NOT NULL,
  end_datetime DATETIME,
  note TEXT,
  PRIMARY KEY(id),
  UNIQUE (vehicle_id,quarters_id,start_datetime),
  INDEX (quarters_id),
  INDEX (start_datetime)
)
ENGINE = InnoDB;

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "EMS Admin") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "EMS")
  and vehicle.name <> "AIR MEDIC";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Heliport") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.name = "AIR MEDIC";

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.09") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R09");

insert ignore vehicle_quarters_history (vehicle_id,quarters_id,start_datetime,note)
select vehicle.id as vehicle_id,
  (select id from vehicle_quarters where medium_designator = "Sta.16") as quarters_id,
  NOW() as start_datetime,
  "Initialization setting only" as note
from vehicle
where vehicle.agency_id = (select id from agency where short_designator = "R16");

ALTER TABLE `vehicle_quarters_history`
  ADD CONSTRAINT `vqh_vehicle_id` FOREIGN KEY `vqh_vehicle_id` (`vehicle_id`) REFERENCES `vehicle` (`id`),
  ADD CONSTRAINT `vqh_quarters_id` FOREIGN KEY `vqh_quarters_id` (`quarters_id`) REFERENCES `vehicle_quarters` (`id`);

COMMIT