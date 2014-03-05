START TRANSACTION
;
CREATE  TABLE `mid_cycle_leave` (
  `id` SERIAL ,
  `member_id` INT UNSIGNED NOT NULL ,
  `kind_of_leave_code` TINYINT UNSIGNED NOT NULL ,
  `start_date` DATE NOT NULL ,
  `end_date` DATE NOT NULL ,
  `note` VARCHAR(127) ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `member_id` (`member_id` ASC, `start_date` ASC) ,
  CONSTRAINT `mid_cycle_leave_member_id` FOREIGN KEY (`member_id` ) REFERENCES `member` (`id` )
  )
;
COMMIT