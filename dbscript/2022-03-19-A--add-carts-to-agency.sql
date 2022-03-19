START TRANSACTION
;
INSERT INTO `agency` (`id`, `short_designator`, `medium_designator`, `long_designator`, `be_active`, `fleet_tracking_ops_tally`, `be_ems_post`, `be_ok_to_nag`, `be_ok_to_send_duty_reminders`, `ems_system_id`, `be_keyclick_enabled`, `be_efficipay_enabled`) VALUES
('651', 'C51', 'Cart 51', 'Cart 51', '0', '0', '1', '1', '0', '1', '0', '0'),
('699', 'CMR', 'Cart MRAT', 'Medical Rapid Access Transport cart', '0', '0', '1', '1', '0', '1', '0', '0')
;
COMMIT
