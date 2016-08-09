START TRANSACTION
;
insert ignore role (name) values
('Department BLS Intern Scheduler'),
('Department Student Scheduler'),
('Department Observer Scheduler')
;
insert ignore role_privilege_map (role_id, privilege_id) values
((select id from role where name = 'Department BLS Intern Scheduler'),(select id from privilege where name = 'change-section')),
((select id from role where name = 'Department BLS Intern Scheduler'),(select id from privilege where name = 'clear-medical-leave')),
((select id from role where name = 'Department BLS Intern Scheduler'),(select id from privilege where name = 'edit-schedule')),
((select id from role where name = 'Department BLS Intern Scheduler'),(select id from privilege where name = 'see-all-squads')),
((select id from role where name = 'Department BLS Intern Scheduler'),(select id from privilege where name = 'see-bulk-bls-intern-schedule-detail')),
((select id from role where name = 'Department BLS Intern Scheduler'),(select id from privilege where name = 'see-other-member-schedule-detail'))
;
insert ignore role_privilege_map (role_id, privilege_id) values
((select id from role where name = 'Department Student Scheduler'),(select id from privilege where name = 'change-section')),
((select id from role where name = 'Department Student Scheduler'),(select id from privilege where name = 'clear-medical-leave')),
((select id from role where name = 'Department Student Scheduler'),(select id from privilege where name = 'edit-schedule')),
((select id from role where name = 'Department Student Scheduler'),(select id from privilege where name = 'see-all-squads')),
((select id from role where name = 'Department Student Scheduler'),(select id from privilege where name = 'see-other-member-schedule-detail'))
;
insert ignore role_privilege_map (role_id, privilege_id) values
((select id from role where name = 'Department Observer Scheduler'),(select id from privilege where name = 'edit-schedule')),
((select id from role where name = 'Department Observer Scheduler'),(select id from privilege where name = 'see-all-squads')),
((select id from role where name = 'Department Observer Scheduler'),(select id from privilege where name = 'see-other-member-schedule-detail'))
;
insert ignore role_notification_map (role_id, notification_id) values
((select id from role where name = 'Department BLS Intern Scheduler'),(select id from notification where name = 'leave-deleted')),
((select id from role where name = 'Department BLS Intern Scheduler'),(select id from notification where name = 'leave-ending-soon')),
((select id from role where name = 'Department BLS Intern Scheduler'),(select id from notification where name = 'leave-expired')),
((select id from role where name = 'Department BLS Intern Scheduler'),(select id from notification where name = 'leave-granted')),
((select id from role where name = 'Department BLS Intern Scheduler'),(select id from notification where name = 'leave-modified')),
((select id from role where name = 'Department BLS Intern Scheduler'),(select id from notification where name = 'member-name-change')),
((select id from role where name = 'Department BLS Intern Scheduler'),(select id from notification where name = 'new-enrollment-level')),
((select id from role where name = 'Department BLS Intern Scheduler'),(select id from notification where name = 'phone-num-change'))
;
insert ignore role_notification_map (role_id, notification_id) values
((select id from role where name = 'Department Student Scheduler'),(select id from notification where name = 'leave-deleted')),
((select id from role where name = 'Department Student Scheduler'),(select id from notification where name = 'leave-ending-soon')),
((select id from role where name = 'Department Student Scheduler'),(select id from notification where name = 'leave-expired')),
((select id from role where name = 'Department Student Scheduler'),(select id from notification where name = 'leave-granted')),
((select id from role where name = 'Department Student Scheduler'),(select id from notification where name = 'leave-modified')),
((select id from role where name = 'Department Student Scheduler'),(select id from notification where name = 'member-name-change')),
((select id from role where name = 'Department Student Scheduler'),(select id from notification where name = 'new-enrollment-level')),
((select id from role where name = 'Department Student Scheduler'),(select id from notification where name = 'phone-num-change'))
;
COMMIT
