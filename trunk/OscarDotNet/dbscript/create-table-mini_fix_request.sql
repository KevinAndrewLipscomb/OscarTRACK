DROP TABLE IF EXISTS mini_fix_request;
CREATE TABLE IF NOT EXISTS mini_fix_request (
  id SERIAL,
  vehicle_id BIGINT UNSIGNED NOT NULL,
  description MEDIUMTEXT NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (id)
)
ENGINE = InnoDB;
