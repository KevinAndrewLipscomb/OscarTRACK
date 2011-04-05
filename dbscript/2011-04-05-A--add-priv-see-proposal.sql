START TRANSACTION
;
insert ignore privilege set name = "see-proposal";
;
insert ignore role_privilege_map (role_id,privilege_id) values
((select id from role where name = "Department Street Supervisor"),(select id from privilege where name = "see-proposal")),
((select id from role where name = "Department Street Supervisor"),(select id from privilege where name = "see-all-squads"))
;
COMMIT