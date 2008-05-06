START TRANSACTION;


insert ignore role_privilege_map (role_id,privilege_id) values ((select id from role where name = "Squad Commander"),(select id from privilege where name = "change-driver-qual"));
insert ignore role_privilege_map (role_id,privilege_id) values ((select id from role where name = "Squad Training Officer"),(select id from privilege where name = "change-driver-qual"));
insert ignore role_privilege_map (role_id,privilege_id) values ((select id from role where name = "Squad Manager"),(select id from privilege where name = "change-driver-qual"));
insert ignore role_privilege_map (role_id,privilege_id) values ((select id from role where name = "Squad Manager"),(select id from privilege where name = "add-members"));
insert ignore role_privilege_map (role_id,privilege_id) values ((select id from role where name = "Squad Manager"),(select id from privilege where name = "change-agency"));
insert ignore role_privilege_map (role_id,privilege_id) values ((select id from role where name = "Squad Manager"),(select id from privilege where name = "change-cad-num"));
insert ignore role_privilege_map (role_id,privilege_id) values ((select id from role where name = "Squad Manager"),(select id from privilege where name = "change-med-release-level"));
insert ignore role_privilege_map (role_id,privilege_id) values ((select id from role where name = "Squad Manager"),(select id from privilege where name = "change-member-name"));
insert ignore role_privilege_map (role_id,privilege_id) values ((select id from role where name = "Squad Manager"),(select id from privilege where name = "release-trainees"));
insert ignore role_privilege_map (role_id,privilege_id) values ((select id from role where name = "Squad Training Officer"),(select id from privilege where name = "release-trainees"));
insert ignore role_privilege_map (role_id,privilege_id) values ((select id from role where name = "Squad Training Officer"),(select id from privilege where name = "change-med-release-level"));

COMMIT