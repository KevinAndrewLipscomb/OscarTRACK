START TRANSACTION
;
insert ignore field_situation_impression (pecking_order,description,elaboration) values
(4250,'AlsSurge','OSCALERT: Multiple calls holding for ALS. ALS to your stations.'),
(5250,'FireSurge','OSCALERT: VBFD has multiple working incidents. EMS first response capacity reduced. Volunteers to your stations.'),
(8000,'EmsSurge','OSCALERT: Multiple calls holding for ambulances. Volunteers to your stations.')
;
DROP TABLE IF EXISTS `sms_gateway`
;
CREATE TABLE `sms_gateway` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `carrier_name` varchar(63) NOT NULL,
  `hostname` varchar(253) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carrier_name` (`carrier_name`)
) ENGINE=InnoDB
;
INSERT INTO `sms_gateway` VALUES (1,'Verizon Wireless','vtext.com');
INSERT INTO `sms_gateway` VALUES (2,'AT&T','mms.att.net');
INSERT INTO `sms_gateway` VALUES (3,'Sprint','messaging.sprintpcs.com');
INSERT INTO `sms_gateway` VALUES (4,'T-Mobile','tmomail.net');
INSERT INTO `sms_gateway` VALUES (5,'Cricket','sms.mycricket.com');
INSERT INTO `sms_gateway` VALUES (6,'nTelos','pcs.ntelos.com');
;
ALTER TABLE `member`
  ADD COLUMN `phone_service_id` BIGINT UNSIGNED NULL  AFTER `phone_num`
,
  ADD COLUMN `min_oscalert_peck_order_general` SMALLINT UNSIGNED NOT NULL DEFAULT 5250
,
  ADD COLUMN `min_oscalert_peck_order_als` SMALLINT UNSIGNED NOT NULL DEFAULT 65535
,
  ADD COLUMN `do_oscalert_for_trap` BOOLEAN NOT NULL DEFAULT FALSE
,
  ADD COLUMN `do_oscalert_for_airport_alert` BOOLEAN NOT NULL DEFAULT FALSE
,
  ADD COLUMN `do_oscalert_for_mrt` BOOLEAN NOT NULL DEFAULT FALSE
,
  ADD COLUMN `do_oscalert_for_sart` BOOLEAN NOT NULL DEFAULT FALSE
,
  ADD INDEX `phone_service_id` (`phone_service_id` ASC)
,
  ADD CONSTRAINT `member_phone_service_id` FOREIGN KEY (`phone_service_id` ) REFERENCES `sms_gateway` (`id` )
;
COMMIT