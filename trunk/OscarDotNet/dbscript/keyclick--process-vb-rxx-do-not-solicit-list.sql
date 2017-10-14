START TRANSACTION
;
drop table if exists resident_to_not_solicit
;
CREATE  TABLE `resident_to_not_solicit`
  (
    `name` VARCHAR(50) NULL -- leave in
  ,
    `address` VARCHAR(144) NOT NULL
  ,
    `city` VARCHAR(127) NULL
  ,
    `state` VARCHAR(127) NULL
  ,
    `agency` ENUM('KVRS','PVRS','DCVRS','PACHVRS','CBVRS','VBVRS','OPVRS','CVRS','BVRS','SVRS') NOT NULL
  ,
    `state_id` BIGINT UNSIGNED
  ,
    `city_id` BIGINT UNSIGNED
  ,
    `house_num` VARCHAR(15)
  ,
    `street_id` BIGINT UNSIGNED
  ,
    `post_directional` VARCHAR(2)
  )
;
-- --
--
--
-- Insert output column from spreadsheet(s) below this comment.
--
-- --
;
;
-- --
--
--
-- Insert output column from spreadsheet(s) above this comment.
--
-- --
;
--
-- STATE
--
;
update resident_to_not_solicit set state = 'VA' where state = 'VIRGINIA'
;
update resident_to_not_solicit join state on (state.abbreviation=resident_to_not_solicit.state) set state_id = state.id
;
--
-- CITY
--
;
update resident_to_not_solicit set city = "VIRGINIA BEACH" where city = "VIRGINIA BCH"
;
update resident_to_not_solicit join city on (city.name=resident_to_not_solicit.city and city.state_id=resident_to_not_solicit.state_id) set city_id = city.id
;
--
-- Scrub address
--
;
update resident_to_not_solicit set address = REPLACE(address,'  ',' ')
;
update resident_to_not_solicit set address = REPLACE(address,' 1/2','-1/2')
;
update resident_to_not_solicit set address = REPLACE(address,'- ','-')
;
update resident_import set address = REPLACE(address,'1/2TH ','1/2 ')
;
update resident_import set address = REPLACE(address,'TH-1/2 ','-1/2 ')
;
update resident_import set address = REPLACE(address,' APT. ',' APT ')
;
update resident_import set address = REPLACE(address,' PH-',' PH ')
;
--
-- Extricate house_num and street from the address field, and convert Sub-Unit Designator phrases into house_num suffixes.
--
;
update ignore resident_to_not_solicit
set house_num = LEFT(address,LOCATE(' ',address) - 1)
 , address = SUBSTRING(address,LOCATE(' ',address) + 1)
where address REGEXP '^[0-9].+'
;
update ignore resident_to_not_solicit
set house_num = SUBSTRING(address,LOCATE('PO BOX ',address) + 7)
 , address = 'PO BOX'
