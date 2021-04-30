START TRANSACTION
;
update vehicle
  join vehicle_kind on (vehicle_kind.id=vehicle.kind_id)
set dmv_inspection_due = '2020-01-01'
where description like '%trailer'
  and dmv_inspection_due = '9999-12-31'
;
COMMIT