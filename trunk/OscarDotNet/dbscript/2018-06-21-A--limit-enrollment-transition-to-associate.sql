START TRANSACTION
;
update enrollment_transition
set authorized_tier_id = (select id from tier where name = 'Department')
where valid_next_level_code = (select code from enrollment_level where description = 'Associate')
;
COMMIT
