START TRANSACTION
;
insert ignore role (name,tier_id,pecking_order) values
('Squad Tapout Tracker',2,21350)
;
insert ignore role_privilege_map (role_id,privilege_id) values
((select id from role where name = 'Squad Tapout Tracker'),(select id from privilege where name = 'see-personnel-status-notes'))
;
COMMIT
