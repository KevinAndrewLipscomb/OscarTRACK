START TRANSACTION
;
ALTER TABLE `gripe`
  DROP INDEX `id`
,
  DROP INDEX `id_2`
,
  ADD INDEX `vehicle_id` (`vehicle_id` ASC)
,
  ADD CONSTRAINT `gripe_vehicle_id` FOREIGN KEY (`vehicle_id` ) REFERENCES `vehicle` (`id` )
;
ALTER TABLE `indicator_fleet_tracking_participation`
  ADD CONSTRAINT `indicator_fleet_tracking_participation_agency_id` FOREIGN KEY (`agency_id` ) REFERENCES `agency` (`id` )
;
ALTER TABLE `indicator_commensuration`
  ADD CONSTRAINT `indicator_commensuration_agency_id` FOREIGN KEY (`agency_id` ) REFERENCES `agency` (`id` )
;
ALTER TABLE `indicator_third_slot_saturation`
  ADD CONSTRAINT `indicator_third_slot_saturation_agency_id` FOREIGN KEY (`agency_id` ) REFERENCES `agency` (`id` )
;
COMMIT