START TRANSACTION
;
ALTER TABLE `role`
  DROP COLUMN `soft_hyphenation_text`
;
COMMIT
