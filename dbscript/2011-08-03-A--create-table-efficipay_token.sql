START TRANSACTION
;
DROP TABLE IF EXISTS efficipay_token;
CREATE TABLE IF NOT EXISTS efficipay_token (
  id SERIAL,
  value VARCHAR(32) NOT NULL,
  time_created DATETIME NOT NULL,
  time_retired DATETIME,
  PRIMARY KEY(id),
  UNIQUE (id)
)
ENGINE = InnoDB
;
insert ignore privilege set name = "config-efficipay-tokens"
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "config-efficipay-tokens"),(select id from role where name = "Application Administrator"))
;
COMMIT