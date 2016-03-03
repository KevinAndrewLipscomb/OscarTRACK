START TRANSACTION
;
insert ignore medical_release_code_description_map
set description = 'AEMT'
, pecking_order = 62
, watchbill_rendition = 'A'
;
COMMIT
