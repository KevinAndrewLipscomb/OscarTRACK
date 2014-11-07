START TRANSACTION
;
-- --
--
-- Scrub city table.
--
-- --
;
update resident_base
  join street on (street.id=resident_base.street_id)
  join city on (city.id=street.city_id)
set street_id = (select street.id from street join city on (city.id=street.city_id) where street.name = 'PO BOX' and city.name = 'GLOUCESTER POINT')
where city.name like 'GLOUCESTER PT'
;
delete from street where city_id = (select id from city where name = 'GLOUCESTER PT')
;
update street join city c on (c.id=street.city_id) set city_id = (select id from city where name = 'COLONIAL HEIGHTS' and state_id = c.state_id) where city_id = (select id from city where name = 'COLONIAL HGTS');
update street join city c on (c.id=street.city_id) set city_id = (select id from city where name = 'FAIRFAX STATION' and state_id = c.state_id) where city_id = (select id from city where name = 'FAIRFAX STA');
update street join city c on (c.id=street.city_id) set city_id = (select id from city where name = 'FREDERICKSBURG' and state_id = c.state_id) where city_id = (select id from city where name = 'FREDERICKSBRG');
update street join city c on (c.id=street.city_id) set city_id = (select id from city where name = 'GLOUCESTER POINT' and state_id = c.state_id) where city_id = (select id from city where name = 'GLOUCESTER PT');
update street join city c on (c.id=street.city_id) set city_id = (select id from city where name = 'MCLEAN' and state_id = c.state_id) where city_id = (select id from city where name = 'MC LEAN');
update street join city c on (c.id=street.city_id) set city_id = (select id from city where name = 'MECHANICSVILLE' and state_id = c.state_id) where city_id = (select id from city where name = 'MECHANICSVLLE');
update street join city c on (c.id=street.city_id) set city_id = (select id from city where name = 'PORTSMOUTH' and state_id = c.state_id) where city_id = (select id from city where name = 'PORSTMOUTH');
update street join city c on (c.id=street.city_id) set city_id = (select id from city where name = 'ST GEORGE' and state_id = c.state_id) where city_id = (select id from city where name = 'ST. GEORGE');
;
-- --
--
-- Scrub street table.
--
-- --
--
-- Perform TRIVIAL street scrubs.
--
;
update ignore street
set name = NORMALIZED_STREET_SUFFIX_RENDITION(name)
where name <> NORMALIZED_STREET_SUFFIX_RENDITION(name)
;
update ignore street set name = LEFT(name,LOCATE(' C/O ',name) - 1) where name like '% C/O %';
update ignore street set name = LEFT(name,LOCATE(' APT ',name) - 1) where name like '% APT %';
update ignore street set name = LEFT(name,LOCATE(' OFC ',name) - 1) where name like '% OFC %';
;
delete from resident_base
where street_id in (select id from street where name like '% C/O %')
  or street_id in (select id from street where name = '1608 1608 FOREST GLENN CIR')
  or street_id in (select id from street where name = 'GREAT NECK ROAD STATION 1272 BOX 168')
;
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = '24TH ST' and city_id = s.city_id) where street_id = (select id from street where name = '-24TH ST');
;
delete from street
where name like '% C/O %'
  or name in
    (
    '1608 1608 FOREST GLENN CIR',
    'SHORE DR 111',
    'SHORE DR PH 56',
    '-24TH ST',
    'GREAT NECK ROAD STATION 1272 BOX 168'
    )
