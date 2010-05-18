START TRANSACTION;

update vehicle set license_plate = REPLACE(license_plate,'-','');

COMMIT