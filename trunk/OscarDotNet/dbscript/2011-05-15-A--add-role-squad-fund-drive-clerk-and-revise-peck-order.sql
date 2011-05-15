START TRANSACTION
;
update ignore role set pecking_order = 22000 where name = "Squad Fleet Coordinator"
;
insert ignore role set name = "Squad Fund Drive Clerk", tier_id = 2, soft_hyphenation_text = "Squad Fund Drive Clerk", pecking_order = 23000
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "perform-fund-drive-ops"),(select id from role where name = "Squad Fund Drive Clerk"))
;
insert ignore role_member_map (role_id,member_id) values
((select id from role where name = "Squad Fund Drive Clerk"),(select id from member where last_name = "BAKER" and first_name = "JULIA")),
((select id from role where name = "Squad Fund Drive Clerk"),(select id from member where last_name = "BALL" and first_name = "DIANA")),
((select id from role where name = "Squad Fund Drive Clerk"),(select id from member where last_name = "GRAY" and first_name = "JINNY")),
((select id from role where name = "Squad Fund Drive Clerk"),(select id from member where last_name = "HEIM" and first_name = "REBECCA")),
((select id from role where name = "Squad Fund Drive Clerk"),(select id from member where last_name = "KIERNAN" and first_name = "THOMAS")),
((select id from role where name = "Squad Fund Drive Clerk"),(select id from member where last_name = "PAULSEN" and first_name = "JUDITH")),
((select id from role where name = "Squad Fund Drive Clerk"),(select id from member where last_name = "STEWART" and first_name = "DENNIS"))
;
COMMIT