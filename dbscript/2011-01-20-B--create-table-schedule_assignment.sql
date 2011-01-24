START TRANSACTION
;
DROP TABLE IF EXISTS schedule_assignment;
CREATE TABLE IF NOT EXISTS schedule_assignment (
  id SERIAL,
  nominal_day DATE NOT NULL,
  shift_id BIGINT UNSIGNED NOT NULL,
  post_id BIGINT UNSIGNED NOT NULL,
  post_cardinality TINYINT UNSIGNED DEFAULT 1 NOT NULL,
  position_id BIGINT UNSIGNED,
  member_id INTEGER UNSIGNED,
  be_selected BOOLEAN DEFAULT TRUE NOT NULL,
  comment VARCHAR(511),
  be_new BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY(id),
  UNIQUE `practical` (`nominal_day` ASC, `shift_id` ASC, `member_id` ASC),
  INDEX `be_new` (`be_new` ASC)
)
ENGINE = InnoDB
;
insert ignore privilege (name) values ("edit-schedule"),("config-shifts");
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "edit-schedule"),(select id from role where name = "Application Administrator")),
((select id from privilege where name = "edit-schedule"),(select id from role where name = "Department Authority")),
((select id from privilege where name = "edit-schedule"),(select id from role where name = "Department Scheduler")),
((select id from privilege where name = "edit-schedule"),(select id from role where name = "Squad Commander")),
((select id from privilege where name = "edit-schedule"),(select id from role where name = "Squad Manager")),
((select id from privilege where name = "edit-schedule"),(select id from role where name = "Squad Assistant Manager")),
((select id from privilege where name = "edit-schedule"),(select id from role where name = "Squad Scheduler")),
((select id from privilege where name = "config-shifts"),(select id from role where name = "Application Administrator")),
((select id from privilege where name = "config-shifts"),(select id from role where name = "Department Authority"))
;
COMMIT
