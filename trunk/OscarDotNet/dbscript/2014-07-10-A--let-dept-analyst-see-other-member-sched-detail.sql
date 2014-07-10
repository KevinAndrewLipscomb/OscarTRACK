START TRANSACTION
;
insert ignore role_privilege_map
set role_id = (select id from role where name = 'Department Analyst')
, privilege_id = (select id from privilege where name = 'see-other-member-schedule-detail')
;
COMMIT