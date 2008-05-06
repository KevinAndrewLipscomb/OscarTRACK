START TRANSACTION;

update enrollment_history
  set end_date = NULL
  where member_id = (select id from member where last_name = "MUSICANT" and first_name = "KYLE")
    and level_code = (select code from enrollment_level where description = "Regular");

COMMIT