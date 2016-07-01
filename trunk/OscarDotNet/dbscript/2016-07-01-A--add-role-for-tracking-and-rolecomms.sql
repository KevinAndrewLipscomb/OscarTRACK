START TRANSACTION
;
insert ignore role (name,tier_id,pecking_order) values
('Department Deputy Chief',1,10225)
;
insert ignore role_privilege_map (role_id,privilege_id)
select (select id from role where name = 'Department Deputy Chief') as role_id
, privilege_id
from role_privilege_map
where role_id = (select id from role where name = 'Department Authority')
;
COMMIT
