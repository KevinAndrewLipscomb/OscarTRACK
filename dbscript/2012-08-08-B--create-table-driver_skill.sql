START TRANSACTION
;
DROP TABLE IF EXISTS driver_skill
;
CREATE TABLE IF NOT EXISTS driver_skill (
  id SERIAL,
  description VARCHAR(63) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE(description)
)
ENGINE = InnoDB
;
insert ignore driver_skill (description) values
("Vehicle/engine check off"),
("Routine road handling"),
("Proper use of lights and siren"),
("Adheres to speed limits"),
("Drives defensively"),
("Understands directions (map, etc)"),
("Scene placement"),
("Backing procedures"),
("Residential driving"),
("Primary road driving"),
("Radio/MDT use"),
("Fueling procedures"),
("Post call clean up"),
("Approaching intersections (emergency mode)"),
("General driving etiquette"),
("Area familiarization")
;
COMMIT