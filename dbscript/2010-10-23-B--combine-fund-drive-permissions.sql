START TRANSACTION
;
ALTER TABLE `role_privilege_map`
  ADD CONSTRAINT `role_privilege_map_privilege_id` FOREIGN KEY (`privilege_id` ) REFERENCES `privilege` (`id` ),
  ADD CONSTRAINT `role_privilege_map_role_id` FOREIGN KEY (`role_id` ) REFERENCES `role` (`id` )
;
ALTER TABLE `role_notification_map`
  DROP INDEX privilege_id,
  ADD INDEX notification_id (notification_id),
  ADD INDEX data_condition_id (data_condition_id),
  ADD CONSTRAINT `role_notification_map_data_condition_id` FOREIGN KEY (`data_condition_id` ) REFERENCES `data_condition` (`id` ),
  ADD CONSTRAINT `role_notification_map_notification_id` FOREIGN KEY (`notification_id` ) REFERENCES `notification` (`id` ),
  ADD CONSTRAINT `role_notification_map_role_id` FOREIGN KEY (`role_id` ) REFERENCES `role` (`id` )
;
insert ignore privilege set name = "perform-fund-drive-ops"
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "perform-fund-drive-ops"),(select id from role where name = "Application Administrator"))
;
delete from role_privilege_map where privilege_id in (select id from privilege where name in ("log-donations","convert-scene-visits-to-love-letter-targets"))
;
delete from privilege where name in ("log-donations","convert-scene-visits-to-love-letter-targets")
;
COMMIT