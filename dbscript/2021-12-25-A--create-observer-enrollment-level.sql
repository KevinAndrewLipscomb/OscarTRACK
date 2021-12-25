START TRANSACTION
;
INSERT ignore INTO `enrollment_level` (`description`, `pecking_order`, `elaboration`, `core_ops_commitment_level_code`, `be_hereafter_valid`) VALUES ('Observer', '97', 'Self-explanatory', '1', '1');
;
INSERT ignore INTO `shift` (`start`, `end`, `name`, `pecking_order`) VALUES ('08:00:00', '16:00:00', 'DAY/8TO4', '14500');
INSERT ignore INTO `shift` (`start`, `end`, `name`, `pecking_order`) VALUES ('15:00:00', '23:00:00', '15TO23', '23750');
;
COMMIT