where address like 'PO BOX %'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' APT ',address) + LENGTH(' APT ')))
, address = LEFT(address,LOCATE(' APT ',address) - 1)
where address REGEXP '^.* APT .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' BLDG ',address) + LENGTH(' BLDG ')))
, address = LEFT(address,LOCATE(' BLDG ',address) - 1)
where address REGEXP '^.* BLDG .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' DEPT ',address) + LENGTH(' DEPT ')))
, address = LEFT(address,LOCATE(' DEPT ',address) - 1)
where address REGEXP '^.* DEPT .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' FL ',address) + LENGTH(' FL ')))
, address = LEFT(address,LOCATE(' FL ',address) - 1)
where address REGEXP '^.* FL .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' HNGR ',address) + LENGTH(' HNGR ')))
, address = LEFT(address,LOCATE(' HNGR ',address) - 1)
where address REGEXP '^.* HNGR .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' LOT ',address) + LENGTH(' LOT ')))
, address = LEFT(address,LOCATE(' LOT ',address) - 1)
where address REGEXP '^.* LOT .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' PH ',address) + LENGTH(' PH ')))
, address = LEFT(address,LOCATE(' PH ',address) - 1)
where address REGEXP '^.* PH .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' PIER ',address) + LENGTH(' PIER ')))
, address = LEFT(address,LOCATE(' PIER ',address) - 1)
where address REGEXP '^.* PIER .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' RM ',address) + LENGTH(' RM ')))
, address = LEFT(address,LOCATE(' RM ',address) - 1)
where address REGEXP '^.* RM .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' SLIP ',address) + LENGTH(' SLIP ')))
, address = LEFT(address,LOCATE(' SLIP ',address) - 1)
where address REGEXP '^.* SLIP .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' SPC ',address) + LENGTH(' SPC ')))
, address = LEFT(address,LOCATE(' SPC ',address) - 1)
where address REGEXP '^.* SPC .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' STE ',address) + LENGTH(' STE ')))
, address = LEFT(address,LOCATE(' STE ',address) - 1)
where address REGEXP '^.* STE .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' STOP ',address) + LENGTH(' STOP ')))
, address = LEFT(address,LOCATE(' STOP ',address) - 1)
where address REGEXP '^.* STOP .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' SUITE ',address) + LENGTH(' SUITE ')))
, address = LEFT(address,LOCATE(' SUITE ',address) - 1)
where address REGEXP '^.* SUITE .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' UNIT ',address) + LENGTH(' UNIT ')))
, address = LEFT(address,LOCATE(' UNIT ',address) - 1)
where address REGEXP '^.* UNIT .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' # ',address) + LENGTH(' # ')))
, address = LEFT(address,LOCATE(' # ',address) - 1)
where address REGEXP '^.* # .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' #',address) + LENGTH(' #')))
, address = LEFT(address,LOCATE(' #',address) - 1)
where address REGEXP '^.* #.*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' TRLR ',address) + LENGTH(' TRLR ')))
, address = LEFT(address,LOCATE(' TRLR ',address) - 1)
where address REGEXP '^.* TRLR .*'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-","BSMT")
, address = LEFT(address,LOCATE(' BSMT',address) - 1)
where address REGEXP '^.* BSMT$'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-","FRNT")
, address = LEFT(address,LOCATE(' FRNT',address) - 1)
where address REGEXP '^.* FRNT$'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-","LBBY")
, address = LEFT(address,LOCATE(' LBBY',address) - 1)
where address REGEXP '^.* LBBY$'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-","LOWR")
, address = LEFT(address,LOCATE(' LOWR',address) - 1)
where address REGEXP '^.* LOWR$'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-","OFC")
, address = LEFT(address,LOCATE(' OFC',address) - 1)
where address REGEXP '^.* OFC$'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-","PH")
, address = LEFT(address,LOCATE(' PH',address) - 1)
where address REGEXP '^.* PH$'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-","REAR")
, address = LEFT(address,LOCATE(' REAR',address) - 1)
where address REGEXP '^.* REAR$'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-","SIDE")
, address = LEFT(address,LOCATE(' SIDE',address) - 1)
where address REGEXP '^.* SIDE$'
;
update ignore resident_to_not_solicit
set house_num = concat(house_num,"-","UPPR")
, address = LEFT(address,LOCATE(' UPPR',address) - 1)
where address REGEXP '^.* UPPR$'
;
--
-- Extricate "post-directionals" (such as CENTERVILLE TPKE N) so we can normalize street suffixes.
--
;
update ignore resident_to_not_solicit
set post_directional = 'N'
, address = LEFT(address,LENGTH(address) - LENGTH(' N'))
where address REGEXP '^.* N$'
;
update ignore resident_to_not_solicit
set post_directional = 'NE'
, address = LEFT(address,LENGTH(address) - LENGTH(' NE'))
where address REGEXP '^.* NE$'
;
update ignore resident_to_not_solicit
set post_directional = 'E'
, address = LEFT(address,LENGTH(address) - LENGTH(' E'))
where address REGEXP '^.* E$'
;
update ignore resident_to_not_solicit
set post_directional = 'SE'
, address = LEFT(address,LENGTH(address) - LENGTH(' SE'))
where address REGEXP '^.* SE$'
;
update ignore resident_to_not_solicit
set post_directional = 'S'
, address = LEFT(address,LENGTH(address) - LENGTH(' S'))
where address REGEXP '^.* S$'
;
update ignore resident_to_not_solicit
set post_directional = 'SW'
, address = LEFT(address,LENGTH(address) - LENGTH(' SW'))
where address REGEXP '^.* SW$'
;
update ignore resident_to_not_solicit
set post_directional = 'W'
, address = LEFT(address,LENGTH(address) - LENGTH(' W'))
where address REGEXP '^.* W$'
;
update ignore resident_to_not_solicit
set post_directional = 'NW'
, address = LEFT(address,LENGTH(address) - LENGTH(' NW'))
where address REGEXP '^.* NW$'
;
--
-- Normalized street name suffixes.
--
;
update ignore resident_to_not_solicit set address = NORMALIZED_STREET_SUFFIX_RENDITION(address)
;
--
-- Reattach post-directionals to the end of address.
--
;
update ignore resident_to_not_solicit set address = CONCAT(address,' ',post_directional) where post_directional is not null
;
--
-- STREET
--
;
update resident_to_not_solicit join street on (street.name=resident_to_not_solicit.address and street.city_id=resident_to_not_solicit.city_id) set street_id = street.id
;
--
-- Perform additional nit-picks made easier by the extrication of house_num and street
--
delete from resident_to_not_solicit where name is null and house_num is null
;
--
-- DELETE resident_to_not_solicit FROM resident_base
--
;
delete resident_base
from resident_base
  join resident_to_not_solicit
    on (resident_to_not_solicit.street_id=resident_base.street_id and resident_to_not_solicit.house_num=resident_base.house_num and resident_to_not_solicit.agency=resident_base.agency)
;
COMMIT
