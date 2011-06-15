START TRANSACTION
;
insert ignore role set name = "Department Jump Seat Scheduler", tier_id = 1, pecking_order = 10575
;
insert ignore data_condition (name) values
("BeRolePersonnelRelated")
;
update ignore role_notification_map
set data_condition_id = (select id from data_condition where name = "BeRolePersonnelRelated")
where notification_id = (select id from notification where name = "role-change")
  and role_id in (select id from role where name in ("Department Human Resources Officer","Department BLS ID Coordinator"))
;
insert ignore role_notification_map (role_id,data_condition_id,notification_id) values
((select id from role where name = "Department Jump Seat Scheduler"),(select id from data_condition where name = "BeMemberTrainee"),(select id from notification where name = "new-enrollment-level")),
((select id from role where name = "Department Jump Seat Scheduler"),(select id from data_condition where name = "BeMemberTrainee"),(select id from notification where name = "leave-modified")),
((select id from role where name = "Department Jump Seat Scheduler"),(select id from data_condition where name = "BeMemberTrainee"),(select id from notification where name = "leave-granted")),
((select id from role where name = "Department Jump Seat Scheduler"),(select id from data_condition where name = "BeMemberTrainee"),(select id from notification where name = "leave-deleted")),
((select id from role where name = "Department Jump Seat Scheduler"),(select id from data_condition where name = "BeMemberTrainee"),(select id from notification where name = "leave-ending-soon")),
((select id from role where name = "Department Jump Seat Scheduler"),(select id from data_condition where name = "BeMemberTrainee"),(select id from notification where name = "leave-expired")),
((select id from role where name = "Department Jump Seat Scheduler"),(select id from data_condition where name = "BeMemberTrainee"),(select id from notification where name = "member-name-change")),
((select id from role where name = "Department Jump Seat Scheduler"),(select id from data_condition where name = "BeMemberTrainee"),(select id from notification where name = "phone-num-change"))
;
insert ignore role_privilege_map (role_id,privilege_id) values
((select id from role where name = "Department Jump Seat Scheduler"),(select id from privilege where name = "edit-schedule"))
;
COMMIT