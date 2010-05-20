START TRANSACTION;

drop table indicator_shiftwise_vehicles_up_and_current;

CREATE TABLE `indicator_shiftwise_vehicles_up_and_current`
  (
  `date` date NOT NULL,
  `be_for_night_shift` TINYINT(1) NOT NULL,
  `be_agency_id_applicable` TINYINT(1) NOT NULL,
  `agency_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` float NOT NULL,
  PRIMARY KEY (`date`,`be_for_night_shift`,`be_agency_id_applicable`,`agency_id`),
  KEY `agency_id` (`agency_id`),
  CONSTRAINT `indicator_shiftwise_vehicles_up_and_current_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
  )
  ENGINE=InnoDB DEFAULT CHARSET=utf8;

COMMIT