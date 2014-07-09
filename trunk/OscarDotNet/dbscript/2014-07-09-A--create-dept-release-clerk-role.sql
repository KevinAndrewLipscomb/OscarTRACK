START TRANSACTION
;
insert ignore role
set name = 'Department Release Clerk'
, tier_id = (select id from tier where name = 'Department')
, soft_hyphenation_text = ''
, pecking_order = 10762
;
insert ignore role_notification_map
set role_id = (select id from role where name = 'Department Release Clerk')
, notification_id = (select id from notification where name = 'medical-release-level-change')
;
COMMIT