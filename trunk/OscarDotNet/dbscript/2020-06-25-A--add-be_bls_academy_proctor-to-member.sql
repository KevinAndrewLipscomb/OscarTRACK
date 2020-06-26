START TRANSACTION
;
ALTER TABLE `member` 
  ADD COLUMN `be_bls_academy_proctor` TINYINT NOT NULL DEFAULT '0'
;
insert ignore role (name,tier_id,pecking_order) values
('Department Chief Training Officer',1,10275),
('Department BLS Academy Proctor Coordinator',1,11000)
;
insert ignore privilege
set name = 'change-bls-academy-proctor-qual'
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'change-bls-academy-proctor-qual'),(select id from role where name = 'Department Authority')),
((select id from privilege where name = 'change-bls-academy-proctor-qual'),(select id from role where name = 'Department Deputy Chief')),
((select id from privilege where name = 'change-bls-academy-proctor-qual'),(select id from role where name = 'Department Division Chief')),
((select id from privilege where name = 'change-bls-academy-proctor-qual'),(select id from role where name = 'Department Chief Training Officer')),
((select id from privilege where name = 'change-bls-academy-proctor-qual'),(select id from role where name = 'Department BLS Academy Proctor Coordinator'))
;
insert ignore notification
set name = 'bls-academy-proctor-qualification-change'
, activity_description = 'BLS academy proctor qualification changes'
, activity_pecking_order = 173
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = 'bls-academy-proctor-qualification-change'),(select id from role where name = 'Department Chief Training Officer')),
((select id from notification where name = 'bls-academy-proctor-qualification-change'),(select id from role where name = 'Department BLS Academy Proctor Coordinator'))
;
insert ignore role_member_map (role_id,member_id) values
((select id from role where name = 'Department Chief Training Officer'),(select id from member where cad_num = '800804')),
((select id from role where name = 'Department BLS Academy Proctor Coordinator'),(select id from member where cad_num = '800169'))
;
COMMIT