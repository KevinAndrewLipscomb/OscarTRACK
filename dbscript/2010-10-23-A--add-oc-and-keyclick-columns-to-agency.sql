START TRANSACTION
;
ALTER TABLE `agency`
  ADD COLUMN `keyclick_enumerator` VARCHAR(7) NULL
 , ADD COLUMN `oscar_classic_enumerator` VARCHAR(8) NULL
 , ADD UNIQUE INDEX `keyclick_enumeral` (`keyclick_enumerator` ASC)
 , ADD UNIQUE INDEX `oscar_classic_enumeral` (`oscar_classic_enumerator` ASC)
;
update agency set oscar_classic_enumerator = 'Rescue1', keyclick_enumerator = 'OPVRS' where short_designator = 'R01'
;
update agency set oscar_classic_enumerator = 'Rescue2', keyclick_enumerator = 'DCVRS' where short_designator = 'R02'
;
update agency set oscar_classic_enumerator = 'Rescue4', keyclick_enumerator = 'CBVRS' where short_designator = 'R04'
;
update agency set oscar_classic_enumerator = 'Rescue5', keyclick_enumerator = 'PACHVRS' where short_designator = 'R05'
;
update agency set oscar_classic_enumerator = 'Rescue6', keyclick_enumerator = 'CVRS' where short_designator = 'R06'
;
update agency set oscar_classic_enumerator = 'Rescue9', keyclick_enumerator = 'KVRS' where short_designator = 'R09'
;
update agency set oscar_classic_enumerator = 'Rescue13', keyclick_enumerator = 'BVRS' where short_designator = 'R13'
;
update agency set oscar_classic_enumerator = 'Rescue14', keyclick_enumerator = 'VBVRS' where short_designator = 'R14'
;
update agency set oscar_classic_enumerator = 'Rescue15', keyclick_enumerator = 'KIVRS' where short_designator = 'R15'
;
update agency set oscar_classic_enumerator = 'Rescue16', keyclick_enumerator = 'PVRS' where short_designator = 'R16'
;
update agency set oscar_classic_enumerator = 'Rescue17', keyclick_enumerator = 'SVRS' where short_designator = 'R17'
;
update agency set oscar_classic_enumerator = 'EMS' where short_designator = 'EMS'
;
update agency set oscar_classic_enumerator = 'Support9' where short_designator = 'S09'
;
update agency set oscar_classic_enumerator = 'DiveTeam' where short_designator = 'MRT'
;
update agency set oscar_classic_enumerator = 'SupSvcs' where short_designator = 'SST'
;
COMMIT