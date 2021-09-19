START TRANSACTION
;
INSERT INTO `enrollment_level`
set description = 'ResDoc'
, pecking_order = 37
, elaboration = 'Use for resident physicians who only have duty obligations during their EMS rotations'
, core_ops_commitment_level_code = 2
, be_hereafter_valid = TRUE
;
insert ignore enrollment_transition (current_level_code,valid_next_level_code,authorized_tier_id) values
((select code from enrollment_level where description = "Tenured ALS"),(select code from enrollment_level where description = "ResDoc"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Tenured BLS"),(select code from enrollment_level where description = "ResDoc"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Senior"),(select code from enrollment_level where description = "ResDoc"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Life"),(select code from enrollment_level where description = "ResDoc"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Regular"),(select code from enrollment_level where description = "ResDoc"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Recruit"),(select code from enrollment_level where description = "ResDoc"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Admin"),(select code from enrollment_level where description = "ResDoc"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "College"),(select code from enrollment_level where description = "ResDoc"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Atypical"),(select code from enrollment_level where description = "ResDoc"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Associate"),(select code from enrollment_level where description = "ResDoc"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "SpecOps"),(select code from enrollment_level where description = "ResDoc"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Transferring"),(select code from enrollment_level where description = "ResDoc"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Suspended"),(select code from enrollment_level where description = "ResDoc"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "ResDoc"),(select code from enrollment_level where description = "EDP"),(select id from tier where name = "Department"))
;
insert ignore enrollment_transition
select (select code from enrollment_level where description = 'ResDoc') as current_level_code
, required_historical_level_code
, disallowed_historical_level_code
, valid_next_level_code
, 1 as authorized_tier_id
from enrollment_transition
where current_level_code = (select code from enrollment_level where description = 'EDP')
;
insert ignore enrollment_transition
select current_level_code
, required_historical_level_code
, disallowed_historical_level_code
, (select code from enrollment_level where description = 'ResDoc') as valid_next_level_code
, 1 as authorized_tier_id
from enrollment_transition
where valid_next_level_code = (select code from enrollment_level where description = 'EDP')
;
COMMIT