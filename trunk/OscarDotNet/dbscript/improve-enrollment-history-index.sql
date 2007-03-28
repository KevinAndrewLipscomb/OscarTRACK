ALTER TABLE enrollment_history DROP INDEX member_id,
 ADD UNIQUE INDEX member_id(member_id,level_code,start_date);