START TRANSACTION
;
ALTER TABLE `cad_record`
  ADD COLUMN `be_augmented` TINYINT(1) NOT NULL DEFAULT 0
,
  ADD INDEX `be_augmented` (`be_augmented` ASC)
;
COMMIT