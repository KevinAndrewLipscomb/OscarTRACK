START TRANSACTION
;
DROP TABLE IF EXISTS `schedule_assignment_log`
;
CREATE TABLE `schedule_assignment_log`
  (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT
  ,
    `assignment_id` bigint unsigned NOT NULL
  ,
    `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
  ,
    `actor_member_id` int unsigned NOT NULL
  ,
    `action` varchar(511) NOT NULL
  ,
    PRIMARY KEY (`id`)
  ,
    KEY `assignment_id` (`assignment_id`)
  ,
    KEY `actor_member_id` (`actor_member_id`)
  ,
    CONSTRAINT `schedule_assignment_log_assignment_id` FOREIGN KEY (`assignment_id`) REFERENCES `schedule_assignment` (`id`) ON DELETE CASCADE
  ,
    CONSTRAINT `schedule_assignment_log_actor_member_id` FOREIGN KEY (`actor_member_id`) REFERENCES `member` (`id`)
  )
  ENGINE=InnoDB
;
COMMIT
