START TRANSACTION
;
UPDATE `agency` SET `be_ems_post`='1' WHERE `id`='403'
;
UPDATE `agency` SET `be_ems_post`='0' WHERE `id`='205'
;
UPDATE `agency` SET `be_ems_post`='0' WHERE `id`='307'
;
UPDATE `agency` SET `be_ems_post`='0' WHERE `id`='312'
;
UPDATE `agency` SET `be_ems_post`='0' WHERE `id`='318'
;
UPDATE `agency` SET `be_ems_post`='0' WHERE `id`='320'
;
INSERT INTO `agency` (`id`, `short_designator`, `medium_designator`, `long_designator`, `be_active`, `fleet_tracking_ops_tally`, `be_ems_post`, `be_ok_to_nag`, `be_ok_to_send_duty_reminders`, `ems_system_id`, `be_keyclick_enabled`, `be_efficipay_enabled`) VALUES
('615', 'C15', 'Cart 15', 'Cart 15', '0', '0', '1', '1', '0', '1', '0', '0'),
('705', 'SE5', 'Special Event 5', 'Special Event #5', '0', '0', '1', '1', '0', '1', '0', '0'),
('706', 'SE6', 'Special Event 6', 'Special Event #6', '0', '0', '1', '1', '0', '1', '0', '0')
;
COMMIT
