START TRANSACTION
;
ALTER TABLE `patient_encounter`
  ADD COLUMN `guid` CHAR(36) NOT NULL
,
  ADD UNIQUE `guid` (`guid` ASC)
;
COMMIT