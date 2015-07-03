START TRANSACTION
;
update field_situation_impression
set description = REPLACE(description,'GunShotWound','Gsw')
, elaboration = REPLACE(elaboration,'GunShotWound','Gsw')
where description = 'StabbingOrGunShotWound'
;
COMMIT
