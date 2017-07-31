START TRANSACTION
;
insert ignore privilege set name = 'send-quickmessage-by-shift';
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'send-quickmessage-by-shift'),(select id from role where name = 'Department Analyst'))
;
COMMIT
