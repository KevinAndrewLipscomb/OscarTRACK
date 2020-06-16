START TRANSACTION
;
DELIMITER $$

DROP FUNCTION IF EXISTS `MONTH_DUTY_HOURS`
$$
CREATE FUNCTION `MONTH_DUTY_HOURS`
  (
  the_member_id INT UNSIGNED,
  the_year_num SMALLINT UNSIGNED,
  the_month_num TINYINT UNSIGNED
  )
RETURNS DECIMAL(5,1)
  READS SQL DATA
BEGIN
  RETURN FORMAT
    (
      (
      select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0)
      from schedule_assignment
      where member_id = the_member_id
        and YEAR(nominal_day) = the_year_num
        and MONTH(nominal_day) = the_month_num
      )
    ,
      1
    );
END
$$
DROP FUNCTION IF EXISTS `YEAR_DUTY_HOURS`
$$
CREATE FUNCTION `YEAR_DUTY_HOURS`
  (
  the_member_id INT UNSIGNED,
  the_year_num SMALLINT UNSIGNED
  )
RETURNS DECIMAL(5,1)
  READS SQL DATA
BEGIN
  RETURN
    (
    select IFNULL(sum(TIME_TO_SEC(TIMEDIFF(muster_to_logoff_timespan,muster_to_logon_timespan))/3600*be_selected),0)
    from schedule_assignment
    where member_id = the_member_id
      and YEAR(nominal_day) = the_year_num
    );
END
$$
DROP FUNCTION IF EXISTS `ENROLLMENT`
$$
CREATE FUNCTION `ENROLLMENT`(the_code TINYINT UNSIGNED)
RETURNS VARCHAR(31)
  READS SQL DATA
BEGIN
  RETURN IFNULL((select description from enrollment_level where code = the_code),'(na)');
END
$$
DROP FUNCTION IF EXISTS `MONTH_BASE_OBLIGATION`
$$
CREATE FUNCTION `MONTH_BASE_OBLIGATION`(the_code TINYINT UNSIGNED)
RETURNS DECIMAL(5,1)
  READS SQL DATA
BEGIN
  RETURN (select num_shifts from enrollment_level where code = the_code);
END
$$
DROP FUNCTION IF EXISTS `YEAR_BASE_OBLIGATION`
$$
CREATE FUNCTION `YEAR_BASE_OBLIGATION`
  (
  the_jan_code TINYINT UNSIGNED,
  the_feb_code TINYINT UNSIGNED,
  the_mar_code TINYINT UNSIGNED,
  the_apr_code TINYINT UNSIGNED,
  the_may_code TINYINT UNSIGNED,
  the_jun_code TINYINT UNSIGNED,
  the_jul_code TINYINT UNSIGNED,
  the_aug_code TINYINT UNSIGNED,
  the_sep_code TINYINT UNSIGNED,
  the_oct_code TINYINT UNSIGNED,
  the_nov_code TINYINT UNSIGNED,
  the_dec_code TINYINT UNSIGNED
  )
RETURNS DECIMAL(5,1)
  READS SQL DATA
BEGIN
  RETURN
    (
      IFNULL(MONTH_BASE_OBLIGATION(the_jan_code),0)
    +
      IFNULL(MONTH_BASE_OBLIGATION(the_feb_code),0)
    +
      IFNULL(MONTH_BASE_OBLIGATION(the_mar_code),0)
    +
      IFNULL(MONTH_BASE_OBLIGATION(the_apr_code),0)
    +
      IFNULL(MONTH_BASE_OBLIGATION(the_may_code),0)
    +
      IFNULL(MONTH_BASE_OBLIGATION(the_jun_code),0)
    +
      IFNULL(MONTH_BASE_OBLIGATION(the_jul_code),0)
    +
      IFNULL(MONTH_BASE_OBLIGATION(the_aug_code),0)
    +
      IFNULL(MONTH_BASE_OBLIGATION(the_sep_code),0)
    +
      IFNULL(MONTH_BASE_OBLIGATION(the_oct_code),0)
    +
      IFNULL(MONTH_BASE_OBLIGATION(the_nov_code),0)
    +
      IFNULL(MONTH_BASE_OBLIGATION(the_dec_code),0)
    )*12;
END
$$
DROP FUNCTION IF EXISTS `KIND_OF_LEAVE`
$$
CREATE FUNCTION `KIND_OF_LEAVE`
  (
  the_member_id INT UNSIGNED,
  the_year_num SMALLINT UNSIGNED,
  the_month_num TINYINT UNSIGNED
  )
RETURNS VARCHAR(31)
  READS SQL DATA
