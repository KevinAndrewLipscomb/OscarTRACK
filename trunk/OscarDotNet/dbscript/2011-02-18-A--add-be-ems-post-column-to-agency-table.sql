START TRANSACTION
;
ALTER TABLE `agency` ADD COLUMN `be_ems_post` BOOLEAN NOT NULL DEFAULT '0'
;
update agency set be_ems_post = TRUE where id in (0,1,2,3,4,5,6,7,8,9,10,12,13,14,16,17,18,19,20,21,22);
;
update agency set long_designator = "London Bridge" where id = 3;
;
update agency set long_designator = "Thalia" where id = 7;
;
update agency set long_designator = "Oceana" where id = 8;
;
update agency set long_designator = "Woodstock" where id = 10;
;
update agency set long_designator = "Seatack" where id = 12;
;
update agency set long_designator = "Green Run" where id = 18;
;
update agency set long_designator = "Stumpy Lake" where id = 19;
;
update agency set long_designator = "Little Neck" where id = 20;
;
update agency set long_designator = "Strawbridge" where id = 21;
;
update agency set long_designator = "First Landing" where id = 22;
;
COMMIT