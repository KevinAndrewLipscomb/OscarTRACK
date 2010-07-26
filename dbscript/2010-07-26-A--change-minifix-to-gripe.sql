START TRANSACTION;

update privilege
set name = "config-gripes"
where name = "config-mini-fix-requests";

insert ignore notification
set name = "gripe-submission",
  activity_description = "vehicle gripes submitted",
  activity_pecking_order = 248;

update notification
set name = "gripe-log-review",
  activity_description = "suggestions to review a vehicle GripeLog"
where name = "minifix-log-review";

rename table mini_fix_request to gripe;

COMMIT