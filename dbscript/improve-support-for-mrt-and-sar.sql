SET FOREIGN_KEY_CHECKS=0;

SET AUTOCOMMIT=0;
START TRANSACTION;


update enrollment_level
  set description = 'Atypical'
  where description = 'Special';

insert enrollment_level
  set description = 'SpecOps',
    num_shifts = 0,
    pecking_order = 83,
    elaboration = 'Only use for members who NEVER run ambulance duties and who are NOT members of one of the city''s ten original volunteer rescue squads.';

insert enrollment_transition (current_level_code,valid_next_level_code) values
(18,11),
(18,13),
(18,14),
(18,15),
(18,16),
(17,18);

update enrollment_history join member on (member.id=enrollment_history.member_id)
  set level_code = 18
  where (level_code = 1)
    and ((agency_id = 203) or (agency_id = 204));

update agency set be_active = 1 where short_designator = 'MRT';
update agency set be_active = 1 where short_designator = 'SAR';


SET FOREIGN_KEY_CHECKS=1;

COMMIT;