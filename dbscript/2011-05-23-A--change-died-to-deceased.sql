START TRANSACTION
;
update enrollment_level set description = "Deceased" where description = "Died"
;
COMMIT