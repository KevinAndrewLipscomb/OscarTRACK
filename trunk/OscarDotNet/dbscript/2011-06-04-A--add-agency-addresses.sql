START TRANSACTION
;
ALTER TABLE `agency` ADD COLUMN `address` VARCHAR(63) NULL
;
update ignore agency set address = "3769 E STRATFORD RD" where short_designator = "R01"
;
update ignore agency set address = "4672 HAYGOOD RD" where short_designator = "R02"
;
update ignore agency set address = "600 CENTRAL DR" where short_designator = "R03"
;
update ignore agency set address = "2444 PLEASURE HOUSE RD" where short_designator = "R04"
;
update ignore agency set address = "2461 PRINCESS ANNE RD" where short_designator = "R05"
;
update ignore agency set address = "595 PRINCESS ANNE RD" where short_designator = "R06"
;
update ignore agency set address = "407 THALIA RD" where short_designator = "R07"
;
update ignore agency set address = "1243 BAYNE DR", long_designator = "Great Neck" where short_designator = "R08"
;
update ignore agency set address = "5145 RURITAN CT" where short_designator = "R09"
;
update ignore agency set address = "5656 PROVIDENCE RD" where short_designator = "R10"
;
update ignore agency set address = "800 VIRGINIA BEACH BLVD" where short_designator = "R11"
;
update ignore agency set address = "949 S BIRDNECK RD" where short_designator = "R12"
;
update ignore agency set address = "6009 BLACKWATER RD" where short_designator = "R13"
;
update ignore agency set address = "740 VIRGINIA BEACH BLVD" where short_designator = "R14"
;
update ignore agency set address = "3610 S PLAZA TRL" where short_designator = "R16"
;
update ignore agency set address = "305 SANDBRIDGE RD" where short_designator = "R17"
;
update ignore agency set address = "1601 S LYNNHAVEN PKWY" where short_designator = "R18"
;
update ignore agency set address = "4196 PLEASANT VALLEY RD" where short_designator = "R19"
;
update ignore agency set address = "885 LITTLE NECK RD" where short_designator = "R20"
;
update ignore agency set address = "1468 NIMMO PKWY" where short_designator = "R21"
;
update ignore agency set address = "2837 SHORE DR" where short_designator = "R22"
;
ALTER TABLE `agency` ADD INDEX `address` (`address` ASC)
;
COMMIT