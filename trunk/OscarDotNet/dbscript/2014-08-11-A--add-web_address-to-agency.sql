START TRANSACTION
;
ALTER TABLE `agency` 
  ADD COLUMN `web_address` VARCHAR(63) NULL
;
update agency set web_address = 'http://www.vbrescue1.com' where id = 1
;
update agency set web_address = 'http://www.pachvrs.org' where id = 5
;
update agency set web_address = 'http://www.kvrs.org' where id = 9
;
update agency set long_designator = 'Ocean Park' where id = 1
;
COMMIT
