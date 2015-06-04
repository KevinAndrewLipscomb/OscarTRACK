START TRANSACTION
;
ALTER TABLE `member` 
  ADD COLUMN `first_release_as_aic_date` DATE NULL
;
update member
  join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)
set first_release_as_aic_date = '0001-01-01'
where LEFT(medical_release_code_description_map.description,3) = 'EMT'
;
COMMIT