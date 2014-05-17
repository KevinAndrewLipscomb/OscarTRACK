START TRANSACTION
;
ALTER TABLE `member`
  CHANGE COLUMN `min_oscalert_peck_order_general` `min_oscalert_peck_order_general` SMALLINT(5) UNSIGNED NULL DEFAULT '4750'
,
  CHANGE COLUMN `min_oscalert_peck_order_als` `min_oscalert_peck_order_als` SMALLINT(5) UNSIGNED NULL DEFAULT NULL
;
update member
set min_oscalert_peck_order_general = null
where min_oscalert_peck_order_general = 65535
;
update member
set min_oscalert_peck_order_als = null
where min_oscalert_peck_order_als = 65535
;
ALTER ignore TABLE `member`
  DROP FOREIGN KEY `member_ibfk_2`
,
  DROP FOREIGN KEY `member_ibfk_3`
;
ALTER ignore TABLE `member` 
  ADD INDEX `min_oscalert_general_peck_order` (`min_oscalert_peck_order_general` ASC)
,
  ADD INDEX `min_oscalert_peck_order_als` (`min_oscalert_peck_order_als` ASC)
,
  ADD CONSTRAINT `member_medical_release_code` FOREIGN KEY (`medical_release_code` ) REFERENCES `medical_release_code_description_map` (`code` )
, 
  ADD CONSTRAINT `member_agency_id` FOREIGN KEY (`agency_id` ) REFERENCES `agency` (`id` )
, 
  ADD CONSTRAINT `member_min_oscalert_general_impression_peck_order` FOREIGN KEY (`min_oscalert_peck_order_general` ) REFERENCES `field_situation_impression` (`pecking_order` )
, 
  ADD CONSTRAINT `member_min_oscalert_als_impression_peck_order` FOREIGN KEY (`min_oscalert_peck_order_als` ) REFERENCES `field_situation_impression` (`pecking_order` )
;
update ignore member set min_oscalert_peck_order_general = 6500 where min_oscalert_peck_order_general = 6000
;
delete ignore from field_situation_impression where description = 'MajorFireIncident'
;
COMMIT