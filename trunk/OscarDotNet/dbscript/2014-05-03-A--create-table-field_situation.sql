START TRANSACTION
;
DROP TABLE IF EXISTS field_situation
;
DROP TABLE IF EXISTS field_situation_impression
;
CREATE TABLE IF NOT EXISTS field_situation_impression (
  id SERIAL,
  description VARCHAR(31) NOT NULL,
  elaboration VARCHAR(127) NOT NULL,
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
insert ignore field_situation_impression (pecking_order,description,elaboration) values
(00500,'Standby','AUTOTEXT: Be advised, VB has created a Standby case. No action warranted.'),
(01000,'Typical','AUTOTEXT: Be advised, VB has created a Typical case. No action warranted.'),
(01500,'AlsEms','AUTOTEXT: VB has dispatched an ALS case at <address/>. *UNKNOWN IF SCENE IS SAFE* Contact VB before arriving.'),
(02000,'MrtCall','AUTOTEXT: VB has dispatched a Marine Rescue Team case. MRT members respond on TAC-#.'),
(02500,'AirportAlert','AUTOTEXT: Be advised, VB has dispatched an Airport Alert case.'),
(03000,'AmbNeeded','AUTOTEXT: Ambulance needed. Volunteers to your stations.'),
(03500,'AlsNeeded','AUTOTEXT: ALS needed. ALS to your stations.'),
(04000,'CardiacArrestAlsNeeded','AUTOTEXT: ALS needed at a Cardiac Arrest. ALS to your stations.'),
(04500,'CardiacArrestAmbNeeded','AUTOTEXT: Ambulance needed at a Cardiac Arrest. Volunteers to your stations.'),
(05000,'WorkingFire','AUTOTEXT: Be advised, VBFD has a Working Fire or equivalent.'),
(05500,'TwoAlarmFire','AUTOTEXT: VBFD has a 2-alarm fire or equivalent. EMS first response capacity reduced. Volunteers to your stations.'),
(06000,'MajorFireIncident','AUTOTEXT: VBFD has a major fire incident. EMS first response capacity reduced. Volunteers to your stations.'),
(06500,'MultiAlarmFire','AUTOTEXT: VBFD has a MULTI-alarm fire or equivalent. EMS first response capacity reduced. Volunteers to your stations.'),
(07000,'Trap','AUTOTEXT: VB has dispatched a Trap case or equivalent. SQTM members to your stations.'),
(30000,'MciSmall','AUTOTEXT: Small MCI case active. Volunteers to your stations.'),
(40000,'MciMedium','AUTOTEXT: Medium MCI case active. Volunteers to your stations.'),
(50000,'MciLarge','AUTOTEXT: LARGE MCI case active. Volunteers to your stations.'),
(60000,'MciHuge','AUTOTEXT: HUGE MCI CASE ACTIVE. VOLUNTEERS TO YOUR STATIONS.')
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