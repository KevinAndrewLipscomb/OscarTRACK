START TRANSACTION
;
ALTER TABLE `resident_base` 
  ADD COLUMN `id_in_agency_system` VARCHAR(7) NULL
;
COMMIT