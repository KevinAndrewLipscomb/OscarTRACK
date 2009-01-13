START TRANSACTION;

delete from enrollment_history where member_id = 1027;
delete from leave_of_absence where member_id = 1027;
delete from officership where member_id = 1027;
delete from role_member_map where member_id = 1027;
delete from user_member_map where member_id = 1027;
delete from member where id = 1027;

COMMIT