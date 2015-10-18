START TRANSACTION
;
INSERT INTO `role` (`name`, `tier_id`, `soft_hyphenation_text`, `pecking_order`) VALUES ('Squad Fund Drive Coordinator', '2', '', '25000');
;
INSERT INTO privilege set name = 'see-other-fund-drive-clerk-activity'
;
insert into role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'see-other-fund-drive-clerk-activity'),(select id from role where name = 'Application Administrator')),
((select id from privilege where name = 'see-other-fund-drive-clerk-activity'),(select id from role where name = 'Squad Analyst')),
((select id from privilege where name = 'see-other-fund-drive-clerk-activity'),(select id from role where name = 'Squad Treasurer')),
((select id from privilege where name = 'see-other-fund-drive-clerk-activity'),(select id from role where name = 'Squad Fund Drive Coordinator'))
;
insert into role_member_map (role_id,member_id) values
((select id from role where name = 'Squad Analyst'),(select id from member where last_name = 'LIPSCOMB' and first_name = 'KEVIN')),
((select id from role where name = 'Squad Analyst'),(select id from member where last_name = 'KERR' and first_name = 'GERALD')),
((select id from role where name = 'Squad Fund Drive Coordinator'),(select id from member where last_name = 'LIPSCOMB' and first_name = 'KEVIN')),
((select id from role where name = 'Squad Fund Drive Coordinator'),(select id from member where last_name = 'STEWART' and first_name = 'DENNIS')),
((select id from role where name = 'Squad Fund Drive Coordinator'),(select id from member where last_name = 'BUHRMANN' and first_name = 'DIANA')),
((select id from role where name = 'Squad Fund Drive Coordinator'),(select id from member where last_name = 'KERR' and first_name = 'GERALD'))
;
COMMIT
