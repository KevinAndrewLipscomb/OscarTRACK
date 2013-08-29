START TRANSACTION
;
insert ignore privilege set name = "clear-medical-leave"
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "clear-medical-leave"),(select id from role where name = "Department Authority")),
((select id from privilege where name = "clear-medical-leave"),(select id from role where name = "Application Administrator")),
((select id from privilege where name = "clear-medical-leave"),(select id from role where name = "Department Human Resources Officer")),
((select id from privilege where name = "clear-medical-leave"),(select id from role where name = "Department Leave Monitor"))
;
COMMIT