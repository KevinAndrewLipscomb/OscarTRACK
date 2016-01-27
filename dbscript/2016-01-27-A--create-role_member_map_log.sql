START TRANSACTION
;
DROP TABLE IF EXISTS `role_member_map_log`
;
CREATE TABLE `role_member_map_log`
  (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT
  ,
    `subject_member_id` int unsigned NOT NULL
  ,
    `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
  ,
    `actor_member_id` int unsigned
  ,
    be_granted bool NOT NULL
  ,
    role_id int unsigned NOT NULL
  ,
    PRIMARY KEY (`id`)
  ,
    KEY `subject_member_id` (`subject_member_id`)
  ,
    KEY `actor_member_id` (`actor_member_id`)
  ,
    KEY `role_id` (`role_id`)
  ,
    CONSTRAINT `role_member_map_log_subject_member_id` FOREIGN KEY (`subject_member_id`) REFERENCES `member` (`id`)
  ,
    CONSTRAINT `role_member_map_log_actor_member_id` FOREIGN KEY (`actor_member_id`) REFERENCES `member` (`id`)
  ,
    CONSTRAINT `role_member_map_log_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
  )
  ENGINE=InnoDB
;
insert role_member_map_log (subject_member_id,be_granted,role_id)
select member_id as subject_member_id
, TRUE as be_granted
, role_id
from role_member_map
;
COMMIT
