START TRANSACTION
;
INSERT INTO `agency` (`id`, `short_designator`, `medium_designator`, `long_designator`, `be_active`, `fleet_tracking_ops_tally`, `be_ems_post`, `door_code`, `be_ok_to_nag`, `be_ok_to_send_duty_reminders`, `ems_system_id`, `be_keyclick_enabled`, `be_efficipay_enabled`) VALUES
('601', 'C01', 'Cart 1', 'Cart 1', '0', '0', '1', '2+4,3', '0', '1', '1', '0', '0')
;
update agency
set be_ok_to_nag = '0'
, be_ok_to_send_duty_reminders = '1'
where id between 601 and 699
;
COMMIT
