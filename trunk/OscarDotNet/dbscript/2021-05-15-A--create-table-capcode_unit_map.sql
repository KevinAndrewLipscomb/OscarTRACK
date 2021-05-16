DROP TABLE IF EXISTS capcode_unit_map;
CREATE TABLE IF NOT EXISTS capcode_unit_map (
  id SERIAL,
  capcode CHAR(7) NOT NULL,
  unit VARCHAR(7) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (capcode),
  UNIQUE (unit)
)
ENGINE = InnoDB
;
insert ignore privilege set name = 'config-capcode-unit-maps'
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'config-capcode-unit-maps'),(select id from role where name = 'Application Administrator')),
((select id from privilege where name = 'config-capcode-unit-maps'),(select id from role where name = 'Department Authority')),
((select id from privilege where name = 'config-capcode-unit-maps'),(select id from role where name = 'Department Deputy Chief')),
((select id from privilege where name = 'config-capcode-unit-maps'),(select id from role where name = 'Department Division Chief'))
;
COMMIT