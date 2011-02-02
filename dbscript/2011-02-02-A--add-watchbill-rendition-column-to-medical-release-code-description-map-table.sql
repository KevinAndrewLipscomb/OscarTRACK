START TRANSACTION
;
ALTER ignore TABLE medical_release_code_description_map ADD COLUMN `watchbill_rendition` CHAR NULL
;
update medical_release_code_description_map
set watchbill_rendition = "z"
where description = "none"
;
update medical_release_code_description_map
set watchbill_rendition = "y"
where description = "EMT Intern"
;
update medical_release_code_description_map
set watchbill_rendition = "t"
where description = "Trainee"
;
update medical_release_code_description_map
set watchbill_rendition = "B"
where description = "EMT-B"
;
update medical_release_code_description_map
set watchbill_rendition = "S"
where description = "EMT-ST"
;
update medical_release_code_description_map
set watchbill_rendition = "E"
where description = "EMT-E"
;
update medical_release_code_description_map
set watchbill_rendition = "C"
where description = "EMT-CT"
;
update medical_release_code_description_map
set watchbill_rendition = "I"
where description = "EMT-I"
;
update medical_release_code_description_map
set watchbill_rendition = "P"
where description = "EMT-P"
;
COMMIT