SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT=0;

START TRANSACTION;

delete from squad_commander_user where id <> 9;
ALTER TABLE squad_commander_user
  DROP FOREIGN KEY squad_commander_user_ibfk_1;
ALTER TABLE squad_commander_user RENAME TO user;
ALTER TABLE user
  MODIFY COLUMN `id` INTEGER UNSIGNED NOT NULL DEFAULT NULL AUTO_INCREMENT,
  ADD COLUMN username CHAR(40) AFTER id,
  ADD COLUMN num_unsuccessful_login_attempts int unsigned NOT NULL default 0,
  ADD COLUMN last_login datetime NOT NULL,
  ADD UNIQUE INDEX username (username),
  ADD UNIQUE INDEX password_reset_email_address (password_reset_email_address);

ALTER TABLE member
  ADD COLUMN user_id int unsigned AFTER id,
  ADD COLUMN email_address varchar(255) AFTER first_name,
  ADD UNIQUE KEY user_id (user_id);

update member
  join member_user using (id)
  set email_address = password_reset_email_address;

DROP TABLE IF EXISTS member_user;

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
(18,'change-section');

--
-- Table structure for table `role`
--
DROP TABLE IF EXISTS role;
CREATE TABLE role (
  id int unsigned NOT NULL auto_increment,
  `name` varchar(63) NOT NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO role (id,`name`) VALUES
(1,'Application Administrator'),
(2,'Department Authority'),
(3,'Department Human Resources Officer'),
(4,'Department BLS ID Coordinator'),
(5,'Department Analyst'),
(6,'Squad Commander'),
(7,'Squad Section Sergeant'),
(8,'Squad Training Officer'),
(9,'Squad Membership Coordinator'),
(10,'Squad Analyst'),
(11,'Member'),
(12,'Department ALS ID Coordinator');

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
(6,13),
(6,14),
(6,15),
(6,16),
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
(12,15);

--
-- table structure for table `role_user_map`
--
DROP TABLE IF EXISTS role_user_map;
CREATE TABLE role_user_map (
  user_id int unsigned NOT NULL,
  role_id int unsigned NOT NULL,
  PRIMARY KEY  (user_id,role_id),
  KEY role_id (role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO role_user_map (user_id,role_id) VALUES
(9,1),
(9,5);


ALTER TABLE member
  ADD CONSTRAINT FOREIGN KEY (user_id) REFERENCES user (id);

ALTER TABLE user MODIFY COLUMN username CHAR(40) NOT NULL;


SET FOREIGN_KEY_CHECKS=1;

COMMIT;