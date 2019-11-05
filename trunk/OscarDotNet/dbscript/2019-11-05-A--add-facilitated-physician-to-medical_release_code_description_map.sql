START TRANSACTION
;
insert ignore medical_release_code_description_map
set description = 'Facilitated Physician'
, pecking_order = 15
, watchbill_rendition = '†'
;
update medical_release_code_description_map
set watchbill_rendition = '‡'
where description = 'Physician'
;
update enrollment_level
set core_ops_commitment_level_code = 2
where description = 'EDP'
;
COMMIT