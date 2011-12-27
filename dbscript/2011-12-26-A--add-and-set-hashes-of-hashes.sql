START TRANSACTION
;
ALTER TABLE `user` ADD COLUMN `encoded_password_hash` CHAR(40) NULL DEFAULT NULL  AFTER `encoded_password`
;
update user set encoded_password_hash = SHA1(encoded_password)
;
ALTER TABLE `user` DROP COLUMN `encoded_password`
;
COMMIT