START TRANSACTION;

ALTER TABLE `member` ADD COLUMN `equivalent_los_start_date` DATE;

update member
set equivalent_los_start_date =
  (
  select min(start_date)
  from enrollment_history
  where member_id = member.id
    and level_code in (1,2,3,4,5,6,7,8,9,10,18)
  group by member_id
  );

update member
set equivalent_los_start_date =
  ADDDATE(
    equivalent_los_start_date,
    IFNULL(
      (
        SELECT sum(DATEDIFF(end_date,start_date)) as duration
        FROM enrollment_history
        where level_code in (11,12,13,14,15,16,22)
          and end_date is not null
          and member_id = member.id
      ),
      0
    )
  )
where equivalent_los_start_date is not null;

COMMIT