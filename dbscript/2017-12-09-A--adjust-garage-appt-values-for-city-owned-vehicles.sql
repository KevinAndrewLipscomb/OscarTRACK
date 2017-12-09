START TRANSACTION
;
update vehicle
set target_pm_mileage = 0xFFFFFFFF
, dmv_inspection_due = '9999-12-31'
where (agency_id not between 1 and 199)
  and agency_id <> 203 -- MRT
;
COMMIT
