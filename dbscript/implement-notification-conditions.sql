START TRANSACTION;

CREATE TABLE data_condition
  (
  `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(31) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX name(`name`)
  )
ENGINE = InnoDB;

insert data_condition (name) values
("none"),
("BeMemberTrainee");

ALTER TABLE role_notification_map
  ADD COLUMN data_condition_id INTEGER UNSIGNED NOT NULL DEFAULT 1,
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (role_id,notification_id,data_condition_id);

insert role_notification_map (role_id,notification_id,data_condition_id) values
((select id from role where name = "Department BLS ID Coordinator"),(select id from notification where name = "leave-deleted"),(select id from data_condition where name = "BeMemberTrainee")),
((select id from role where name = "Department BLS ID Coordinator"),(select id from notification where name = "leave-granted"),(select id from data_condition where name = "BeMemberTrainee")),
((select id from role where name = "Department BLS ID Coordinator"),(select id from notification where name = "leave-modified"),(select id from data_condition where name = "BeMemberTrainee")),
((select id from role where name = "Department BLS ID Coordinator"),(select id from notification where name = "member-name-change"),(select id from data_condition where name = "BeMemberTrainee")),
((select id from role where name = "Department BLS ID Coordinator"),(select id from notification where name = "new-enrollment-level"),(select id from data_condition where name = "BeMemberTrainee")),
((select id from role where name = "Squad Training Officer"),(select id from notification where name = "leave-deleted"),(select id from data_condition where name = "BeMemberTrainee")),
((select id from role where name = "Squad Training Officer"),(select id from notification where name = "leave-granted"),(select id from data_condition where name = "BeMemberTrainee")),
((select id from role where name = "Squad Training Officer"),(select id from notification where name = "leave-modified"),(select id from data_condition where name = "BeMemberTrainee")),
((select id from role where name = "Squad Training Officer"),(select id from notification where name = "member-name-change"),(select id from data_condition where name = "BeMemberTrainee")),
((select id from role where name = "Squad Training Officer"),(select id from notification where name = "new-enrollment-level"),(select id from data_condition where name = "BeMemberTrainee"));

COMMIT