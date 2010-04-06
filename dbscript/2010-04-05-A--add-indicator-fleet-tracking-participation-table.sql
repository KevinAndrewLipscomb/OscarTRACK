START TRANSACTION;

DROP TABLE IF EXISTS `indicator_fleet_tracking_participation`;
CREATE TABLE IF NOT EXISTS `indicator_fleet_tracking_participation` (
  `year` int(10) unsigned NOT NULL,
  `month` tinyint(3) unsigned NOT NULL,
  `be_agency_id_applicable` tinyint(1) NOT NULL,
  `agency_id` int(10) unsigned NOT NULL default '0',
  `value` FLOAT NOT NULL,
  PRIMARY KEY  (`year`,`month`,`be_agency_id_applicable`,`agency_id`),
  KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

COMMIT