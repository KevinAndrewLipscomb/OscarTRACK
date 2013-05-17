START TRANSACTION
;
ALTER TABLE `agency`
  ADD COLUMN `be_keyclick_enabled` TINYINT NOT NULL DEFAULT FALSE
,
  ADD COLUMN `be_efficipay_enabled` TINYINT NOT NULL DEFAULT FALSE
;
update agency set be_keyclick_enabled = TRUE where id in (5,9)
;
update agency set be_efficipay_enabled = TRUE where id in (9)
;
insert ignore role (name,tier_id,pecking_order) values
("Rescue Council Treasurer",(select id from tier where name = "Department"),10860),
("Rescue Council Bookkeeper",(select id from tier where name = "Department"),10863),
("Rescue Council Check Signer",(select id from tier where name = "Department"),10866)
;
insert ignore privilege (name) values
("create-efficipay-docket-for-rc"),
("sign-efficipay-docket-for-rc")
;
insert ignore role_privilege_map (role_id,privilege_id) values
((select id from role where name = "Rescue Council Treasurer"),(select id from privilege where name = "create-efficipay-docket-for-rc")),
((select id from role where name = "Rescue Council Treasurer"),(select id from privilege where name = "sign-efficipay-docket-for-rc")),
((select id from role where name = "Rescue Council Bookkeeper"),(select id from privilege where name = "create-efficipay-docket-for-rc")),
((select id from role where name = "Rescue Council Check Signer"),(select id from privilege where name = "sign-efficipay-docket-for-rc"))
;
insert ignore role_notification_map (role_id,notification_id) values
((select id from role where name = "Rescue Council Treasurer"),(select id from notification where name = "efficipay-docket-ready-for-review")),
((select id from role where name = "Rescue Council Treasurer"),(select id from notification where name = "efficipay-docket-signed-and-countersigned")),
((select id from role where name = "Rescue Council Bookkeeper"),(select id from notification where name = "efficipay-docket-signed-and-countersigned")),
((select id from role where name = "Rescue Council Check Signer"),(select id from notification where name = "efficipay-docket-ready-for-review"))
;
COMMIT