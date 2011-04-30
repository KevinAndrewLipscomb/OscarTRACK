START TRANSACTION
;
delete from schedule_assignment where member_id is null or member_id = 1512
;
ALTER TABLE `schedule_assignment` CHANGE COLUMN `post_id` `post_id` INT UNSIGNED NOT NULL
;
ALTER TABLE `schedule_assignment` ADD COLUMN `reviser_member_id` INT UNSIGNED NULL
, ADD CONSTRAINT `schedule_assignment_shift_id` FOREIGN KEY (`shift_id` ) REFERENCES `shift` (`id` )
, ADD CONSTRAINT `schedule_assignment_post_id` FOREIGN KEY (`post_id`) REFERENCES `agency` (`id`)
, ADD CONSTRAINT `scheduler_assignment_member_id` FOREIGN KEY (`member_id` ) REFERENCES `member` (`id` )
, ADD CONSTRAINT `scheduler_assignment_reviser_member_id` FOREIGN KEY (`reviser_member_id` ) REFERENCES `member` (`id` )
, ADD INDEX `schedule_assignment_shift_id` (`shift_id` ASC)
, ADD INDEX `schedule_assignment_post_id` (`post_id`,`post_cardinality`)
, ADD INDEX `scheduler_assignment_member_id` (`member_id` ASC)
, ADD INDEX `be_selected` (`be_selected` ASC)
, ADD INDEX `scheduler_assignment_reviser_member_id` (`reviser_member_id` ASC)
;
ALTER TABLE `schedule_assignment` ADD INDEX `conventional` (`nominal_day` ASC, `shift_id` ASC, `post_id` ASC, `be_selected` ASC, `post_cardinality` ASC, `position_id` ASC)
;
COMMIT