START TRANSACTION
;
update medical_release_code_description_map set description = "old Trainee", watchbill_rendition = "o" where description = "Trainee"
;
update medical_release_code_description_map set description = "Student", watchbill_rendition = "s" where description = "EMT Intern"
;
update medical_release_code_description_map set description = "BLS Intern", watchbill_rendition = "b" where description = "old Trainee"
;
COMMIT