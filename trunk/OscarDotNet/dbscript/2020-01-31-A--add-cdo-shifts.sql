START TRANSACTION
;
INSERT INTO `shift` (`start`, `end`, `name`, `pecking_order`) VALUES
('07:00:00', '19:00:00', 'DAY/7TO7', '14300'),
('19:00:00', '07:00:00', 'NIGHT/7TO7', '40300')
;
COMMIT;