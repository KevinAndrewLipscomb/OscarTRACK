START TRANSACTION;


-- --------------------------------------------------------

--
-- Table structure for table `indicator_num_members_in_pipeline`
--

DROP TABLE IF EXISTS `indicator_num_members_in_pipeline`;
CREATE TABLE IF NOT EXISTS `indicator_num_members_in_pipeline` (
  `year` int(10) unsigned NOT NULL,
  `month` tinyint(3) unsigned NOT NULL,
  `be_agency_id_applicable` tinyint(1) NOT NULL,
  `agency_id` int(10) unsigned NOT NULL default '0',
  `value` INTEGER unsigned NOT NULL,
  PRIMARY KEY  (`year`,`month`,`be_agency_id_applicable`,`agency_id`),
  KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for table `indicator_num_members_in_pipeline`
--
ALTER TABLE `indicator_num_members_in_pipeline`
  ADD CONSTRAINT FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`);


COMMIT