START TRANSACTION
;
DROP TABLE IF EXISTS skill_rating
;
CREATE TABLE IF NOT EXISTS skill_rating (
  id SERIAL,
  designator CHAR(1) NOT NULL,
  description VARCHAR(63) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE(designator),
  UNIQUE(description)
)
ENGINE = InnoDB
;
insert ignore skill_rating (designator,description) values
("O","Skill observed but not performed"),
("R","Needs remediation"),
("G","Guidance given"),
("I","Performs independently")
;
COMMIT