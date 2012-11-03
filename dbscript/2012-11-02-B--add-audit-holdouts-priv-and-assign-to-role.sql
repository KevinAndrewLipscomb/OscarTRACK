START TRANSACTION
;
insert ignore privilege set name = "audit-holdouts"
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "audit-holdouts"),(select id from role where name = "Department BLS ID Coordinator"))
;
COMMIT