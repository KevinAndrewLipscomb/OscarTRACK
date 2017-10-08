START TRANSACTION
;
ALTER TABLE `kind_of_leave_code_description_map` ADD COLUMN `be_hereafter_valid` TINYINT NOT NULL DEFAULT 1;
;
update kind_of_leave_code_description_map
set be_hereafter_valid = FALSE
where description = 'Maternity'
;
COMMIT
