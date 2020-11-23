START TRANSACTION
;
insert ignore role (name,tier_id,pecking_order) values
('Squad Inventory Administrator',2,22250)
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = 'agency-change'),(select id from role where name = 'Squad Inventory Administrator')),
((select id from notification where name = 'medical-release-level-change'),(select id from role where name = 'Squad Inventory Administrator')),
((select id from notification where name = 'member-added'),(select id from role where name = 'Squad Inventory Administrator')),
((select id from notification where name = 'member-email-address-change'),(select id from role where name = 'Squad Inventory Administrator')),
((select id from notification where name = 'new-enrollment-level'),(select id from role where name = 'Squad Inventory Administrator')),
((select id from notification where name = 'phone-num-change'),(select id from role where name = 'Squad Inventory Administrator'))
;
insert ignore role_member_map (role_id,member_id) values
((select id from role where name = 'Squad Inventory Administrator'),(select id from member where cad_num = '802908'))
;
COMMIT