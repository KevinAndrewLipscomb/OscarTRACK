START TRANSACTION
;
update notification
set name = 'vehicle-needs-shuttled'
, activity_description = 'vehicle shuttles needed'
where name = 'vehicle-appointment'
;
update privilege
set name = 'send-vehicle-shuttle-needed-notifications'
where name = 'send-vehicle-appointment-notifications'
;
COMMIT
