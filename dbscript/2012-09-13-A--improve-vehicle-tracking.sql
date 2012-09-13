START TRANSACTION
;
ALTER TABLE `vehicle_kind`
  ADD COLUMN `be_dmv_inspection_due_meaningful` TINYINT(1) NOT NULL DEFAULT '0'
;
update vehicle_kind set description = "Light utility trailer" where description = "Utility trailer"
;
update vehicle_kind set description = "Light special trailer" where description = "Special trailer"
;
update vehicle_kind set description = "Light cargo trailer" where description = "Cargo trailer"
;
update vehicle_kind set description = "Light boat trailer" where description = "Boat trailer"
;
insert ignore vehicle_kind (description) values
  ("Heavy utility trailer")
,
  ("Heavy special trailer")
,
  ("Heavy cargo trailer")
,
  ("Heavy boat trailer")
;
update vehicle_kind
set be_dmv_inspection_due_meaningful = TRUE
where description in
  (
    "Ambulance"
  ,
    "Zone car"
  ,
    "Squad truck"
  ,
    "Support truck"
  ,
    "Boat"
  ,
    "Utility car"
  ,
    "Supervisor car"
  ,
    "Chief car"
  ,
    "MCI truck"
  ,
    "Parade piece"
  ,
    "Dive truck"
  ,
    "SAR truck"
  ,
    "Heavy utility trailer"
  ,
    "Heavy special trailer"
  ,
    "Heavy cargo trailer"
  ,
    "Heavy boat trailer"
  )
;
update vehicle
set kind_id = (select id from vehicle_kind where description = "Heavy utility trailer")
where kind_id = (select id from vehicle_kind where description = "Light utility trailer")
  and dmv_inspection_due is not null
;
update vehicle
set kind_id = (select id from vehicle_kind where description = "Heavy special trailer")
where kind_id = (select id from vehicle_kind where description = "Light special trailer")
  and dmv_inspection_due is not null
;
update vehicle
set kind_id = (select id from vehicle_kind where description = "Heavy cargo trailer")
where kind_id = (select id from vehicle_kind where description = "Light cargo trailer")
  and dmv_inspection_due is not null
;
update vehicle
set kind_id = (select id from vehicle_kind where description = "Heavy boat trailer")
where kind_id = (select id from vehicle_kind where description = "Light boat trailer")
  and dmv_inspection_due is not null
;
update vehicle_kind set be_target_pm_mileage_meaningful = TRUE where description = "Chief car"
;
COMMIT