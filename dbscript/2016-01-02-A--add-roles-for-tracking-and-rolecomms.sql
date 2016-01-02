START TRANSACTION
;
insert ignore role (name,tier_id,soft_hyphenation_text,pecking_order) values
('Department Division Chief',1,'',10260),
('Department Brigade Chief',1,'',10290),
('Rescue Council President',1,'',10853),
('Rescue Council Vice President',1,'',10855),
('Rescue Council Secretary',1,'',10857),
('Squad Oxygen Coordinator',2,'',23250)
;
insert ignore role_privilege_map (role_id,privilege_id)
select (select id from role where name = 'Department Division Chief') as role_id
, privilege_id
from role_privilege_map
where role_id = (select id from role where name = 'Department Authority')
;
insert ignore role_privilege_map (role_id,privilege_id)
select (select id from role where name = 'Department Brigade Chief') as role_id
, privilege_id
from role_privilege_map
where role_id = (select id from role where name = 'Department Analyst')
;
insert ignore role_privilege_map (role_id,privilege_id)
select (select id from role where name = 'Rescue Council President') as role_id
, privilege_id
from role_privilege_map
where role_id = (select id from role where name = 'Department Analyst')
;
insert ignore role_privilege_map (role_id,privilege_id)
select (select id from role where name = 'Rescue Council Vice President') as role_id
, privilege_id
from role_privilege_map
where role_id = (select id from role where name = 'Department Analyst')
;
insert ignore role_privilege_map (role_id,privilege_id)
select (select id from role where name = 'Rescue Council Secretary') as role_id
, privilege_id
from role_privilege_map
where role_id = (select id from role where name = 'Department Analyst')
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'send-quickmessages'),(select id from role where name = 'Squad Oxygen Coordinator'))
;
COMMIT
