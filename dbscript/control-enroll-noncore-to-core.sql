START TRANSACTION;

delete from role_privilege_map where role_id = 6 and privilege_id = 13;

ALTER TABLE enrollment_transition
  ADD COLUMN `authorized_tier_id` TINYINT UNSIGNED NOT NULL DEFAULT 1;

update enrollment_transition
set authorized_tier_id = 1;

update enrollment_transition
  join enrollment_level as e on (e.code=enrollment_transition.current_level_code)
  join enrollment_level as f on (f.code=enrollment_transition.valid_next_level_code)
set authorized_tier_id = 2
where not ((e.core_ops_commitment_level_code = 1) and (f.core_ops_commitment_level_code > 1))
  and not e.code in (10,17)
  and not f.code in (10,17);

ALTER TABLE enrollment_transition
  ADD CONSTRAINT `enrollment_transition_ibfk_5` FOREIGN KEY `enrollment_transition_ibfk_5` (`authorized_tier_id`) REFERENCES `tier` (`id`);

insert enrollment_level
set description = 'Just released',
  num_shifts = 0,
  pecking_order = 82,
  elaboration = 'Has recently been released to function as a patient care provider, but next enrollment level has not yet been indicated.  Shift obligation set to zero in this system.',
  core_ops_commitment_level_code = 2;

insert enrollment_transition (current_level_code,required_historical_level_code,disallowed_historical_level_code,valid_next_level_code,authorized_tier_id) values
(10,NULL,NULL,21,1),
(21,NULL,NULL,2,2),
(21,NULL,NULL,6,2),
(21,NULL,NULL,5,2);

delete from enrollment_transition
where current_level_code = 10
  and valid_next_level_code in (2,5,6,7,8,9);

update enrollment_level
set elaboration = 'Use for chiefs and MD members.  Also use when duty obligation is seasonal (for non-regional college students, etc) or otherwise unusual.'
where code = 6;

COMMIT