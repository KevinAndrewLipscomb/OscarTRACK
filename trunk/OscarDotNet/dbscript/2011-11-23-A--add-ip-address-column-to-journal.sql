START TRANSACTION
;
ALTER TABLE `journal` ADD COLUMN `ip_address` VARCHAR(15) AFTER `actor`
, ADD INDEX `ip_address` (`ip_address` ASC)
;
COMMIT