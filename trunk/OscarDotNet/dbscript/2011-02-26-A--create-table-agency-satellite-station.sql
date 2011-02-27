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
COMMIT