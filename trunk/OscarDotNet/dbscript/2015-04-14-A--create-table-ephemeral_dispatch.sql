START TRANSACTION
;
ALTER TABLE `incident_nature` 
  ADD UNIQUE INDEX `designator` (`designator` ASC)
,
  DROP INDEX `id`
;
DROP TABLE IF EXISTS ephemeral_dispatch
;
CREATE TABLE IF NOT EXISTS ephemeral_dispatch (
  id SERIAL,
  designator VARCHAR(15) NOT NULL,
  description VARCHAR(63),
  PRIMARY KEY(id),
  UNIQUE designator (designator)
)
ENGINE = InnoDB
;
insert ignore ephemeral_dispatch (designator,description) values
('BATGP','Battalion chief group'),
('BTGP',NULL),
('CAR','Fire division chiefs'),
('EMSALL','EMS all-call'),
('EMTALS','EMT/ALS all-call'),
('ESTAFF','EMS leadership staff'),
('FIGP','Fire investigator group'),
('FINS','Fire inspector'),
('FSTAFF','Fire leadership staff'),
('HAZGP','Fire hazardous materials group'),
('INSGP','Fire inspector group'),
('MCITK','Mass casualty incident truck team'),
('MIRT','Fire marine incident response team'),
('MRT','Marine rescue team'),
('NGALE','Nightingale'),
('PIO','Fire public information officer'),
('PU','Public Utilities'),
('SART','Search and rescue team'),
('SQTM','Squad truck team'),
('STECH','Fire support unit technician'),
('TECH','Fire technical/trench rescue team')
;
COMMIT