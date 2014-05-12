START TRANSACTION
;
ALTER TABLE `member`
  CHANGE COLUMN `min_oscalert_peck_order_general` `min_oscalert_peck_order_general` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '4750'
;
update member
set min_oscalert_peck_order_general = 4750
;
update member
  join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)
set min_oscalert_peck_order_als = 4250
where pecking_order >= (select pecking_order from medical_release_code_description_map where description = 'EMT-CT')
;
update member
set do_oscalert_for_mrt = TRUE
where agency_id = (select id from agency where short_designator = 'MRT')
;
update member
set do_oscalert_for_sart = TRUE
where agency_id = (select id from agency where short_designator = 'SAR')
;
update member
  join enrollment_history on
    (
      enrollment_history.member_id=member.id
    and
      enrollment_history.end_date is null
    )
  join enrollment_level on (enrollment_level.code=enrollment_history.level_code)
set min_oscalert_peck_order_general = 65535
, min_oscalert_peck_order_als = 65535
, do_oscalert_for_trap = FALSE
, do_oscalert_for_airport_alert = FALSE
, do_oscalert_for_mrt = FALSE
, do_oscalert_for_sart = FALSE
where enrollment_level.description in ('Withdrew application','Unknown','Resigned','Retired','Disabled','Dismissed','Deceased')
;
update field_situation_impression set elaboration = REPLACE(elaboration,'LARGE','Large')
;
update field_situation_impression set elaboration = REPLACE(elaboration,'HUGE MCI CASE ACTIVE. VOLUNTEERS TO YOUR STATIONS.','Huge MCI case active. Volunteers to your stations.')
;
update field_situation_impression set elaboration = REPLACE(elaboration,'needed for Cardiac','needed, Cardiac')
;
update field_situation_impression set elaboration = REPLACE(elaboration,'SCENE SAFETY','SAFETY')
;
update field_situation_impression set elaboration = REPLACE(elaboration,'Marine Rescue Team','MRT')
;
update field_situation_impression set elaboration = REPLACE(elaboration,'Search And Rescue Team','SAR')
;
update field_situation_impression set elaboration = REPLACE(elaboration,'ALS needed','Need ALS')
;
update field_situation_impression set elaboration = REPLACE(elaboration,'Ambulance needed','Need ambulance')
;
update field_situation_impression set elaboration = REPLACE(elaboration,' first ',' 1st ')
;
update field_situation_impression set elaboration = REPLACE(elaboration,'capacity reduced','reduced')
;
update field_situation_impression set elaboration = REPLACE(elaboration,' at ',' @ ')
;
update field_situation_impression set elaboration = REPLACE(elaboration,'Assignment is ','http://v.gd/7bfLG6 Assgnmt=')
;
update field_situation_impression set elaboration = REPLACE(elaboration,' to your stations.',' to your stations. http://v.gd/7bfLG6')
;
COMMIT