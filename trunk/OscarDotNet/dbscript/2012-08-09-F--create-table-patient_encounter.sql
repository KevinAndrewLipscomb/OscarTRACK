START TRANSACTION
;
DROP TABLE IF EXISTS patient_encounter
;
CREATE TABLE IF NOT EXISTS patient_encounter (
  id SERIAL,
  eval_id BIGINT UNSIGNED,
  chief_complaint VARCHAR(255) NOT NULL,
  patient_age TINYINT UNSIGNED,
  patient_age_unit_id BIGINT UNSIGNED,
  patient_encounter_level_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY(id)
)
ENGINE = InnoDB
;
ALTER TABLE `patient_encounter`
  ADD INDEX `eval_id` (`eval_id` ASC)
,
  ADD INDEX `patient_age_unit_id` (`patient_age_unit_id` ASC)
,
  ADD INDEX `patient_encounter_level_id` (`patient_encounter_level_id` ASC)
,
  ADD CONSTRAINT `patient_encounter_eval_id` FOREIGN KEY (`eval_id` ) REFERENCES `eval` (`id` )
,
  ADD CONSTRAINT `patient_encounter_patient_age_unit_id` FOREIGN KEY (`patient_age_unit_id` ) REFERENCES `patient_age_unit` (`id` )
,
  ADD CONSTRAINT `patient_encounter_patient_encounter_level_id` FOREIGN KEY (`patient_encounter_level_id` ) REFERENCES `patient_encounter_level` (`id` )
;
COMMIT