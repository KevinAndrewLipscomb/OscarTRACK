START TRANSACTION
;
DROP TABLE IF EXISTS care_skill_rating
;
CREATE TABLE IF NOT EXISTS care_skill_rating (
  id SERIAL,
  care_skill_id BIGINT UNSIGNED NOT NULL,
  skill_rating_id BIGINT UNSIGNED,
  patient_encounter_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY(id),
  UNIQUE `practical` (`patient_encounter_id` ASC, `care_skill_id` ASC)
)
ENGINE = InnoDB
;
ALTER TABLE `care_skill_rating`
  ADD INDEX `care_skill_id` (`care_skill_id` ASC)
,
  ADD INDEX `skill_rating_id` (`skill_rating_id` ASC)
,
  ADD CONSTRAINT `care_skill_rating_care_skill_id` FOREIGN KEY (`care_skill_id` ) REFERENCES `care_skill` (`id` )
,
  ADD CONSTRAINT `care_skill_rating_skill_rating_id` FOREIGN KEY (`skill_rating_id` ) REFERENCES `skill_rating` (`id` )
,
  ADD CONSTRAINT `care_skill_rating_patient_encounter_id` FOREIGN KEY (`patient_encounter_id` ) REFERENCES `patient_encounter` (`id` )
;
COMMIT