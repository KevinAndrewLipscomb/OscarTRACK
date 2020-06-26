START TRANSACTION
;
update role
set pecking_order = 11100
where name = 'Department BLS Academy Proctor Coordinator'
;
insert ignore role (name,tier_id,pecking_order) values
('Department Instruction Supervisor',1,11000)
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'change-bls-academy-proctor-qual'),(select id from role where name = 'Department Instruction Supervisor'))
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = 'bls-academy-proctor-qualification-change'),(select id from role where name = 'Department Instruction Supervisor'))
;
insert ignore role_member_map (role_id,member_id) values
((select id from role where name = 'Department Instruction Supervisor'),(select id from member where cad_num = '800169')),
((select id from role where name = 'Department Instruction Supervisor'),(select id from member where cad_num = '800414')),
((select id from role where name = 'Department Instruction Supervisor'),(select id from member where cad_num = '800273')),
((select id from role where name = 'Department BLS Academy Proctor Coordinator'),(select id from member where cad_num = '800512'))
;
delete from role_member_map
where role_id = (select id from role where name = 'Department BLS Academy Proctor Coordinator')
  and member_id = (select id from member where cad_num = '800169')
;
COMMIT