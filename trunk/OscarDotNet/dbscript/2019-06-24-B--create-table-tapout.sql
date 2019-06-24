START TRANSACTION
;
DROP TABLE IF EXISTS tapout
;
CREATE TABLE IF NOT EXISTS tapout
  (
  id SERIAL,
  member_id INTEGER UNSIGNED NOT NULL,
  expected_start DATETIME NOT NULL,
  comment VARCHAR(511),
  hours_warning SMALLINT UNSIGNED,
  actor_member_id INTEGER UNSIGNED NOT NULL,
  actor_timestamp TIMESTAMP NOT NULL,
  PRIMARY KEY(id),
  INDEX member_id (member_id),
  INDEX actor_member_id (actor_member_id),
  UNIQUE practical (member_id,expected_start,actor_member_id,actor_timestamp),
  CONSTRAINT `tapout_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  CONSTRAINT `tapout_actor_member_id` FOREIGN KEY (`actor_member_id`) REFERENCES `member` (`id`)
  ) ENGINE = InnoDB
;
COMMIT
