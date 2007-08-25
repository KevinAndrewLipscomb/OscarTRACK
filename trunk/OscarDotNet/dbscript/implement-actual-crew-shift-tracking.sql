START TRANSACTION;

DROP TABLE IF EXISTS `indicator_commensuration`;
CREATE TABLE IF NOT EXISTS `indicator_commensuration` (
  `year` int(10) unsigned NOT NULL,
  `month` tinyint(3) unsigned NOT NULL,
  `be_agency_id_applicable` tinyint(1) NOT NULL,
  `agency_id` int(10) unsigned NOT NULL default '0',
  `value` FLOAT NOT NULL,
  PRIMARY KEY  (`year`,`month`,`be_agency_id_applicable`,`agency_id`),
  KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT privilege set name = "enter-actual-crew-shifts";

INSERT role set name = "Department Schedule Auditor";

INSERT role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "enter-actual-crew-shifts"),(select id from role where name = "Application Administrator")),
((select id from privilege where name = "enter-actual-crew-shifts"),(select id from role where name = "Department Schedule Auditor"));

INSERT role_member_map set
role_id = (select id from role where name = "Department Schedule Auditor"),
member_id = (select id from member where first_name = "KATHLEEN" and last_name = "BUDY");

COMMIT