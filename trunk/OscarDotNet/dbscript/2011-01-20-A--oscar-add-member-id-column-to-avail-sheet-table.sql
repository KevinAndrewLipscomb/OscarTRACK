START TRANSACTION
;
ALTER TABLE `avail_sheet`
  CHARACTER SET = utf8 ,
  ENGINE = InnoDB ,
  ADD COLUMN `odnmid` INT UNSIGNED NULL ,
  ADD INDEX `odnmid` (`odnmid` ASC)
;
COMMIT
