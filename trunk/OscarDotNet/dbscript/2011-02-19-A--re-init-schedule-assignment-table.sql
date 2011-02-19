START TRANSACTION
;
DROP TABLE IF EXISTS schedule_assignment;
CREATE TABLE IF NOT EXISTS schedule_assignment (
  id SERIAL,
  nominal_day DATE NOT NULL,
  shift_id BIGINT UNSIGNED NOT NULL,
  post_id BIGINT UNSIGNED NOT NULL,
  post_cardinality TINYINT UNSIGNED DEFAULT 1 NOT NULL,
  position_id BIGINT UNSIGNED,
  member_id INTEGER UNSIGNED,
  be_selected BOOLEAN DEFAULT TRUE NOT NULL,
  comment VARCHAR(511),
  be_new BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY(id),
  UNIQUE `practical` (`nominal_day` ASC, `shift_id` ASC, `member_id` ASC),
  INDEX `be_new` (`be_new` ASC)
)
ENGINE = InnoDB
;
COMMIT
