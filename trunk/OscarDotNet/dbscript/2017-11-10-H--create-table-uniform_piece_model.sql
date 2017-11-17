DROP TABLE IF EXISTS uniform_piece_model;
CREATE TABLE IF NOT EXISTS uniform_piece_model (
  id SERIAL,
  make_id BIGINT UNSIGNED NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (id)
)
ENGINE = InnoDB;
