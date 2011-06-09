START TRANSACTION
;
create or replace view avail_comment as select * from oscar.avail_comment
;
ALTER TABLE `journal` CHANGE COLUMN `action` `action` MEDIUMTEXT NOT NULL
;
COMMIT