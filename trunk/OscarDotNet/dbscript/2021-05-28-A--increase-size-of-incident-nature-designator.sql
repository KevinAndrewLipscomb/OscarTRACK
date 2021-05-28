START TRANSACTION
;
ALTER TABLE `incident_nature` CHANGE COLUMN `designator` `designator` VARCHAR(6) NOT NULL
;
COMMIT