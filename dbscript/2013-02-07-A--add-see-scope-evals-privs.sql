START TRANSACTION
;
insert ignore privilege (name) values
("see-department-scope-evals"),
("see-squad-scope-evals")
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "see-department-scope-evals"),(select id from role where name = "Department BLS ID Coordinator")),
((select id from privilege where name = "see-department-scope-evals"),(select id from role where name = "Department Authority")),
((select id from privilege where name = "see-department-scope-evals"),(select id from role where name = "Application Administrator")),
((select id from privilege where name = "see-squad-scope-evals"),(select id from role where name = "Squad Training Officer")),
((select id from privilege where name = "see-squad-scope-evals"),(select id from role where name = "Squad Commander")),
((select id from privilege where name = "see-squad-scope-evals"),(select id from role where name = "Squad Manager")),
((select id from privilege where name = "see-squad-scope-evals"),(select id from role where name = "Squad Assistant Manager"))
;
insert ignore notification (name) values
("eval-archived")
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = "eval-archived"),(select id from role where name = "Department BLS ID Coordinator")),
((select id from notification where name = "eval-archived"),(select id from role where name = "Squad Training Officer"))
;
COMMIT