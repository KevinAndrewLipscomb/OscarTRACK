-- $Id$
--
-- phpMyAdmin SQL Dump
-- version 2.6.4-pl4
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jan 16, 2007 at 12:22 PM
-- Server version: 5.0.20
-- PHP Version: 4.4.2

SET FOREIGN_KEY_CHECKS=0;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- 
-- Database: `oscardotnet_x`
-- 

-- 
-- Dumping data for table `agency`
-- 

INSERT INTO `agency` (`id`, `short_designator`, `medium_designator`, `long_designator`, `be_active`) VALUES (0, 'EMS', 'VBDEMS', 'Va Beach Dept of EMS', 1),
(1, 'R01', 'Rescue 1', 'Ocean Park ', 1),
(2, 'R02', 'Rescue 2', 'Davis Corner', 1),
(3, 'R03', 'Rescue 3', '-- placeholder 3 --', 0),
(4, 'R04', 'Rescue 4', 'Chesapeake Beach', 1),
(5, 'R05', 'Rescue 5', 'Courthouse', 1),
(6, 'R06', 'Rescue 6', 'Creeds', 1),
(7, 'R07', 'Rescue 7', '-- placeholder 7 --', 0),
(8, 'R08', 'Rescue 8', '-- placeholder 8 --', 0),
(9, 'R09', 'Rescue 9', 'Kempsville', 1),
(10, 'R10', 'Rescue 10', '-- placeholder 10 --', 0),
(11, 'R11', 'Rescue 11', '-- placeholder 11 --', 0),
(12, 'R12', 'Rescue 12', '-- placeholder 12 --', 0),
(13, 'R13', 'Rescue 13', 'Blackwater', 1),
(14, 'R14', 'Rescue 14', 'Virginia Beach', 1),
(15, 'R15', 'Rescue 15', 'Knotts Island', 0),
(16, 'R16', 'Rescue 16', 'Plaza', 1),
(17, 'R17', 'Rescue 17', 'Sandbridge', 1),
(18, 'R18', 'Rescue 18', '-- placeholder 18 --', 0),
(19, 'R19', 'Rescue 19', '-- placeholder 19 --', 0),
(201, 'S09', 'Support 9', 'Support 9', 0),
(202, 'SST', 'Support Services', 'Support Services Team', 0),
(203, 'MRT', 'Marine Rescue Team', 'Marine Rescue Team', 0);

-- 
-- Dumping data for table `enrollment_history`
-- 

