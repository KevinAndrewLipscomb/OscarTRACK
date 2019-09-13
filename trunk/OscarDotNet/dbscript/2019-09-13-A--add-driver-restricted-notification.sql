START TRANSACTION
;
insert ignore role (name,tier_id,pecking_order) values
('Department Safety Officer',1,10280)
;
insert ignore role_privilege_map (role_id,privilege_id)
select (select id from role where name = 'Department Safety Officer') as role_id
, privilege_id
from role_privilege_map
where role_id = (select id from role where name = 'Department Analyst')
;
insert ignore notification set name = 'established-driving-privileges-revoked'
, activity_description = 'established driving privileges revoked'
, activity_pecking_order = 143
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = 'established-driving-privileges-revoked'),(select id from role where name = 'Department Safety Officer'))
;
COMMIT
