-- $Id$
--
-- phpMyAdmin SQL Dump
-- version 2.6.4-pl4
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Dec 19, 2006 at 11:21 AM
-- Server version: 5.0.20
-- PHP Version: 4.4.2
-- 
-- Database: `oscardotnet_x`
-- 

SET FOREIGN_KEY_CHECKS=0;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- --------------------------------------------------------

-- 
-- Table structure for table `agency`
-- 

DROP TABLE IF EXISTS agency;
CREATE TABLE IF NOT EXISTS agency (
  id int unsigned NOT NULL,
  short_designator varchar(3) NOT NULL,
  medium_designator varchar(23) NOT NULL,
  long_designator varchar(63) NOT NULL,
  be_active boolean NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY short_designator (short_designator),
  UNIQUE KEY medium_designator (medium_designator),
  UNIQUE KEY long_designator (long_designator)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_ops_commitment_level`
--

DROP TABLE IF EXISTS core_ops_commitment_level;
CREATE TABLE IF NOT EXISTS core_ops_commitment_level (
  `code` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE INDEX name(`name`)
)
ENGINE = InnoDB;

insert core_ops_commitment_level (`name`) values
('None'),
('Limited'),
('Standard');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_history`
--

DROP TABLE IF EXISTS enrollment_history;
CREATE TABLE IF NOT EXISTS enrollment_history (
  id int(10) unsigned NOT NULL auto_increment,
  member_id int(10) unsigned NOT NULL,
  level_code tinyint(3) unsigned NOT NULL,
  start_date date NOT NULL,
  end_date date,
  note VARCHAR(127),
  PRIMARY KEY  (id),
  UNIQUE KEY member_id (member_id,level_code,start_date),
  KEY level_code (level_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_level`
--

DROP TABLE IF EXISTS enrollment_level;
CREATE TABLE IF NOT EXISTS enrollment_level (
  `code` tinyint(3) unsigned NOT NULL auto_increment,
  description varchar(31) NOT NULL,
  num_shifts tinyint(3) unsigned default NULL,
  pecking_order smallint(5) unsigned NOT NULL default '0',
  elaboration varchar(511) NOT NULL,
  core_ops_commitment_level_code INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY  (`code`),
  UNIQUE KEY description (description),
  UNIQUE KEY pecking_order (pecking_order),
  INDEX core_ops_commitment_level_code(core_ops_commitment_level_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enrollment_level`
--

INSERT INTO enrollment_level (code, description, num_shifts, pecking_order, elaboration) VALUES
(1, 'Admin', 0, 90, 'For Admin I, II, and Support Services members.',1),
(2, 'Regular', 4, 30, 'As defined in EMS Duty Policy.  Has been issued a white ID card.',3),
(3, 'Life', 3, 20, 'as defined in EMS Duty Policy',3),
(4, 'Tenured', 2, 10, 'as defined in EMS Duty Policy',3),
(5, 'Associate', 2, 80, 'as defined in EMS Duty Policy',2),
(6, 'Atypical', NULL, 70, 'Use for chiefs and MD members.  Also use when duty obligation is seasonal (for non-regional college students, etc) or otherwise unusual.',2),
(7, 'Reduced (1)', 1, 60, 'Only use when 1 shift per month is presumed to be a very long-term arrangement.  Otherwise, grant leave to the member instead, and specify an obligation of 1 shift.',2),
(8, 'Reduced (2)', 2, 50, 'Only use when 2 shifts per month is presumed to be a very long-term arrangement.  Otherwise, grant leave to the member instead, and specify an obligation of 2 shifts.',2),
(9, 'Reduced (3)', 3, 40, 'Only use when 3 shifts per month is presumed to be a very long-term arrangement.  Otherwise, grant leave to the member instead, and specify an obligation of 3 shifts.',2),
(10, 'Recruit', 0, 85, 'Has been issued a red or yellow ID card.',1),
(11, 'Resigned', 0, 100, 'If the member did not clearly resign verbally or in writing, use "Unknown" instead.  For Life or Tenured members, use "Retired" unless they have indicated a desire to "divorce" themselves from the organization.',1),
(12, 'Retired', 0, 150, 'Life or Tenured member left on own accord.  It is recommended to put member on leave for a while prior to using this status.',1),
(13, 'Died', 0, 5555, 'Self-explanatory',1),
(14, 'Dismissed', 0, 800, 'Forced out against own wishes',1),
(15, 'Disabled', 0, 200, 'Suffered persistent injury or illness.  Should normally only be used after member has been on medical leave.',1),
(16, 'Unknown', 0, 300, 'Stopped reporting to organization.  Only use if the member never gave a clear indication of their intentions.  It is recommended to put member on leave for a while prior to using this status.',1),
(17, 'Applicant', 0, 88, 'Has submitted an application that has not yet been completely approved.  Has not been issued any kind of ID card.',1),
(18, 'SpecOps', 0, 83, 'Only use for members who NEVER run ambulance duties and who are NOT members of one of the city''s ten original volunteer rescue squads.',1),
(19, 'Suspended', 0, 95, 'as described in Corrective Action Policy',1),
(20, 'Transferring', 0, 81, 'In the process of switching affiliation WITHIN the system.  Temporarily relieves member from duty obligation.',1),
(21, 'New trainee', 0, 82, 'Has recently been issued a white ID card with a red stripe by Training Division.  Next membership status needs to be set by squad commander.  Shift obligation is set to zero in this system.',2),
(22, 'Withdrew application', 0, 125, 'Self-explanatory',1);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_transition`
--

DROP TABLE IF EXISTS enrollment_transition;
CREATE TABLE IF NOT EXISTS enrollment_transition (
  current_level_code tinyint(3) unsigned NOT NULL,
  required_historical_level_code tinyint(3) unsigned,
  disallowed_historical_level_code tinyint(3) unsigned,
  valid_next_level_code tinyint(3) unsigned NOT NULL,
  authorized_tier_id TINYINT UNSIGNED NOT NULL DEFAULT 1,
  UNIQUE KEY (current_level_code, required_historical_level_code, disallowed_historical_level_code, valid_next_level_code),
  KEY (required_historical_level_code),
  KEY (disallowed_historical_level_code),
  KEY (valid_next_level_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enrollment_transition`
--

INSERT INTO `enrollment_transition` (`current_level_code`, `required_historical_level_code`, `disallowed_historical_level_code`, `valid_next_level_code`, `authorized_tier_id`) VALUES
(1, NULL, NULL, 2, 1),
(1, NULL, NULL, 5, 1),
(1, NULL, NULL, 6, 1),
(1, NULL, NULL, 11, 2),
(1, NULL, NULL, 13, 2),
(1, NULL, NULL, 14, 2),
(1, NULL, NULL, 15, 2),
(1, NULL, NULL, 16, 2),
(1, 2, NULL, 7, 1),
(1, 2, 3, 9, 1),
(1, 2, 4, 8, 1),
(1, 3, NULL, 12, 2),
(1, 3, 4, 3, 1),
(1, 4, NULL, 4, 1),
(1, 5, NULL, 7, 1),
(2, NULL, NULL, 1, 2),
(2, NULL, NULL, 3, 2),
(2, NULL, NULL, 5, 2),
(2, NULL, NULL, 6, 2),
(2, NULL, NULL, 7, 2),
(2, NULL, NULL, 8, 2),
(2, NULL, NULL, 9, 2),
(2, NULL, NULL, 11, 2),
(2, NULL, NULL, 13, 2),
(2, NULL, NULL, 14, 2),
(2, NULL, NULL, 15, 2),
(2, NULL, NULL, 16, 2),
(3, NULL, NULL, 1, 2),
(3, NULL, NULL, 4, 2),
(3, NULL, NULL, 5, 2),
(3, NULL, NULL, 6, 2),
(3, NULL, NULL, 7, 2),
(3, NULL, NULL, 8, 2),
(3, NULL, NULL, 11, 2),
(3, NULL, NULL, 12, 2),
(3, NULL, NULL, 13, 2),
(3, NULL, NULL, 14, 2),
(3, NULL, NULL, 15, 2),
(3, NULL, NULL, 16, 2),
(4, NULL, NULL, 1, 2),
(4, NULL, NULL, 6, 2),
(4, NULL, NULL, 7, 2),
(4, NULL, NULL, 11, 2),
(4, NULL, NULL, 12, 2),
(4, NULL, NULL, 13, 2),
(4, NULL, NULL, 14, 2),
(4, NULL, NULL, 15, 2),
(4, NULL, NULL, 16, 2),
(5, NULL, NULL, 1, 2),
(5, NULL, NULL, 2, 2),
(5, NULL, NULL, 6, 2),
(5, NULL, NULL, 7, 2),
(5, NULL, NULL, 11, 2),
(5, NULL, NULL, 13, 2),
(5, NULL, NULL, 14, 2),
(5, NULL, NULL, 15, 2),
(5, NULL, NULL, 16, 2),
(5, 2, 3, 9, 2),
(5, 3, NULL, 12, 2),
(5, 3, 4, 3, 2),
(6, NULL, NULL, 1, 2),
(6, NULL, NULL, 2, 2),
(6, NULL, NULL, 11, 2),
(6, NULL, NULL, 13, 2),
(6, NULL, NULL, 14, 2),
(6, NULL, NULL, 15, 2),
(6, NULL, NULL, 16, 2),
(6, 2, NULL, 7, 2),
(6, 2, 3, 9, 2),
(6, 2, 4, 8, 2),
(6, 3, NULL, 12, 2),
(6, 3, 4, 3, 2),
(6, 4, NULL, 4, 2),
(7, NULL, NULL, 1, 2),
(7, NULL, NULL, 6, 2),
(7, NULL, NULL, 11, 2),
(7, NULL, NULL, 13, 2),
(7, NULL, NULL, 14, 2),
(7, NULL, NULL, 15, 2),
(7, NULL, NULL, 16, 2),
(7, 2, NULL, 2, 2),
(7, 2, NULL, 5, 2),
(7, 2, 3, 9, 2),
(7, 2, 4, 8, 2),
(7, 3, NULL, 12, 2),
(7, 3, 4, 3, 2),
(7, 4, 3, 4, 2),
(7, 5, NULL, 5, 2),
(8, NULL, NULL, 1, 2),
(8, NULL, NULL, 5, 2),
(8, NULL, NULL, 6, 2),
(8, NULL, NULL, 7, 2),
(8, NULL, NULL, 11, 2),
(8, NULL, NULL, 13, 2),
(8, NULL, NULL, 14, 2),
(8, NULL, NULL, 15, 2),
(8, NULL, NULL, 16, 2),
(8, NULL, 3, 2, 2),
(8, NULL, 3, 9, 2),
(8, 3, NULL, 12, 2),
(8, 3, 4, 3, 2),
(8, 4, NULL, 4, 2),
(9, NULL, NULL, 1, 2),
(9, NULL, NULL, 2, 2),
(9, NULL, NULL, 6, 2),
(9, NULL, NULL, 7, 2),
(9, NULL, NULL, 11, 2),
(9, NULL, NULL, 13, 2),
(9, NULL, NULL, 14, 2),
(9, NULL, NULL, 15, 2),
(9, NULL, NULL, 16, 2),
(9, NULL, 4, 5, 2),
(9, NULL, 4, 8, 2),
(9, 3, NULL, 3, 2),
(9, 3, NULL, 12, 2),
(9, 4, 3, 4, 2),
(10, NULL, NULL, 1, 1),
(10, NULL, NULL, 11, 1),
(10, NULL, NULL, 13, 1),
(10, NULL, NULL, 14, 1),
(10, NULL, NULL, 15, 1),
(10, NULL, NULL, 16, 1),
(10, NULL, NULL, 17, 1),
(11, NULL, NULL, 10, 1),
(12, NULL, NULL, 10, 1),
(12, 3, NULL, 13, 2),
(14, NULL, NULL, 10, 1),
(15, NULL, NULL, 10, 1),
(16, NULL, NULL, 10, 1),
(16, NULL, NULL, 1),
(16, 2, 3, 2),
(16, 3, 4, 3),
(16, 4, NULL, 4),
(16, 2, NULL, 5),
(16, 5, NULL, 5),
(16, 6, NULL, 6),
(16, 2, NULL, 7),
(16, 2, 4, 8),
(16, 2, 3, 9),
(16, NULL, NULL, 11),
(16, 3, NULL, 12),
(16, NULL, NULL, 13),
(16, 1, NULL, 14),
(16, 2, NULL, 14),
(16, 10, NULL, 14),
(16, NULL, NULL, 15),
(16, 1, NULL, 19),
(16, 2, NULL, 19),
(17, NULL, NULL, 10, 1),
(17, NULL, NULL, 13, 1),
(17, NULL, NULL, 14, 1),
(17, NULL, NULL, 16, 1),
(18, NULL, NULL, 11, 2),
(18, NULL, NULL, 13, 2),
(18, NULL, NULL, 14, 2),
(18, NULL, NULL, 15, 2),
(18, NULL, NULL, 16, 2),
(17, NULL, NULL, 18, 1),
(1, NULL, NULL, 19, 2),
(2, NULL, NULL, 19, 2),
(3, NULL, NULL, 19, 2),
(4, NULL, NULL, 19, 2),
(5, NULL, NULL, 19, 2),
(6, NULL, NULL, 19, 2),
(7, NULL, NULL, 19, 2),
(8, NULL, NULL, 19, 2),
(9, NULL, NULL, 19, 2),
(10, NULL, NULL, 19, 1),
(18, NULL, NULL, 19, 2),
(19, NULL, NULL, 1, 2),
(19, 2, 3, 2, 1),
(19, 3, 4, 3, 1),
(19, 4, NULL, 4, 1),
(19, NULL, NULL, 5, 1),
(19, NULL, NULL, 6, 1),
(19, 2, NULL, 7, 1),
(19, 2, 4, 8, 1),
(19, 2, 3, 9, 1),
(19, NULL, NULL, 10, 1),
(19, NULL, NULL, 11, 2),
(19, 3, NULL, 12, 2),
(19, NULL, NULL, 13, 2),
(19, NULL, NULL, 14, 2),
(19, NULL, NULL, 15, 2),
(19, NULL, NULL, 16, 2),
(19, NULL, NULL, 18, 2),
(4, NULL, NULL, 20, 2),
(3, NULL, NULL, 20, 2),
(2, NULL, NULL, 20, 2),
(9, NULL, NULL, 20, 2),
(8, NULL, NULL, 20, 2),
(7, NULL, NULL, 20, 2),
(6, NULL, NULL, 20, 2),
(5, NULL, NULL, 20, 2),
(18, NULL, NULL, 20, 2),
(20, 4, NULL, 4, 1),
(20, 3, 4, 3, 1),
(20, 2, 3, 2, 1),
(20, 2, 3, 9, 1),
(20, 2, 4, 8, 1),
(20, 2, NULL, 7, 1),
(20, NULL, NULL, 6, 1),
(20, NULL, NULL, 5, 1),
(20, NULL, NULL, 18, 2),
(20, NULL, NULL, 1, 2),
(10, NULL, NULL, 21, 1),
(21, NULL, NULL, 2, 2),
(21, NULL, NULL, 6, 2),
(21, NULL, NULL, 5, 2)
(17, NULL, NULL, 22, 1),
(22, NULL, NULL, 17, 1);


-- --------------------------------------------------------

--
-- Table structure for table `indicator_commensuration`
--

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


-- --------------------------------------------------------

--
-- Table structure for table `indicator_median_length_of_service`
--

DROP TABLE IF EXISTS indicator_median_length_of_service;
CREATE TABLE IF NOT EXISTS indicator_median_length_of_service (
  be_trendable BOOLEAN NOT NULL DEFAULT 0,
  `year` INTEGER UNSIGNED NOT NULL,
  `month` TINYINT UNSIGNED NOT NULL,
  `be_agency_id_applicable` BOOLEAN NOT NULL
  `agency_id` INTEGER UNSIGNED NOT NULL DEFAULT 0,
  `m` FLOAT UNSIGNED NOT NULL,
  PRIMARY KEY(be_trendable, `year`, `month`, `be_agency_id_applicable`, `agency_id`)
) ENGINE = InnoDB;


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


-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS journal;
CREATE TABLE IF NOT EXISTS journal (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `timestamp` TIMESTAMP NOT NULL,
  actor VARCHAR(31) NOT NULL,
  action VARCHAR(4095) NOT NULL,
  PRIMARY KEY(`id`),
  INDEX actor (actor)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kind_of_leave_code_description_map`
--

DROP TABLE IF EXISTS kind_of_leave_code_description_map;
CREATE TABLE IF NOT EXISTS kind_of_leave_code_description_map (
  `code` tinyint(3) unsigned NOT NULL auto_increment,
  description varchar(31) NOT NULL,
  PRIMARY KEY  (`code`),
  UNIQUE KEY description (description)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kind_of_leave_code_description_map`
--

INSERT INTO kind_of_leave_code_description_map (code, description) VALUES (6, 'Administrative'),
(5, 'Educational'),
(4, 'Maternity'),
(2, 'Medical'),
(3, 'Military'),
(1, 'Personal');

-- --------------------------------------------------------

--
-- Table structure for table `leave_of_absence`
--

DROP TABLE IF EXISTS leave_of_absence;
CREATE TABLE IF NOT EXISTS leave_of_absence (
  id int(10) unsigned NOT NULL auto_increment,
  member_id int(10) unsigned NOT NULL,
  kind_of_leave_code tinyint(3) unsigned NOT NULL,
  start_date date NOT NULL,
  end_date date default NULL,
  num_obliged_shifts tinyint(3) unsigned NOT NULL default '0',
  note varchar(127) default NULL,
  PRIMARY KEY  (id),
  KEY member_id (member_id),
  KEY kind_of_leave_code (kind_of_leave_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `medical_release_code_description_map`
-- 

DROP TABLE IF EXISTS medical_release_code_description_map;
CREATE TABLE IF NOT EXISTS medical_release_code_description_map (
  `code` tinyint(3) unsigned NOT NULL auto_increment,
  description varchar(31) NOT NULL,
  pecking_order tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`code`),
  UNIQUE KEY description (description),
  UNIQUE KEY pecking_order (pecking_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `medical_release_code_description_map`
-- 

INSERT INTO medical_release_code_description_map (code, description, pecking_order) VALUES
(1, 'none', 0),
(2, 'Trainee', 10),
(3, 'EMT-B', 20),
(4, 'EMT-ST', 30),
(5, 'EMT-CT', 50),
(6, 'EMT-P', 70),
(7, 'EMT-E', 40),
(8, 'EMT-I', 60),
(9, 'EMT Intern', 5);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--
drop table if exists member;
create table if not exists member
  (
  id int unsigned AUTO_INCREMENT,
  be_valid boolean NOT NULL default 0,
  last_name varchar(31) NOT NULL,
  first_name varchar(31) NOT NULL,
  email_address varchar(255),
  cad_num varchar(6) default NULL,
  medical_release_code tinyint(3) unsigned NOT NULL default '1',
  agency_id int unsigned NOT NULL,
  be_driver_qualified boolean NOT NULL,
  section_num tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY cad_num (cad_num),
  KEY agency_id (agency_id),
  KEY medical_release_code (medical_release_code),
  KEY section_num (section_num)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--
drop table if exists notification;
create table notification
  (
  id int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY (`name`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO notification (id,`name`) VALUES
(1,'driver-qualification-change'),
(2,'leave-deleted'),
(3,'leave-granted'),
(4,'leave-modified'),
(5,'medical-release-level-change'),
(6,'member-added'),
(7,'new-enrollment-level'),
(8,'section-change'),
(9,'needs-enrollment-review'),
(10,'cad-num-change'),
(11,'member-name-change');

-- --------------------------------------------------------

--
-- Table structure for table `officership`
--

DROP TABLE IF EXISTS officership;
CREATE TABLE IF NOT EXISTS officership (
  id int(10) unsigned NOT NULL auto_increment,
  member_id int(10) unsigned NOT NULL,
  start_date date NOT NULL,
  end_date date,
  rank_code tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (id),
  KEY member_id (member_id),
  KEY rank_code (rank_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `privilege`
--
drop table if exists privilege;
create table privilege
  (
  id int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY (`name`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO privilege (id,`name`) VALUES
(1,'grant-leave'),
(2,'edit-enrollments'),
(3,'release-trainees'),
(4,'mark-recruits-in-class'),
(5,'edit-own-attributes'),
(6,'see-all-sections'),
(7,'see-all-squads'),
(8,'see-released-members'),
(9,'see-nonreleased-members'),
(10,'assign-department-roles-to-members'),
(11,'assign-squad-roles-to-members'),
(12,'see-roster'),
(13,'add-members'),
(14,'send-quickmessages'),
(15,'change-med-release-level'),
(16,'change-driver-qual'),
(17,'change-member-email-address'),
(18,'change-section'),
(19,'change-agency'),
(20,'change-cad-num'),
(21,'change-member-name'),
(22,'enter-actual-crew-shifts'),
(23,'config-users'),
(24,'config-agencies');

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS rank;
CREATE TABLE IF NOT EXISTS rank (
  `code` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(31) NOT NULL,
  pecking_order tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `rank`
-- 

INSERT INTO `rank` (`code`, `name`, `pecking_order`) VALUES (1, 'Sergeant', 1),
(2, 'Lieutenant', 2),
(3, 'Assistant Squad Commander', 3),
(4, 'Squad Commander', 4),
(7, 'Brigade Chief', 5),
(8, 'Division Chief', 6),
(9, 'Squad President', 4),
(10, 'Squad Vice President', 3),
(11, 'Council President', 6),
(12, 'Council Vice President', 5),
(13, 'Other Council corporate officer', 4),
(14, 'Other Squad corporate officer', 2);

--
-- Table structure for table `role`
--
DROP TABLE IF EXISTS role;
CREATE TABLE role (
  id int unsigned NOT NULL auto_increment,
  `name` varchar(63) NOT NULL,
  tier_id TINYINT UNSIGNED,
  PRIMARY KEY id (id),
  UNIQUE KEY name (`name`),
  KEY tier_id (tier_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO role (id,`name`,tier_id) VALUES
(1,'Application Administrator',1),
(2,'Department Authority',1),
(3,'Department Human Resources Officer',1),
(4,'Department BLS ID Coordinator',1),
(5,'Department Analyst',1),
(6,'Squad Commander',2),
(7,'Squad Section Sergeant',3),
(8,'Squad Training Officer',2),
(9,'Squad Membership Coordinator',2),
(10,'Squad Analyst',2),
(11,'Member'),
(12,'Department ALS ID Coordinator',1),
(13,'Department Schedule Auditor',1);

--
-- table structure for table `role_member_map`
--
DROP TABLE IF EXISTS role_member_map;
CREATE TABLE role_member_map (
  member_id int unsigned NOT NULL,
  role_id int unsigned NOT NULL,
  PRIMARY KEY  (member_id,role_id),
  KEY role_id (role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `role_notification_map`
--
DROP TABLE IF EXISTS role_notification_map;
CREATE TABLE role_notification_map (
  role_id int unsigned NOT NULL,
  notification_id int unsigned NOT NULL,
  PRIMARY KEY  (role_id,notification_id),
  KEY privilege_id (notification_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT role_notification_map (notification_id,role_id) VALUES
(1,3),
(1,4),
(1,6),
(1,7),
(1,8),
(2,3),
(2,6),
(2,7),
(3,3),
(3,6),
(3,7),
(4,3),
(4,6),
(4,7),
(5,3),
(5,4),
(5,6),
(5,7),
(5,8),
(6,3),
(6,6),
(6,9),
(7,3),
(7,6),
(8,6),
(8,7),
(9,6),
(10,3),
(11,3),
(11,6),
(11,13),
(11,14);

--
-- Table structure for table `role_privilege_map`
--
DROP TABLE IF EXISTS role_privilege_map;
CREATE TABLE role_privilege_map (
  role_id int unsigned NOT NULL,
  privilege_id int unsigned NOT NULL,
  PRIMARY KEY  (role_id,privilege_id),
  KEY privilege_id (privilege_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO role_privilege_map (role_id,privilege_id) VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(1,13),
(1,14),
(1,15),
(1,16),
(1,17),
(1,18),
(1,19),
(1,20),
(1,21),
(1,22),
(1,23),
(1,24),
(2,1),
(2,2),
(2,3),
(2,4),
(2,6),
(2,7),
(2,8),
(2,9),
(2,10),
(2,11),
(2,12),
(2,13),
(2,14),
(2,15),
(2,16),
(2,17),
(2,19),
(2,20),
(2,21),
(2,22),
(2,23),
(2,24),
(3,2),
(3,6),
(3,7),
(3,8),
(3,9),
(3,12),
(3,13),
(3,14),
(3,15),
(3,16),
(3,17),
(3,19),
(4,3),
(4,4),
(4,6),
(4,7),
(4,8),
(4,9),
(4,12),
(4,14),
(4,15),
(5,6),
(5,7),
(5,8),
(5,9),
(5,12),
(5,14),
(6,1),
(6,6),
(6,8),
(6,9),
(6,11),
(6,12),
(6,14),
(6,17),
(6,18),
(7,8),
(7,12),
(7,14),
(7,17),
(8,6),
(8,8),
(8,9),
(8,12),
(8,14),
(8,16),
(8,17),
(9,6),
(9,8),
(9,9),
(9,12),
(9,14),
(9,17),
(10,6),
(10,8),
(10,9),
(10,12),
(10,14),
(11,5),
(11,6),
(11,8),
(11,12),
(12,3),
(12,4),
(12,6),
(12,7),
(12,8),
(12,9),
(12,12),
(12,14),
(12,15),
(13,22);

-- --------------------------------------------------------

--
-- Table structure for table `tier`
--
DROP TABLE IF EXISTS tier;
CREATE TABLE tier (
  id tinyint unsigned NOT NULL,
  name varchar(31) NOT NULL,
  PRIMARY KEY id (id),
  UNIQUE KEY name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT tier (id,name) VALUES
(1,'Department'),
(2,'Squad'),
(3,'Section');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--   Framework-required info about user
--
DROP TABLE IF EXISTS user;
CREATE TABLE user (
  id int unsigned NOT NULL AUTO_INCREMENT,
  username char(40) NOT NULL,
  encoded_password char(40) default NULL,
  be_stale_password boolean NOT NULL default 1,
  password_reset_email_address varchar(255) NOT NULL,
  be_active boolean NOT NULL default 1,
  num_unsuccessful_login_attempts int unsigned NOT NULL default 0,
  last_login datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY (username),
  UNIQUE KEY (password_reset_email_address)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- table structure for table `user_member_map`
--
DROP TABLE IF EXISTS user_member_map;
CREATE TABLE user_member_map (
  user_id int unsigned NOT NULL,
  member_id int unsigned NOT NULL,
  PRIMARY KEY  (user_id),
  UNIQUE KEY (member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 
-- Constraints for dumped tables
-- 

--
-- Constraints for table `enrollment_history`
--
ALTER TABLE `enrollment_history`
  ADD CONSTRAINT enrollment_history_ibfk_3 FOREIGN KEY (member_id) REFERENCES member (id),
  ADD CONSTRAINT enrollment_history_ibfk_4 FOREIGN KEY (level_code) REFERENCES enrollment_level (`code`);

--
-- Constraints for table `enrollment_level`
--
ALTER TABLE enrollment_level
  ADD CONSTRAINT FOREIGN KEY (core_ops_commitment_level_code) REFERENCES core_ops_commitment_level (code);

--
-- Constraints for table `enrollment_transition`
--
ALTER TABLE enrollment_transition
  ADD CONSTRAINT enrollment_transition_ibfk_1 FOREIGN KEY (current_level_code) REFERENCES enrollment_level (code),
  ADD CONSTRAINT enrollment_transition_ibfk_2 FOREIGN KEY (required_historical_level_code) REFERENCES enrollment_level (code),
  ADD CONSTRAINT enrollment_transition_ibfk_3 FOREIGN KEY (disallowed_historical_level_code) REFERENCES enrollment_level (code),
  ADD CONSTRAINT enrollment_transition_ibfk_4 FOREIGN KEY (valid_next_level_code) REFERENCES enrollment_level (code),
  ADD CONSTRAINT enrollment_transition_ibfk_5 FOREIGN KEY (authorized_tier_id) REFERENCES tier (id);

--
-- Constraints for table `indicator_core_ops_size`
--
ALTER TABLE `indicator_core_ops_size`
  ADD CONSTRAINT FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`);

--
-- Constraints for table `indicator_crew_shifts_forecast`
--
ALTER TABLE `indicator_crew_shifts_forecast`
  ADD CONSTRAINT FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`);

--
-- Constraints for table `indicator_median_length_of_service`
--
ALTER TABLE indicator_median_length_of_service
  ADD CONSTRAINT agency_id FOREIGN KEY agency_id (agency_id) REFERENCES agency (id);

--
-- Constraints for table `indicator_standard_enrollment`
--
ALTER TABLE `indicator_standard_enrollment`
  ADD CONSTRAINT FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`);

--
-- Constraints for table `indicator_utilization`
--
ALTER TABLE `indicator_utilization`
  ADD CONSTRAINT FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`);

--
-- Constraints for table `leave_of_absence`
--
ALTER TABLE `leave_of_absence`
  ADD CONSTRAINT leave_of_absence_ibfk_1 FOREIGN KEY (member_id) REFERENCES member (id),
  ADD CONSTRAINT leave_of_absence_ibfk_2 FOREIGN KEY (kind_of_leave_code) REFERENCES kind_of_leave_code_description_map (`code`);

--
-- Constraints for table `officership`
--
ALTER TABLE `officership`
  ADD CONSTRAINT officership_ibfk_4 FOREIGN KEY (member_id) REFERENCES member (id),
  ADD CONSTRAINT officership_ibfk_5 FOREIGN KEY (rank_code) REFERENCES rank (`code`);

--
-- Constraints for table `member`
--
ALTER TABLE member
  ADD CONSTRAINT FOREIGN KEY (agency_id) REFERENCES agency (id),
  ADD CONSTRAINT FOREIGN KEY (medical_release_code) REFERENCES medical_release_code_description_map (`code`);

ALTER TABLE role
  ADD CONSTRAINT tier_id FOREIGN KEY tier_id (tier_id) REFERENCES tier (id);

ALTER TABLE role_member_map
  ADD CONSTRAINT FOREIGN KEY (member_id) REFERENCES member (id),
  ADD CONSTRAINT FOREIGN KEY (role_id) REFERENCES role (id);

ALTER TABLE user_member_map
  ADD CONSTRAINT FOREIGN KEY (user_id) REFERENCES user (id),
  ADD CONSTRAINT FOREIGN KEY (member_id) REFERENCES member (id);


SET FOREIGN_KEY_CHECKS=1;

COMMIT;