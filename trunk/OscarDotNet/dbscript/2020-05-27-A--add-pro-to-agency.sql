START TRANSACTION
;
insert ignore agency
set id = 211
, short_designator = "PRO"
, medium_designator = "Proctor"
, long_designator = "Workshop Proctor Team"
, be_active = TRUE
, oscar_classic_enumerator = "WkshpProctorTm"
, ems_system_id = 1
;
COMMIT