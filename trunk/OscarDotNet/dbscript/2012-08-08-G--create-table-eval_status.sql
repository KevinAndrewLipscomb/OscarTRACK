START TRANSACTION
;
DROP TABLE IF EXISTS eval_status
;
CREATE TABLE IF NOT EXISTS eval_status (
  id SERIAL,
  description VARCHAR(63) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE(description)
)
ENGINE = InnoDB
;
insert ignore eval_status (description) values
("NEEDS_BOTH_LOCKS"),
("NEEDS_EVALUATEE_REBUTTAL"),
("ARCHIVED")
;
COMMIT