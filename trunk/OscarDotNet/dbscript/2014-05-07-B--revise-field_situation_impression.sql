START TRANSACTION
;
update field_situation_impression
set elaboration = 'OSCALERT: Standby case at <address/>. No action needed. Assignment is <assignment/>.'
where description = 'Standby'
;
update field_situation_impression
set elaboration = 'OSCALERT: Typical case at <address/>. No action needed. Assignment is <assignment/>.'
where description = 'Typical'
;
update field_situation_impression
set elaboration = 'OSCALERT: AirportAlert or equiv at <address/>. Assignment is <assignment/>.'
where description = 'AirportAlert'
;
update field_situation_impression
set elaboration = 'OSCALERT: WorkingFire or equiv at <address/>. Assignment is <assignment/>.'
where description = 'WorkingFire'
;
COMMIT