START TRANSACTION
;
DROP TABLE IF EXISTS ems_system
;
CREATE TABLE IF NOT EXISTS ems_system (
  id SERIAL,
  description VARCHAR(63) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE(description)
)
ENGINE = InnoDB
;
insert ignore ems_system (description) values
("VIRGINIA BEACH, VA, USA"),
("SUFFOLK, VA, USA")
;
COMMIT