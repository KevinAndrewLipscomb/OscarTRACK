START TRANSACTION
;
INSERT ignore INTO `enrollment_level` set description = 'Guest Provider'
, pecking_order = '98'
, elaboration =
    'A VBFD firefighter or NON-member of VBRescue riding as a guest for the purpose of completing an EMS field internship'
, core_ops_commitment_level_code = 1
, be_hereafter_valid = 1
;
insert ignore into medical_release_code_description_map set description = 'Guest Intern'
, pecking_order = 9
, watchbill_rendition = 'g'
;
COMMIT