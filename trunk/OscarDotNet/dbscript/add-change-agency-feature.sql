START TRANSACTION;

insert privilege
set name = 'change-agency';

insert role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'change-agency'),1),
((select id from privilege where name = 'change-agency'),2),
((select id from privilege where name = 'change-agency'),3);

COMMIT