INSERT INTO `enrollment_history` (`id`, `member_id`, `obligation_code`, `start_date`, `end_disposition_code`) VALUES (7, 6, 3, '2003-07-13', NULL),
(9, 7, 3, '2004-09-26', NULL),
(11, 8, 3, '1979-05-01', 2),
(12, 8, 4, '1989-05-01', NULL),
(14, 9, 3, '1999-01-01', NULL),
(15, 11, 5, '2006-12-01', NULL),
(20, 2, 2, '2006-02-20', NULL),
(21, 3, 2, '2004-01-20', NULL),
(22, 4, 2, '2006-01-23', NULL),
(23, 5, 2, '2002-10-14', NULL),
(24, 6, 2, '1993-08-13', NULL),
(25, 7, 2, '1994-09-26', 2),
(26, 8, 2, '1969-05-01', 2),
(27, 9, 2, '1989-01-01', NULL),
(28, 10, 10, '2006-04-17', NULL),
(30, 12, 2, '2004-04-25', 3),
(31, 13, 2, '2001-07-30', NULL),
(32, 14, 2, '2005-04-04', NULL),
(33, 16, 2, '1997-08-11', NULL),
(34, 17, 2, '1999-04-16', NULL),
(35, 18, 1, '2000-08-07', NULL),
(36, 19, 2, '1996-02-12', NULL),
(37, 20, 1, '2003-07-27', NULL),
(38, 21, 2, '1998-12-07', 2),
(39, 22, 2, '1997-04-07', NULL),
(40, 24, 2, '1996-09-09', 2),
(41, 25, 2, '2004-01-11', NULL),
(42, 27, 2, '1998-05-04', NULL),
(43, 28, 2, '1987-06-23', 2),
(44, 29, 2, '1988-06-10', NULL),
(45, 30, 2, '2003-03-07', NULL),
(46, 31, 2, '2006-05-02', NULL),
(47, 32, 1, '2003-04-18', NULL),
(48, 33, 2, '1995-01-09', NULL),
(49, 34, 2, '1990-09-10', 2),
(50, 35, 2, '2004-06-05', NULL),
(51, 37, 2, '1990-03-05', 2),
(52, 38, 2, '2003-09-08', NULL),
(53, 39, 2, '2003-09-08', NULL),
(54, 40, 2, '2006-03-06', NULL),
(55, 41, 2, '2003-11-11', NULL),
(56, 42, 2, '2005-05-22', NULL),
(57, 43, 2, '2006-04-24', NULL),
(58, 44, 2, '2006-02-27', NULL),
(59, 45, 2, '2002-09-08', NULL),
(60, 46, 2, '2003-09-08', NULL),
(61, 47, 2, '2004-08-09', NULL),
(62, 48, 2, '2003-12-13', NULL),
(63, 49, 2, '2003-10-25', NULL),
(64, 50, 2, '2004-07-19', NULL),
(65, 51, 10, '2006-02-05', NULL),
(66, 52, 1, '1996-12-31', NULL),
(67, 53, 2, '2004-03-28', NULL),
(68, 54, 2, '2002-07-08', NULL),
(69, 55, 2, '2005-07-03', NULL),
(70, 56, 2, '2002-05-24', NULL),
(71, 57, 2, '2004-10-23', NULL),
(72, 58, 2, '2004-02-16', NULL),
(73, 59, 2, '2006-03-12', NULL),
(74, 61, 10, '2006-05-07', NULL),
(75, 62, 2, '2002-08-19', NULL),
(76, 63, 10, '2004-02-08', NULL),
(77, 65, 1, '2002-02-02', NULL),
(78, 68, 1, '2000-09-19', NULL),
(79, 69, 2, '1970-08-01', NULL),
(80, 70, 2, '2004-07-19', NULL),
(81, 71, 2, '2000-05-04', NULL),
(82, 72, 2, '2005-06-07', NULL),
(83, 73, 1, '1995-06-05', NULL),
(84, 74, 2, '2003-12-07', NULL),
(85, 75, 10, '2006-07-09', NULL),
(86, 76, 2, '2005-07-18', NULL),
(87, 78, 2, '2005-12-13', NULL),
(88, 79, 2, '1990-12-03', NULL),
(89, 80, 1, '1999-06-07', NULL),
(90, 81, 10, '2005-01-17', NULL),
(91, 82, 2, '2004-10-28', 3),
(92, 84, 1, '2005-11-01', NULL),
(93, 85, 2, '2002-07-08', NULL),
(94, 87, 2, '2004-07-12', NULL),
(95, 89, 2, '2001-09-25', NULL),
(96, 90, 10, '2006-12-04', NULL),
(97, 91, 1, '1996-02-12', NULL),
(98, 92, 2, '2004-08-07', NULL),
(99, 93, 10, '2006-01-18', NULL),
(100, 94, 2, '2003-09-08', NULL),
(101, 95, 10, '2005-05-10', NULL),
(102, 97, 2, '1999-12-06', NULL),
(103, 98, 2, '2003-12-01', NULL),
(104, 99, 2, '2003-12-13', 3),
(105, 100, 2, '2004-02-14', NULL),
(106, 101, 1, '2006-02-20', NULL),
(107, 102, 2, '2005-06-20', NULL),
(108, 24, 3, '2006-09-09', NULL),
(109, 34, 3, '2000-09-10', 5),
(110, 37, 3, '2000-03-05', 3),
(111, 82, 6, '2006-12-01', NULL),
(112, 34, 1, '2006-03-31', NULL),
(113, 37, 1, '2006-11-01', NULL),
(114, 12, 6, '2006-12-01', NULL),
(115, 99, 8, '2006-11-01', NULL),
(116, 28, 3, '1997-06-23', 2),
(117, 28, 4, '2007-02-01', NULL),
(118, 21, 3, '2007-01-08', NULL),
(119, 103, 10, '2007-01-01', NULL),
(120, 104, 10, '2007-01-01', NULL),
(121, 105, 10, '2007-01-01', NULL),
(122, 106, 10, '2007-01-01', NULL),
(123, 107, 10, '2007-01-01', NULL),
(124, 108, 10, '2007-01-01', NULL),
(125, 109, 10, '2007-01-01', NULL),
(126, 110, 10, '2007-01-13', NULL);

-- 
-- Dumping data for table `leave_of_absence`
-- 

