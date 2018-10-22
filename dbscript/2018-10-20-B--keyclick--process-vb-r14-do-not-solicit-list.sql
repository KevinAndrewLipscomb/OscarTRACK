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
insert into resident_to_not_solicit set address = '221 80th St', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '403 34th St Apt 107', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '500 Pacific Ave Unit 202', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2101 Parks Ave Ste 500', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '808 Kennedy Ave', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '700 Oriole Dr Apt 123A', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '791 Oriole Dr', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1284 Laskin Rd Apt 102', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1000 19th St', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = 'PO Box 1696', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '637 Phoenix Dr', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '3529  Lake Dr', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '4500 Holland Office Park Ste 318', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '301 Bendix Rd Ste 300', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '4160 Virginia Beach Blvd', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '233 Victoria Dr', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '321 Garrison Pl', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '501 Viking Dr', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1800 College Cres', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2828 Pleasant Acres Dr', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '806 Windom Pl', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2209 Sumberg Court', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2221 Plantation Dr', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2808 S Adventure Trl', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1060 First Colonial Rd', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1858 Duke of York Quay', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2425 Shorehaven Dr', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1233 Parkside Pl', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '940 General Stuart Dr', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1250 Bayne Dr', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1800 Tree Line Rd', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '900 First Colonial Rd Apt 334', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '316 Roselynn Ln', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '317 West Ln', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1514 Hill Meadow Ct', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1126 Charter Ct', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '572 Central Dr Ste 102', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1201 Faulkner Rd', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '895 Avatar Dr', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '4529 Guam St', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '3663 Marlin Bay Ct', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1370 Dunstan Ln', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1120 Daventry Pl', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '5620 Wesleyan Dr Apt 136', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '5345 Deford Rd', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2425 Nimmo Pkwy-Court Support', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = 'PO Box 6344', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2580 Atwoodtown Rd', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '941 Summerside Ct', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '5057 Thatcher Way', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2341 Tierra Monte Arch', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1364 Dalsbury Ln', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2649 Majesty Ln', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2401 Courthouse Dr Ste 9002', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2425 Nimmo Pkwy Ste 9017', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1 Municipal Ctr', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2405 Courthouse Dr', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2416 Courthouse Dr Bldg 19', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '249 Princess Anne Rd', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '2164 Pungo Ferry Rd', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1750 Tomcat Blvd Bldg 230/FLOOR', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '821 Baker Rd', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '961 Gas Light Ln', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '5445 Legacy Way', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '4525 Main St Ste 700', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '4208 Maplehurst Rd', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '4837 Afton Ct', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '747 Driskill Ct', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '5264 Lowery Downs', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
insert into resident_to_not_solicit set address = '1993 Sundevil Dr', city = 'Virginia Beach', state = 'Virginia', agency='VBVRS';
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
