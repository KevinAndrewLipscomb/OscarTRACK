START TRANSACTION
;
DROP TABLE IF EXISTS care_skill
;
CREATE TABLE IF NOT EXISTS care_skill (
  id SERIAL,
  description VARCHAR(63) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE(description)
)
ENGINE = InnoDB
;
insert ignore care_skill (description) values
("Scene sizeup"),
("Medical assessment"),
("Trauma assessment"),
("Vitals"),
("Airway management"),
("Oxygen administration"),
("CPR/AED"),
("Spinal immobilization"),
("Dressing & bandaging"),
("Splinting"),
("Glucometry"),
("Patient handling"),
("Radio/MDT"),
("Verbal communications"),
("EMR documentation"),
("ALS skill assist"),
("Team leadership"),
("Teamwork")
;
COMMIT