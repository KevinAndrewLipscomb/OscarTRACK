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
-- Table structure for table `end_disposition_code_description_map`
-- 

DROP TABLE IF EXISTS end_disposition_code_description_map;
CREATE TABLE IF NOT EXISTS end_disposition_code_description_map (
  `code` tinyint(3) unsigned NOT NULL auto_increment,
  description varchar(63) NOT NULL,
  elaboration varchar(127) NOT NULL,
  PRIMARY KEY  (`code`),
  UNIQUE KEY description (description),
  UNIQUE KEY elaboration (elaboration)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `end_disposition_code_description_map`
-- 

INSERT INTO `end_disposition_code_description_map` (`code`, `description`, `elaboration`) VALUES (1, 'Unknown', 'No information available'),
(2, 'Advanced', 'Earned higher enrollment status'),
(3, 'Receded', 'Converted to lower enrollment status'),
(4, 'Resigned', 'Explicitly disassociated on own accord'),
(5, 'Retired', 'Life member disengaged on own accord'),
(6, 'Died', 'Died'),
(7, 'Expelled', 'Forced out against own wishes'),
(8, 'Disabled', 'Suffered persistent injury or illness'),
(9, 'Disengaged', 'Stopped reporting to organization');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_history`
--

DROP TABLE IF EXISTS enrollment_history;
CREATE TABLE IF NOT EXISTS enrollment_history (
  id int(10) unsigned NOT NULL auto_increment,
  member_id int(10) unsigned NOT NULL,
  obligation_code tinyint(3) unsigned NOT NULL,
  start_date date NOT NULL,
  end_disposition_code tinyint(3) unsigned default NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY member_id (member_id,start_date),
  KEY obligation_code (obligation_code),
  KEY end_disposition_code (end_disposition_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

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

INSERT INTO medical_release_code_description_map (code, description, pecking_order) VALUES (1, 'none', 0),
(2, 'Trainee', 10),
(3, 'EMT-B', 20),
(4, 'EMT-ST', 30),
(5, 'EMT-CT', 50),
(6, 'EMT-P', 70),
(7, 'EMT-E', 40),
(8, 'EMT-I', 60);

-- --------------------------------------------------------

-- 
-- Table structure for table `member`
-- 

DROP TABLE IF EXISTS member;
CREATE TABLE IF NOT EXISTS member (
  id int unsigned NOT NULL auto_increment,
  cad_num varchar(6) default NULL,
  last_name varchar(31) NOT NULL,
  first_name varchar(31) NOT NULL,
  medical_release_code tinyint(3) unsigned NOT NULL default '0',
  agency_id int unsigned NOT NULL,
  be_driver_qualified boolean NOT NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY cad_num (cad_num),
  KEY agency_id (agency_id),
  KEY medical_release_code (medical_release_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `member_user`
-- 

DROP TABLE IF EXISTS member_user;
CREATE TABLE IF NOT EXISTS member_user (
  id int unsigned NOT NULL,
  encoded_password char(40) default NULL,
  be_stale_password boolean NOT NULL default '1',
  password_reset_email_address varchar(255) NOT NULL,
  be_active boolean NOT NULL default '1',
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `obligation_code_description_map`
-- 

DROP TABLE IF EXISTS obligation_code_description_map;
CREATE TABLE IF NOT EXISTS obligation_code_description_map (
  `code` tinyint(3) unsigned NOT NULL auto_increment,
  description varchar(31) NOT NULL,
  num_shifts tinyint(3) unsigned default NULL,
  pecking_order tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`code`),
  UNIQUE KEY description (description),
  UNIQUE KEY pecking_order (pecking_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `obligation_code_description_map`
-- 

INSERT INTO obligation_code_description_map (code, description, num_shifts, pecking_order) VALUES (1, 'Admin', 0, 90),
(2, 'Regular', 4, 30),
(3, 'Life', 3, 20),
(4, 'Tenured', 2, 10),
(5, 'Associate', 2, 80),
(6, 'Special', NULL, 70),
(7, 'Reduced (1)', 1, 60),
(8, 'Reduced (2)', 2, 50),
(9, 'Reduced (3)', 3, 40),
(10, 'Recruit', 0, 85);

-- --------------------------------------------------------

-- 
-- Table structure for table `officership`
-- 

DROP TABLE IF EXISTS officership;
CREATE TABLE IF NOT EXISTS officership (
  id int(10) unsigned NOT NULL auto_increment,
  member_id int(10) unsigned NOT NULL,
  start_date date NOT NULL,
  end_date date NOT NULL,
  rank_code tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (id),
  KEY member_id (member_id),
  KEY rank_code (rank_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `squad_commander_user`
--

DROP TABLE IF EXISTS squad_commander_user;
CREATE TABLE IF NOT EXISTS squad_commander_user (
  id int unsigned NOT NULL,
  encoded_password char(40) default NULL,
  be_stale_password boolean NOT NULL default '1',
  password_reset_email_address varchar(255) NOT NULL,
  be_active boolean NOT NULL default '1',
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 
-- Constraints for dumped tables
-- 

-- 
-- Constraints for table `enrollment_history`
-- 
ALTER TABLE `enrollment_history`
  ADD CONSTRAINT enrollment_history_ibfk_3 FOREIGN KEY (member_id) REFERENCES member (id),
  ADD CONSTRAINT enrollment_history_ibfk_4 FOREIGN KEY (obligation_code) REFERENCES obligation_code_description_map (`code`),
  ADD CONSTRAINT enrollment_history_ibfk_5 FOREIGN KEY (end_disposition_code) REFERENCES end_disposition_code_description_map (`code`);

-- 
-- Constraints for table `leave_of_absence`
-- 
ALTER TABLE `leave_of_absence`
  ADD CONSTRAINT leave_of_absence_ibfk_1 FOREIGN KEY (member_id) REFERENCES member (id),
  ADD CONSTRAINT leave_of_absence_ibfk_2 FOREIGN KEY (kind_of_leave_code) REFERENCES kind_of_leave_code_description_map (`code`);

-- 
-- Constraints for table `member`
-- 
ALTER TABLE `member`
  ADD CONSTRAINT member_ibfk_1 FOREIGN KEY (agency_id) REFERENCES agency (id);

-- 
-- Constraints for table `member_user`
-- 
ALTER TABLE `member_user`
  ADD CONSTRAINT member_user_ibfk_1 FOREIGN KEY (id) REFERENCES member (id);

-- 
-- Constraints for table `officership`
-- 
ALTER TABLE `officership`
  ADD CONSTRAINT officership_ibfk_4 FOREIGN KEY (member_id) REFERENCES member (id),
  ADD CONSTRAINT officership_ibfk_5 FOREIGN KEY (rank_code) REFERENCES rank (`code`);

ALTER TABLE squad_commander_user
  ADD CONSTRAINT squad_commander_user_ibfk_1 FOREIGN KEY (id) REFERENCES agency (id);


SET FOREIGN_KEY_CHECKS=1;

COMMIT;