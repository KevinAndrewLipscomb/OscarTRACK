START TRANSACTION
;
insert ignore medical_release_code_description_map
set description = 'MD'
, pecking_order = 160
, watchbill_rendition = '#'
;
COMMIT