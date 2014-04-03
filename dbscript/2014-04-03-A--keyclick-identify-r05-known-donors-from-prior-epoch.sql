START TRANSACTION
;
insert ignore donation (id,amount,note,entered_by,per_clerk_seq_num)
select id
, 1 as amount
, 'Identified as a donor in external data import' as note
, 'OscarTRACK' as entered_by
, @n := @n + 1 as per_clerk_seq_num
from (select @n := 0) as init, resident_base
where ((id between 51076 and 54252) or (id = 66634))
  and agency = 'PACHVRS'
;
COMMIT