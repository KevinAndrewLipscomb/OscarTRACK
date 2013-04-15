START TRANSACTION
;
ALTER TABLE `eval`
  CHANGE COLUMN `be_aic_ok_with_third_progress` `be_aic_ok_with_third_progress` TINYINT(1) NULL DEFAULT NULL
,
  CHANGE COLUMN `be_aic_ok_with_third_release` `be_aic_ok_with_third_release` TINYINT(1) NULL DEFAULT NULL
,
  CHANGE COLUMN `be_third_ok_with_progress` `be_third_ok_with_progress` TINYINT(1) NULL DEFAULT NULL
,
  CHANGE COLUMN `be_third_ok_with_release` `be_third_ok_with_release` TINYINT(1) NULL DEFAULT NULL
;
COMMIT