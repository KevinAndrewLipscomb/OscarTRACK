DROP TABLE IF EXISTS subjoined_attribute;
CREATE TABLE IF NOT EXISTS subjoined_attribute (
  id SERIAL,
  time_implemented DATETIME NOT NULL,
  involvement_id BIGINT UNSIGNED DEFAULT "2" NOT NULL COMMENT "indirectly referenced by convention in associated method names",
  name VARCHAR(63) NOT NULL COMMENT "directly referenced by convention in associated method names",
  PRIMARY KEY(id),
  UNIQUE practical (involvement_id,name),
  CONSTRAINT subjoined_attribute_involvement_id FOREIGN KEY (involvement_id) REFERENCES involvement (id)
)
ENGINE = InnoDB;
