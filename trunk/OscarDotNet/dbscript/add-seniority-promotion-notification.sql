START TRANSACTION;

insert notification set name = "seniority-promotion";

insert role_notification_map (role_id,notification_id) values
((select id from role where name = "Department Authority"),(select id from notification where name = "seniority-promotion")),
((select id from role where name = "Squad Manager"),(select id from notification where name = "seniority-promotion")),
((select id from role where name = "Department Human Resources Officer"),(select id from notification where name = "seniority-promotion")),
((select id from role where name = "Department Scheduler"),(select id from notification where name = "seniority-promotion")),
((select id from role where name = "Squad Commander"),(select id from notification where name = "seniority-promotion")),
((select id from role where name = "Squad Section Sergeant"),(select id from notification where name = "seniority-promotion")),
((select id from role where name = "Squad Membership Coordinator"),(select id from notification where name = "seniority-promotion")),
((select id from role where name = "Squad Scheduler"),(select id from notification where name = "seniority-promotion")),
((select id from role where name = "Association Newsletter Editor"),(select id from notification where name = "seniority-promotion"));

COMMIT