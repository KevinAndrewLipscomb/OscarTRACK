START TRANSACTION
;
ALTER TABLE `member`
  ADD COLUMN `be_on_mrt` TINYINT NOT NULL DEFAULT FALSE
,
  ADD COLUMN `be_on_sart` TINYINT NOT NULL DEFAULT FALSE
,
  ADD INDEX `do_oscalert_for_trap` (`do_oscalert_for_trap` ASC)
,
  ADD INDEX `do_oscalert_for_airport_alert` (`do_oscalert_for_airport_alert` ASC)
,
  ADD INDEX `do_oscalert_for_mrt` (`do_oscalert_for_mrt` ASC)
,
  ADD INDEX `do_oscalert_for_sart` (`do_oscalert_for_sart` ASC)
,
  ADD INDEX `be_on_mrt` (`be_on_mrt` ASC)
,
  ADD INDEX `be_on_sart` (`be_on_sart` ASC)
;
COMMIT