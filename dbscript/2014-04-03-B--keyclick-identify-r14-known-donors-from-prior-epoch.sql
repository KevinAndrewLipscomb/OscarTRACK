START TRANSACTION
;
insert ignore donation (id,amount,note,entered_by,per_clerk_seq_num)
select id
, 1 as amount
, 'Identified as a donor in external data import' as note
, 'OscarTRACK' as entered_by
, @n := @n + 1 as per_clerk_seq_num
from (select @n := max(per_clerk_seq_num) from donation where entered_by = 'OscarTRACK') as init, resident_base
where name is not null
  and agency = 'VBVRS'
;
COMMIT