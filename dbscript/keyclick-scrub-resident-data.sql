START TRANSACTION
;
delete from resident
where address1 not like "1%"
  and address1 not like "2%"
  and address1 not like "3%"
  and address1 not like "4%"
  and address1 not like "5%"
  and address1 not like "6%"
  and address1 not like "7%"
  and address1 not like "8%"
  and address1 not like "9%"
  and address1 not like "PO %"
  and address1 not like "P %"
  and name = "TO OUR NEIGHBORS AT"
  and id not in (select id from donation)
;
update resident
set name = REPLACE(name,"  "," ")
;
update resident
set address1 = REPLACE(address1,"P O BOX ","PO BOX ")
;
update resident
set address1 = REPLACE(address1," -","-")
where address1 REGEXP '^[0-9]+ -.+'
;
drop table if exists resident_address1_parse
;
CREATE TABLE resident_address1_parse
select id
 , LEFT(address1,LOCATE(" APT ",address1) - 1) as prefix
 , LEFT(address1,LOCATE(" ",address1) - 1) as house_num
 , SPACE(127) as street_name
 , SUBSTRING(address1,LOCATE(" APT ",address1) + LENGTH(" APT ")) as suffix
from resident
where address1 REGEXP '^[0-9]+.* APT .*'
UNION
select id
 , LEFT(address1,LOCATE(" STE ",address1) - 1) as prefix
 , LEFT(address1,LOCATE(" ",address1) - 1) as house_num
 , SPACE(127) as street_name
 , SUBSTRING(address1,LOCATE(" STE ",address1) + LENGTH(" STE ")) as suffix
from resident
where address1 REGEXP '^[0-9]+.* STE .*'
UNION
select id
 , LEFT(address1,LOCATE(" SUITE ",address1) - 1) as prefix
 , LEFT(address1,LOCATE(" ",address1) - 1) as house_num
 , SPACE(127) as street_name
 , SUBSTRING(address1,LOCATE(" SUITE ",address1) + LENGTH(" SUITE ")) as suffix
from resident
where address1 REGEXP '^[0-9]+.* SUITE .*'
UNION
select id
 , LEFT(address1,LOCATE(" UNIT ",address1) - 1) as prefix
 , LEFT(address1,LOCATE(" ",address1) - 1) as house_num
 , SPACE(127) as street_name
 , SUBSTRING(address1,LOCATE(" UNIT ",address1) + LENGTH(" UNIT ")) as suffix
from resident
where address1 REGEXP '^[0-9]+.* UNIT .*'
UNION
select id
 , LEFT(address1,LOCATE(" # ",address1) - 1) as prefix
 , LEFT(address1,LOCATE(" ",address1) - 1) as house_num
 , SPACE(127) as street_name
 , SUBSTRING(address1,LOCATE(" # ",address1) + LENGTH(" # ")) as suffix
from resident
where address1 REGEXP '^[0-9]+.* # .*'
;
update resident_address1_parse
set street_name = REPLACE(prefix,concat(house_num," "),"")
;
update resident
  join resident_address1_parse using (id)
set address1 = CONCAT(house_num,"-",suffix," ",street_name)
;
drop table if exists resident_address1_parse
;
update resident
set city = "VIRGINIA BEACH"
where city = "VA BEACH"
;
COMMIT