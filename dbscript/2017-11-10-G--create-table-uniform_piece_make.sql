DROP TABLE IF EXISTS uniform_piece_make;
CREATE TABLE IF NOT EXISTS uniform_piece_make (
  id SERIAL,
  agency_id INTEGER UNSIGNED DEFAULT 0 NOT NULL,
  name VARCHAR(63) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (id)
)
ENGINE = InnoDB;
