START TRANSACTION
;
ALTER TABLE `vehicle` 
  ADD COLUMN `can_receive_legacy_cot_fastener` TINYINT NOT NULL DEFAULT '0'
;
COMMIT