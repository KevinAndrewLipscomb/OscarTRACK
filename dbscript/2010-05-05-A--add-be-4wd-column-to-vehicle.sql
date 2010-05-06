START TRANSACTION;

ALTER TABLE `vehicle`
  ADD COLUMN `be_four_or_all_wheel_drive` BOOLEAN NOT NULL DEFAULT FALSE,
  ADD INDEX `be_four_or_all_wheel_drive` (`be_four_or_all_wheel_drive` ASC) ;

COMMIT