DROP TABLE IF EXISTS uniform_piece_vendor;
CREATE TABLE IF NOT EXISTS uniform_piece_vendor (
  id SERIAL,
  agency_id INTEGER UNSIGNED DEFAULT 0 NOT NULL,
  name VARCHAR(63) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (id)
)
ENGINE = InnoDB;
