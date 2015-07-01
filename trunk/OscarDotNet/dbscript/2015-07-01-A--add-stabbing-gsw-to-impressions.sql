START TRANSACTION
;
insert ignore field_situation_impression
set description = 'StabbingOrGunShotWound'
, elaboration = 'OSCALERT: StabbingOrGunShotWound, <address/>. http://goo.gl/lvMvXs Assgnmt=<assignment/>.'
, pecking_order = 1600
;
COMMIT
