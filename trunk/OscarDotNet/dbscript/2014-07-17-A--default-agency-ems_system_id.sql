START TRANSACTION
;
ALTER TABLE `agency`
  DROP FOREIGN KEY `agency_ems_system_id`
;
ALTER TABLE `agency`
  CHANGE COLUMN `ems_system_id` `ems_system_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '1'
;
ALTER TABLE `agency`
  ADD CONSTRAINT `agency_ems_system_id` FOREIGN KEY (`ems_system_id`) REFERENCES `ems_system` (`id`)
;
COMMIT