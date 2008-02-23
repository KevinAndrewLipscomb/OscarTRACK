START TRANSACTION;

insert notification set name = "leave-expired";

insert role_notification_map (notification_id,role_id,data_condition_id) values
((select id from notification where name = "leave-expired"),(select id from role where name = "Department Human Resources Officer"),1),
((select id from notification where name = "leave-expired"),(select id from role where name = "Department BLS ID Coordinator"),2),
((select id from notification where name = "leave-expired"),(select id from role where name = "Squad Commander"),1),
((select id from notification where name = "leave-expired"),(select id from role where name = "Squad Section Sergeant"),1),
((select id from notification where name = "leave-expired"),(select id from role where name = "Squad Training Officer"),2);

COMMIT