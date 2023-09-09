START TRANSACTION
;
ALTER TABLE `agency` ADD COLUMN `presentation_order` INT NOT NULL
;
update agency set presentation_order = 1000*id
;
update agency set presentation_order = 400100 where short_designator = '001'
;
update agency set presentation_order = 400200 where short_designator = '002'
;
update agency set presentation_order = 400300 where short_designator = '003'
;
update agency set presentation_order = 400400 where short_designator = '004'
;
update agency set presentation_order = 401000 where short_designator = '010'
;
update agency set presentation_order = 401700 where short_designator = '017'
;
update agency set presentation_order = 402000 where short_designator = 'CDO'
;
ALTER TABLE `agency` ADD UNIQUE INDEX `presentation_order_UNIQUE` (`presentation_order` ASC) VISIBLE;
;
COMMIT
