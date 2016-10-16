START TRANSACTION
;
insert ignore special_role_member_map
set member_id = 9,
  role_id = (select id from role where name = 'Squad Fund Drive Clerk'),
  agency_id = 9
;
COMMIT
