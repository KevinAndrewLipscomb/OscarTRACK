START TRANSACTION
;
insert into agency
set enumeral = "BikeTeam"
, description = "Bike Team"
, be_active = "TRUE"
;
ALTER TABLE `authority`
  CHANGE COLUMN `coord_agency` `coord_agency` ENUM('EMS','Rescue1','Rescue2','Rescue4','Rescue5','Rescue6','Rescue9','Rescue13','Rescue14','Rescue15','Rescue16','Rescue17','DiveTeam','Support9','SupSvcs','SquadTruckTeam','VolFldSupTeam','MciTeam','BikeTeam') NOT NULL DEFAULT 'EMS'
;
ALTER TABLE `avail_comment`
  CHANGE COLUMN `coord_agency` `coord_agency` ENUM('EMS','Rescue1','Rescue2','Rescue4','Rescue5','Rescue6','Rescue9','Rescue13','Rescue14','Rescue15','Rescue16','Rescue17','DiveTeam','Support9','SupSvcs','SquadTruckTeam','VolFldSupTeam','MciTeam','BikeTeam') NOT NULL DEFAULT 'EMS'
;
ALTER TABLE `avail_sheet`
  CHANGE COLUMN `coord_agency` `coord_agency` ENUM('EMS','Rescue1','Rescue2','Rescue4','Rescue5','Rescue6','Rescue9','Rescue13','Rescue14','Rescue15','Rescue16','Rescue17','DiveTeam','Support9','SupSvcs','SquadTruckTeam','VolFldSupTeam','MciTeam','BikeTeam') NOT NULL DEFAULT 'EMS'
;
ALTER TABLE `squad_of_coord_agency`
  CHANGE COLUMN `coord_agency` `coord_agency` ENUM('Rescue1','Rescue2','Rescue4','Rescue5','Rescue6','Rescue9','Rescue13','Rescue14','Rescue16','Rescue17','DiveTeam','Support9','SupSvcs','SquadTruckTeam','VolFldSupTeam','MciTeam','BikeTeam') NOT NULL DEFAULT 'Rescue1'
,
  CHANGE COLUMN `squad` `squad` ENUM('R01','R02','R04','R05','R06','R09','R13','R14','R16','R17','DIV','SU9','SSV','SQT','VFS','MCI','BKT') NOT NULL DEFAULT 'R01'
;
insert ignore squad_of_coord_agency
set coord_agency = "BikeTeam"
, squad = "BKT"
;
COMMIT