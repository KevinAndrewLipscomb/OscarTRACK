START TRANSACTION
;
ALTER TABLE `love_letter_batch` 
  ADD COLUMN `agency` ENUM('KVRS','PVRS','DCVRS','PACHVRS','CBVRS','VBVRS','OPVRS','CVRS','BVRS','SVRS') NOT NULL DEFAULT 'KVRS'
,
  DROP INDEX `designator_UNIQUE`
,
  ADD UNIQUE INDEX `designator_UNIQUE` (`designator` ASC, `agency` ASC)
,
  ADD INDEX `agency` (`agency` ASC, `immune_scene_visits_factor` ASC)
;
ALTER TABLE `scene_visited` 
  ADD COLUMN `agency` ENUM('KVRS','PVRS','DCVRS','PACHVRS','CBVRS','VBVRS','OPVRS','CVRS','BVRS','SVRS') NOT NULL DEFAULT 'KVRS' AFTER `address`
,
  DROP INDEX `love_letter_batch_designator`
,
  ADD INDEX `love_letter_batch_designator` (`love_letter_batch_designator` ASC, `agency` ASC)
,
  ADD INDEX `agency` (`agency` ASC)
;
update scene_visited set agency = 'PACHVRS' where love_letter_batch_designator like 'R05-%'
;
update love_letter_batch set agency = 'PACHVRS' where designator like 'R05-%'
;
COMMIT
