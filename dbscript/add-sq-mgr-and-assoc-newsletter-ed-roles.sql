START TRANSACTION;

insert role (name,tier_id) values
("Squad Manager",2),
("Association Newsletter Editor",1);

insert role_notification_map (role_id,notification_id) values
((select id from role where name = "Squad Manager"),(select id from notification where name = "driver-qualification-change")),
((select id from role where name = "Squad Manager"),(select id from notification where name = "leave-deleted")),
((select id from role where name = "Squad Manager"),(select id from notification where name = "leave-granted")),
((select id from role where name = "Squad Manager"),(select id from notification where name = "leave-modified")),
((select id from role where name = "Squad Manager"),(select id from notification where name = "medical-release-level-change")),
((select id from role where name = "Squad Manager"),(select id from notification where name = "member-added")),
((select id from role where name = "Squad Manager"),(select id from notification where name = "new-enrollment-level")),
((select id from role where name = "Squad Manager"),(select id from notification where name = "section-change")),
((select id from role where name = "Squad Manager"),(select id from notification where name = "needs-enrollment-review")),
((select id from role where name = "Squad Manager"),(select id from notification where name = "member-name-change")),
((select id from role where name = "Association Newsletter Editor"),(select id from notification where name = "medical-release-level-change"));

insert member
set last_name = "SCHAUM",
  first_name = "KITTY",
  email_address = "info@vbrescuefoundation.org",
  agency_id = 14,
  be_driver_qualified = FALSE;

insert enrollment_history
set member_id = (select id from member where last_name = "Schaum" and first_name = "Kitty"),
  level_code = (select code from enrollment_level where description = "Admin"),
  start_date = CURDATE();

insert role_member_map (member_id,role_id) values
(161,(select id from role where name = "Squad Manager")),
((select id from member where last_name = "Schaum" and first_name = "Kitty"),(select id from role where name = "Association Newsletter Editor"));

COMMIT