START TRANSACTION
;
ALTER TABLE `agency`
  ADD COLUMN `ems_system_id` BIGINT UNSIGNED NOT NULL
,
  ADD INDEX `agency_ems_system_id` (`ems_system_id` ASC)
;
update agency set ems_system_id = (select id from ems_system where description = "VIRGINIA BEACH, VA, USA")
;
ALTER TABLE `agency`
  ADD CONSTRAINT `agency_ems_system_id` FOREIGN KEY (`ems_system_id` ) REFERENCES `ems_system` (`id` )
;
COMMIT