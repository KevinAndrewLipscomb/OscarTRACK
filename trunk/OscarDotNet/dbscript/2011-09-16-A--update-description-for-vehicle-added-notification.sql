START TRANSACTION
;
update notification
set activity_description = "vehicles added"
where name = "vehicle-added"
;
COMMIT