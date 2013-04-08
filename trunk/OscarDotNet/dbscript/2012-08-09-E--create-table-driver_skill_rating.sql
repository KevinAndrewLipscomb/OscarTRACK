START TRANSACTION
;
DROP TABLE IF EXISTS driver_skill_rating
;
CREATE TABLE IF NOT EXISTS driver_skill_rating (
  id SERIAL,
  driver_skill_id BIGINT UNSIGNED NOT NULL,
  skill_rating_id BIGINT UNSIGNED,
  eval_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY(id)
)
ENGINE = InnoDB
;
ALTER TABLE `driver_skill_rating`
  ADD INDEX `driver_skill_id` (`driver_skill_id` ASC)
,
  ADD INDEX `skill_rating_id` (`skill_rating_id` ASC)
,
  ADD INDEX `eval_id` (`eval_id` ASC)
,
  ADD CONSTRAINT `driver_skill_rating_driver_skill_id` FOREIGN KEY (`driver_skill_id` ) REFERENCES `driver_skill` (`id` )
,
  ADD CONSTRAINT `driver_skill_rating_skill_rating_id` FOREIGN KEY (`skill_rating_id` ) REFERENCES `skill_rating` (`id` )
,
  ADD CONSTRAINT `driver_skill_rating_eval_id` FOREIGN KEY (`eval_id` ) REFERENCES `eval` (`id` )
;
COMMIT
