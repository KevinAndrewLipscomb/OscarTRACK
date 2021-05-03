START TRANSACTION
;
ALTER TABLE `member` 
  ADD COLUMN `trigger_managed_first_name_double_metaphone` VARCHAR(31) NULL AFTER `first_name`
,
  ADD COLUMN `trigger_managed_last_name_double_metaphone` VARCHAR(31) NULL AFTER `last_name`
,
  ADD INDEX `trigger_managed_first_name_double_metaphone` (`trigger_managed_first_name_double_metaphone` ASC)
,
  ADD INDEX `trigger_managed_last_name_double_metaphone` (`trigger_managed_last_name_double_metaphone` ASC)
;
update member
set trigger_managed_first_name_double_metaphone = DOUBLE_METAPHONE(first_name)
, trigger_managed_last_name_double_metaphone = DOUBLE_METAPHONE(last_name)
;
DROP TRIGGER IF EXISTS `member_BEFORE_INSERT`
;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `member_BEFORE_INSERT` BEFORE INSERT ON `member` FOR EACH ROW
BEGIN
set NEW.trigger_managed_first_name_double_metaphone = DOUBLE_METAPHONE(NEW.first_name);
set NEW.trigger_managed_last_name_double_metaphone = DOUBLE_METAPHONE(NEW.last_name);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `member_BEFORE_UPDATE`
;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `member_BEFORE_UPDATE` BEFORE UPDATE ON `member` FOR EACH ROW
BEGIN
set NEW.trigger_managed_first_name_double_metaphone = DOUBLE_METAPHONE(NEW.first_name);
set NEW.trigger_managed_last_name_double_metaphone = DOUBLE_METAPHONE(NEW.last_name);
END
$$
DELIMITER ;
;
COMMIT