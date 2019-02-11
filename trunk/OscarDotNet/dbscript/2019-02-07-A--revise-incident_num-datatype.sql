START TRANSACTION
;
ALTER TABLE `field_situation` DROP FOREIGN KEY `field_situation_case_num`
;
ALTER TABLE `cad_record` CHANGE COLUMN `incident_num` `incident_num` VARCHAR(16) NULL DEFAULT NULL
;
ALTER TABLE `field_situation` CHANGE COLUMN `case_num` `case_num` VARCHAR(16) NOT NULL
;
ALTER TABLE `field_situation` ADD CONSTRAINT `field_situation_case_num` FOREIGN KEY (`case_num`) REFERENCES `cad_record` (`incident_num`) ON DELETE CASCADE
;
COMMIT
