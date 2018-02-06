START TRANSACTION
;
ALTER TABLE `agency_satellite_station` 
  DROP INDEX `agency_satellite_station_satellite_station_id`
,
  ADD UNIQUE INDEX `agency_satellite_station_satellite_station_id` (`satellite_station_id` ASC)
;
COMMIT
