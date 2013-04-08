START TRANSACTION
;
DROP TABLE IF EXISTS patient_encounter_level
;
CREATE TABLE IF NOT EXISTS patient_encounter_level (
  id SERIAL,
  description VARCHAR(63) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE(description)
)
ENGINE = InnoDB
;
insert ignore patient_encounter_level (description) values
("Refusal"),
("BLS"),
("ALS")
;
COMMIT