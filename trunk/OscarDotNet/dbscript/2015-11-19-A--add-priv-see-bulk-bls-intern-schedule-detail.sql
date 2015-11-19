START TRANSACTION
;
insert ignore privilege set name = 'see-bulk-bls-intern-schedule-detail'
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'see-bulk-bls-intern-schedule-detail'),(select id from role where name = 'Department Jump Seat Scheduler')),
((select id from privilege where name = 'see-bulk-bls-intern-schedule-detail'),(select id from role where name = 'Application Administrator'))
;
COMMIT
