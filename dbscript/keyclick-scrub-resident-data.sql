START TRANSACTION
;
 delete from resident_base
 where house_num not like '1%'
   and house_num not like '2%'
   and house_num not like '3%'
   and house_num not like '4%'
   and house_num not like '5%'
   and house_num not like '6%'
   and house_num not like '7%'
   and house_num not like '8%'
   and house_num not like '9%'
   and street_id not in (select id from street where name = 'PO BOX')
   and name is null
   and id not in (select id from donation)
;
 update resident_base set name = REPLACE(name,'  ',' ')
;
 update resident_base set house_num = REPLACE(house_num,' -','-')
;
 update resident_base set house_num = REPLACE(house_num,'- ','-')
;
 drop table if exists resident_address1_parse
;
 CREATE TABLE resident_address1_parse
  (
  id mediumint not null,
  prefix varchar(143),
  house_num varchar(143),
  street_name varchar(127),
  suffix varchar(143)
  )
;
insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' APT ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' APT ',address1) + LENGTH(' APT ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* APT .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' BLDG ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' BLDG ',address1) + LENGTH(' BLDG ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* BLDG .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' DEPT ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' DEPT ',address1) + LENGTH(' DEPT ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* DEPT .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' FL ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' FL ',address1) + LENGTH(' FL ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* FL .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' HNGR ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' HNGR ',address1) + LENGTH(' HNGR ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* HNGR .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' LOT ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' LOT ',address1) + LENGTH(' LOT ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* LOT .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' PIER ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' PIER ',address1) + LENGTH(' PIER ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* PIER .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' RM ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' RM ',address1) + LENGTH(' RM ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* RM .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' SLIP ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' SLIP ',address1) + LENGTH(' SLIP ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* SLIP .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' SPC ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' SPC ',address1) + LENGTH(' SPC ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* SPC .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' STE ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' STE ',address1) + LENGTH(' STE ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* STE .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' STOP ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' STOP ',address1) + LENGTH(' STOP ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* STOP .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' SUITE ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' SUITE ',address1) + LENGTH(' SUITE ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* SUITE .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' UNIT ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' UNIT ',address1) + LENGTH(' UNIT ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* UNIT .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' # ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' # ',address1) + LENGTH(' # ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* # .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' TRLR ',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , SUBSTRING(address1,LOCATE(' TRLR ',address1) + LENGTH(' TRLR ')) as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* TRLR .*'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' BSMT',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , 'BSMT' as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* BSMT$'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' FRNT',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , 'FRNT' as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* FRNT$'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' LBBY',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , 'LBBY' as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* LBBY$'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' LOWR',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , 'LOWR' as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* LOWR$'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' OFC',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , 'OFC' as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* OFC$'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' REAR',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , 'REAR' as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* REAR$'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' SIDE',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , 'SIDE' as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* SIDE$'
 ; insert ignore resident_address1_parse
 select id
   , LEFT(address1,LOCATE(' UPPR',address1) - 1) as prefix
   , LEFT(address1,LOCATE(' ',address1) - 1) as house_num
   , NULL as street_name
   , 'UPPR' as suffix
 from resident
 where address1 REGEXP '^[0-9]+.* UPPR$'
;
 update resident_address1_parse set street_name = REPLACE(prefix,concat(house_num,' '),'')
;
 insert ignore street (name,city_id)
 select distinct street_name
   , city_id
 from resident_address1_parse
   join resident_base on (resident_base.id=resident_address1_parse.id)
   join street on (street.id=resident_base.street_id)
;
 update resident_base join resident_address1_parse using (id)
 set resident_base.house_num = CONCAT(resident_address1_parse.house_num,'-',suffix)
  , street_id = (select id from street where name = street_name)
;
 drop table if exists resident_address1_parse
;
 delete from street where id not in (select distinct street_id from resident_base)
;
 delete from city where id not in (select distinct city_id from street)
;
 delete from state where id not in (select distinct state_id from city)
;
 COMMIT