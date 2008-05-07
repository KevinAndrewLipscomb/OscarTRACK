START TRANSACTION;

delete from role_privilege_map where
  privilege_id = (select id from privilege where name = "release-trainees")
 and
  role_id in
    (
    select id from role where name in
      (
      "Squad Commander",
      "Squad Training Officer",
      "Squad Membership Coordinator",
      "Department ALS ID Coordinator",
      "Squad Manager"
      )
    )
;

COMMIT