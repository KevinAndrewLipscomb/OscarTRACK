-- OscarTRACK

START TRANSACTION;

ALTER TABLE `member`
 ADD INDEX `last_name`(`last_name`),
 ADD INDEX `first_name`(`first_name`);

ALTER TABLE `user`
  MODIFY COLUMN `last_login` DATETIME;

COMMIT