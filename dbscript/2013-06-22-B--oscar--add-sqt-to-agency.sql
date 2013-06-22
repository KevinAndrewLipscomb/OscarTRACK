START TRANSACTION
;
ALTER TABLE `agency`
  CHANGE COLUMN `enumeral` `enumeral` VARCHAR(14) NOT NULL DEFAULT ''
;
insert into agency
set enumeral = "SquadTruckTeam"
, description = "Squad Truck Team"
, be_active = TRUE
;
ALTER TABLE `authority`
  CHANGE COLUMN `coord_agency` `coord_agency` ENUM('EMS','Rescue1','Rescue2','Rescue4','Rescue5','Rescue6','Rescue9','Rescue13','Rescue14','Rescue15','Rescue16','Rescue17','DiveTeam','Support9','SupSvcs','SquadTruckTeam') NOT NULL DEFAULT 'EMS'
;
ALTER TABLE `avail_comment`
  CHANGE COLUMN `coord_agency` `coord_agency` ENUM('EMS','Rescue1','Rescue2','Rescue4','Rescue5','Rescue6','Rescue9','Rescue13','Rescue14','Rescue15','Rescue16','Rescue17','DiveTeam','Support9','SupSvcs','SquadTruckTeam') NOT NULL DEFAULT 'EMS'
;
ALTER TABLE `avail_sheet`
  CHANGE COLUMN `coord_agency` `coord_agency` ENUM('EMS','Rescue1','Rescue2','Rescue4','Rescue5','Rescue6','Rescue9','Rescue13','Rescue14','Rescue15','Rescue16','Rescue17','DiveTeam','Support9','SupSvcs','SquadTruckTeam') NOT NULL DEFAULT 'EMS'
;
ALTER TABLE `squad_of_coord_agency`
  CHANGE COLUMN `coord_agency` `coord_agency` ENUM('Rescue1','Rescue2','Rescue4','Rescue5','Rescue6','Rescue9','Rescue13','Rescue14','Rescue16','Rescue17','DiveTeam','Support9','SupSvcs','SquadTruckTeam') NOT NULL DEFAULT 'Rescue1'
,
  CHANGE COLUMN `squad` `squad` ENUM('R01','R02','R04','R05','R06','R09','R13','R14','R16','R17','DIV','SU9','SSV','SQT') NOT NULL DEFAULT 'R01'
;
insert ignore squad_of_coord_agency
set coord_agency = "SquadTruckTeam"
, squad = "SQT"
;
COMMIT