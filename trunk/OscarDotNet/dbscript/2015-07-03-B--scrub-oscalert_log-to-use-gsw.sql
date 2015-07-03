START TRANSACTION
;
update oscalert_log
set content = REPLACE(content,'GunShotWound','Gsw')
;
COMMIT
