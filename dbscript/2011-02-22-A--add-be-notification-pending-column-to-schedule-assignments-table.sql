START TRANSACTION
;
ALTER TABLE `schedule_assignment` ADD COLUMN `be_notification_pending` BOOLEAN NOT NULL DEFAULT TRUE
, ADD INDEX `be_notification_pending` (`be_notification_pending` ASC)
;
COMMIT