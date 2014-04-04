START TRANSACTION
;
insert ignore privilege set name = 'edit-post-assignments'
;
insert ignore role_privilege_map
set privilege_id = (select id from privilege where name = 'edit-post-assignments')
, role_id = (select id from role where name = 'Department Street Supervisor')
;
delete from role_privilege_map
where role_id = (select id from role where name = 'Department Street Supervisor')
  and privilege_id = (select id from privilege where name = 'edit-schedule')
;
COMMIT