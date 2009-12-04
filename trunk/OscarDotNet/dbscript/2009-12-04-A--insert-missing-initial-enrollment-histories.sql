START TRANSACTION;

insert ignore enrollment_history
set member_id = (select id from member where last_name = "DELP" and first_name = "ERNIE"),
  level_code = 6,
  start_date = "0000-00-00";
insert ignore enrollment_history
set member_id = (select id from member where last_name = "BAUST" and first_name = "DAVID"),
  level_code = 6,
  start_date = "0000-00-00";
insert ignore enrollment_history
set member_id = (select id from member where last_name = "HORDESKI" and first_name = "JIM"),
  level_code = 6,
  start_date = "0000-00-00";

COMMIT