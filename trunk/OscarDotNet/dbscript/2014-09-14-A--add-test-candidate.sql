START TRANSACTION
;
insert ignore medical_release_code_description_map
set description = 'Test Candidate'
, pecking_order = 8
, watchbill_rendition = 't'
;
COMMIT