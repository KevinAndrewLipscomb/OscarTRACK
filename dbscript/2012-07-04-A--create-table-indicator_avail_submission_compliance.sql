START TRANSACTION
;
DROP TABLE IF EXISTS `indicator_avail_submission_compliance`
;
CREATE TABLE IF NOT EXISTS `indicator_avail_submission_compliance` (
  `year` int(10) unsigned NOT NULL,
  `month` tinyint(3) unsigned NOT NULL,
  `be_agency_id_applicable` tinyint(1) NOT NULL,
  `agency_id` int(10) unsigned NOT NULL default '0',
  `value` FLOAT NOT NULL,
  PRIMARY KEY  (`year`,`month`,`be_agency_id_applicable`,`agency_id`),
  KEY `agency_id` (`agency_id`),
  CONSTRAINT `indicator_avail_submission_compliance_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
COMMIT