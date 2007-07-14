START TRANSACTION;

insert privilege (name) values
("change-cad-num"),
("change-member-name");

insert role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = "change-cad-num"),1),
((select id from privilege where name = "change-cad-num"),2),
((select id from privilege where name = "change-cad-num"),3),
((select id from privilege where name = "change-member-name"),1),
((select id from privilege where name = "change-member-name"),2),
((select id from privilege where name = "change-member-name"),3);

insert notification (name) values
("cad-num-change"),
("member-name-change");

insert role_notification_map (notification_id,role_id) values
((select id from notification where name = "cad-num-change"),3),
((select id from notification where name = "member-name-change"),3),
((select id from notification where name = "member-name-change"),6),
((select id from notification where name = "member-name-change"),13),
((select id from notification where name = "member-name-change"),14);

COMMIT