INSERT INTO `leave_of_absence` (`id`, `member_id`, `kind_of_leave_code`, `start_date`, `end_date`, `num_obliged_shifts`, `note`) VALUES (1, 2, 1, '2006-12-01', '2007-02-28', 0, 'studying to pass VA bar exam'),
(2, 3, 1, '2006-12-01', '2006-12-31', 0, NULL),
(3, 5, 1, '2006-12-01', '2006-12-31', 0, NULL),
(4, 6, 1, '2006-12-01', '2007-01-31', 0, NULL),
(5, 7, 1, '2007-01-01', '2007-03-31', 0, NULL),
(6, 8, 1, '2006-12-01', '2007-01-31', 0, NULL),
(7, 10, 1, '2006-12-01', '2007-03-31', 0, NULL),
(8, 12, 1, '2007-01-01', '2007-01-31', 0, NULL),
(9, 13, 1, '2007-01-01', '2007-01-31', 0, NULL),
(10, 14, 1, '2007-01-01', '2007-08-31', 0, 'VB police cadet'),
(11, 17, 1, '2006-12-01', '2007-01-31', 0, NULL),
(12, 21, 1, '2006-12-01', '2007-01-31', 0, NULL),
(13, 58, 1, '2007-01-01', NULL, 0, NULL),
(14, 38, 1, '2007-01-01', NULL, 0, NULL),
(15, 53, 1, '2007-01-01', NULL, 0, NULL),
(16, 54, 1, '2006-12-01', NULL, 0, NULL),
(17, 55, 1, '2007-01-01', NULL, 0, NULL),
(19, 22, 1, '2006-11-01', NULL, 0, NULL),
(20, 29, 1, '2006-12-01', NULL, 0, NULL),
(21, 41, 1, '2006-12-01', '2006-12-31', 0, NULL),
(22, 45, 1, '2006-11-01', '2006-12-31', 0, NULL),
(23, 69, 1, '2006-12-01', '2006-12-31', 1, NULL),
(24, 70, 1, '2006-12-01', NULL, 0, NULL),
(25, 87, 1, '2006-12-01', '2006-12-31', 0, NULL),
(26, 92, 1, '2006-12-01', '2006-12-31', 0, NULL),
(27, 97, 1, '2006-12-01', NULL, 0, NULL),
(28, 100, 1, '2007-02-01', NULL, 0, 'VB fire academy; may give early month avails'),
(29, 21, 1, '2007-02-01', '2007-02-28', 3, NULL),
(30, 17, 1, '2007-02-01', '2007-05-31', 1, NULL),
(31, 81, 1, '2006-11-01', '2006-12-31', 0, 'military'),
(32, 72, 1, '2006-11-01', '2007-04-30', 2, 'plus 24 pickup hrs after sched is published'),
(33, 74, 1, '2007-02-01', '2007-02-28', 0, NULL),
(34, 49, 6, '2007-01-12', NULL, 0, 'pending disposition of criminal charge');

-- 
-- Dumping data for table `member`
-- 

