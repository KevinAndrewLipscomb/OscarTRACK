START TRANSACTION;

insert privilege set name = "edit-enrollments-of-trainees-only";

insert role_privilege_map (role_id,privilege_id) values
((select id from role where name = "Squad Training Officer"),(select id from privilege where name = "edit-enrollments-of-trainees-only"));

COMMIT