START TRANSACTION
;
ALTER TABLE `agency`
  CHANGE COLUMN `oscar_classic_enumerator` `oscar_classic_enumerator` VARCHAR(14) NULL DEFAULT NULL
;
insert ignore agency
set id = 206
, short_designator = "SQT"
, medium_designator = "Squad Team"
, long_designator = "Squad Truck Team"
, be_active = TRUE
, oscar_classic_enumerator = "SquadTruckTeam"
, ems_system_id = 1
;
COMMIT