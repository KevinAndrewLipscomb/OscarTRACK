START TRANSACTION
;
delete from resident_base
where agency = 'VBVRS'
  and id not in (select distinct id from donation)
;
COMMIT
