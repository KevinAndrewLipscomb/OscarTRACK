START TRANSACTION
;
 drop table if exists resident_sud_parse
;
 CREATE TABLE resident_sud_parse
  (
  id mediumint not null,
  prefix varchar(143),
  suffix varchar(143)
  )
  ENGINE=InnoDB
;
insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' APT ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' APT ',street.name) + LENGTH(' APT ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* APT .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' BLDG ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' BLDG ',street.name) + LENGTH(' BLDG ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* BLDG .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' DEPT ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' DEPT ',street.name) + LENGTH(' DEPT ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* DEPT .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' FL ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' FL ',street.name) + LENGTH(' FL ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* FL .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' HNGR ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' HNGR ',street.name) + LENGTH(' HNGR ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* HNGR .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' LOT ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' LOT ',street.name) + LENGTH(' LOT ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* LOT .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' PIER ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' PIER ',street.name) + LENGTH(' PIER ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* PIER .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' RM ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' RM ',street.name) + LENGTH(' RM ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* RM .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' SLIP ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' SLIP ',street.name) + LENGTH(' SLIP ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* SLIP .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' SPC ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' SPC ',street.name) + LENGTH(' SPC ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* SPC .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' STE ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' STE ',street.name) + LENGTH(' STE ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* STE .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' STOP ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' STOP ',street.name) + LENGTH(' STOP ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* STOP .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' SUITE ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' SUITE ',street.name) + LENGTH(' SUITE ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* SUITE .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' UNIT ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' UNIT ',street.name) + LENGTH(' UNIT ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* UNIT .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' # ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' # ',street.name) + LENGTH(' # ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* # .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' TRLR ',street.name) - 1) as prefix
   , SUBSTRING(street.name,LOCATE(' TRLR ',street.name) + LENGTH(' TRLR ')) as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* TRLR .*'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' BSMT',street.name) - 1) as prefix
   , 'BSMT' as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* BSMT$'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' FRNT',street.name) - 1) as prefix
   , 'FRNT' as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* FRNT$'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' LBBY',street.name) - 1) as prefix
   , 'LBBY' as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* LBBY$'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' LOWR',street.name) - 1) as prefix
   , 'LOWR' as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* LOWR$'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' OFC',street.name) - 1) as prefix
   , 'OFC' as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* OFC$'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' REAR',street.name) - 1) as prefix
   , 'REAR' as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* REAR$'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' SIDE',street.name) - 1) as prefix
   , 'SIDE' as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* SIDE$'
 ;
 insert ignore resident_sud_parse
 select resident_base.id
   , LEFT(street.name,LOCATE(' UPPR',street.name) - 1) as prefix
   , 'UPPR' as suffix
 from resident_base
   join street on (street.id=resident_base.street_id)
 where street.name REGEXP '^.* UPPR$'
;
 insert ignore street (name,city_id)
 select distinct prefix
   , city_id
 from resident_sud_parse
   join resident_base on (resident_base.id=resident_sud_parse.id)
   join street on (street.id=resident_base.street_id)
;
 update resident_base join resident_sud_parse using (id)
 set resident_base.house_num = CONCAT(resident_base.house_num,'-',suffix)
  , street_id = (select id from street where name = prefix)
;
 drop table if exists resident_sud_parse
;
 delete from street where id not in (select distinct street_id from resident_base)
;
 delete from city where id not in (select distinct city_id from street)
;
 delete from state where id not in (select distinct state_id from city)
;
 COMMIT