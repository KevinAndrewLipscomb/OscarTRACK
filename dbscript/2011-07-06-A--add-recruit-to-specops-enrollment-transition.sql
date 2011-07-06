START TRANSACTION
;
insert ignore enrollment_transition (current_level_code,valid_next_level_code,authorized_tier_id) values
((select code from enrollment_level where description = "Recruit"),(select code from enrollment_level where description = "SpecOps"),(select id from tier where name = "Squad"))
;
COMMIT