BEGIN
  RETURN IFNULL
    (
      (
      select description
      from leave_of_absence
        join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)
      where member_id = the_member_id
        and CONCAT(the_year_num,'-',the_month_num,'-15') between start_date and end_date)
    ,
      '(none)'
    );
END
$$
DROP FUNCTION IF EXISTS `EFFECTIVE_OBLIGATION`
$$
CREATE FUNCTION `EFFECTIVE_OBLIGATION`
  (
  the_member_id INT UNSIGNED,
  the_year_num SMALLINT UNSIGNED,
  the_month_num TINYINT UNSIGNED,
  the_code TINYINT UNSIGNED
  )
RETURNS DECIMAL(5,1)
  READS SQL DATA
BEGIN
  RETURN FORMAT
    (
    IFNULL
      (
        (
        select num_obliged_shifts
        from leave_of_absence
        where member_id = the_member_id
          and CONCAT(the_year_num,'-',the_month_num,'-15') between start_date and end_date
        )
      ,
        IFNULL(MONTH_BASE_OBLIGATION(the_code),0)
      )*12
    ,
      1
    );
END
$$
DROP FUNCTION IF EXISTS `PERCENTAGE`
$$
CREATE FUNCTION `PERCENTAGE`
  (
  the_numerator DECIMAL,
  the_denominator DECIMAL
  )
RETURNS VARCHAR(15)
  NO SQL
BEGIN
  RETURN CONCAT(IFNULL(ROUND(100*the_numerator/the_denominator),0),'%');
END
$$
DELIMITER ;
;
select cad_num
, last_name
, first_name
, FORMAT(YEAR_DUTY_HOURS(subquery.member_id,2020),1) as 2020_duty_hours
, FORMAT(YEAR_BASE_OBLIGATION(jan_code,feb_code,mar_code,apr_code,may_code,jun_code,jul_code,aug_code,sep_code,oct_code,nov_code,dec_code),1) as 2020_base_obligation
, PERCENTAGE(YEAR_DUTY_HOURS(subquery.member_id,2020),ROUND(YEAR_BASE_OBLIGATION(jan_code,feb_code,mar_code,apr_code,may_code,jun_code,jul_code,aug_code,sep_code,oct_code,nov_code,dec_code),1)) as 2020_pct_of_base
, FORMAT(IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-01-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(jan_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-02-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(feb_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-03-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(mar_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-04-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(apr_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-05-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(may_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-06-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(jun_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-07-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(jul_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-08-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(aug_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-09-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(sep_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-10-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(oct_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-11-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(nov_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-12-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(dec_code),0))*12,1) as 2020_effective_obligation
, PERCENTAGE(YEAR_DUTY_HOURS(subquery.member_id,2020),ROUND(IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-01-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(jan_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-02-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(feb_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-03-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(mar_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-04-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(apr_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-05-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(may_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-06-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(jun_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-07-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(jul_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-08-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(aug_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-09-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(sep_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-10-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(oct_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-11-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(nov_code),0))*12 + IFNULL((select num_obliged_shifts from leave_of_absence where member_id = subquery.member_id and '2020-12-15' between start_date and end_date),IFNULL(MONTH_BASE_OBLIGATION(dec_code),0))*12,1)) as 2020_pct_of_effective

, MONTH_DUTY_HOURS(subquery.member_id,2020,1) as jan_duty_hours
, ENROLLMENT(jan_code) as jan_enrollment
, FORMAT(IFNULL(MONTH_BASE_OBLIGATION(jan_code)*12,0),1) as jan_base_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,1),MONTH_BASE_OBLIGATION(jan_code)*12) as jan_pct_of_base
, KIND_OF_LEAVE(subquery.member_id,2020,1) as jan_leave
, EFFECTIVE_OBLIGATION(subquery.member_id,2020,1,jan_code) as jan_effective_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,1),EFFECTIVE_OBLIGATION(subquery.member_id,2020,1,jan_code)) as jan_pct_of_effective

, MONTH_DUTY_HOURS(subquery.member_id,2020,2) as feb_duty_hours
, ENROLLMENT(feb_code) as feb_enrollment
, FORMAT(IFNULL(MONTH_BASE_OBLIGATION(feb_code)*12,0),1) as feb_base_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,2),MONTH_BASE_OBLIGATION(feb_code)*12) as feb_pct_of_base
, KIND_OF_LEAVE(subquery.member_id,2020,2) as feb_leave
, EFFECTIVE_OBLIGATION(subquery.member_id,2020,2,feb_code) as feb_effective_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,2),EFFECTIVE_OBLIGATION(subquery.member_id,2020,2,feb_code)) as feb_pct_of_effective

, MONTH_DUTY_HOURS(subquery.member_id,2020,3) as mar_duty_hours
, ENROLLMENT(mar_code) as mar_enrollment
, FORMAT(IFNULL(MONTH_BASE_OBLIGATION(mar_code)*12,0),1) as mar_base_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,3),MONTH_BASE_OBLIGATION(mar_code)*12) as mar_pct_of_base
, KIND_OF_LEAVE(subquery.member_id,2020,3) as mar_leave
, EFFECTIVE_OBLIGATION(subquery.member_id,2020,3,mar_code) as mar_effective_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,3),EFFECTIVE_OBLIGATION(subquery.member_id,2020,3,mar_code)) as mar_pct_of_effective

, MONTH_DUTY_HOURS(subquery.member_id,2020,4) as apr_duty_hours
, ENROLLMENT(apr_code) as apr_enrollment
, FORMAT(IFNULL(MONTH_BASE_OBLIGATION(apr_code)*12,0),1) as apr_base_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,4),MONTH_BASE_OBLIGATION(apr_code)*12) as apr_pct_of_base
, KIND_OF_LEAVE(subquery.member_id,2020,4) as apr_leave
, EFFECTIVE_OBLIGATION(subquery.member_id,2020,4,apr_code) as apr_effective_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,4),EFFECTIVE_OBLIGATION(subquery.member_id,2020,4,apr_code)) as apr_pct_of_effective

, MONTH_DUTY_HOURS(subquery.member_id,2020,5) as may_duty_hours
, ENROLLMENT(may_code) as may_enrollment
, FORMAT(IFNULL(MONTH_BASE_OBLIGATION(may_code)*12,0),1) as may_base_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,5),MONTH_BASE_OBLIGATION(may_code)*12) as may_pct_of_base
, KIND_OF_LEAVE(subquery.member_id,2020,5) as may_leave
, EFFECTIVE_OBLIGATION(subquery.member_id,2020,5,may_code) as may_effective_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,5),EFFECTIVE_OBLIGATION(subquery.member_id,2020,5,may_code)) as may_pct_of_effective

