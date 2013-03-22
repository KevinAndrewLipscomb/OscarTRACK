START TRANSACTION
;
ALTER TABLE `resident_base`
  DROP INDEX `street_id_house_num`
,
  ADD UNIQUE INDEX `street_id_house_num_agency` (`street_id` ASC, `house_num` ASC, `agency` ASC)
;
COMMIT