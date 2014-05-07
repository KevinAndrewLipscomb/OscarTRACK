START TRANSACTION
;
update field_situation_impression
set elaboration = 'OSCALERT: ALS case at <address/>. SCENE SAFETY *UNKNOWN*. Assignment is <assignment/>.'
where description = 'AlsEms'
;
update field_situation_impression
set elaboration = 'OSCALERT: ALS needed at <address/>. SCENE SAFETY *UNKNOWN*. Assignment is <assignment/>.'
where description = 'AlsNeeded'
;
update field_situation_impression
set elaboration = 'OSCALERT: ALS needed for Cardiac Arrest at <address/>. SCENE SAFETY *UNKNOWN*. Assignment is <assignment/>.'
where description = 'CardiacArrestAlsNeeded'
;
update field_situation_impression
set elaboration = 'OSCALERT: Marine Rescue Team case at <address/>. Assignment is <assignment/>.'
where description = 'MrtCall'
;
update field_situation_impression
set elaboration = 'OSCALERT: Trap case or equiv at <address/>. Assignment is <assignment/>.'
where description = 'Trap'
;
update field_situation_impression
set elaboration = REPLACE(elaboration,'AUTOTEXT','OSCALERT')
;
update field_situation_impression
set elaboration = REPLACE(elaboration,'Be advised, ','')
;
update field_situation_impression
set elaboration = REPLACE(elaboration,'equivalent','equiv')
;
COMMIT