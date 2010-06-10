START TRANSACTION;

insert ignore enrollment_transition
set current_level_code = (select code from enrollment_level where description = "Recruit"),
  valid_next_level_code = (select code from enrollment_level where description = "Transferring");

insert ignore enrollment_transition
set current_level_code = (select code from enrollment_level where description = "Transferring"),
  required_historical_level_code = (select code from enrollment_level where description = "Recruit"),
  valid_next_level_code = (select code from enrollment_level where description = "Recruit");

insert ignore enrollment_transition
set current_level_code = (select code from enrollment_level where description = "Admin"),
  valid_next_level_code = (select code from enrollment_level where description = "Transferring");

COMMIT