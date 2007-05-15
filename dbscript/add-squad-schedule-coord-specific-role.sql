START TRANSACTION;

insert role (name,tier_id) values
('Squad Scheduler',2),
('Department Scheduler',1);

insert role_notification_map (role_id,notification_id) values
(13,1),
(13,2),
(13,3),
(13,4),
(13,5),
(13,6),
(13,7),
(14,1),
(14,2),
(14,3),
(14,4),
(14,5),
(14,6),
(14,7);

insert role_privilege_map (role_id,privilege_id) values
(13,6),
(13,8),
(13,9),
(13,12),
(13,14),
(14,6),
(14,7),
(14,8),
(14,9),
(14,12),
(14,14);

update role_member_map set role_id = 13 where member_id = 415 and role_id = 10;
update role_member_map set role_id = 13 where member_id = 20 and role_id = 10;
update role_member_map set role_id = 13 where member_id = 409 and role_id = 10;
update role_member_map set role_id = 13 where member_id = 528 and role_id = 10;
update role_member_map set role_id = 13 where member_id = 604 and role_id = 10;
update role_member_map set role_id = 13 where member_id = 477 and role_id = 10;

update role_member_map set role_id = 14 where member_id = 616 and role_id = 5;
update role_member_map set role_id = 14 where member_id = 623 and role_id = 5;

COMMIT;