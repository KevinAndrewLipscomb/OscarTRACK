START TRANSACTION
;
DROP TABLE IF EXISTS agency_satellite_station;
CREATE TABLE IF NOT EXISTS agency_satellite_station (
  id SERIAL,
  agency_id INTEGER UNSIGNED NOT NULL,
  satellite_station_id INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(id)
)
ENGINE = InnoDB
;
ALTER TABLE `agency_satellite_station` ADD CONSTRAINT `agency_satellite_station_agency_id` FOREIGN KEY (`agency_id` ) REFERENCES `agency` (`id` )
, ADD CONSTRAINT `agency_satellite_station_satellite_station_id` FOREIGN KEY (`satellite_station_id` ) REFERENCES `agency` (`id` )
, ADD UNIQUE INDEX `map` (`agency_id` ASC, `satellite_station_id` ASC)
, ADD INDEX `agency_satellite_station_satellite_station_id` (`satellite_station_id` ASC)
, DROP INDEX `id` 
;
insert ignore agency_satellite_station (agency_id,satellite_station_id) values
(1,22),
(2,7),
(5,21),
(9,10),
(9,19),
(14,8),
(16,18)
;
COMMIT