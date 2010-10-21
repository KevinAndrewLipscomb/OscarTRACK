START TRANSACTION
;
--
-- Drops
--
drop table if exists street_section
;
drop table if exists zip5
;
drop table if exists resident_base
;
DROP TABLE IF EXISTS `street`;
;
DROP TABLE IF EXISTS `city`;
;
DROP TABLE IF EXISTS `state`;
;
--
--
--
create table resident_base select * from resident
;
--
-- Nit-pick resident_base
--
ALTER TABLE `resident_base` CHANGE COLUMN `name` `name` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;
update resident_base set name = NULL where name = "TO OUR NEIGHBORS AT"
;
update resident_base set name = "THOMAS CECELIA", city = "VIRGINIA BEACH" where address1 = "5204 ALBRIGHT DR"
;
update resident_base set address1 = REPLACE(address1,'  ',' ')
;
update resident_base set address1 = REPLACE(address1,' 1/2','-1/2')
;
update resident_base set address1 = REPLACE(address1,'- ','-')
;
update resident_base set address1 = 'PO BOX 62247' where id = 33911
;
update resident_base set state = "NO" where state = ""
;
update donation set id =  1419 where id in (1422);
update donation set id =  1421 where id in (1414);
update donation set id =  2505 where id in (2501,2502,2503,2504,2506,2507);
update donation set id =  2527 where id in (2511);
update donation set id =  2532 where id in (2512,2515,2517,2519,2524,2525,2531);
update donation set id =  2551 where id in (2554);
update donation set id =  2553 where id in (2550);
update donation set id =  2793 where id in (2792);
update donation set id =  7351 where id in (7356);
update donation set id =  7818 where id in (35962);
update donation set id = 10943 where id in (36010);
update donation set id = 14860 where id in (36441);
update donation set id = 15278 where id in (26978);
update donation set id = 15767 where id in (36001);
update donation set id = 16095 where id in (32188);
update donation set id = 16552 where id in (36325);
update donation set id = 16890 where id in (36134);
update donation set id = 17457 where id in (35992);
update donation set id = 18263 where id in (36311);
update donation set id = 18548 where id in (35059);
update donation set id = 19233 where id in (35975);
update donation set id = 19276 where id in (36448);
update donation set id = 19626 where id in (36005);
update donation set id = 20341 where id in (35985);
update donation set id = 25814 where id in (36013);
update donation set id = 26029 where id in (36428);
update donation set id = 26792 where id in (26791);
update donation set id = 34068 where id in (36322);
update donation set id = 35384 where id in (35382,35383,35386,35388);
update donation set id = 35911 where id in (35910);
update donation set id = 35970 where id in (17241);
update donation set id = 35991 where id in (1383,1399);
update donation set id = 36006 where id in (643);
update donation set id = 36400 where id in (36396,36398);
update donation set id = 36427 where id in (7620,35961);
update donation set id = 36439 where id in (8203);
update donation set id = 36442 where id in (29702);
update donation set id = 36443 where id in (10088);
update donation set id = 36445 where id in (36446);
update donation set id = 39771 where id in (51053);
update donation set id = 50148 where id in (16540);
update donation set id = 50917 where id in (7773);
;
delete from resident_base where id in
  (
  278,
  282,
  643,
  1383,
  1392,
  1399,
  1408,
  1409,
  1410,
  1411,
  1414,
  1422,
  1423,
  1427,
  1428,
  1595,
  2486,
  2487,
  2488,
  2489,
  2490,
  2491,
  2492,
  2494,
  2495,
  2496,
  2497,
  2498,
  2499,
  2501,
  2502,
  2503,
  2504,
  2506,
  2507,
  2509,
  2510,
  2511,
  2512,
  2513,
  2514,
  2515,
  2516,
  2517,
  2518,
  2519,
  2520,
  2522,
  2523,
  2524,
  2525,
  2526,
  2528,
  2529,
  2530,
  2531,
  2538,
  2545,
  2547,
  2548,
  2549,
  2550,
  2552,
  2554,
  2555,
  2666,
  2792,
  6229,
  7356,
  7620,
  7773,
  8203,
  9607,
  10088,
  10463,
  11474,
  15251,
  15429,
  16540,
  17241,
  26791,
  26978,
  29702,
  32188,
  34892,
  34899,
  35008,
  35059,
  35096,
  35179,
  35323,
  35382,
  35383,
  35386,
  35388,
  35390,
  35393,
  35394,
  35410,
  35529,
  35477,
  35674,
  35773,
  35910,
  35960,
  35961,
  35962,
  35963,
  35965,
  35972,
  35973,
  35975,
  35980,
  35985,
  35989,
  35992,
  35996,
  35997,
  35999,
  36001,
  36002,
  36003,
  36005,
  36010,
  36013,
  36126,
  36134,
  36200,
  36203,
  36209,
  36246,
  36273,
  36311,
  36313,
  36321,
  36322,
  36325,
  36327,
  36390,
  36391,
  36392,
  36393,
  36394,
  36395,
  36396,
  36397,
  36398,
  36401,
  36428,
  36440,
  36441,
  36446,
  36448,
  36458,
  39646,
  45542,
  49034,
  49362,
  51053
  )
