start transaction;

insert ignore role set name = "All-Squad NGO Leader", tier_id = 1;

insert ignore role_member_map (member_id,role_id) values
((select id from member where last_name = "Martin" and first_name = "Stewart"),(select id from role where name = "Department Authority")),
((select id from member where last_name = "Brazle" and first_name = "Edward"),(select id from role where name = "Department Authority")),
((select id from member where last_name = "Nedelka" and first_name = "Bruce"),(select id from role where name = "Department Authority")),
((select id from member where last_name = "Green" and first_name = "Tom"),(select id from role where name = "Department Authority")),
((select id from member where last_name = "Whitley" and first_name = "Charles"),(select id from role where name = "All-Squad NGO Leader")),
((select id from member where last_name = "Best" and first_name = "John"),(select id from role where name = "All-Squad NGO Leader")),
((select id from member where last_name = "McFarland" and first_name = "Jenni"),(select id from role where name = "All-Squad NGO Leader")),
((select id from member where last_name = "Schaum" and first_name = "Kitty"),(select id from role where name = "All-Squad NGO Leader"));

insert ignore notification set name = "report-monthly-per-agency-serial-indicators";

insert ignore role_notification_map (role_id,notification_id) values
((select id from role where name = "Application Administrator"),(select id from notification where name = "report-monthly-per-agency-serial-indicators")),
((select id from role where name = "Department Authority"),(select id from notification where name = "report-monthly-per-agency-serial-indicators")),
((select id from role where name = "Department Human Resources Officer"),(select id from notification where name = "report-monthly-per-agency-serial-indicators")),
((select id from role where name = "Department BLS ID Coordinator"),(select id from notification where name = "report-monthly-per-agency-serial-indicators")),
((select id from role where name = "Squad Commander"),(select id from notification where name = "report-monthly-per-agency-serial-indicators")),
((select id from role where name = "Squad Training Officer"),(select id from notification where name = "report-monthly-per-agency-serial-indicators")),
((select id from role where name = "Squad Membership Coordinator"),(select id from notification where name = "report-monthly-per-agency-serial-indicators")),
((select id from role where name = "Squad Scheduler"),(select id from notification where name = "report-monthly-per-agency-serial-indicators")),
((select id from role where name = "Squad Manager"),(select id from notification where name = "report-monthly-per-agency-serial-indicators")),
((select id from role where name = "Department Schedule Auditor"),(select id from notification where name = "report-monthly-per-agency-serial-indicators")),
((select id from role where name = "All-Squad NGO Leader"),(select id from notification where name = "report-monthly-per-agency-serial-indicators"));

commit