, MONTH_DUTY_HOURS(subquery.member_id,2020,6) as jun_duty_hours
, ENROLLMENT(jun_code) as jun_enrollment
, FORMAT(IFNULL(MONTH_BASE_OBLIGATION(jun_code)*12,0),1) as jun_base_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,6),MONTH_BASE_OBLIGATION(jun_code)*12) as jun_pct_of_base
, KIND_OF_LEAVE(subquery.member_id,2020,6) as jun_leave
, EFFECTIVE_OBLIGATION(subquery.member_id,2020,6,jun_code) as jun_effective_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,6),EFFECTIVE_OBLIGATION(subquery.member_id,2020,6,jun_code)) as jun_pct_of_effective

, MONTH_DUTY_HOURS(subquery.member_id,2020,7) as jul_duty_hours
, ENROLLMENT(jul_code) as jul_enrollment
, FORMAT(IFNULL(MONTH_BASE_OBLIGATION(jul_code)*12,0),1) as jul_base_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,7),MONTH_BASE_OBLIGATION(jul_code)*12) as jul_pct_of_base
, KIND_OF_LEAVE(subquery.member_id,2020,7) as jul_leave
, EFFECTIVE_OBLIGATION(subquery.member_id,2020,7,jul_code) as jul_effective_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,7),EFFECTIVE_OBLIGATION(subquery.member_id,2020,7,jul_code)) as jul_pct_of_effective

, MONTH_DUTY_HOURS(subquery.member_id,2020,8) as aug_duty_hours
, ENROLLMENT(aug_code) as aug_enrollment
, FORMAT(IFNULL(MONTH_BASE_OBLIGATION(aug_code)*12,0),1) as aug_base_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,8),MONTH_BASE_OBLIGATION(aug_code)*12) as aug_pct_of_base
, KIND_OF_LEAVE(subquery.member_id,2020,8) as aug_leave
, EFFECTIVE_OBLIGATION(subquery.member_id,2020,8,aug_code) as aug_effective_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,8),EFFECTIVE_OBLIGATION(subquery.member_id,2020,8,aug_code)) as aug_pct_of_effective

