START TRANSACTION
;
INSERT ignore INTO `agency` (`id`, `short_designator`, `medium_designator`, `long_designator`, `be_active`, `fleet_tracking_ops_tally`, `be_ems_post`, `be_ok_to_nag`, `be_ok_to_send_duty_reminders`, `ems_system_id`, `be_keyclick_enabled`, `be_efficipay_enabled`) VALUES
('1151', 'CDR', 'Civil Disturbance Response', 'Civil Disturbance Response field activity', '0', '0', '1', '0', '1', '1', '0', '0')
;
update agency
set short_designator = REPLACE(short_designator,'C','¢')
where id between 601 and 699
;
update agency
set short_designator = 'CSM'
where short_designator = 'VAX'
;
COMMIT
