START TRANSACTION
;
ALTER TABLE `gripe` 
  ADD COLUMN `last_entry_datetime` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP
;
update gripe
set last_entry_datetime = CONCAT(DATE(@reduction_3 := LEFT(SUBSTRING(@reduction_2 := SUBSTRING(@reduction_1 := REPLACE(REPLACE(SUBSTRING(description,LENGTH(description) - LOCATE(' ==v==',REVERSE(description)) + 2),' JR. ',' '),' SR ',' '),LOCATE(' ',@reduction_1) + 1),LOCATE(' ',@reduction_2) + 1),19)),' ',REPLACE(TIME(@reduction_3),'.000000',''))
;
ALTER TABLE `gripe` 
  CHANGE COLUMN `last_entry_datetime` `last_entry_datetime` DATETIME NOT NULL
;
COMMIT
