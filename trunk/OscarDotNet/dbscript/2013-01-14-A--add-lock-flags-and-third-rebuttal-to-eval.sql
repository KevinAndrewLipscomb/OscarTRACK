START TRANSACTION
;
ALTER TABLE `eval`
  ADD COLUMN `be_locked_by_third_initially` TINYINT(1) NOT NULL DEFAULT 0
,
  ADD COLUMN `be_locked_by_aic` TINYINT(1) NOT NULL DEFAULT 0  AFTER `be_locked_by_third_initially` 
,
  ADD COLUMN `third_rebuttal` TEXT NULL  AFTER `be_locked_by_aic`
;
COMMIT