SET AUTOCOMMIT=0;
SET FOREIGN_KEY_CHECKS=0;


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

insert role_member_map (member_id,role_id)
  select member.id as member_id,role_id
    from member join role_user_map on (role_user_map.user_id=member.user_id);

insert ignore role_member_map (member_id,role_id)
  select id as member_id, (select id from role where name = "Member") as role_id
    from member
    order by member_id;

DROP TABLE IF EXISTS role_user_map;

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

insert user_member_map (user_id,member_id)
  select user_id,member.id as member_id
    from member
    where not isnull(user_id);

ALTER TABLE member DROP INDEX user_id;
alter table member drop column user_id;

ALTER TABLE role_member_map
  ADD CONSTRAINT FOREIGN KEY (member_id) REFERENCES member (id),
  ADD CONSTRAINT FOREIGN KEY (role_id) REFERENCES role (id);

ALTER TABLE user_member_map
  ADD CONSTRAINT FOREIGN KEY (user_id) REFERENCES user (id),
  ADD CONSTRAINT FOREIGN KEY (member_id) REFERENCES member (id);


SET FOREIGN_KEY_CHECKS=1;
COMMIT;
SET AUTOCOMMIT=1;
