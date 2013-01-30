START TRANSACTION
;
ALTER TABLE `agency` CHANGE COLUMN `door_code` `door_code` VARCHAR(63) NULL DEFAULT NULL
;
update agency
set door_code = "Meet @9 (code 5,2,1); run @19 (code 4,5,1)"
where id = 19
;
COMMIT
