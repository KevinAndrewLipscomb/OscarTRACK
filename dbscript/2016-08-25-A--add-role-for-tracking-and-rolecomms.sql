START TRANSACTION
;
insert ignore role (name,tier_id,pecking_order) values
('Department Assistant Chief',1,10240)
;
insert ignore role_privilege_map (role_id,privilege_id)
select (select id from role where name = 'Department Assistant Chief') as role_id
, privilege_id
from role_privilege_map
where role_id = (select id from role where name = 'Department Division Chief')
;
insert ignore role_member_map (role_id,member_id) values
((select id from role where name = 'Department Assistant Chief'),(select id from member where last_name = 'KIRK' and first_name = 'TREVOR')),
((select id from role where name = 'Department Assistant Chief'),(select id from member where last_name = 'LEACH' and first_name = 'JAMES')),
((select id from role where name = 'Department Assistant Chief'),(select id from member where last_name = 'WALKER' and first_name = 'WILLIAM')),
((select id from role where name = 'Department Assistant Chief'),(select id from member where last_name = 'LONG' and first_name = 'STEVEN'))
;
delete from role_member_map
where role_id = (select id from role where name = 'Department Brigade Chief')
  and member_id = (select id from member where last_name = 'KIRK' and first_name = 'TREVOR')
;
delete from role_member_map
where role_id = (select id from role where name = 'Department Brigade Chief')
  and member_id = (select id from member where last_name = 'LEACH' and first_name = 'JAMES')
;
delete from role_member_map
where role_id = (select id from role where name = 'Department Brigade Chief')
  and member_id = (select id from member where last_name = 'WALKER' and first_name = 'WILLIAM')
;
COMMIT
