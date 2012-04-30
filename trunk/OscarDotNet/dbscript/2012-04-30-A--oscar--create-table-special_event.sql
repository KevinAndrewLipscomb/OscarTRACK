START TRANSACTION
;
DROP TABLE IF EXISTS special_event
;
CREATE TABLE IF NOT EXISTS special_event (
  id SERIAL,
  description VARCHAR(63) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE(description)
)
ENGINE = InnoDB
;
insert ignore special_event (description) values
("Patriotic Festival")
;
DROP TABLE IF EXISTS special_event_shift
;
CREATE TABLE IF NOT EXISTS special_event_shift (
  id SERIAL,
  special_event_id BIGINT UNSIGNED NOT NULL,
  nominal_day DATE NOT NULL,
  name VARCHAR(31) NOT NULL,
  PRIMARY KEY(id),
  INDEX `special_event_id` (`special_event_id` ASC),
  INDEX `nominal_day` (`nominal_day` ASC),
  UNIQUE `practical` (`special_event_id` ASC, `nominal_day` ASC, `name` ASC),
  CONSTRAINT `special_event_shift_special_event_id` FOREIGN KEY (`special_event_id` ) REFERENCES `special_event` (`id` )
)
ENGINE = InnoDB
;
insert ignore special_event_shift (special_event_id,nominal_day,name) values
((select id from special_event where description = "Patriotic Festival"),"2012-06-01","AM"),
((select id from special_event where description = "Patriotic Festival"),"2012-06-01","PM"),
((select id from special_event where description = "Patriotic Festival"),"2012-06-02","AM"),
((select id from special_event where description = "Patriotic Festival"),"2012-06-02","PM"),
((select id from special_event where description = "Patriotic Festival"),"2012-06-03","AM"),
((select id from special_event where description = "Patriotic Festival"),"2012-06-03","PM")
;
DROP TABLE IF EXISTS special_event_avail
;
CREATE TABLE IF NOT EXISTS special_event_avail (
  id SERIAL,
  shift_id BIGINT UNSIGNED NOT NULL,
  odnmid INT UNSIGNED NOT NULL,
  PRIMARY KEY(id),
  UNIQUE `practical` (shift_id,odnmid),
  INDEX `odnmid` (odnmid),
  CONSTRAINT special_event_avail_shift_id FOREIGN KEY (shift_id) REFERENCES special_event_shift(id)
)
ENGINE = InnoDB
;
COMMIT