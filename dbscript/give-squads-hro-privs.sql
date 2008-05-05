START TRANSACTION;

insert role_privilege_map (role_id,privilege_id) values
((select id from role where name = "Squad Commander"),(select id from privilege where name = "add-members")),
((select id from role where name = "Squad Commander"),(select id from privilege where name = "change-agency")),
((select id from role where name = "Squad Commander"),(select id from privilege where name = "change-cad-num")),
((select id from role where name = "Squad Commander"),(select id from privilege where name = "change-med-release-level")),
((select id from role where name = "Squad Commander"),(select id from privilege where name = "change-member-name")),
((select id from role where name = "Squad Commander"),(select id from privilege where name = "release-trainees")),
((select id from role where name = "Squad Membership Coordinator"),(select id from privilege where name = "add-members")),
((select id from role where name = "Squad Membership Coordinator"),(select id from privilege where name = "change-agency")),
((select id from role where name = "Squad Membership Coordinator"),(select id from privilege where name = "change-cad-num")),
((select id from role where name = "Squad Membership Coordinator"),(select id from privilege where name = "change-med-release-level")),
((select id from role where name = "Squad Membership Coordinator"),(select id from privilege where name = "change-member-name")),
((select id from role where name = "Squad Membership Coordinator"),(select id from privilege where name = "release-trainees"));

update enrollment_transition set authorized_tier_id = 2 where authorized_tier_id = 1;

COMMIT