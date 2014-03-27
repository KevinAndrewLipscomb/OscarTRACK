START TRANSACTION
;
insert ignore role
set name = 'Department Street Supervisor Alternate'
, tier_id = 1
, pecking_order = 10877
;
insert ignore role_privilege_map (role_id,privilege_id)
select (select id from role where name = 'Department Street Supervisor Alternate') as role_id
, privilege_id
from role_privilege_map
where role_id = (select id from role where name = 'Department Street Supervisor')
;
update role_member_map
set role_id = (select id from role where name = 'Department Street Supervisor Alternate')
where role_id = (select id from role where name = 'Department Street Supervisor')
;
insert ignore role_privilege_map
set role_id = (select id from role where name = 'Department Street Supervisor')
, privilege_id = (select id from privilege where name = 'edit-schedule')
;
update role_member_map
set role_id = (select id from role where name = 'Department Street Supervisor')
where
    role_id = (select id from role where name = 'Department Street Supervisor Alternate')
  and
    member_id in
      (
      select id
      from member
      where cad_num in
        (
          '800202' -- jeff brennaman
        ,
          '800232' -- john fusco
        ,
          '801729' -- dennis hodge
        ,
          '801956' -- joe corley
        ,
          '800426' -- deb brennaman
        ,
          '800190' -- david baust
        ,
          '800605' -- rick baker
        ,
          '801039' -- pete gonzalez
        )
      )
;
insert ignore privilege set name = 'edit-schedule-liberally'
;
insert ignore role_privilege_map (privilege_id,role_id) values
((select id from privilege where name = 'edit-schedule-liberally'),(select id from role where name = 'Department Authority')),
((select id from privilege where name = 'edit-schedule-liberally'),(select id from role where name = 'Application Administrator')),
((select id from privilege where name = 'edit-schedule-liberally'),(select id from role where name = 'Department Chief Scheduler'))
;
COMMIT