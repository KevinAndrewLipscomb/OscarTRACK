START TRANSACTION
;
update field_situation_impression
set description = 'MultAmbHolds'
, pecking_order = 4750
where description = 'EmsSurge'
;
update field_situation_impression
set description = 'MultAlsHolds'
where description = 'AlsSurge'
;
update member
set min_oscalert_peck_order_general = 65535
;
insert ignore field_situation_impression
set description = 'SarCall'
, elaboration = 'OSCALERT: Search And Rescue Team case at <address/>. Assignment is <assignment/>.'
, pecking_order = 2250
;
ALTER TABLE `field_situation`
  ADD COLUMN `be_sart` BOOLEAN NOT NULL DEFAULT FALSE
;
COMMIT