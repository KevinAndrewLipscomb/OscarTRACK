--
-- The following code generates conversion parameters.  Its results should be placed in the keyclick--scrub-landing-streets spreadsheet.  You should run this code AFTER deleting
-- trespass records.
--
set @topic := 'LORDS';
select @topic as street
, bad.house_num
, bad.id as bad_id
, bad.name as bad_name
, good.id as good_id
, good.name as good_name
from
  (
  select house_num
  , resident_base.id as id
  , resident_base.name as name
  from resident_base
    join street on (street.id=resident_base.street_id)
  where street.name = 'LORDS LDNG'
  )
  as bad
left join
  (
  select house_num
  , resident_base.id as id
  , resident_base.name as name
  from resident_base
    join street on (street.id=resident_base.street_id)
  where street.name = 'LORDS LNDG'
  )
  as good
on (good.house_num=bad.house_num)

--
-- The following code is the formatted version of the ~sql~ that should be placed in a =CONCATENATE(~sql~) formula in the keyclick--scrub-landing-streets spreadsheet for
-- addresses that have BOTH a bad and good street representation.
--
-- For addresses that only have a BAD street representation, only the "update resident_base" statement is necessary.
--
START TRANSACTION
;
update donation set id = '";E2;"' where id = '";C2;"'
;
update resident_journal set timestamp = timestamp, id = '";E2;"' where id = '";C2;"'
;
update web_donor set resident_id = '";E2;"' where resident_id = '";C2;"'
;
update resident_base set name = NULLIF('";H2;"','') where id = '";E2;"'
;
delete from resident_base where id = '";C2;"'
;
COMMIT
;

--
-- The following code -- intended to be kept in sync with the formatted version above -- shows the unformatted =CONCATENATE() formulas that should be placed in the spreadsheet.
--
=concatenate("START TRANSACTION; update donation set id = '";E2;"' where id = '";C2;"'; update resident_journal set timestamp = timestamp, id = '";E2;"' where id = '";C2;"'; update web_donor set resident_id = '";E2;"' where resident_id = '";C2;"'; update resident_base set name = NULLIF('";H2;"','') where id = '";E2;"'; delete from resident_base where id = '";C2;"'; COMMIT;")
=concatenate("START TRANSACTION; update resident_base set street_id = (select id from street where name = '";A2;" LNDG' and city_id = (select id from city where name = 'VIRGINIA BEACH')) where id = '";C2;"'; COMMIT;")
