START TRANSACTION
;
INSERT ignore INTO `shift` (`start`, `end`, `name`, `pecking_order`) VALUES ('19:00:00', '23:00:00', 'NIGHT/19TO23', '40400');
;
COMMIT