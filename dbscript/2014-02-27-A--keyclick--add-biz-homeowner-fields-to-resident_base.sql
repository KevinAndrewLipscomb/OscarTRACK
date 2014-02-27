START TRANSACTION
;
ALTER TABLE `resident_base`
  DROP COLUMN `id_accidental_2010_a`
,
  ADD COLUMN `be_pure_business` BOOLEAN NOT NULL DEFAULT FALSE
,
  ADD COLUMN `be_homeowner` BOOLEAN NULL
;
update resident_base
set be_pure_business = TRUE
where agency = 'DCVRS'
  and id between 142441 and 143738
;
update resident_base
set be_pure_business = TRUE
where agency = 'CBVRS'
  and id between 143739 and 144741
;
COMMIT