;
--
-- Extricate house_num and street from the address1 field
--
ALTER TABLE `resident_base` ADD COLUMN `house_num` VARCHAR(15) NULL
 , ADD COLUMN `street` VARCHAR(127) NOT NULL
;
update resident_base
set house_num = LEFT(address1,LOCATE(' ',address1) - 1)
 , street = SUBSTRING(address1,LOCATE(' ',address1) + 1)
where address1 REGEXP '^[0-9].+'
;
update resident_base
set house_num = SUBSTRING(address1,LOCATE('PO BOX ',address1) + 7)
 , street = 'PO BOX'
where address1 like 'PO BOX %'
;
--
-- Perform additional nit-picks made easier by the extrication of house_num and street
--
delete from resident_base where name is null and house_num is null
;
update resident_base set street = address1 where house_num is null and street = ''
;
--
-- Build and populate state (as in Virginia) table
--
CREATE  TABLE `state` (`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT
 , `abbreviation` VARCHAR(127) NOT NULL
 , PRIMARY KEY (`id`)
 , UNIQUE INDEX `abbreviation` (`abbreviation`)
 )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
;
insert ignore state (abbreviation) select state from resident_base
;
--
-- Link resident_base to state (as in Virginia) table
--
ALTER TABLE `resident_base` ADD COLUMN `state_id` BIGINT UNSIGNED NOT NULL
;
update resident_base set state_id = (select id from state where abbreviation = resident_base.state)
;
--
-- Build and populate city table
--
CREATE  TABLE `city` (`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT
 , `name` VARCHAR(127) NOT NULL
 , `state_id` BIGINT UNSIGNED NOT NULL
 , PRIMARY KEY (`id`)
 , UNIQUE INDEX `state_id_name` (`state_id` ASC, `name` ASC)
 )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
;
ALTER TABLE `city` ADD CONSTRAINT `city_state_id` FOREIGN KEY (`state_id` ) REFERENCES `state` (`id` )
;
insert ignore city (name,state_id) select city as name, state_id from resident_base
;
--
-- Link resident_base to state (as in Virginia) table
--
ALTER TABLE `resident_base` ADD COLUMN `city_id` BIGINT UNSIGNED NOT NULL
;
update resident_base set city_id = (select id from city where name = resident_base.city and state_id = resident_base.state_id)
;
--
-- Build and populate street table
--
CREATE  TABLE `street` (`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT
 , `name` VARCHAR(127) NOT NULL
 , `city_id` BIGINT UNSIGNED NOT NULL
 , PRIMARY KEY (`id`)
 , UNIQUE INDEX `city_id_name` (`city_id` ASC, `name` ASC)
 )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
;
ALTER TABLE `street` ADD CONSTRAINT `street_city_id` FOREIGN KEY (`city_id` ) REFERENCES `city` (`id` )
;
insert ignore street (name,city_id) select street as name, city_id from resident_base
;
--
-- Link resident_base to street table
--
ALTER TABLE `resident_base` ADD COLUMN `street_id` BIGINT UNSIGNED NOT NULL
;
update resident_base set street_id = (select id from street where name = resident_base.street and city_id = resident_base.city_id)
;
--
-- Trim no-longer-needed parts of resident_base and add constraint
--
ALTER TABLE `resident_base` DROP COLUMN `state`
 , DROP COLUMN `city`
 , DROP COLUMN `zip`
 , drop column address1
 , drop column street
 , DROP COLUMN state_id
 , DROP COLUMN `city_id`
;
ALTER TABLE `resident_base` CHARACTER SET = utf8
 , COLLATE = utf8_general_ci
 , ENGINE = InnoDB
 , ADD UNIQUE `street_id_house_num` (`street_id` ASC, house_num)
 , ADD CONSTRAINT `resident_base_street_id` FOREIGN KEY (`street_id` ) REFERENCES `street` (`id` )
;
create or replace view resident2 as
SELECT resident_base.id as id
 , resident_base.name as name
 , IF(street.name = 'PO BOX',
     concat(street.name,' ',house_num),
     concat(IF(house_num is null,'',concat(house_num,' ')),street.name)
     ) as address1
 , city.name as city
 , state.abbreviation as state
 , NULL as zip
 , agency
 , year_of_last_appeal_to_become_a_donor
FROM `resident_base`
  join street on (street.id=street_id)
  join city on (city.id=street.city_id)
  join state on (state.id=city.state_id)
order by resident_base.id
;
COMMIT