START TRANSACTION
;
update enrollment_level
set be_hereafter_valid = FALSE
where description like 'Reduced (%)'
;
COMMIT
