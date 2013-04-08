START TRANSACTION
;
DROP TABLE IF EXISTS eval
;
CREATE TABLE IF NOT EXISTS eval (
  id SERIAL,
  third_member_id INTEGER UNSIGNED NOT NULL,
  nominal_day DATE NOT NULL,
  shift_id BIGINT UNSIGNED NOT NULL,
  post_id INTEGER UNSIGNED NOT NULL,
  post_cardinality TINYINT UNSIGNED NOT NULL,
  vehicle_id BIGINT UNSIGNED NOT NULL,
  aic_member_id INTEGER UNSIGNED NOT NULL,
  alt_aic_reason VARCHAR(255),
  time_in TIME NOT NULL,
  time_out TIME NOT NULL,
  discussions TEXT,
  be_aic_ok_with_third_progress BOOLEAN NOT NULL,
  be_aic_ok_with_third_release BOOLEAN NOT NULL,
  be_third_ok_with_progress BOOLEAN NOT NULL,
  be_third_ok_with_release BOOLEAN NOT NULL,
  comments_on_driving TEXT,
  miles_driven_routine SMALLINT UNSIGNED,
  miles_driven_emergency SMALLINT UNSIGNED,
  road_conditions VARCHAR(255),
  be_aic_ok_with_third_being_driver BOOLEAN,
  be_third_ok_with_being_driver BOOLEAN,
  status_id BIGINT UNSIGNED NOT NULL,
  time_last_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
)
ENGINE = InnoDB
;
ALTER TABLE `eval`
  ADD INDEX `third_member_id` (`third_member_id` ASC)
,
  ADD INDEX `shift_id` (`shift_id` ASC)
,
  ADD INDEX `post_id` (`post_id` ASC)
,
  ADD INDEX `vehicle_id` (`vehicle_id` ASC)
,
  ADD INDEX `aic_member_id` (`aic_member_id` ASC)
,
  ADD INDEX `status_id` (`status_id` ASC)
,
  ADD INDEX `time_last_modified` (`time_last_modified` ASC)
,
  ADD UNIQUE INDEX `practical` (`third_member_id` ASC, `aic_member_id` ASC, `nominal_day` ASC, `time_in` ASC)
,
  ADD CONSTRAINT `eval_third_member_id` FOREIGN KEY (`third_member_id` ) REFERENCES `member` (`id` )
,
  ADD CONSTRAINT `eval_shift_id` FOREIGN KEY (`shift_id` ) REFERENCES `shift` (`id` )
,
  ADD CONSTRAINT `eval_post_id` FOREIGN KEY (`post_id` ) REFERENCES `agency` (`id` )
,
  ADD CONSTRAINT `eval_vehicle_id` FOREIGN KEY (`vehicle_id` ) REFERENCES `vehicle` (`id` )
,
  ADD CONSTRAINT `eval_aic_member_id` FOREIGN KEY (`aic_member_id` ) REFERENCES `member` (`id` )
,
  ADD CONSTRAINT `eval_status_id` FOREIGN KEY (`status_id` ) REFERENCES `eval_status` (`id` )
;
COMMIT