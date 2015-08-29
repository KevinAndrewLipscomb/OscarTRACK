START TRANSACTION
;
UPDATE `vehicle_down_nature`
SET `elaboration`='The unit is down for a reason that is unrelated to repair, maintenance, garage inspection, or upgrade, or the data is not available.'
WHERE `name`='UNVALIDATED'
;
COMMIT
