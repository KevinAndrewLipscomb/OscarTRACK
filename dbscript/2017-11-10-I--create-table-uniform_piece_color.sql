DROP TABLE IF EXISTS uniform_piece_color;
CREATE TABLE IF NOT EXISTS uniform_piece_color (
  id SERIAL,
  agency_id INTEGER UNSIGNED DEFAULT 0 NOT NULL,
  name VARCHAR(31) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (id)
)
ENGINE = InnoDB;
