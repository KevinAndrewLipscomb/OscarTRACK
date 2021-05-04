START TRANSACTION
;
ALTER ignore TABLE `member` 
  CHANGE COLUMN `trigger_managed_last_name_double_metaphone` `trigger_managed_last_name_double_metaphone_1` VARCHAR(15) NULL DEFAULT NULL AFTER `phone_service_id`
,
  CHANGE COLUMN `trigger_managed_first_name_double_metaphone` `trigger_managed_last_name_double_metaphone_2` VARCHAR(15) NULL DEFAULT NULL AFTER `trigger_managed_last_name_double_metaphone_1`
,
  DROP INDEX `trigger_managed_first_name_double_metaphone`
,
  ADD INDEX `trigger_managed_last_name_double_metaphone_1` (`trigger_managed_last_name_double_metaphone_1` ASC)
,
  DROP INDEX `trigger_managed_last_name_double_metaphone`
,
  ADD INDEX `trigger_managed_last_name_double_metaphone_2` (`trigger_managed_last_name_double_metaphone_2` ASC)
;
DROP TRIGGER IF EXISTS `member_BEFORE_INSERT`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `member_BEFORE_INSERT` BEFORE INSERT ON `member` FOR EACH ROW BEGIN
set @double_metaphone = DOUBLE_METAPHONE(NEW.last_name);
set NEW.trigger_managed_last_name_double_metaphone_1 = SUBSTRING_INDEX(@double_metaphone,';',1);
set NEW.trigger_managed_last_name_double_metaphone_2 = SUBSTRING_INDEX(@double_metaphone,';',-1);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `member_BEFORE_UPDATE`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `member_BEFORE_UPDATE` BEFORE UPDATE ON `member` FOR EACH ROW BEGIN
set @double_metaphone = DOUBLE_METAPHONE(NEW.last_name);
set NEW.trigger_managed_last_name_double_metaphone_1 = SUBSTRING_INDEX(@double_metaphone,';',1);
set NEW.trigger_managed_last_name_double_metaphone_2 = SUBSTRING_INDEX(@double_metaphone,';',-1);
END
$$
DELIMITER ;
;
update member
set trigger_managed_last_name_double_metaphone_1 = SUBSTRING_INDEX(DOUBLE_METAPHONE(last_name),';',1)
, trigger_managed_last_name_double_metaphone_2 = SUBSTRING_INDEX(DOUBLE_METAPHONE(last_name),';',-1)
;
COMMIT