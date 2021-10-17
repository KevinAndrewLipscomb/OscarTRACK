START TRANSACTION
;
UPDATE `medical_release_code_description_map` SET `description` = 'EMT' WHERE (`code` = '3')
;
COMMIT