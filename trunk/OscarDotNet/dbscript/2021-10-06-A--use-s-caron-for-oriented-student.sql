START TRANSACTION
;
UPDATE `medical_release_code_description_map` SET `watchbill_rendition` = 'š' WHERE (`description` = 'Oriented Student');
;
COMMIT