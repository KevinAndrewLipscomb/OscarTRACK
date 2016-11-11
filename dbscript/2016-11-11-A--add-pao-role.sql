START TRANSACTION
;
insert ignore role (name,tier_id,pecking_order) values
('Department Public Affairs Officer',1,10350)
;
insert ignore role_privilege_map (role_id,privilege_id)
select (select id from role where name = 'Department Public Affairs Officer') as role_id
, privilege_id
from role_privilege_map
where role_id = (select id from role where name = 'Department Analyst')
;
COMMIT
