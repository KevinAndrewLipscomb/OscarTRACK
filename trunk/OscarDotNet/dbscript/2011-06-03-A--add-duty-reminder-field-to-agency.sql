START TRANSACTION
;
ALTER ignore TABLE `agency` ADD COLUMN `be_ok_to_send_duty_reminders` TINYINT(1) NOT NULL DEFAULT FALSE
, ADD INDEX `be_ok_to_send_duty_reminders` (`be_ok_to_send_duty_reminders` ASC)
;
update ignore agency set be_ok_to_send_duty_reminders = TRUE where id in (0,1,9,14,16)
;
COMMIT