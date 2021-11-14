START TRANSACTION
;
UPDATE `enrollment_level` SET `description` = 'Field staff', `elaboration` = 'Use for paid department patient care providers and Brigade Chiefs and above.' WHERE (`code` = '23')
;
COMMIT