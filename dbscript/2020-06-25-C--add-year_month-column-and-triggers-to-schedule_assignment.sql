START TRANSACTION
;
DROP TRIGGER IF EXISTS `schedule_assignment_BEFORE_INSERT`
;
DROP TRIGGER IF EXISTS `schedule_assignment_BEFORE_UPDATE`
;
ALTER TABLE `schedule_assignment` 
  ADD COLUMN `trigger_managed_year_month` MEDIUMINT NOT NULL
;
update schedule_assignment
set trigger_managed_year_month = EXTRACT(YEAR_MONTH from nominal_day)
;
ALTER TABLE `schedule_assignment` 
  ADD INDEX `trigger_managed_year_month` (`trigger_managed_year_month` ASC)
;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `schedule_assignment_BEFORE_INSERT` BEFORE INSERT ON `schedule_assignment` FOR EACH ROW
BEGIN
  set NEW.trigger_managed_year_month = EXTRACT(YEAR_MONTH from NEW.nominal_day);
END
$$
CREATE DEFINER = CURRENT_USER TRIGGER `schedule_assignment_BEFORE_UPDATE` BEFORE UPDATE ON `schedule_assignment` FOR EACH ROW
BEGIN
  set NEW.trigger_managed_year_month = EXTRACT(YEAR_MONTH from NEW.nominal_day);
END
$$
DELIMITER ;
;
COMMIT