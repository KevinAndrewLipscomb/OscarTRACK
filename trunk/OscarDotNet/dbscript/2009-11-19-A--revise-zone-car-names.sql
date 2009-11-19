START TRANSACTION;

update vehicle
  join vehicle_kind on (vehicle_kind.id=vehicle.kind_id)
set name = concat("ZONE CAR ",IFNULL(bumper_number,concat("(OT#",vehicle.id,")")))
where description = "Zone car";

COMMIT