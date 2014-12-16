START TRANSACTION
;
update notification
set activity_description = 'flight medic qualification changes'
, activity_pecking_order = 153
where name = 'flight-medic-qualification-change'
;
update notification
set activity_description = 'marine medic qualification changes'
, activity_pecking_order = 157
where name = 'marine-medic-qualification-change'
;
COMMIT