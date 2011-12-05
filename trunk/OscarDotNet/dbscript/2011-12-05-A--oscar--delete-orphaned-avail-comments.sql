START TRANSACTION
;
delete from avail_comment where month in ("JUL","SEP","OCT","NOV")
;
COMMIT