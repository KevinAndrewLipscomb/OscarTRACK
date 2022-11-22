CREATE TABLE `scenes_reached`
  (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `agency_id` INT UNSIGNED DEFAULT 0,
  `address` VARCHAR(63),
  PRIMARY KEY (`id`),
  INDEX `agency_id` (`agency_id` ASC) VISIBLE,
  CONSTRAINT `scenes_reached_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  )
;
