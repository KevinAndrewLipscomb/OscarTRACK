DROP TABLE IF EXISTS rank_group;
CREATE TABLE IF NOT EXISTS rank_group (
  id SERIAL,
  agency_id INTEGER UNSIGNED DEFAULT 0 NOT NULL,
  name VARCHAR(15) NOT NULL,
  pecking_order SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (id)
)
ENGINE = InnoDB;
