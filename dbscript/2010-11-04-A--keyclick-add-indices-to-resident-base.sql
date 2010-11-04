START TRANSACTION
;
ALTER TABLE `resident_base` ADD INDEX `name` (`name` ASC) ;
;
COMMIT