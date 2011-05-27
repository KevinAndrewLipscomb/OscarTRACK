START TRANSACTION
;
ALTER TABLE `agency` ADD COLUMN `door_code` VARCHAR(15) NULL  AFTER `be_ems_post` 
, ADD COLUMN `be_ok_to_nag` TINYINT(1)  NOT NULL DEFAULT TRUE  AFTER `door_code`
, ADD INDEX `be_ok_to_nag` (`be_ok_to_nag` ASC)
;
update agency set door_code = "4,2,3,1" where id = 1
;
update agency set door_code = "5,2,1" where id = 2
;
update agency set door_code = "3,6,9,0" where id = 3
;
update agency set door_code = "2,4,1" where id = 4
;
update agency set door_code = "2,4,5,1" where id = 5
;
update agency set door_code = "1,8,5,9,#" where id = 6
;
update agency set door_code = "1,2,5" where id = 7
;
update agency set door_code = "5,1,5,2" where id = 8
;
update agency set door_code = "5,2,1" where id = 9
;
update agency set door_code = "4,2,1" where id = 10
;
update agency set door_code = "4,8,3,5" where id = 11
;
update agency set door_code = "4,8,3,6" where id = 12
;
update agency set door_code = "1,3" where id = 13
;
update agency set door_code = "Call,#,5,1,5,2" where id = 14
;
update agency set door_code = "2+4,3" where id = 16
;
update agency set door_code = "1,7,3,0,5" where id = 17
;
update agency set door_code = "5,2,1" where id = 18
;
update agency set door_code = "4,5,1" where id = 19
;
update agency set door_code = "3,5,2,1" where id = 20
;
update agency set door_code = "2,1,6,8" where id = 21
;
update agency set door_code = "2+4,3" where id = 22
;
update agency set door_code = "5,2,1" where id = 201
;
update agency set door_code = "5,2,1" where id = 302
;
update agency set door_code = "1,8,5,9,#" where id = 306
;
update agency set door_code = "5,2,1" where id = 309
;
update agency set door_code = "#,5,1,5,2" where id = 314
;
update agency set door_code = "2+4,3" where id = 316
;
update agency set door_code = "2,1,6,8" where id = 321
;
COMMIT