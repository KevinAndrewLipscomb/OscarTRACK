DROP TABLE IF EXISTS uniform_class;
CREATE TABLE IF NOT EXISTS uniform_class (
  id SERIAL,
  agency_id INTEGER UNSIGNED DEFAULT 0 NOT NULL,
  short_designator VARCHAR(1) NOT NULL,
  long_designator VARCHAR(15) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (id)
)
ENGINE = InnoDB;
