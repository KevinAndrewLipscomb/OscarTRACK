START TRANSACTION
;
insert ignore agency
set id = 408
, short_designator = '008'
, medium_designator = 'EMS 08'
, long_designator = 'EMS 08'
, be_ems_post = TRUE
;
COMMIT