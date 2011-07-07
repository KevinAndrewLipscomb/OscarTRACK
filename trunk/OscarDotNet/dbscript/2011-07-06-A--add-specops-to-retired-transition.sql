START TRANSACTION
;
insert ignore enrollment_transition
set current_level_code = (select code from enrollment_level where description = "SpecOps")
, valid_next_level_code = (select code from enrollment_level where description = "Retired")
, authorized_tier_id = (select id from tier where name = "Squad")
;
COMMIT