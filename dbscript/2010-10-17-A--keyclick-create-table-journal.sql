START TRANSACTION
;
CREATE TABLE `journal` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `actor` varchar(31) NOT NULL,
  `action` varchar(4095) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `actor` (`actor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
COMMIT