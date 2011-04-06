START TRANSACTION
;
insert ignore role set name = "Squad Schedule Monitor"
;
insert ignore role_member_map (role_id,member_id) values
((select id from role where name = "Squad Schedule Monitor"),(select id from member where last_name in ("CLAYPOOL","WADLER") and first_name = "CATHRINE")),
((select id from role where name = "Squad Schedule Monitor"),(select id from member where last_name = "BAKER" and first_name = "JUDI"))
;
COMMIT