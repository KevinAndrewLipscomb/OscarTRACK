START TRANSACTION
;
DROP TABLE IF EXISTS incident_nature_translation
;
CREATE TABLE IF NOT EXISTS incident_nature_translation (
  id SERIAL,
  `foreign` VARCHAR(63) NOT NULL,
  local VARCHAR(63) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE `foreign` (`foreign`)
)
ENGINE = InnoDB
;
insert ignore incident_nature_translation (`foreign`,local) values
("Anaphylactic Reaction","Anaphylactic Shock"),
("Chest Pain","Cardiac"),
("Diabetic Problem","Diabetic"),
("Eye Problem / Injury","Eye Injury"),
("Fall Victim","Fall"),
("Fire Standby","Fire Case"),
("Heat / Cold Exposure","Headache"),
("Hemorrhage / Laceration","Bleeding"),
("Psychiatric Problems","Suicide"),
("Seizure / Convulsions","Seizure"),
("Sick Person","Illness"),
("Stroke / CVA","Stroke"),
("Traffic Accident Pin / Entrapment","Accident-Pin"),
("Traumatic Injury","Injury"),
("Unconscious / Fainting","Unconscious"),
("Unknown Problem / Man Down","Unknown")
;
COMMIT
