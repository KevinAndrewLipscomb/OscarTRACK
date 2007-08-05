START TRANSACTION;


-- --------------------------------------------------------

--
-- Table structure for table `indicator_core_ops_size`
--

DROP TABLE IF EXISTS `indicator_core_ops_size`;
CREATE TABLE IF NOT EXISTS `indicator_core_ops_size` (
  `year` int(10) unsigned NOT NULL,
  `month` tinyint(3) unsigned NOT NULL,
  `be_agency_id_applicable` tinyint(1) NOT NULL,
  `agency_id` int(10) unsigned NOT NULL default '0',
  `value` INTEGER unsigned NOT NULL,
  PRIMARY KEY  (`year`,`month`,`be_agency_id_applicable`,`agency_id`),
  KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for table `indicator_core_ops_size`
--
ALTER TABLE `indicator_core_ops_size`
  ADD CONSTRAINT FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`);


-- --------------------------------------------------------

--
-- Table structure for table `indicator_utilization`
--

DROP TABLE IF EXISTS `indicator_utilization`;
CREATE TABLE IF NOT EXISTS `indicator_utilization` (
  `year` int(10) unsigned NOT NULL,
  `month` tinyint(3) unsigned NOT NULL,
  `be_agency_id_applicable` tinyint(1) NOT NULL,
  `agency_id` int(10) unsigned NOT NULL default '0',
  `value` FLOAT unsigned NOT NULL,
  PRIMARY KEY  (`year`,`month`,`be_agency_id_applicable`,`agency_id`),
  KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for table `indicator_utilization`
--
ALTER TABLE `indicator_utilization`
  ADD CONSTRAINT FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`);


-- --------------------------------------------------------

--
-- Table structure for table `indicator_crew_shifts_forecast`
--

DROP TABLE IF EXISTS `indicator_crew_shifts_forecast`;
CREATE TABLE IF NOT EXISTS `indicator_crew_shifts_forecast` (
  `year` int(10) unsigned NOT NULL,
  `month` tinyint(3) unsigned NOT NULL,
  `be_agency_id_applicable` tinyint(1) NOT NULL,
  `agency_id` int(10) unsigned NOT NULL default '0',
  `value` FLOAT unsigned NOT NULL,
  PRIMARY KEY  (`year`,`month`,`be_agency_id_applicable`,`agency_id`),
  KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for table `indicator_crew_shifts_forecast`
--
ALTER TABLE `indicator_crew_shifts_forecast`
  ADD CONSTRAINT FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`);


-- --------------------------------------------------------

--
-- Table structure for table `indicator_standard_enrollment`
--

DROP TABLE IF EXISTS `indicator_standard_enrollment`;
CREATE TABLE IF NOT EXISTS `indicator_standard_enrollment` (
  `year` int(10) unsigned NOT NULL,
  `month` tinyint(3) unsigned NOT NULL,
  `be_agency_id_applicable` tinyint(1) NOT NULL,
  `agency_id` int(10) unsigned NOT NULL default '0',
  `value` FLOAT unsigned NOT NULL,
  PRIMARY KEY  (`year`,`month`,`be_agency_id_applicable`,`agency_id`),
  KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for table `indicator_standard_enrollment`
--
ALTER TABLE `indicator_standard_enrollment`
  ADD CONSTRAINT FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`);


COMMIT