START TRANSACTION
;
insert ignore role (name,tier_id,soft_hyphenation_text,pecking_order) values
('Assistant Squad Commander',2,'',21125),
('Squad Fleet Assistant',2,'',22500),
('Squad Equipment Officer',2,'',23100),
('Squad Supply Officer',2,'',23200),
('Squad Rescue Council Alternate',2,'',21275),
('Squad President',2,'',23600),
('Squad Vice President',2,'',23650),
('Squad Secretary',2,'',23700),
('Squad Board Director',2,'',23750),
('Squad Mail Clerk',2,'',26100),
('Squad Uniforms Coordinator',2,'',26200),
('Squad Banquet Coordinator',2,'',26300),
('Squad Building & Grounds Coordinator',2,'',26400),
('Squad Ambulance Procurement & Disposition Coordinator',2,'',26500),
('Squad Info Tech Coordinator',2,'',26600)
;
insert ignore role_privilege_map (role_id,privilege_id)
select (select id from role where name = 'Assistant Squad Commander') as role_id
, privilege_id
from role_privilege_map
where role_id = (select id from role where name = 'Squad Manager')
;
insert ignore role_privilege_map (role_id,privilege_id)
select (select id from role where name = 'Squad President') as role_id
, privilege_id
from role_privilege_map
where role_id = (select id from role where name = 'Squad Analyst')
;
insert ignore role_privilege_map (role_id,privilege_id)
select (select id from role where name = 'Squad Vice President') as role_id
, privilege_id
from role_privilege_map
where role_id = (select id from role where name = 'Squad Analyst')
;
insert ignore role_privilege_map (role_id,privilege_id)
select (select id from role where name = 'Squad Secretary') as role_id
, privilege_id
from role_privilege_map
where role_id = (select id from role where name = 'Squad Analyst')
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'send-quickmessages'),(select id from role where name = 'Squad Equipment Officer')),
((select id from privilege where name = 'send-quickmessages'),(select id from role where name = 'Squad Supply Officer')),
((select id from privilege where name = 'send-quickmessages'),(select id from role where name = 'Squad Rescue Council Alternate')),
((select id from privilege where name = 'send-quickmessages'),(select id from role where name = 'Squad Uniforms Coordinator')),
((select id from privilege where name = 'send-quickmessages'),(select id from role where name = 'Squad Banquet Coordinator')),
((select id from privilege where name = 'send-quickmessages'),(select id from role where name = 'Squad Building & Grounds Coordinator')),
((select id from privilege where name = 'send-quickmessages'),(select id from role where name = 'Squad Ambulance Procurement & Disposition Coordinator')),
((select id from privilege where name = 'send-quickmessages'),(select id from role where name = 'Squad Info Tech Coordinator'))
;
update role set name = 'Squad Manager (possibly paid)' where name = 'Squad Manager'
;
update role
set name = 'Squad Assistant Manager (possibly paid)'
, pecking_order = 21225
where name = 'Squad Assistant Manager'
;
COMMIT
