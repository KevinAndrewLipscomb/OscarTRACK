START TRANSACTION
;
DELETE FROM `agency_satellite_station` WHERE (`id` = '34')
;
DELETE FROM `agency_satellite_station` WHERE (`id` = '35')
;
DELETE FROM `agency` WHERE (`id` = '514')
;
DELETE FROM `agency` WHERE (`id` = '516')
;
UPDATE `agency` SET `long_designator` = 'Burton Station', `be_ems_post` = '1', `door_code` = 'Swipe city card', `address` = '1160 TOLLIVER RD' WHERE (`id` = '22');
;
UPDATE `agency` SET `long_designator` = 'First Landing', `be_ems_post` = '1', `door_code` = '2+4,3', `address` = '2837 SHORE DR' WHERE (`id` = '11');
;
UPDATE `agency_satellite_station` SET `satellite_station_id` = '11' WHERE (`satellite_station_id` = '22')
;
UPDATE `vehicle_quarters` SET `long_designator` = 'Burton Station' WHERE (`medium_designator` = 'Sta.22');
;
UPDATE `vehicle_quarters` SET `long_designator` = 'First Landing' WHERE (`medium_designator` = 'Sta.11');
;
COMMIT