INSERT INTO `member` (`id`, `cad_num`, `last_name`, `first_name`, `medical_release_code`, `agency_id`, `be_driver_qualified`) VALUES (2, '801958', 'Viel', 'Joseph', 3, 9, 0),
(3, '801672', 'Cairns', 'Eddy', 3, 9, 1),
(4, '801978', 'Rankin', 'Cori', 3, 9, 1),
(5, '801453', 'Parks', 'Christopher', 3, 9, 1),
(6, '800546', 'James', 'Jan', 3, 9, 1),
(7, '800324', 'Barclift', 'Normalee', 6, 9, 1),
(8, '800164', 'Black', 'William', 8, 9, 1),
(9, '800251', 'Lipscomb', 'Kevin', 6, 9, 1),
(10, NULL, 'Liveston', 'Jessika', 1, 9, 0),
(11, NULL, 'Nelson', 'Helen', 1, 9, 0),
(12, '801742', 'Rush', 'Patrick', 1, 9, 0),
(13, '801245', 'Sourbeer', 'Jerry', 6, 9, 1),
(14, '801841', 'Kerlin', 'Holly', 3, 9, 1),
(16, '800580', 'Achesinski', 'April', 6, 9, 1),
(17, '800755', 'Baker', 'David', 7, 9, 1),
(18, '800963', 'Baker', 'Julia', 1, 9, 0),
(19, '800605', 'Baker', 'Richard', 4, 9, 1),
(20, NULL, 'Baker', 'Tonya', 1, 9, 0),
(21, '800603', 'Baker', 'Venita', 7, 9, 1),
(22, '800613', 'Ball', 'Diana', 3, 9, 1),
(24, '800705', 'Benadum', 'Thomas', 4, 9, 1),
(25, '801695', 'Beson', 'Christopher', 7, 9, 1),
(27, '800696', 'Blais', 'David', 6, 9, 1),
(28, '800195', 'Blow', 'Russell', 6, 9, 1),
(29, '800165', 'Born', 'Christopher', 6, 9, 1),
(30, '801492', 'Branchesi', 'Karen', 3, 9, 1),
(31, '801983', 'Brewer', 'James', 3, 9, 1),
(32, NULL, 'Brewer', 'Shirley', 1, 9, 0),
(33, '800115', 'Budy', 'Kathleen', 1, 9, 1),
(34, '800207', 'Burke', 'Scott', 1, 9, 1),
(35, '801775', 'Busch', 'Anthony', 3, 9, 1),
(37, '800662', 'Carew', 'Brendan', 1, 9, 1),
(38, '801642', 'Carroll', 'Richard', 3, 9, 1),
(39, '801628', 'Daugherty', 'Daniel', 8, 9, 1),
(40, '801928', 'Davis', 'Brian', 1, 9, 0),
(41, '801697', 'Davis', 'Kareem', 3, 9, 1),
(42, '801861', 'Degrave', 'Matthew', 3, 9, 1),
(43, '801984', 'DeLugo', 'Benjamin', 3, 9, 1),
(44, '801985', 'DiCaprio', 'Nicholas', 3, 9, 1),
(45, '801450', 'Dunhoff', 'Kathleen', 7, 9, 1),
(46, '801590', 'Elliott', 'Michael', 7, 9, 1),
(47, '801802', 'Fair', 'Daniel', 3, 9, 1),
(48, '801663', 'Fedak', 'Elizabeth', 3, 9, 1),
(49, '801646', 'Fleek', 'Jessica', 3, 9, 1),
(50, '801804', 'Frye', 'Marla', 3, 9, 1),
(51, '801998', 'Gavin', 'Shannon', 1, 9, 0),
(52, '800474', 'Gray', 'Jinny', 1, 9, 0),
(53, '801692', 'Gregory', 'Shaun', 3, 9, 1),
(54, '801411', 'Griffith', 'Lee', 3, 9, 1),
(55, '801930', 'Grimm', 'Vincent', 3, 9, 1),
(56, '801376', 'Heim', 'Rebecca', 6, 9, 1),
(57, '801791', 'Hoffower', 'Brian', 6, 9, 1),
(58, '801683', 'Benadum', 'Kristine', 3, 9, 1),
(59, '801977', 'Jacobs', 'Diane', 1, 9, 0),
(61, NULL, 'James', 'Stephen', 1, 9, 0),
(62, '801406', 'Johnson', 'James', 3, 9, 1),
(63, '801780', 'Johnson', 'Travis', 1, 9, 0),
(65, '802018', 'Kiernan', 'Thomas', 1, 9, 0),
(68, '801057', 'Losick', 'Arlene', 1, 9, 0),
(69, '800315', 'Losick', 'Melvin', 6, 9, 1),
(70, '801808', 'Maudlin', 'Jeanne', 3, 9, 1),
(71, '800965', 'Medero', 'Deborah', 7, 9, 1),
(72, '801859', 'Mitchell', 'Amber-Leigh', 3, 9, 1),
(73, '800962', 'Moore', 'Jennifer', 1, 9, 0),
(74, '801639', 'Nuckols', 'Robert', 3, 9, 1),
(75, '802002', 'OHagan', 'Brittany', 1, 9, 0),
(76, '801939', 'Oswald', 'Michael', 3, 9, 1),
(78, '801955', 'Pascarosa', 'Joseph', 3, 9, 1),
(79, '800921', 'Paulsen', 'Judith', 3, 9, 1),
(80, '800863', 'Paulsen', 'Robert', 1, 9, 1),
(81, '801844', 'Prager', 'Erik', 1, 9, 0),
(82, '801788', 'Quinn', 'Jonathan', 3, 9, 0),
(84, '801992', 'Reid', 'Martin', 1, 9, 0),
(85, '801378', 'Rice', 'Amanda', 3, 9, 1),
(87, '801784', 'Saucier', 'Guy', 3, 9, 1),
(89, '801230', 'Spencer', 'Scott', 3, 9, 1),
(90, '802026', 'Stacey', 'Stephen', 1, 9, 0),
(91, '800998', 'Stewart', 'Dennis', 1, 9, 0),
(92, '801811', 'Strickland', 'Ashley-Rae', 1, 9, 1),
(93, '801982', 'Tasz', 'Alicia', 1, 9, 0),
(94, '801658', 'Thompson', 'Amanda', 3, 9, 1),
(95, '801858', 'Turner', 'Jeffrey', 1, 9, 1),
(97, '800819', 'Walia', 'Ramanjit', 7, 9, 1),
(98, '801640', 'Wallace', 'Patrick', 3, 9, 1),
(99, '801662', 'Walsh', 'Lisa', 3, 9, 1),
(100, '801790', 'Ward', 'John', 6, 9, 1),
(101, NULL, 'Weakley', 'Robert', 1, 9, 0),
(102, '801946', 'Weakley', 'Tina', 3, 9, 1),
(103, NULL, 'Arroyo', 'Carla', 1, 9, 0),
(104, NULL, 'Brown', 'Nancy', 1, 9, 0),
(105, NULL, 'Kehoe', 'Chris', 1, 9, 0),
(106, NULL, 'Mayes', 'Richard', 1, 9, 0),
(107, NULL, 'Page', 'Arlene', 1, 9, 0),
(108, NULL, 'Taylor', 'Judith', 1, 9, 0),
(109, NULL, 'Zaccaria', 'Chris', 1, 9, 0),
(110, NULL, 'Orem', 'Arliss', 1, 9, 0);

