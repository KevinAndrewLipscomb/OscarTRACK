START TRANSACTION
;
update medical_release_code_description_map
set description = 'Physician'
where description = 'MD'
;
INSERT INTO `enrollment_level`
set description = 'EDP'
, num_shifts = 1
, pecking_order = 35
, elaboration = 'Participates in the EMS Duty Physician Program'
, core_ops_commitment_level_code = 3
, be_hereafter_valid = TRUE
;
insert ignore enrollment_transition (current_level_code,valid_next_level_code,authorized_tier_id) values
((select code from enrollment_level where description = "Tenured ALS"),(select code from enrollment_level where description = "EDP"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Tenured BLS"),(select code from enrollment_level where description = "EDP"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Senior"),(select code from enrollment_level where description = "EDP"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Life"),(select code from enrollment_level where description = "EDP"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Regular"),(select code from enrollment_level where description = "EDP"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Recruit"),(select code from enrollment_level where description = "EDP"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Admin"),(select code from enrollment_level where description = "EDP"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "College"),(select code from enrollment_level where description = "EDP"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Atypical"),(select code from enrollment_level where description = "EDP"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Associate"),(select code from enrollment_level where description = "EDP"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "SpecOps"),(select code from enrollment_level where description = "EDP"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Transferring"),(select code from enrollment_level where description = "EDP"),(select id from tier where name = "Department")),
((select code from enrollment_level where description = "Suspended"),(select code from enrollment_level where description = "EDP"),(select id from tier where name = "Department"))
;
COMMIT