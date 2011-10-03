START TRANSACTION
;
update notification set activity_pecking_order = 285 where name = "vehicle-added"
;
insert ignore notification (name,activity_description,activity_pecking_order) values
("efficipay-docket-ready-for-review","EfficiPay docket reviews needed",295),
("efficipay-docket-signed-and-countersigned","EfficiPay dockets signed & countersigned",297);
;
insert ignore role_notification_map (notification_id,role_id) values
((select id from notification where name = "efficipay-docket-ready-for-review"),(select id from role where name = "Squad Check Signer")),
((select id from notification where name = "efficipay-docket-ready-for-review"),(select id from role where name = "Squad Treasurer")),
((select id from notification where name = "efficipay-docket-signed-and-countersigned"),(select id from role where name = "Squad Bookkeeper")),
((select id from notification where name = "efficipay-docket-signed-and-countersigned"),(select id from role where name = "Squad Treasurer"))
;
update role set pecking_order = 25100 where name = "Squad Fund Drive Clerk"
;
COMMIT