;
--
-- Perform COMPLEX street scrubs.
--
-- ...where house_num must be updated
--
;
update resident_base set house_num = '4004-1412', street_id = (select id from street where name = 'OCEAN FRONT AVE' and city_id = 2) where id = '67562'; delete from street where name = 'OCEAN FRONT AVENUE APT 1412';
update resident_base set house_num = '952-101', street_id = (select id from street where name = '24TH ST' and city_id = 2) where id = '87454'; delete from street where name = '24TH ST OFC 101';
update resident_base set house_num = '352-101', street_id = (select id from street where name = 'FERNWOOD CT' and city_id = 2) where id = '94243'; delete from street where name = 'FERNWOOD CT OFC 101';
update resident_base set house_num = '5721-103', street_id = (select id from street where name = 'HAMPSHIRE LN' and city_id = 2) where id = '132882'; delete from street where name = 'HAMPSHIRE LN OFC 103';
update resident_base set house_num = '113-A', street_id = (select id from street where name = '88TH ST' and city_id = 2) where id = '63893'; delete from street where name = 'A 88TH ST';
update resident_base set house_num = '215-1/2-B', street_id = (select id from street where name = '76TH ST' and city_id = 2) where id = '65900'; delete from street where name = 'B 76TH ST';
update resident_base set house_num = '4404-1105', street_id = (select id from street where name = 'ATLANTIC AVE' and city_id = 2) where id = '67868'; delete from street where name = 'ATLANTIC AV 1105';
update resident_base set house_num = '5700-329', street_id = (select id from street where name = 'CLEVELAND ST' and city_id = 2) where id = '68518'; delete from street where name = 'CLEVELAND STEET SUTIE 329';
update resident_base set house_num = '2364-REAR-17', street_id = (select id from street where name = 'COVENT GARDEN RD' and city_id = 2) where id = '66391'; delete from street where name = 'COVENT GARDEN RD REAR 17';
update resident_base set house_num = '845-157', street_id = (select id from street where name = 'FIRST COLONIAL INN' and city_id = 2) where id = '69389'; delete from street where name = 'FIRST COLONIAL INN 157';
update resident_base set house_num = '685-546', street_id = (select id from street where name = 'FLEET DR' and city_id = 2) where id = '68793'; delete from street where name = 'FLEET DRIVE 546';
update resident_base set house_num = '411-201', street_id = (select id from street where name = 'HARBOUR POINTE CONDOS' and city_id = 2) where id = '67679'; delete from street where name = 'HARBOUR POINTE CONDOS 201';
update resident_base set house_num = '1604-202', street_id = (select id from street where name = 'HILLTOP WEST EXECUTIVE CENTER' and city_id = 2) where id = '64963'; delete from street where name = 'HILLTOP WEST EXECTIVE CENTER 202';
update resident_base set house_num = '1604-220', street_id = (select id from street where name = 'HILLTOP WEST EXECUTIVE CENTER' and city_id = 2) where id = '64965'; delete from street where name = 'HILLTOP WEST EXECUTIVE CENTER 220';
update resident_base set house_num = '1604-311', street_id = (select id from street where name = 'HILLTOP WEST EXECUTIVE CENTER' and city_id = 2) where id = '64966'; delete from street where name = 'HILLTOP WEST EXECUTIVE CENTER 311';
update resident_base set house_num = '2316-204', street_id = (select id from street where name = 'MARINERS WAY' and city_id = 2) where id = '66318'; delete from street where name = 'MARINERS WAY 204';
update resident_base set house_num = '4004-1601', street_id = (select id from street where name = 'OCEAN FRONT AVE' and city_id = 2) where id = '67564'; delete from street where name = 'OCEAN FRONT 1601';
update resident_base set house_num = '4004-504', street_id = (select id from street where name = 'OCEAN FRONT AVE' and city_id = 2) where id = '67563'; delete from street where name = 'OCEAN FRONT 504';
update resident_base set house_num = '4004-PH-5', street_id = (select id from street where name = 'OCEAN FRONT AVE' and city_id = 2) where id = '67561'; delete from street where name = 'OCEAN FRONT AVENUE PH 5';
update resident_base set house_num = '4004-602', street_id = (select id from street where name = 'OCEAN FRONT AVE' and city_id = 2) where id = '67567'; delete from street where name = 'OCEANFRONT AVENUE 602';
update resident_base set house_num = '1168-111', street_id = (select id from street where name = 'OLD DONATION PKWY' and city_id = 2) where id = '63990'; delete from street where name = 'OLD DONATION PARKWAY 111';
update resident_base set house_num = '1627-216', street_id = (select id from street where name = 'OLD DONATION PKWY' and city_id = 2) where id = '65033'; delete from street where name = 'OLD DONATION PARKWAY 216';
update resident_base set house_num = '817-406', street_id = (select id from street where name = 'SALTMEADOW BAY DR' and city_id = 2) where id = '69286'; delete from street where name = 'SALTMEADOW BAY 406';
update resident_base set house_num = '105-101', street_id = (select id from street where name = 'SEA TRACE CT' and city_id = 2) where id = '160173'; delete from street where name = 'SEA TRACE CT 101';
update resident_base set house_num = '9851', street_id = (select id from street where name = 'PO BOX' and city_id = 2) where id = '154083'; delete from street where name = 'P O OX 9851';
--
-- Perform MORE COMPLEX street scrubs.
--
;
update donation set id = 7260 where id = 51056;
update donation set id = 9994 where id = 50625;
update donation set id = 41316 where id = 18087;
;
select @name := name from resident_base where id = 51056; update resident_base set name = @name where id = 7260;
select @name := name from resident_base where id = 50625; update resident_base set name = @name where id = 9994;
select @name := name from resident_base where id = 18087; update resident_base set name = @name where id = 41316;
select @name := name from resident_base where id = 69511; update resident_base set name = @name where id = 98533;
select @name := name from resident_base where id = 67271; update resident_base set name = @name where id = 79203;
select @name := name from resident_base where id = 160178; update resident_base set name = @name where id = 86452;
;
delete from resident_base where id in (74287,51056,50625,18087,69511,67271,160178)
;
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'FIRST COLONIAL RD' and city_id = s.city_id) where street_id = (select id from street where name = '1ST COLONIAL RD');
;
delete from street
where name in ('1ST COLONIAL RD','25-1/2TH ST')
;
-- --
--
-- NORMALIZED STREET SUFFIX RENDITIONS must be managed *after* any parts to the right of the street suffix have been eliminated.
--
-- --
--
-- The following list of statements was generated by running the following query AFTER performing the above SIMPLE street scrubs:
--
-- select id
-- , name
-- , NORMALIZED_STREET_SUFFIX_RENDITION(name)
-- , CONCAT("update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = '",NORMALIZED_STREET_SUFFIX_RENDITION(name),"' and city_id = s.city_id) where street_id = (select id from street where name = '",name,"');") as statement
-- from street
-- where name <> NORMALIZED_STREET_SUFFIX_RENDITION(name)
--
;
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = '19TH ST' and city_id = s.city_id) where street_id = (select id from street where name = '19TH STREET');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = '21ST ST' and city_id = s.city_id) where street_id = (select id from street where name = '21ST ST,');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = '35TH ST' and city_id = s.city_id) where street_id = (select id from street where name = '35TH STREET');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = '44TH ST' and city_id = s.city_id) where street_id = (select id from street where name = '44TH STREET');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = '66TH ST' and city_id = s.city_id) where street_id = (select id from street where name = '66TH STREET');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = '67TH ST' and city_id = s.city_id) where street_id = (select id from street where name = '67TH STREET');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = '70TH ST' and city_id = s.city_id) where street_id = (select id from street where name = '70TH STREET');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = '86TH ST' and city_id = s.city_id) where street_id = (select id from street where name = '86TH STREET');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'ASPEN CIR' and city_id = s.city_id) where street_id = (select id from street where name = 'ASPEN CIRCLE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'ATLANTIC AVE' and city_id = s.city_id) where street_id = (select id from street where name = 'ATLANTIC AV');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'ATLANTIC AVE' and city_id = s.city_id) where street_id = (select id from street where name = 'ATLANTIC AVENUE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'BAY COLONY DR' and city_id = s.city_id) where street_id = (select id from street where name = 'BAY COLONY DRIVE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'BAY SHORE DR' and city_id = s.city_id) where street_id = (select id from street where name = 'BAY SHORE DRIVE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'BAYCLIFF DR' and city_id = s.city_id) where street_id = (select id from street where name = 'BAYCLIFF DRIVE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'BELVOIR LN' and city_id = s.city_id) where street_id = (select id from street where name = 'BELVOIR LANE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'BREEZY RD' and city_id = s.city_id) where street_id = (select id from street where name = 'BREEZY ROAD');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'CREEKS EDGE DR' and city_id = s.city_id) where street_id = (select id from street where name = 'CREEKS EDGE DRIVE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'DISCOVERY RD' and city_id = s.city_id) where street_id = (select id from street where name = 'DISCOVERY ROAD');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'FARMINGTON RD' and city_id = s.city_id) where street_id = (select id from street where name = 'FARMINGTON ROAD');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'FERRELL PKWY' and city_id = s.city_id) where street_id = (select id from street where name = 'FERRELL PWKY');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'FLEMING DR' and city_id = s.city_id) where street_id = (select id from street where name = 'FLEMING DRIVE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'GARDEN DR' and city_id = s.city_id) where street_id = (select id from street where name = 'GARDEN DRIVE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'GOLDSBORO AVE' and city_id = s.city_id) where street_id = (select id from street where name = 'GOLDSBORO AVENUE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'HILLTOP WEST EXECUTIVE CENTER' and city_id = s.city_id) where street_id = (select id from street where name = 'HILLTOP WEST, EXECUTIVE CENTER');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'INLYNNVIEW RD' and city_id = s.city_id) where street_id = (select id from street where name = 'INLYNNVIEW ROAD');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'MARSHALL LN' and city_id = s.city_id) where street_id = (select id from street where name = 'MARSHALL LANE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'MARYLAND AVE' and city_id = s.city_id) where street_id = (select id from street where name = 'MARYLAND AVENUE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'MEADOW LAKE RD' and city_id = s.city_id) where street_id = (select id from street where name = 'MEADOW LAKE ROAD');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'OCEAN HILLS CT' and city_id = s.city_id) where street_id = (select id from street where name = 'OCEAN HILLS COURT');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'PENSIVE CT' and city_id = s.city_id) where street_id = (select id from street where name = 'PENSIVE COURT');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'PINEY MARSH CT' and city_id = s.city_id) where street_id = (select id from street where name = 'PINEY MARSH COURT');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'PLANTATION DR' and city_id = s.city_id) where street_id = (select id from street where name = 'PLANTATION DRIVE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'REAGAN AVE' and city_id = s.city_id) where street_id = (select id from street where name = 'REAGAN AVE.');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'SALEM SPRINGS WAY' and city_id = s.city_id) where street_id = (select id from street where name = 'SALEM SPRINGS WY');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'TEAL CRES' and city_id = s.city_id) where street_id = (select id from street where name = 'TEAL CRESCENT');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'TREEFERN PL' and city_id = s.city_id) where street_id = (select id from street where name = 'TREEFERN PLACE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'VIRGINIA BEACH BLVD' and city_id = s.city_id) where street_id = (select id from street where name = 'VIRGINIA BEACH BOULEVARD');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'WHITEHAVEN RD' and city_id = s.city_id) where street_id = (select id from street where name = 'WHITEHAVEN ROAD');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'WINDOM PL' and city_id = s.city_id) where street_id = (select id from street where name = 'WINDOM PLACE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'WINTHROPE DR' and city_id = s.city_id) where street_id = (select id from street where name = 'WINTHROPE DRIVE');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'WOLFSNARE DR' and city_id = s.city_id) where street_id = (select id from street where name = 'WOLFSNARE DR.');
update resident_base join street s on (s.id=resident_base.street_id) set street_id = (select id from street where name = 'GRANBY ST' and city_id = s.city_id) where street_id = (select id from street where name = 'GRANBY STREET');
;
delete from street where name <> NORMALIZED_STREET_SUFFIX_RENDITION(name)
;
COMMIT