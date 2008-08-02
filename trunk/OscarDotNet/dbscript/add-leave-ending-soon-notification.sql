START TRANSACTION;

insert notification set name = "leave-ending-soon";

insert role_notification_map (notification_id,role_id,data_condition_id) values
((select id from notification where name = "leave-ending-soon"),(select id from role where name = "Squad Commander"),1),
((select id from notification where name = "leave-ending-soon"),(select id from role where name = "Squad Section Sergeant"),1),
((select id from notification where name = "leave-ending-soon"),(select id from role where name = "Squad Scheduler"),1),
((select id from notification where name = "leave-ending-soon"),(select id from role where name = "Squad Training Officer"),2),
((select id from notification where name = "leave-ending-soon"),(select id from role where name = "Department BLS ID Coordinator"),2);

COMMIT