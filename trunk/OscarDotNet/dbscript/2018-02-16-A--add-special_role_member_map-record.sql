START TRANSACTION
;
insert ignore special_role_member_map (member_id,role_id,agency_id) values
((select id from member where cad_num = '800415'),(select id from role where name = 'Department Jump Seat Scheduler'),0)
;
COMMIT
