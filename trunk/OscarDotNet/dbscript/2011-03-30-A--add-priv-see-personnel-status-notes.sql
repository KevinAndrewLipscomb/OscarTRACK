START TRANSACTION
;
insert ignore privilege set name = "see-personnel-status-notes"
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "see-personnel-status-notes"),(select id from role where name = "Department Authority")),
((select id from privilege where name = "see-personnel-status-notes"),(select id from role where name = "Application Administrator")),
((select id from privilege where name = "see-personnel-status-notes"),(select id from role where name = "Department Human Resources Officer")),
((select id from privilege where name = "see-personnel-status-notes"),(select id from role where name = "Department BLS ID Coordinator")),
((select id from privilege where name = "see-personnel-status-notes"),(select id from role where name = "Department ALS ID Coordinator")),
((select id from privilege where name = "see-personnel-status-notes"),(select id from role where name = "Department Leave Monitor")),
((select id from privilege where name = "see-personnel-status-notes"),(select id from role where name = "Department Analyst")),
((select id from privilege where name = "see-personnel-status-notes"),(select id from role where name = "Squad Commander")),
((select id from privilege where name = "see-personnel-status-notes"),(select id from role where name = "Squad Manager")),
((select id from privilege where name = "see-personnel-status-notes"),(select id from role where name = "Squad Membership Coordinator")),
((select id from privilege where name = "see-personnel-status-notes"),(select id from role where name = "Squad Training Officer")),
((select id from privilege where name = "see-personnel-status-notes"),(select id from role where name = "Squad Analyst")),
((select id from privilege where name = "see-personnel-status-notes"),(select id from role where name = "Squad Section Sergeant"))
;
COMMIT