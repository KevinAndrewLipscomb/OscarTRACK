START TRANSACTION
;
DROP TABLE IF EXISTS involvement
;
CREATE TABLE IF NOT EXISTS involvement (
  id SERIAL,
  description VARCHAR(63) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE(description)
)
ENGINE = InnoDB
;
insert ignore involvement (description) values
("user"),
("member")
;
COMMIT