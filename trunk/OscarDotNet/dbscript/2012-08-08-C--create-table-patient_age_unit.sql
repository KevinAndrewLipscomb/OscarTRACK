START TRANSACTION
;
DROP TABLE IF EXISTS patient_age_unit
;
CREATE TABLE IF NOT EXISTS patient_age_unit (
  id SERIAL,
  description VARCHAR(63) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE(description)
)
ENGINE = InnoDB
;
insert ignore patient_age_unit (description) values
("minute"),
("hour"),
("day"),
("month"),
("year")
;
COMMIT