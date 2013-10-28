START TRANSACTION
;
DELETE FROM agency_satellite_station WHERE agency_id = '2' and satellite_station_id = '7'
;
COMMIT