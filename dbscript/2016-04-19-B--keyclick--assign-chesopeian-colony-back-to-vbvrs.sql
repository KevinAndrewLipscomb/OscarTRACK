START TRANSACTION
;
update resident_base
  join street on (street.id=resident_base.street_id)
set agency = 'VBVRS'
where street.name like 'chesopeian %'
  or street.name like 'dix inlet %'
  or street.name like 'cattayle %'
  or street.name like 'west point %'
  or street.name like 'shepherds q%'
  or street.name = 'pine ridge ln'
  or street.name like 'sandy valley %'
  or street.name like 'mulberry grove %'
  or street.name like 'timber neck %'
  or street.name like 'chester forest %'
  or street.name like '_ kings %'
  or street.name like 'apasus %'
  or street.name like 'queen anne %'
  or street.name like 'tarkill %'
  or street.name = 'crawford pl'
  or street.name like 'colony pines %'
  or street.name like 'little pine %'
  or
    (
      street.name = 'virginia beach blvd'
    and
      (house_num like '26__%' or house_num like '27__%' or house_num like '28__%')
    )
;
COMMIT
