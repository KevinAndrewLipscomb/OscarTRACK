START TRANSACTION
;
update agency set be_ems_post = TRUE where short_designator = "SQT"
;
COMMIT