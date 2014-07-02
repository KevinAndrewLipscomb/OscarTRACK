START TRANSACTION
;
update agency
set long_designator = "Town Center"
, be_ems_post = FALSE
, door_code = null
, address = '4817 COLUMBUS ST'
where short_designator = 'R07'
;
update agency
set long_designator = "Thalia"
, keyclick_enumerator = null
, oscar_classic_enumerator = null
, be_ems_post = TRUE
, address = '407 THALIA RD'
where short_designator = 'R15'
;
insert ignore agency
set id = 315
, short_designator = 'Z15'
, medium_designator = 'Zone 15'
, long_designator = 'Zone 15'
, be_ems_post = TRUE
, ems_system_id = 1
;
update schedule_assignment
set post_id = 15
where nominal_day >= '2014-07-01'
  and post_id = 7
;
update schedule_assignment
set post_id = 315
where nominal_day >= '2014-07-01'
  and post_id = 307
;
COMMIT