-- 
-- Dumping data for table `member_user`
-- 

INSERT INTO `member_user` (`id`, `encoded_password`, `be_stale_password`, `password_reset_email_address`, `be_active`) VALUES (2, NULL, 1, 'josephviel@netscape.com', 1),
(3, NULL, 1, 'fireball9112000@yahoo.com', 0),
(4, NULL, 1, 'mrsrankin0510@hotmail.com', 0),
(5, NULL, 1, 'cparks32001@yahoo.com', 0),
(6, NULL, 1, 'L8Jan@cox.net', 0),
(7, NULL, 1, 'nbarclift@cox.net', 0),
(8, NULL, 1, 'wjblack@sentara.com', 0),
(9, NULL, 1, 'KEVIN.LIPSCOMB@KVRS.ORG', 0),
(10, NULL, 1, '', 0),
(11, NULL, 1, '', 0),
(12, NULL, 1, 'prush001@odu.edu', 0),
(13, NULL, 1, 'jwsourbeer@aol.com', 0),
(14, NULL, 1, 'lilkerlin@yahoo.com', 0),
(16, NULL, 1, 'aachesinski@hotmail.com', 0),
(17, NULL, 1, 'VENITANDAV@AOL.COM', 0),
(18, NULL, 1, 'annbakr@aol.com', 0),
(19, NULL, 1, 'BAKERRT85@AOL.COM', 0),
(20, NULL, 1, 'resq9schedule@aol.com', 0),
(21, NULL, 1, 'VENITANDAV@AOL.COM', 0),
(22, NULL, 1, 'luvlighthouses@cox.net', 0),
(24, NULL, 1, 'firemedic100677@yahoo.com', 0),
(25, NULL, 1, 'cbeson@houriganconstruction.com', 0),
(27, NULL, 1, 'DPBlais1@cox.net', 0),
(28, NULL, 1, 'RBB001@AOL.COM', 0),
(29, NULL, 1, 'firephoto@verizon.net', 0),
(30, NULL, 1, 'branchesi123@msn.com', 0),
(31, NULL, 1, 'jbrewer@magic-sweep.com', 0),
(32, NULL, 1, 'ShirleyBrew7@aol.com', 0),
(33, NULL, 1, 'crash1997@sprynet.com', 0),
(34, NULL, 1, 'scott.burke@cox.net', 0),
(35, NULL, 1, 'buschlight_96@hotmail.com', 0),
(37, NULL, 1, 'bcarew@infionline.net', 0),
(38, NULL, 1, 'rc8544@cox.net', 0),
(39, NULL, 1, 'rescue@ddaniscool.com', 0),
(40, NULL, 1, 'bdavis2906@cox.net', 0),
(41, NULL, 1, 'kdavs@hotmail.com', 0),
(42, NULL, 1, 'mdegrave1022@yahoo.com', 0),
(43, NULL, 1, 'bdelugo85@yahoo.com', 0),
(44, NULL, 1, 'vashortstop@hotmail.com', 0),
(45, NULL, 1, 'kathydunhoff@yahoo.com', 0),
(46, NULL, 1, '', 0),
(47, NULL, 1, 'hotstik97@cox.net', 0),
(48, NULL, 1, 'esfedak78743@hotmail.com', 0),
(49, NULL, 1, 'jfleek1977@yahoo.com', 0),
(50, NULL, 1, 'hanksfrye@cox.net', 0),
(51, NULL, 1, 'shannonchica_2002@yahoo.com', 0),
(52, NULL, 1, 'krg31313@aol.com', 0),
(53, NULL, 1, 'sag1a@yahoo.com', 0),
(54, NULL, 1, 'RescueRash@AOL.com', 0),
(55, NULL, 1, 'gowreaper@cox.net', 0),
(56, NULL, 1, 'blondi_2u@hotmail.com', 0),
(57, NULL, 1, 'brianjames23@hotmail.com', 0),
(58, NULL, 1, 'ki1234567@aol.com', 0),
(59, NULL, 1, 'jacobsfive@aol.com', 0),
(61, NULL, 1, 'gousmc@hotmail.com', 0),
(62, NULL, 1, 'vbrs31@hotmail.com', 0),
(63, NULL, 1, 'travis.p.johnson@verizon.net', 0),
(65, NULL, 1, 'TKiernan@mllnet.com', 0),
(68, NULL, 1, 'cptldy@cox.net', 0),
(69, NULL, 1, 'vapm23@cox.net', 0),
(70, NULL, 1, 'jmaud001@odu.edu', 0),
(71, NULL, 1, 'dmedero@cox.net', 0),
(72, NULL, 1, 'am21992004@yahoo.com', 0),
(73, NULL, 1, 'gracie2002@sprynet.com', 0),
(74, NULL, 1, 'nuckolsstump@aol.com', 0),
(75, NULL, 1, 'brittany061004@aol.com', 0),
(76, NULL, 1, 'mozwald1@gmail.com', 0),
(78, NULL, 1, 'secondquess23@hotmail.com', 0),
(79, NULL, 1, 'Jmpaulsen@cox.net', 0),
(80, NULL, 1, 'Jmpaulsen@cox.net', 0),
(81, NULL, 1, 'navyfire@firehousezone.com', 0),
(82, NULL, 1, 'strikerjtq@aol.com', 0),
(84, NULL, 1, 'teamyates28@hotmail.com', 0),
(85, NULL, 1, 'Riceal27@yahoo.com', 0),
(87, NULL, 1, 'vbsauce@yahoo.com', 0),
(89, NULL, 1, 'JAVA@SERIES2000.COM', 0),
(90, NULL, 1, 'steve.stacey@gmail.com', 0),
(91, NULL, 1, 'dstewart25@cox.net', 0),
(92, NULL, 1, 'ashlee1184@yahoo.com', 0),
(93, NULL, 1, 'taszer104@aol.com', 0),
(94, NULL, 1, 'adrenalinejunkie319@yahoo.com', 0),
(95, NULL, 1, 'jturner78@cox.net', 0),
(97, NULL, 1, 'rmnjit20@att.net', 0),
(98, NULL, 1, '', 0),
(99, NULL, 1, 'lisavbresqr@yahoo.com', 0),
(100, NULL, 1, 'wardjb@hotmail.com', 0),
(101, NULL, 1, 'hvacbob55@yahoo.com', 0),
(102, NULL, 1, 'tina72860@yahoo.com', 0);

-- 
-- Dumping data for table `officership`
-- 

INSERT INTO `officership` (`id`, `member_id`, `start_date`, `end_date`, `rank_code`) VALUES (1, 6, '2006-11-18', '2007-11-18', 9),
(2, 9, '2006-11-18', '2007-11-18', 4);

-- 
-- Dumping data for table `squad_commander_user`
-- 

INSERT INTO `squad_commander_user` (`id`, `encoded_password`, `be_stale_password`, `password_reset_email_address`, `be_active`) VALUES (1, NULL, 1, 'captain@kvrs.org', 1),
(2, NULL, 1, 'captain@kvrs.org', 1),
(4, NULL, 1, 'captain@kvrs.org', 1),
(5, NULL, 1, 'captain@kvrs.org', 1),
(6, NULL, 1, 'captain@kvrs.org', 1),
(9, NULL, 1, 'captain@kvrs.org', 1),
(13, NULL, 1, 'captain@kvrs.org', 1),
(14, NULL, 1, 'captain@kvrs.org', 1),
(16, NULL, 1, 'captain@kvrs.org', 1),
(17, NULL, 1, 'captain@kvrs.org', 1);

SET FOREIGN_KEY_CHECKS=1;

COMMIT;
