START TRANSACTION
;
ALTER TABLE `vehicle` 
  ADD COLUMN `deployment_guidance` VARCHAR(63) NULL
;
COMMIT
