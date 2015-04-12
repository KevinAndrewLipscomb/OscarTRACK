START TRANSACTION
;
DROP TABLE IF EXISTS incident_nature
;
CREATE TABLE IF NOT EXISTS incident_nature (
  id SERIAL,
  designator CHAR(4) NOT NULL,
  description VARCHAR(31),
  PRIMARY KEY(id)
)
ENGINE = InnoDB
;
insert ignore incident_nature (designator,description) values
('ACIN','Accident with injuries'),
('ACPI','Accident pin'),
('ANSH','Anaphylactic shock'),
('ARSN','Arson'),
('BREA','Breathing difficulty'),
('BOMB','Bomb threat'),
('CARD','Cardiac'),
('CFLM','Commercial flammable'),
('CLCK','Commercial lockout'),
('EYES','Eye injury'),
('FAL2','Fall pri 2'),
('FUEL',NULL),
('INJ2','Injury pri 2'),
('MAT2','Maternity pri 2'),
('MISC','Miscellaneous'),
('MISR',NULL),
('OVD2','Overdose pri 2'),
('RFLM','Residential flammable'),
('SICK','Illness'),
('UNCO','Unconscious'),
('WIRE','Wires down')
;
insert ignore privilege set name = 'config-incident-natures';
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'config-incident-natures'),(select id from role where name = 'Application Administrator'))
;
COMMIT