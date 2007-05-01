SET FOREIGN_KEY_CHECKS=0;

SET AUTOCOMMIT=0;
START TRANSACTION;


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
(8,'section-change');

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
(8,7);

ALTER TABLE role ADD COLUMN tier_id TINYINT UNSIGNED;
update role set tier_id = 1 where name like 'Application%' or name like 'Department%';
update role set tier_id = 2 where name like 'Squad%';
update role set tier_id = 3 where name like '%Section%';

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

ALTER TABLE role ADD CONSTRAINT tier_id FOREIGN KEY tier_id (tier_id)
    REFERENCES tier (id);


SET FOREIGN_KEY_CHECKS=1;

COMMIT;