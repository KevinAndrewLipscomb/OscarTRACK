START TRANSACTION
;
DROP TABLE IF EXISTS field_situation
;
DROP TABLE IF EXISTS field_situation_impression
;
CREATE TABLE IF NOT EXISTS field_situation_impression (
  id SERIAL,
  description VARCHAR(31) NOT NULL,
  pecking_order SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY(id)
)
ENGINE = InnoDB
;
ALTER TABLE `field_situation_impression`
  DROP INDEX `id`
,
  ADD UNIQUE INDEX `case_description` (`description` ASC) 
,
  ADD UNIQUE INDEX `pecking_order` (`pecking_order` ASC) 
;
insert ignore field_situation_impression (pecking_order,description) values
(00500,'Standby'),
(01000,'Typical'),
(01500,'AlsEms'),
(02000,'MrtCall'),
(02500,'AirportAlert'),
(03000,'AmbNeeded'),
(03500,'AlsNeeded'),
(04000,'CardiacArrestAlsNeeded'),
(04500,'CardiacArrestAmbNeeded'),
(05000,'WorkingFire'),
(05500,'TwoAlarmFire'),
(06000,'MajorFireIncident'),
(06500,'MultiAlarmFire'),
(07000,'Trap'),
(30000,'MciSmall'),
(40000,'MciMedium'),
(50000,'MciLarge'),
(60000,'MciHuge')
;
CREATE TABLE IF NOT EXISTS field_situation (
  id SERIAL,
  be_stale BOOLEAN DEFAULT FALSE NOT NULL,
  case_num CHAR(9) NOT NULL,
  address VARCHAR(127) NOT NULL,
  assignment TEXT NOT NULL,
  time_initialized DATETIME NOT NULL,
  nature VARCHAR(63),
  impression_id BIGINT UNSIGNED,
  num_ambulances SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  num_zone_cars SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  num_squad_trucks SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  num_supervisors SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  be_emtals BOOLEAN DEFAULT FALSE NOT NULL,
  be_etby BOOLEAN DEFAULT FALSE NOT NULL,
  num_holds SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  num_hzcs SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  num_lifeguards SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  num_mci_trucks SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  be_mrt BOOLEAN DEFAULT FALSE NOT NULL,
  num_mrtks SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  be_pio BOOLEAN DEFAULT FALSE NOT NULL,
  be_pu BOOLEAN DEFAULT FALSE NOT NULL,
  be_rescue_area BOOLEAN DEFAULT FALSE NOT NULL,
  num_rbs SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  be_sqtm BOOLEAN DEFAULT FALSE NOT NULL,
  num_tacs SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  num_bats SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  num_cars SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  num_engines SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  num_fboas SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  num_frsqs SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  be_ftby BOOLEAN DEFAULT FALSE NOT NULL,
  num_hazs SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  num_ladders SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  be_mirt BOOLEAN DEFAULT FALSE NOT NULL,
  num_safes SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  be_stech BOOLEAN DEFAULT FALSE NOT NULL,
  num_sups SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  num_tankers SMALLINT UNSIGNED DEFAULT 0 NOT NULL,
  PRIMARY KEY(id),
  INDEX be_stale (be_stale)
)
ENGINE = InnoDB
;
ALTER TABLE `field_situation`
  DROP INDEX `id`
,
  ADD UNIQUE INDEX `case_num` (`case_num` ASC) 
,
  ADD CONSTRAINT `field_situation_case_num` FOREIGN KEY (`case_num` ) REFERENCES `cad_record` (`incident_num` )
,
  ADD CONSTRAINT `field_situation_impression_id` FOREIGN KEY (`impression_id` ) REFERENCES `field_situation_impression` (`id` )
;
COMMIT