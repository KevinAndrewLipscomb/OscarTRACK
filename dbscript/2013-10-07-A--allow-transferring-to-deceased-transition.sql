START TRANSACTION
;
insert ignore enrollment_transition set current_level_code = (select code from enrollment_level where description = "Transferring")
, valid_next_level_code = (select code from enrollment_level where description = "Deceased")
;
COMMIT