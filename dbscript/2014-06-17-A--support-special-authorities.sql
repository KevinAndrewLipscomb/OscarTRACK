START TRANSACTION
;
DROP TABLE IF EXISTS `special_role_member_map`
;
CREATE TABLE `special_role_member_map`
  (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT
,
  `member_id` int(10) unsigned NOT NULL
,
  `role_id` int(10) unsigned NOT NULL
,
  `agency_id` INT UNSIGNED NULL
,
  PRIMARY KEY (`id`)
,
  UNIQUE INDEX `practical` (`member_id` ASC, `role_id` ASC, `agency_id` ASC)
,
  KEY `role_id` (`role_id`)
,
  INDEX `agency_id` (`agency_id` ASC)
,
  CONSTRAINT `role_member_map_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
,
  CONSTRAINT `role_member_map_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
,
  CONSTRAINT `role_member_map_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
  )
  ENGINE=InnoDB DEFAULT CHARSET=utf8
;
COMMIT