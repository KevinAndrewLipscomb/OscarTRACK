START TRANSACTION
;
ALTER TABLE `gripe` CHARACTER SET = utf8
;
ALTER TABLE `gripe` CHANGE COLUMN `description` `description` MEDIUMTEXT CHARACTER SET 'utf8' NOT NULL
;
COMMIT