, MONTH_DUTY_HOURS(subquery.member_id,2020,9) as sep_duty_hours
, ENROLLMENT(sep_code) as sep_enrollment
, FORMAT(IFNULL(MONTH_BASE_OBLIGATION(sep_code)*12,0),1) as sep_base_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,9),MONTH_BASE_OBLIGATION(sep_code)*12) as sep_pct_of_base
, KIND_OF_LEAVE(subquery.member_id,2020,9) as sep_leave
, EFFECTIVE_OBLIGATION(subquery.member_id,2020,9,sep_code) as sep_effective_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,9),EFFECTIVE_OBLIGATION(subquery.member_id,2020,9,sep_code)) as sep_pct_of_effective

, MONTH_DUTY_HOURS(subquery.member_id,2020,10) as oct_duty_hours
, ENROLLMENT(oct_code) as oct_enrollment
, FORMAT(IFNULL(MONTH_BASE_OBLIGATION(oct_code)*12,0),1) as oct_base_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,10),MONTH_BASE_OBLIGATION(oct_code)*12) as oct_pct_of_base
, KIND_OF_LEAVE(subquery.member_id,2020,10) as oct_leave
, EFFECTIVE_OBLIGATION(subquery.member_id,2020,10,oct_code) as oct_effective_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,10),EFFECTIVE_OBLIGATION(subquery.member_id,2020,10,oct_code)) as oct_pct_of_effective

, MONTH_DUTY_HOURS(subquery.member_id,2020,11) as nov_duty_hours
, ENROLLMENT(nov_code) as nov_enrollment
, FORMAT(IFNULL(MONTH_BASE_OBLIGATION(nov_code)*12,0),1) as nov_base_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,11),MONTH_BASE_OBLIGATION(nov_code)*12) as nov_pct_of_base
, KIND_OF_LEAVE(subquery.member_id,2020,11) as nov_leave
, EFFECTIVE_OBLIGATION(subquery.member_id,2020,11,nov_code) as nov_effective_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,11),EFFECTIVE_OBLIGATION(subquery.member_id,2020,11,nov_code)) as nov_pct_of_effective

, MONTH_DUTY_HOURS(subquery.member_id,2020,12) as dec_duty_hours
, ENROLLMENT(dec_code) as dec_enrollment
, FORMAT(IFNULL(MONTH_BASE_OBLIGATION(dec_code)*12,0),1) as dec_base_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,12),MONTH_BASE_OBLIGATION(dec_code)*12) as dec_pct_of_base
, KIND_OF_LEAVE(subquery.member_id,2020,12) as dec_leave
, EFFECTIVE_OBLIGATION(subquery.member_id,2020,12,dec_code) as dec_effective_obligation
, PERCENTAGE(MONTH_DUTY_HOURS(subquery.member_id,2020,12),EFFECTIVE_OBLIGATION(subquery.member_id,2020,12,dec_code)) as dec_pct_of_effective
from
  (
  select member.id as member_id
  , cad_num
  , last_name
  , first_name
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-01-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as jan_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-02-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as feb_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-03-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as mar_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-04-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as apr_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-05-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as may_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-06-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as jun_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-07-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as jul_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-08-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as aug_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-09-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as sep_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-10-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as oct_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-11-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as nov_code
  , (select level_code from enrollment_history h join enrollment_level l on (l.code=h.level_code and l.pecking_order < 84) where member_id = member.id and '2020-12-15' between h.start_date and IFNULL(h.end_date,'9999-12-31') limit 1) as dec_code
  from member
  order by last_name, first_name, cad_num
  )
  as subquery
where (jan_code is not null and jan_code <> 23)
  or (feb_code is not null and feb_code <> 23)
  or (mar_code is not null and mar_code <> 23)
  or (apr_code is not null and apr_code <> 23)
  or (may_code is not null and may_code <> 23)
  or (jun_code is not null and jun_code <> 23)
  or (jul_code is not null and jul_code <> 23)
  or (aug_code is not null and aug_code <> 23)
  or (sep_code is not null and sep_code <> 23)
  or (oct_code is not null and oct_code <> 23)
  or (nov_code is not null and nov_code <> 23)
  or (dec_code is not null and dec_code <> 23)
;
DROP FUNCTION IF EXISTS `MONTH_DUTY_HOURS`
;
DROP FUNCTION IF EXISTS `YEAR_DUTY_HOURS`
;
DROP FUNCTION IF EXISTS `ENROLLMENT`
;
DROP FUNCTION IF EXISTS `MONTH_BASE_OBLIGATION`
;
DROP FUNCTION IF EXISTS `YEAR_BASE_OBLIGATION`
;
DROP FUNCTION IF EXISTS `KIND_OF_LEAVE`
;
DROP FUNCTION IF EXISTS `EFFECTIVE_OBLIGATION`
;
DROP FUNCTION IF EXISTS `PERCENTAGE`
;
COMMIT
