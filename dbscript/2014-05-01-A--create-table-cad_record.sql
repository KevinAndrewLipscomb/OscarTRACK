START TRANSACTION
;
DROP TABLE IF EXISTS cad_record;
CREATE TABLE IF NOT EXISTS cad_record (
  id SERIAL,
  incident_date DATE,
  incident_num CHAR(9),
  incident_address VARCHAR(127),
  call_sign VARCHAR(31),
  time_initialized TIME,
  time_of_alarm TIME,
  time_enroute TIME,
  time_on_scene TIME,
  time_transporting TIME,
  time_at_hospital TIME,
  time_available TIME,
  time_downloaded DATETIME,
  PRIMARY KEY(id)
)
ENGINE = InnoDB
;
ALTER TABLE `cad_record` 
  DROP INDEX `id`
,
  ADD UNIQUE INDEX `practical` (`incident_num` ASC, `call_sign` ASC)
;
COMMIT