START TRANSACTION
;
ALTER TABLE `schedule_assignment` 
  CHANGE COLUMN `trigger_managed_year_month` `trigger_managed_year_month` MEDIUMINT NOT NULL DEFAULT 0
;
COMMIT