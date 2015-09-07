START TRANSACTION
;
ALTER TABLE `member` 
  DROP FOREIGN KEY `member_min_oscalert_general_impression_peck_order`
;
ALTER TABLE `member` 
  CHANGE COLUMN `min_oscalert_peck_order_general` `min_oscalert_peck_order_general` SMALLINT(5) UNSIGNED NULL DEFAULT NULL COMMENT ''
;
ALTER TABLE `member` 
  ADD CONSTRAINT `member_min_oscalert_general_impression_peck_order` FOREIGN KEY (`min_oscalert_peck_order_general`) REFERENCES `field_situation_impression` (`pecking_order`)
;
update member
set min_oscalert_peck_order_general = NULL
, min_oscalert_peck_order_als = NULL
;
COMMIT
