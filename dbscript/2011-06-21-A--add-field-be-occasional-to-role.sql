START TRANSACTION
;
ALTER TABLE `role` ADD COLUMN `be_occasional` TINYINT(1)  NOT NULL DEFAULT FALSE
, ADD INDEX `be_occasional` (`be_occasional` ASC)
;
insert ignore role set name = "Department Street Supervisor (occasional)"
, tier_id = 1
, soft_hyphenation_text = ""
, pecking_order = 10880
, be_occasional = TRUE
;
insert ignore role_privilege_map (role_id,privilege_id) values
((select id from role where name = "Department Street Supervisor (occasional)"),(select id from privilege where name = "see-all-squads")),
((select id from role where name = "Department Street Supervisor (occasional)"),(select id from privilege where name = "see-other-member-schedule-detail")),
((select id from role where name = "Department Street Supervisor (occasional)"),(select id from privilege where name = "see-proposal"))
;
COMMIT