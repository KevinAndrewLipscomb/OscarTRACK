START TRANSACTION
;
insert ignore medical_release_code_description_map
set description = 'EMT-P-RSI'
, pecking_order = 80
, watchbill_rendition = '¶'
;
COMMIT