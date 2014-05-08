START TRANSACTION
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
  ADD INDEX `phone_service_id` (`phone_service_id` ASC)
,
  ADD CONSTRAINT `member_phone_service_id` FOREIGN KEY (`phone_service_id` ) REFERENCES `sms_gateway` (`id` )
;
COMMIT