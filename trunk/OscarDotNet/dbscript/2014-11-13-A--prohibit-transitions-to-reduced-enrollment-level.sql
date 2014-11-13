START TRANSACTION
;
ALTER TABLE `mid_cycle_leave` 
  ADD COLUMN `num_obliged_shifts` TINYINT UNSIGNED NOT NULL DEFAULT 0 AFTER `end_date`
;
delete from enrollment_transition where valid_next_level_code in (select code from enrollment_level where description like 'Reduced (%)')
;
update enrollment_level set elaboration = REPLACE(elaboration,'leave of absence','leave/reduction') where description = 'Transferring'
;
COMMIT