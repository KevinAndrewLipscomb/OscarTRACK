START TRANSACTION
;
delete from role_privilege_map where privilege_id = (select id from privilege where name = "change-agency") and role_id in
  (
    (select id from role where name = "Squad Commander")
  ,
    (select id from role where name = "Squad Membership Coordinator")
  ,
    (select id from role where name = "Squad Manager")
  )
;
COMMIT