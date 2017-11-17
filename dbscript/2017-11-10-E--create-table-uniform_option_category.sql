DROP TABLE IF EXISTS uniform_option_category;
CREATE TABLE IF NOT EXISTS uniform_option_category (
  id SERIAL,
  agency_id INTEGER UNSIGNED DEFAULT 0 NOT NULL,
  name VARCHAR(31) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (id)
)
ENGINE = InnoDB;
