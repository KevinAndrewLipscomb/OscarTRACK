START TRANSACTION
;
insert ignore privilege set name = 'config-sms-gateways'
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'config-sms-gateways'),(select id from role where name = 'Application Administrator'))
;
COMMIT
