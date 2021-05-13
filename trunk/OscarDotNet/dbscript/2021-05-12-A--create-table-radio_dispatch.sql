DROP TABLE IF EXISTS radio_dispatch;
CREATE TABLE IF NOT EXISTS radio_dispatch (
  id SERIAL,
  capcode CHAR(7) NOT NULL,
  transmission_datetime DATETIME NOT NULL,
  address VARCHAR(127) NOT NULL,
  nature VARCHAR(63) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (id)
)
ENGINE = InnoDB;
