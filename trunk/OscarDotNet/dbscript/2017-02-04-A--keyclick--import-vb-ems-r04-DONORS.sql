START TRANSACTION
;
-- --
--
-- ADJUST THE BELOW STATEMENT!!!
--
-- --
;
update resident_base set name = NULL where agency = 'CBVRS'  -- ADJUST!!!
;
-- --
--
-- ADJUST THE ABOVE STATEMENT!!!
--
-- --
;
;
drop table if exists resident_import
;
CREATE  TABLE `resident_import`
  (
    `name` VARCHAR(50) NULL
  ,
    `address` VARCHAR(144) NOT NULL
  ,
    `city` VARCHAR(127) NULL
  ,
    `state` VARCHAR(127) NULL
  ,
    `agency` ENUM('KVRS','PVRS','DCVRS','PACHVRS','CBVRS','VBVRS','OPVRS','CVRS','BVRS','SVRS') NOT NULL
  ,
    `id_in_agency_system` VARCHAR(7)
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
  ,
    `amount` DECIMAL(10,2) DEFAULT 1
  ,
    `method` ENUM('BIZREPLY', 'INMEMOF', 'UNSOLICITED', 'WEB', 'LOVELETTER') DEFAULT 'BIZREPLY'
  ,
    `in_mem_of` VARCHAR(64)
  ,
    `note` TEXT
  ,
    `date` DATE 
  )
;
-- --
--
--
-- Insert output column from spreadsheet(s) below this comment.  If working with multiple lists, the order should be Residents, Businesses, Donors.
--
-- --
;
insert into resident_import set name = 'CHERYL K KEPNER', address = '4417 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#51149013', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'W B THARP', address = '5740 GRETNA RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1819', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'GORDON A MAGNUSON', address = '1908 SUNRISE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#6700', date = ADDDATE('1899-12-30',INTERVAL 42690 DAY);
insert into resident_import set name = 'ALVA B CLARY', address = '4713 THOROUGHGOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'INMEMOF', in_mem_of = 'RAWLEIGH CLARY', note = 'chk#3070', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'MATTIE S SWINDELL', address = '4629 SHORE DR APT 107', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#3516', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'MARGORIE M STEVENS', address = '5140 BARDITH CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#6081', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'DR ROBERT L HAWKINS', address = '3 BRADFORD PT ', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#1626', date = ADDDATE('1899-12-30',INTERVAL 42690 DAY);
insert into resident_import set name = 'SANDRA C WAINSCOTT', address = '5021 FINN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#9501', date = ADDDATE('1899-12-30',INTERVAL 42690 DAY);
insert into resident_import set name = 'WALTER C SECHI', address = '5089 GATEHOUSE WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '20', method = 'BIZREPLY', note = 'chk#2087', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'VERNON P BROOKS', address = '4841 BRIGADOON DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '40', method = 'BIZREPLY', note = 'chk#7059', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'MARGARET A FINNEY TRTEE', address = '1013 DULCIE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '30', method = 'BIZREPLY', note = 'chk#6590', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'SHARON A BUSICK', address = '1561 FAWNWOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'INMEMOF', in_mem_of = 'MARK BUSICK', note = 'chk#4827', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'JEAN R ASBURY', address = '5536 ARAGON DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#4747', date = ADDDATE('1899-12-30',INTERVAL 42690 DAY);
insert into resident_import set name = 'ELAINE M KYRUS', address = '4008 LAMBS CREEK CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#7905', date = ADDDATE('1899-12-30',INTERVAL 42690 DAY);
insert into resident_import set name = 'BIRGINIA K JENKOT', address = '4482 OCEAN VIEW AVE APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '400', method = 'BIZREPLY', note = 'chk#4828', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'MICHAEL HOGSHIRE', address = '4468 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'INMEMOF', in_mem_of = 'MILTON L HOGSHIRE JR', note = 'chk#3688', date = ADDDATE('1899-12-30',INTERVAL 42690 DAY);
insert into resident_import set name = 'PATRICIA A WOBBLETON', address = '4406 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#126', date = ADDDATE('1899-12-30',INTERVAL 42687 DAY);
insert into resident_import set name = 'CYNTHIA J CUTTER', address = '5004 DAILEY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'INMEMOF', in_mem_of = 'CHARLIE WOODALL', note = 'chk#9509', date = ADDDATE('1899-12-30',INTERVAL 42691 DAY);
insert into resident_import set name = 'WILLIAM E MOORE SR', address = '1456 LAKESIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1169', date = ADDDATE('1899-12-30',INTERVAL 42690 DAY);
insert into resident_import set name = 'ROBERT BOYD', address = '4825 BAY BRIDGE LANE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#1145', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'CATHERINE N HOLLOWAY', address = '1725 KEELING RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#2575', date = ADDDATE('1899-12-30',INTERVAL 42690 DAY);
insert into resident_import set name = 'ROSALIE C THORNOCK', address = '5465 SUNNYWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#11278', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'RUTH W DUKE', address = '1036 FAIRLAWN AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'INMEMOF', in_mem_of = 'JEAN SILER', note = 'chk#2964', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'JENNIFER M WALSH', address = '1297 BRADDOCK AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#1522', date = ADDDATE('1899-12-30',INTERVAL 42687 DAY);
insert into resident_import set name = 'LEIGH JONNS', address = '1460 BRIERCLIFF PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1966', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'ELIZABETH H COFFELT', address = '2301 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#1960', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'EVELYN JEAN ROBERTS LIVING TRUST', address = '1608 WESTERFIELD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#2659', date = ADDDATE('1899-12-30',INTERVAL 42691 DAY);
insert into resident_import set name = 'ELIZABETH F BEASLEY', address = '2428 GREENWELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1849', date = ADDDATE('1899-12-30',INTERVAL 42690 DAY);
insert into resident_import set name = 'DIANNE W HOWARD', address = '1557 FROST RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '40', method = 'BIZREPLY', note = 'chk#7815', date = ADDDATE('1899-12-30',INTERVAL 42691 DAY);
insert into resident_import set name = 'MARK SAUER', address = '1324 LAKEVIEW DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'INMEMOF', in_mem_of = 'KATRINA KOMUVES  SAUER', note = 'chk#4535', date = ADDDATE('1899-12-30',INTERVAL 42690 DAY);
insert into resident_import set name = 'BRUCE W HARROD', address = '1520 JANKE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '75', method = 'BIZREPLY', note = 'chk#8224', date = ADDDATE('1899-12-30',INTERVAL 42690 DAY);
insert into resident_import set name = 'JOHN A MICKELSON', address = '5629 ARAGON DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#1256', date = ADDDATE('1899-12-30',INTERVAL 42687 DAY);
insert into resident_import set name = 'EDNA F QUISENBERRY', address = '4636 CHURCH POINT PLACE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#186', date = ADDDATE('1899-12-30',INTERVAL 42694 DAY);
insert into resident_import set name = 'ROBERT M RIEVE', address = '1 BRADFORD POINT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#2325', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'BARBARA A TOWNES', address = '5537 QUARTERPATH GATE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '35', method = 'BIZREPLY', note = 'chk#7107', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'MARY T TATTERSON', address = '1713 WHITETHORNE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#3838', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'RONALD J LAUSTER', address = '5532 QUARTERPATH GATE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#7626', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'MILENA M CORBIN', address = '1061 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#2451', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'J L WAGNER', address = '1608 BARNARDS COVE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '20', method = 'BIZREPLY', note = 'chk#6382', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'MARK A DOLSON ', address = '4412 SWAINE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#2040', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'CARRIE M WOODALL', address = '5000 DAILEY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '35', method = 'BIZREPLY', note = 'chk#385', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'TERESA A DEE STUART', address = '4500 THOROUGHGOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#4489', date = ADDDATE('1899-12-30',INTERVAL 42690 DAY);
insert into resident_import set name = 'JOHN DESJARDINS RLT', address = '1505 SUNNYWOOD CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#4103', date = ADDDATE('1899-12-30',INTERVAL 42686 DAY);
insert into resident_import set name = 'ALAN P CHAPMAN LIVING TRUST', address = '1467 MAHARIS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#277', date = ADDDATE('1899-12-30',INTERVAL 42687 DAY);
insert into resident_import set name = 'SARAH L HOUCK', address = '5032 LAUDERDALE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#7509', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'CYNTHIA MCCAUSLAND', address = '1945 KING WILLIAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#7129', date = ADDDATE('1899-12-30',INTERVAL 42686 DAY);
insert into resident_import set name = 'A T WATSON JR', address = '5413 ODESSA DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#4448', date = ADDDATE('1899-12-30',INTERVAL 42687 DAY);
insert into resident_import set name = 'MARGARET L ALLEN', address = '4401 DELMAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#5879', date = ADDDATE('1899-12-30',INTERVAL 42687 DAY);
insert into resident_import set name = 'CAROLYN A BLISS', address = '4448 BOWDEN AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#10357', date = ADDDATE('1899-12-30',INTERVAL 42686 DAY);
insert into resident_import set name = 'PRUDY A RAMSEY', address = '4340 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#3144', date = ADDDATE('1899-12-30',INTERVAL 42686 DAY);
insert into resident_import set name = 'MAGNOLIA E DOSSETT', address = '5528 BAYSIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#5898', date = ADDDATE('1899-12-30',INTERVAL 42687 DAY);
insert into resident_import set name = 'JOYCE A PRYOR', address = '5441 SUNNYWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'INMEMOF', in_mem_of = 'WILLIAM B SEARIGHT', note = 'chk#6712', date = ADDDATE('1899-12-30',INTERVAL 42686 DAY);
insert into resident_import set name = 'CHARLES H DUFF III', address = '4521 CORONET AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#2225', date = ADDDATE('1899-12-30',INTERVAL 42687 DAY);
insert into resident_import set name = 'WILLIAM G BISHOP JR', address = '1329 LAKEVIEW DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1961', date = ADDDATE('1899-12-30',INTERVAL 42687 DAY);
insert into resident_import set name = 'DAVID N HALLDEN', address = '1600 FIVE FORKS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#4059', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'VICTORIA V FREEMAN', address = '1545 EAGLETON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#5269', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'JOYCE H TURNER', address = '4484 LAUDERDALE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#4448', date = ADDDATE('1899-12-30',INTERVAL 42686 DAY);
insert into resident_import set name = 'MICHAEL S THOMAS', address = '1708 MEREDITH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#2536', date = ADDDATE('1899-12-30',INTERVAL 42687 DAY);
insert into resident_import set name = 'BARBARA CODY', address = '4608 GALEFORCE CT APT 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1240', date = ADDDATE('1899-12-30',INTERVAL 42687 DAY);
insert into resident_import set name = 'PONSON REVOCABLE LIVING TRUST', address = '1690 MEREDITH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'INMEMOF', in_mem_of = 'FRANCES G PONSON', note = 'chk#6538', date = ADDDATE('1899-12-30',INTERVAL 42687 DAY);
insert into resident_import set name = 'CONNIE S MOORE', address = '1620 WHITETHORNE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#7675', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'HATTIE L HOUSE', address = '4904 LEATHERNECK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#1542', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'MARY L LANE', address = '5188 WALKERS GRANT LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#8574', date = ADDDATE('1899-12-30',INTERVAL 42686 DAY);
insert into resident_import set name = 'BETTY L WILLS', address = '1217 FUNNELL ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#8198', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'HAROLD B LOYER', address = '5405 ODESSA DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#216', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'DAVID G SISSON', address = '2267 GREENWELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#3096', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'ARLENE N WENTELER', address = '1516 GARDENWOOD PKWY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#452', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'E H BELTON', address = '4625 THOROUGHGOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '250', method = 'BIZREPLY', note = 'chk#5242', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'DELORES S PYLES', address = '1444 BRIERCLIFF PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#1527', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'CHRISTOPHER AND ANGELA SINESI', address = '1601 SPRING HOUSE TRAIL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#3996', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'BRENDA E RHODES', address = '2504 WINDY RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#9784', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'JAMES BEAGLE', address = '4804 LEE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#220', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'PAMELA S SEWELL ', address = '5561 ODESSA DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#8408', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'MARTHA J SCHREIBER', address = '1705 MAZE HILL MEWS', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#7430', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'CAPT RICHARD M VIZZIER', address = '1629 ARROWHEAD PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#6962', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'GARY L BULGER', address = '1764 JACK FROST RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#3405', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'GREGORY B HECKMAN', address = '1712 MEREDITH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#1075', date = ADDDATE('1899-12-30',INTERVAL 42687 DAY);
insert into resident_import set name = 'GAIL H DAVIDSON', address = '4905 LEATHERNECK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#9391', date = ADDDATE('1899-12-30',INTERVAL 42687 DAY);
insert into resident_import set name = 'NENA N BRANSTETTER', address = '1565 FAWNWOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#2662', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'BARBARA B LAWSON', address = '1705 LANCKFIELD MEWS', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#2286', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'FRANCIS C POGUE', address = '1816 MEREDITH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#7194', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'ANNE T PITT', address = '4820 BAY BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '30', method = 'BIZREPLY', note = 'chk#655', date = ADDDATE('1899-12-30',INTERVAL 42685 DAY);
insert into resident_import set name = 'JOSEPH WATTS', address = '5008 MOSBY RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'INMEMOF', in_mem_of = 'ROSINA E WATTS', note = 'chk#1233', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'DAVID C LEADBETTER', address = '5501 SHADOWWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#2118', date = ADDDATE('1899-12-30',INTERVAL 42686 DAY);
insert into resident_import set name = 'DARLENE A WILLISON', address = '1833 PERREL ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#6413', date = ADDDATE('1899-12-30',INTERVAL 42686 DAY);
insert into resident_import set name = 'NATALIE SMITH', address = '2408 GREENWELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '20', method = 'BIZREPLY', note = 'chk#14634', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'JEAN CARPENTER', address = '1001 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#4364', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'EDNA B NIXON', address = '4495 LAUDERDALE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#1300', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'JAMES R BORBERG', address = '4524 BLACK COVE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '75', method = 'BIZREPLY', note = 'chk#23788096', date = ADDDATE('1899-12-30',INTERVAL 42684 DAY);
insert into resident_import set name = 'JENNIFER D ORAM SMITH PC', address = '291 INDEPENDENCE BLVD SUITE 241', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '10', method = 'BIZREPLY', note = 'chk#996108', date = ADDDATE('1899-12-30',INTERVAL 42695 DAY);
insert into resident_import set name = 'MARGARET S STEPHENS', address = '5088 SCHOOL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#6661', date = ADDDATE('1899-12-30',INTERVAL 42691 DAY);
insert into resident_import set name = 'PEGGY WEMYSS', address = '5041 FINN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#8057', date = ADDDATE('1899-12-30',INTERVAL 42693 DAY);
insert into resident_import set name = 'FRANK L TREADWAY', address = '2476 BAYVIEW AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'INMEMOF', in_mem_of = 'LURA MAE TREADWAY', note = 'chk#1422', date = ADDDATE('1899-12-30',INTERVAL 42693 DAY);
insert into resident_import set name = 'NARRENE E BEACH', address = '1676 MEREDITH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'INMEMOF', in_mem_of = 'ROY K BEACH', note = 'chk#8298', date = ADDDATE('1899-12-30',INTERVAL 42693 DAY);
insert into resident_import set name = 'MARY K ELLIS', address = '5513 NORLINA RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#605', date = ADDDATE('1899-12-30',INTERVAL 42692 DAY);
insert into resident_import set name = 'DOROTHY A SCHULTZ', address = '1405 BRADFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'INMEMOF', in_mem_of = 'MARION SCHULTZ', note = 'chk#349', date = ADDDATE('1899-12-30',INTERVAL 42693 DAY);
insert into resident_import set name = 'BETTY C KAYTON', address = '4641 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '20', method = 'BIZREPLY', note = 'chk#3056', date = ADDDATE('1899-12-30',INTERVAL 42685 DAY);
insert into resident_import set name = 'MICHELLE S PRESS', address = '4601 GALEFORCE CT #101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#153', date = ADDDATE('1899-12-30',INTERVAL 42690 DAY);
insert into resident_import set name = 'RUTH G MIDGETT', address = '1801 SHELTON RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#10716', date = ADDDATE('1899-12-30',INTERVAL 42690 DAY);
insert into resident_import set name = 'GALE G DAVIS', address = '1701 LOWER CHURCH CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '30', method = 'BIZREPLY', note = 'chk#1706', date = ADDDATE('1899-12-30',INTERVAL 42692 DAY);
insert into resident_import set name = 'ARLENE K NEY', address = '5133 SHENSTONE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#9063', date = ADDDATE('1899-12-30',INTERVAL 42692 DAY);
insert into resident_import set name = 'JARED K PULLEY', address = '1705 WESTERFIELD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#1482', date = ADDDATE('1899-12-30',INTERVAL 42692 DAY);
insert into resident_import set name = 'J F STEINBERG', address = '4637 GUAM ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '40', method = 'BIZREPLY', note = 'chk#2718', date = ADDDATE('1899-12-30',INTERVAL 42692 DAY);
insert into resident_import set name = 'JAMES J SPENCER', address = '5320 BARDITH CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#872', date = ADDDATE('1899-12-30',INTERVAL 42691 DAY);
insert into resident_import set name = 'JOSEPH A GILLILAND III', address = '4472 BLACKBEARD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#4083', date = ADDDATE('1899-12-30',INTERVAL 42692 DAY);
insert into resident_import set name = 'DORIS L WILLIAMSON', address = '1808 JACK FROST RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#5307', date = ADDDATE('1899-12-30',INTERVAL 42692 DAY);
insert into resident_import set name = 'ROBIN M WALKER', address = '1417 SHAMROCK AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#3107', date = ADDDATE('1899-12-30',INTERVAL 42692 DAY);
insert into resident_import set name = 'NORMA J ANDERSON', address = '4212 THOROUGHGOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#6483', date = ADDDATE('1899-12-30',INTERVAL 42692 DAY);
insert into resident_import set name = 'DOLORES E CLARK', address = '1620 JANKE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '10', method = 'BIZREPLY', note = 'chk#3898', date = ADDDATE('1899-12-30',INTERVAL 42691 DAY);
insert into resident_import set name = 'FRED QUIST', address = '4521 POWELLS POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#2544', date = ADDDATE('1899-12-30',INTERVAL 42693 DAY);
insert into resident_import set name = 'JOSEPH G NOWLAN JR', address = '1508 GARDENWOOD PKWY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#7393', date = ADDDATE('1899-12-30',INTERVAL 42705 DAY);
insert into resident_import set name = 'KENT M LION', address = '5293 MILE COURSE WALK', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#995401', date = ADDDATE('1899-12-30',INTERVAL 42704 DAY);
insert into resident_import set name = 'KENNETH G DELONG', address = '5062 MADEIRA RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#278', date = ADDDATE('1899-12-30',INTERVAL 42688 DAY);
insert into resident_import set name = 'SYDNEY YOUNG', address = '4305 THOROUGHGOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#4997', date = ADDDATE('1899-12-30',INTERVAL 42694 DAY);
insert into resident_import set name = 'JANICE K DYER', address = '5513 ODESSA DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#3258', date = ADDDATE('1899-12-30',INTERVAL 42695 DAY);
insert into resident_import set name = 'NANCY W MCKENNEY', address = '1713 KEELING RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'INMEMOF', in_mem_of = 'REGINALD MCKENNEY', note = 'chk#11161', date = ADDDATE('1899-12-30',INTERVAL 42695 DAY);
insert into resident_import set name = 'MILTON A GLASS JR', address = '1512 CHATHAM CT APT 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'INMEMOF', in_mem_of = 'RANDY GLASS', note = 'chk#4877', date = ADDDATE('1899-12-30',INTERVAL 42695 DAY);
insert into resident_import set name = 'GEORGE T KINCAID', address = '4404 POWELLS POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1959', date = ADDDATE('1899-12-30',INTERVAL 42693 DAY);
insert into resident_import set name = 'DEAN A NEWMAN JR', address = '1139-G INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '10', method = 'BIZREPLY', note = 'chk#2698', date = ADDDATE('1899-12-30',INTERVAL 42692 DAY);
insert into resident_import set name = 'ROBERT P HARDEGEN III', address = '5001 LAUDERDALE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '150', method = 'BIZREPLY', note = 'chk#650', date = ADDDATE('1899-12-30',INTERVAL 42694 DAY);
insert into resident_import set name = 'H PERRY ALLGOOD', address = '1821 SUNRISE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#3521', date = ADDDATE('1899-12-30',INTERVAL 42694 DAY);
insert into resident_import set name = 'JOYCE K LINDLEY', address = '5004 BLIVEN LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#1120', date = ADDDATE('1899-12-30',INTERVAL 42696 DAY);
insert into resident_import set name = 'BERNADENE WALLACE', address = '1612 ARROWHEAD PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '35', method = 'BIZREPLY', note = 'chk#5752', date = ADDDATE('1899-12-30',INTERVAL 42695 DAY);
insert into resident_import set name = 'ROBERT A MALLAR,LT.COL', address = '1925 SUNRISE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#6379', date = ADDDATE('1899-12-30',INTERVAL 42695 DAY);
insert into resident_import set name = 'ALLISON R THOMAS', address = '1708 DALWOOD MEWS', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '35', method = 'BIZREPLY', note = 'chk#11020', date = ADDDATE('1899-12-30',INTERVAL 42695 DAY);
insert into resident_import set name = 'JOHN L BOHN', address = '4450 OCEAN VIEW AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#2543', date = ADDDATE('1899-12-30',INTERVAL 42696 DAY);
insert into resident_import set name = 'SHIRLEY JONES', address = '5028 MADEIRA RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#616', date = ADDDATE('1899-12-30',INTERVAL 42697 DAY);
insert into resident_import set name = 'ADELINE H SMOKLER', address = '4605 CORONET AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#8208', date = ADDDATE('1899-12-30',INTERVAL 42699 DAY);
insert into resident_import set name = 'SHARON M KNOX', address = '4704 THOROUGHGOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#2586', date = ADDDATE('1899-12-30',INTERVAL 42699 DAY);
insert into resident_import set name = 'G BARBARA DREW', address = '5129 CRYSTAL POINT DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#6995', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'SYLVIA M ROUGHTON', address = '4158 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#2466', date = ADDDATE('1899-12-30',INTERVAL 42691 DAY);
insert into resident_import set name = 'JACOB S ISRAEL', address = '3776 CANDY CT APT 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#3745', date = ADDDATE('1899-12-30',INTERVAL 42698 DAY);
insert into resident_import set name = 'TERESA TAMBURELLO', address = '1709 MERCHANTS HOPE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#1558', date = ADDDATE('1899-12-30',INTERVAL 42705 DAY);
insert into resident_import set name = 'JOHN T FRANCAVILLA', address = '4312 SANDY BAY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#1144', date = ADDDATE('1899-12-30',INTERVAL 42700 DAY);
insert into resident_import set name = 'SUSAN W FASCIOCCO', address = '4469 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '40', method = 'BIZREPLY', note = 'chk#1820', date = ADDDATE('1899-12-30',INTERVAL 42701 DAY);
insert into resident_import set name = 'FREDRIC G HOUGH', address = '4309 SANDY BAY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#4655', date = ADDDATE('1899-12-30',INTERVAL 42701 DAY);
insert into resident_import set name = 'JOYCE W DOWLING', address = '1613 SHENSTONE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#3412', date = ADDDATE('1899-12-30',INTERVAL 42700 DAY);
insert into resident_import set name = 'JULIUS JOSEPH MONTAGNA', address = '4520 BLACK COVE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#2048', date = ADDDATE('1899-12-30',INTERVAL 42700 DAY);
insert into resident_import set name = 'JEANNE M MACDONALD', address = '5132 LAKE SHORES RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '20', method = 'BIZREPLY', note = 'chk#1474', date = ADDDATE('1899-12-30',INTERVAL 42702 DAY);
insert into resident_import set name = 'MARY LOUISE BALEY', address = '4616 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#968', date = ADDDATE('1899-12-30',INTERVAL 42702 DAY);
insert into resident_import set name = 'GLORIA SOUTHARD', address = '1621 JANKE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#5664', date = ADDDATE('1899-12-30',INTERVAL 42703 DAY);
insert into resident_import set name = 'DANIEL L FACEMIRE', address = '5041 MADEIRA RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#9044', date = ADDDATE('1899-12-30',INTERVAL 42703 DAY);
insert into resident_import set name = 'CHRISTINE B LENOIR', address = '5261 LAKE SHORES RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#6675', date = ADDDATE('1899-12-30',INTERVAL 42703 DAY);
insert into resident_import set name = 'VIVIAN K BRINDEL', address = '4525 JAMES CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#6115', date = ADDDATE('1899-12-30',INTERVAL 42699 DAY);
insert into resident_import set name = 'MELODY B FINK', address = '1713 HUNGERS PARISH CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#4138', date = ADDDATE('1899-12-30',INTERVAL 42702 DAY);
insert into resident_import set name = 'DOROTHY L DYSART', address = '2409 CHUBB LAKE AVE ', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '20', method = 'INMEMOF', in_mem_of = 'JACIK DYSART', note = 'chk#4006', date = ADDDATE('1899-12-30',INTERVAL 42703 DAY);
insert into resident_import set name = 'WANDA H HOTZE-SUTTLE ', address = '3840 CHURCH POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#1070', date = ADDDATE('1899-12-30',INTERVAL 42703 DAY);
insert into resident_import set name = 'DANSBY T GREGORY', address = '4644 FIRST COURT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#4113', date = ADDDATE('1899-12-30',INTERVAL 42702 DAY);
insert into resident_import set name = 'JOYCE L BOLLARD', address = '4400 CLYDE ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#4868', date = ADDDATE('1899-12-30',INTERVAL 42693 DAY);
insert into resident_import set name = 'MARGARET D ULP', address = '4769 OLD HICKORY RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#502', date = ADDDATE('1899-12-30',INTERVAL 42696 DAY);
insert into resident_import set name = 'ELAINE ROBERTS', address = '4412 LEE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '35', method = 'INMEMOF', in_mem_of = 'KAILA ROBERTS-LYSAGHT', note = 'chk#1786', date = ADDDATE('1899-12-30',INTERVAL 42694 DAY);
insert into resident_import set name = 'LOUIS W SCHINDLER', address = '1724 MEREDITH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#4904', date = ADDDATE('1899-12-30',INTERVAL 42695 DAY);
insert into resident_import set name = 'VICTORIA BEA', address = '1713 LOWER CHURCH CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'INMEMOF', in_mem_of = 'SAMUEL BEA', note = 'chk#2434', date = ADDDATE('1899-12-30',INTERVAL 42695 DAY);
insert into resident_import set name = 'IRMGARD CARPENTER', address = '4528 CLYDE ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#4140', date = ADDDATE('1899-12-30',INTERVAL 42694 DAY);
insert into resident_import set name = 'ROBERT E EIDSON', address = '1801 JACK FROST RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1388', date = ADDDATE('1899-12-30',INTERVAL 42695 DAY);
insert into resident_import set name = 'JACQUELYN FEDRYK', address = '1509 LAKEVIEW DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '20', method = 'BIZREPLY', note = 'chk#2609', date = ADDDATE('1899-12-30',INTERVAL 42692 DAY);
insert into resident_import set name = 'JOHN R AND CAROLYN AKERS LVNG TRST', address = '4132 COUNTRY CLUB CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#41237470', date = ADDDATE('1899-12-30',INTERVAL 42710 DAY);
insert into resident_import set name = 'ANNA SUTPHIN', address = '5632 AURORA DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#7417', date = ADDDATE('1899-12-30',INTERVAL 42705 DAY);
insert into resident_import set name = 'JEAN-MARIE H CABANISS', address = '4420 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#2276', date = ADDDATE('1899-12-30',INTERVAL 42702 DAY);
insert into resident_import set name = 'RAYMOND F KUHEL JR', address = '2453 BAYVIEW AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1944', date = ADDDATE('1899-12-30',INTERVAL 42704 DAY);
insert into resident_import set name = 'STEPHEN AND CHELSEA KATZ', address = '4809 MACHEN AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'INMEMOF', in_mem_of = 'SAWYER KATZ', note = 'chk#206', date = ADDDATE('1899-12-30',INTERVAL 42703 DAY);
insert into resident_import set name = 'SHIRLEY J WESTON', address = '5565 ARAGON DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '20', method = 'BIZREPLY', note = 'chk#8408', date = ADDDATE('1899-12-30',INTERVAL 42705 DAY);
insert into resident_import set name = 'REBECCA M BEHLING', address = '4753 BIRDSONG LN APT 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '20', method = 'BIZREPLY', note = 'chk#229', date = ADDDATE('1899-12-30',INTERVAL 42705 DAY);
insert into resident_import set name = 'AMY I JOHNSTON', address = '4629 SHORE DR APT 313', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '20', method = 'BIZREPLY', note = 'chk#827', date = ADDDATE('1899-12-30',INTERVAL 42703 DAY);
insert into resident_import set name = 'DONNA V WHALEY', address = '2313 PARAGON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'INMEMOF', in_mem_of = 'LEE VIERSEN', note = 'chk#1783', date = ADDDATE('1899-12-30',INTERVAL 42704 DAY);
insert into resident_import set name = 'DANA B BRYANT', address = '5532 NORLINA RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#7336', date = ADDDATE('1899-12-30',INTERVAL 42704 DAY);
insert into resident_import set name = 'ARLINE D WAYLER', address = '4629 SHORE DR APT 425', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1103', date = ADDDATE('1899-12-30',INTERVAL 42677 DAY);
insert into resident_import set name = 'BARBARA M FRIEL', address = '5580 ARAGON DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '20', method = 'BIZREPLY', note = 'chk#9090', date = ADDDATE('1899-12-30',INTERVAL 42705 DAY);
insert into resident_import set name = 'LINDA M CONNOLLY', address = '5604 ODESSA DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#13964', date = ADDDATE('1899-12-30',INTERVAL 42705 DAY);
insert into resident_import set name = 'ANDREW J FOSINSA', address = '4312 COUNTRY CLUB CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#2182', date = ADDDATE('1899-12-30',INTERVAL 42705 DAY);
insert into resident_import set name = 'KENNETH BERGER', address = '4613 THOROUGHGOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#4326', date = ADDDATE('1899-12-30',INTERVAL 42705 DAY);
insert into resident_import set name = 'JAMESK CARMACK', address = '1469 DERMOTT AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#6719', date = ADDDATE('1899-12-30',INTERVAL 42704 DAY);
insert into resident_import set name = 'SHEILA AND JOE OVERFELT', address = '4425 LEE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'INMEMOF', in_mem_of = 'NEOMI AND JOE OVERFELT', note = 'chk#1707', date = ADDDATE('1899-12-30',INTERVAL 42695 DAY);
insert into resident_import set name = 'ROBERT J SMITH', address = '4848 CULLEN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#2851', date = ADDDATE('1899-12-30',INTERVAL 42706 DAY);
insert into resident_import set name = 'PAULINE H GOODWIN', address = '4629 SHORE DR APT 420', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '5', method = 'BIZREPLY', note = 'chk#9913', date = ADDDATE('1899-12-30',INTERVAL 42707 DAY);
insert into resident_import set name = 'LINDA C RITTER ', address = '4121 COUNTRY CLUB CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#4258', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'ANNA D SPIVEY', address = '4437 CLYDE ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#6654', date = ADDDATE('1899-12-30',INTERVAL 42707 DAY);
insert into resident_import set name = 'CARL R HILLEY', address = '4732 PRICE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#8168', date = ADDDATE('1899-12-30',INTERVAL 42705 DAY);
insert into resident_import set name = 'NANCY CLAMOR', address = '5532 LAMBDIN ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '15', method = 'INMEMOF', in_mem_of = 'ANSELMO SURBAN', note = 'chk#1147', date = ADDDATE('1899-12-30',INTERVAL 42706 DAY);
insert into resident_import set name = 'MARY A SOULE', address = '1456 DERMOTT AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#1093', date = ADDDATE('1899-12-30',INTERVAL 42706 DAY);
insert into resident_import set name = 'T S WILLISAMS JR', address = '4409 WAKEFIELD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '35', method = 'BIZREPLY', note = 'chk#8626', date = ADDDATE('1899-12-30',INTERVAL 42697 DAY);
insert into resident_import set name = 'EDWIN L ARMISTEAD', address = '1624 WAKEFIELD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1897', date = ADDDATE('1899-12-30',INTERVAL 42708 DAY);
insert into resident_import set name = 'TAMMIS N SEIPEL', address = '4816 LAKE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#2684', date = ADDDATE('1899-12-30',INTERVAL 42707 DAY);
insert into resident_import set name = 'HELEN D MILLS', address = '4828 BRIGADOON DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '35', method = 'BIZREPLY', note = 'chk#222', date = ADDDATE('1899-12-30',INTERVAL 42709 DAY);
insert into resident_import set name = 'HERMAN W SAUER', address = '4409 SWAINE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#6457', date = ADDDATE('1899-12-30',INTERVAL 42709 DAY);
insert into resident_import set name = 'SWARNA MANIAN', address = '1609 MEETING HOUSE LANE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#2637', date = ADDDATE('1899-12-30',INTERVAL 42708 DAY);
insert into resident_import set name = 'MARY A MARTIN', address = '1525 SAGEWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#2331', date = ADDDATE('1899-12-30',INTERVAL 42686 DAY);
insert into resident_import set name = 'DUANE D TROWBRIDGE', address = '4836 BAY BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '35', method = 'BIZREPLY', note = 'chk#1811', date = ADDDATE('1899-12-30',INTERVAL 42707 DAY);
insert into resident_import set name = 'LAWRENCE STRICKLAND', address = '1709 TIMBER RIDGE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1589', date = ADDDATE('1899-12-30',INTERVAL 42705 DAY);
insert into resident_import set name = 'JOHN E SHERMAN', address = '4141 COUNTRY CLUB CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#607', date = ADDDATE('1899-12-30',INTERVAL 42705 DAY);
insert into resident_import set name = 'DENISE S MOXIE', address = '4916 ATHENS BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#170', date = ADDDATE('1899-12-30',INTERVAL 42709 DAY);
insert into resident_import set name = 'SHARON N BRODT', address = '2413 TRANQUILITY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#2536', date = ADDDATE('1899-12-30',INTERVAL 42709 DAY);
insert into resident_import set name = 'JAMES P MCCOY III', address = '4621 DELCO RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'INMEMOF', in_mem_of = 'WILLIAM G TEMPLE', note = 'chk#9361', date = ADDDATE('1899-12-30',INTERVAL 42710 DAY);
insert into resident_import set name = 'MARY M BIONDO', address = '4501 DELCO RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'INMEMOF', in_mem_of = 'MARY PRYE HATTER', note = 'chk#5807', date = ADDDATE('1899-12-30',INTERVAL 42710 DAY);
insert into resident_import set name = 'AIRI H WASHINGTON', address = '5017 REGINA LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#4305', date = ADDDATE('1899-12-30',INTERVAL 42710 DAY);
insert into resident_import set name = 'GARY T BLAKELY', address = '4204 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#9546', date = ADDDATE('1899-12-30',INTERVAL 42709 DAY);
insert into resident_import set name = 'ERIC W LUPINSKY', address = '1069 NORWICH AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#2274', date = ADDDATE('1899-12-30',INTERVAL 42710 DAY);
insert into resident_import set name = 'THOMAS G COOLEY', address = '1805 PERREL ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#2917', date = ADDDATE('1899-12-30',INTERVAL 42712 DAY);
insert into resident_import set name = 'WERNER SEIBEL', address = '4333 THOROUGHGOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#54553587', date = ADDDATE('1899-12-30',INTERVAL 42710 DAY);
insert into resident_import set name = 'NANCY Z PARKER', address = '1424 DERMOTT AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '20', method = 'BIZREPLY', note = 'chk#4464', date = ADDDATE('1899-12-30',INTERVAL 42712 DAY);
insert into resident_import set name = 'JOHN H CROUSE', address = '5069 LAUDERDALE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '35', method = 'BIZREPLY', note = 'chk#2794', date = ADDDATE('1899-12-30',INTERVAL 42707 DAY);
insert into resident_import set name = 'BRENDA K MOX', address = '4420 LEE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1284', date = ADDDATE('1899-12-30',INTERVAL 42716 DAY);
insert into resident_import set name = 'WILLIAM A FOX', address = '3816 CHURCH POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1485', date = ADDDATE('1899-12-30',INTERVAL 42714 DAY);
insert into resident_import set name = 'NORMAN A FORTIN JR', address = '1421 GARWOOD AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#5520', date = ADDDATE('1899-12-30',INTERVAL 42714 DAY);
insert into resident_import set name = 'BETHE R JOHNSON', address = '4516 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#8023', date = ADDDATE('1899-12-30',INTERVAL 42713 DAY);
insert into resident_import set name = 'CARROL J ANTHONY', address = '4825 LAKE BRADFORD LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#7585', date = ADDDATE('1899-12-30',INTERVAL 42716 DAY);
insert into resident_import set name = 'EDWARD C MILLER', address = '4001 ARROWHEAD POINT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#4276', date = ADDDATE('1899-12-30',INTERVAL 42716 DAY);
insert into resident_import set name = 'RITVA S DILLARD', address = '4828 SHELDON DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#3300', date = ADDDATE('1899-12-30',INTERVAL 42718 DAY);
insert into resident_import set name = ' MARY CLARKE', address = '1617 ARROWHEAD PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '250', method = 'BIZREPLY', note = 'chk#3790', date = ADDDATE('1899-12-30',INTERVAL 42716 DAY);
insert into resident_import set name = 'ALICE G EADIE', address = '2077 S INDEPENDENCE BLVD APT 318', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#6156', date = ADDDATE('1899-12-30',INTERVAL 42689 DAY);
insert into resident_import set name = 'JERRY CALLENDER', address = '4809 ALGONAC  AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '500', method = 'BIZREPLY', note = 'chk#68-7497/2560', date = ADDDATE('1899-12-30',INTERVAL 42716 DAY);
insert into resident_import set name = 'ROSE HALL', address = '1640 JANKE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#9958', date = ADDDATE('1899-12-30',INTERVAL 42719 DAY);
insert into resident_import set name = 'PAUL M FEAKINS', address = '1700 HOSSKINE MEWS', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1055', date = ADDDATE('1899-12-30',INTERVAL 42720 DAY);
insert into resident_import set name = 'EDWARD F GLUCKOWSKI', address = '4649 CURTISS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#6186', date = ADDDATE('1899-12-30',INTERVAL 42720 DAY);
insert into resident_import set name = 'RONALD H BOCK SR', address = '5269 MILE COURSE WALK', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '10', method = 'BIZREPLY', note = 'chk#3914', date = ADDDATE('1899-12-30',INTERVAL 42718 DAY);
insert into resident_import set name = 'CAROLYN M CARRICO', address = '1540 WESTERFIELD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#2904', date = ADDDATE('1899-12-30',INTERVAL 42723 DAY);
insert into resident_import set name = 'BETTY W CRAWFORD', address = '1013 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#626', date = ADDDATE('1899-12-30',INTERVAL 42723 DAY);
insert into resident_import set name = 'ALAN RASHKIND', address = '1701 JORDANS PARISH PLACE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#8014', date = ADDDATE('1899-12-30',INTERVAL 42722 DAY);
insert into resident_import set name = 'LINDA A LINZEY', address = '4629 BRADSTON RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '200', method = 'BIZREPLY', note = 'chk#7750', date = ADDDATE('1899-12-30',INTERVAL 42720 DAY);
insert into resident_import set name = 'CARMINE J MACERA', address = '1444 MAHARIS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1553', date = ADDDATE('1899-12-30',INTERVAL 42723 DAY);
insert into resident_import set name = 'MARLENE A HUNNINGS', address = '4801 MCKENZIE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#3434', date = ADDDATE('1899-12-30',INTERVAL 42724 DAY);
insert into resident_import set name = 'ELIZABETH J TOUHEY', address = '4909 LEATHERNECK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#7000', date = ADDDATE('1899-12-30',INTERVAL 42719 DAY);
insert into resident_import set name = 'MADELEINE  L KOPERDAK', address = '5057 FINN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#1337', date = ADDDATE('1899-12-30',INTERVAL 42720 DAY);
insert into resident_import set name = 'RICHARD F BROUDY', address = '4421 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#46626202', date = ADDDATE('1899-12-30',INTERVAL 42732 DAY);
insert into resident_import set name = 'DORIS CREWS ZIMMERMAN', address = '5068 SCHOOL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#1942', date = ADDDATE('1899-12-30',INTERVAL 42727 DAY);
insert into resident_import set name = 'CAPT KENNETH G LYONS', address = '4460 LEE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#4456', date = ADDDATE('1899-12-30',INTERVAL 42727 DAY);
insert into resident_import set name = 'JACK L SIEGEL', address = '1621 MEETING HOUSE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#2334', date = ADDDATE('1899-12-30',INTERVAL 42726 DAY);
insert into resident_import set name = 'PETER G FISHER', address = '1637 ARROWHEAD PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#3429', date = ADDDATE('1899-12-30',INTERVAL 42725 DAY);
insert into resident_import set name = 'PATRICK L CAUSEY', address = '4459 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#2804', date = ADDDATE('1899-12-30',INTERVAL 42724 DAY);
insert into resident_import set name = 'DIANE P WHEELER', address = '4825 STATION HOUSE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#5460', date = ADDDATE('1899-12-30',INTERVAL 42727 DAY);
insert into resident_import set name = 'THOMAS H YOUNG', address = '5009 LAUDERDALE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#3555', date = ADDDATE('1899-12-30',INTERVAL 42728 DAY);
insert into resident_import set name = 'TERRI J HEWITT', address = '4936 FARRINGTON DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1178', date = ADDDATE('1899-12-30',INTERVAL 42731 DAY);
insert into resident_import set name = 'GARY R  MELODY H HARTRANFT REV LIV TR', address = '4200 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#9626', date = ADDDATE('1899-12-30',INTERVAL 42730 DAY);
insert into resident_import set name = 'MELVIN AND ELEANOR ELLIOTT', address = '5859 BURTON STATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '250', method = 'BIZREPLY', note = 'chk#5621', date = ADDDATE('1899-12-30',INTERVAL 42733 DAY);
insert into resident_import set name = 'ALLEN I PALMER JR', address = '4405 POWELLS POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#5427', date = ADDDATE('1899-12-30',INTERVAL 42733 DAY);
insert into resident_import set name = 'BURKEMAN MANUEL', address = '1528 JANKE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1063', date = ADDDATE('1899-12-30',INTERVAL 42733 DAY);
insert into resident_import set name = 'LELAND L OWENS JR', address = '1500 DOEWOOD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#4151', date = ADDDATE('1899-12-30',INTERVAL 42733 DAY);
insert into resident_import set name = ' CARL B STERZING III', address = '4475 LEE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#3104', date = ADDDATE('1899-12-30',INTERVAL 42735 DAY);
insert into resident_import set name = 'THOMAS M MCNICHOLAS JR', address = '4153 HERMITAGE PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '75', method = 'BIZREPLY', note = 'chk#2298', date = ADDDATE('1899-12-30',INTERVAL 42732 DAY);
insert into resident_import set name = 'ELIZABETH A MOXEY', address = '1513 HEDGEROW DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '15', method = 'BIZREPLY', note = 'chk#2873', date = ADDDATE('1899-12-30',INTERVAL 42731 DAY);
insert into resident_import set name = 'JOHN D PARKS', address = '4140 COUNTRY CLUB CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#3444', date = ADDDATE('1899-12-30',INTERVAL 42734 DAY);
insert into resident_import set name = 'BROOKS O BOATWRIGHT JR', address = '4673 CHURCH POINT PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#4218', date = ADDDATE('1899-12-30',INTERVAL 42727 DAY);
insert into resident_import set name = 'POE ENTERPRISES, INC', address = '5096 SCHOOL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '250', method = 'BIZREPLY', note = 'chk#14054', date = ADDDATE('1899-12-30',INTERVAL 42731 DAY);
insert into resident_import set name = 'MICHAEL G LEIDY', address = '2216 BEECH ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#6721', date = ADDDATE('1899-12-30',INTERVAL 42735 DAY);
insert into resident_import set name = 'ROBERT LEE CURFMAN JR', address = '1425 SHAMROCK AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '10', method = 'BIZREPLY', note = 'chk#4775', date = ADDDATE('1899-12-30',INTERVAL 42740 DAY);
insert into resident_import set name = 'JOHN M STEWARD JR', address = '4464 LEE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#50016610', date = ADDDATE('1899-12-30',INTERVAL 42741 DAY);
insert into resident_import set name = 'JEANETTE M NOREN', address = '1192 HILLOCK XING', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#1611', date = ADDDATE('1899-12-30',INTERVAL 42738 DAY);
insert into resident_import set name = 'MARY B ADAMS', address = '4408 POWELLS POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '25', method = 'BIZREPLY', note = 'chk#1959', date = ADDDATE('1899-12-30',INTERVAL 42745 DAY);
insert into resident_import set name = 'GINGER L FERRIS', address = '4336 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '80', method = 'BIZREPLY', note = 'chk#1002', date = ADDDATE('1899-12-30',INTERVAL 42734 DAY);
insert into resident_import set name = 'NANCY C NORMAN', address = '4333 TWO WOODS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#7816', date = ADDDATE('1899-12-30',INTERVAL 42739 DAY);
insert into resident_import set name = 'ELIZABETH C ROBERTS', address = '4201 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '50', method = 'BIZREPLY', note = 'chk#52828210', date = ADDDATE('1899-12-30',INTERVAL 42748 DAY);
insert into resident_import set name = 'JILL NICKEL BROOME', address = '3980 AERIES WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#579', date = ADDDATE('1899-12-30',INTERVAL 42673 DAY);
insert into resident_import set name = 'JILL NICKEL BROOME ', address = '2373 ROOKERY WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '100', method = 'BIZREPLY', note = 'chk#4763', date = ADDDATE('1899-12-30',INTERVAL 42675 DAY);
insert into resident_import set name = 'MARGARET C EDGERTON', address = '4811 BAY WINDS CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS', amount = '15', method = 'BIZREPLY', note = 'chk#5940', date = ADDDATE('1899-12-30',INTERVAL 42746 DAY);
;
-- --
--
--
-- Insert output column from spreadsheet(s) above this comment.  If working with multiple lists, the order should be Residents, Businesses, Donors.
--
-- --
;
--
-- STATE
--
;
update resident_import set state = 'VA' where state = 'VIRGINIA'
;
insert ignore state (abbreviation) select distinct state from resident_import
  -- DO NOT POLLUTE state TABLE WITH UNVERIFIED/UNVALIDATED/UNNORMALIZED DATA!
  -- 1. In MySQL Workbench, run "select * from state order by id" and make a note of existing watermark.
  -- 2. In MySQL Workbench, uncomment the above INSERT statement WITHOUT SAVING THE CHANGE TO THE SCRIPT.
  -- 3. In MySQL Workbench, run the unsaved script.
  -- 4. In MySQL Workbench, run "select * from state order by id" and make a note of new entries (past watermark).
  -- 5. For UNVERIFIED/UNVALIDATED/UNNORMALIZED new entries, make correction(s) in the work/spreadsheet and re-populate this template.
  -- 6. Once there are no UNVERIFIED/UNVALIDATED/UNNORMALIZED new entries, save the script with the above insert statement UNCOMMENTED.
;
update resident_import join state on (state.abbreviation=resident_import.state) set state_id = state.id
;
--
-- CITY
--
;
update resident_import set city = "VIRGINIA BEACH" where city = "VIRGINIA BCH"
;
insert ignore city (name,state_id) select distinct resident_import.city as name, resident_import.state_id as state_id from resident_import
  -- DO NOT POLLUTE city TABLE WITH UNVERIFIED/UNVALIDATED/UNNORMALIZED DATA
  -- 1. In MySQL Workbench, run "select * from city order by id" and make a note of existing watermark.
  -- 2. In MySQL Workbench, uncomment the above INSERT statement WITHOUT SAVING THE CHANGE TO THE SCRIPT.
  -- 3. In MySQL Workbench, run the unsaved script.
  -- 4. In MySQL Workbench, run "select * from city order by id" and make a note of new entries (past watermark).
  -- 5. For UNVERIFIED/UNVALIDATED/UNNORMALIZED new entries, make correction(s) in the work/spreadsheet and re-populate this template.
  -- 6. Once there are no UNVERIFIED/UNVALIDATED/UNNORMALIZED new entries, save the script with the above insert statement UNCOMMENTED.
;
update resident_import join city on (city.name=resident_import.city and city.state_id=resident_import.state_id) set city_id = city.id
;
--
-- Scrub address
--
;
update resident_import set address = REPLACE(address,'  ',' ')
;
update resident_import set address = REPLACE(address,' 1/2','-1/2')
;
update resident_import set address = REPLACE(address,'- ','-')
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
update ignore resident_import
set house_num = LEFT(address,LOCATE(' ',address) - 1)
 , address = SUBSTRING(address,LOCATE(' ',address) + 1)
where address REGEXP '^[0-9].+'
;
update ignore resident_import
set house_num = SUBSTRING(address,LOCATE('PO BOX ',address) + 7)
 , address = 'PO BOX'
where address like 'PO BOX %'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' APT ',address) + LENGTH(' APT ')))
, address = LEFT(address,LOCATE(' APT ',address) - 1)
where address REGEXP '^.* APT .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' BLDG ',address) + LENGTH(' BLDG ')))
, address = LEFT(address,LOCATE(' BLDG ',address) - 1)
where address REGEXP '^.* BLDG .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' DEPT ',address) + LENGTH(' DEPT ')))
, address = LEFT(address,LOCATE(' DEPT ',address) - 1)
where address REGEXP '^.* DEPT .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' FL ',address) + LENGTH(' FL ')))
, address = LEFT(address,LOCATE(' FL ',address) - 1)
where address REGEXP '^.* FL .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' HNGR ',address) + LENGTH(' HNGR ')))
, address = LEFT(address,LOCATE(' HNGR ',address) - 1)
where address REGEXP '^.* HNGR .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' LOT ',address) + LENGTH(' LOT ')))
, address = LEFT(address,LOCATE(' LOT ',address) - 1)
where address REGEXP '^.* LOT .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' PIER ',address) + LENGTH(' PH ')))
, address = LEFT(address,LOCATE(' PH ',address) - 1)
where address REGEXP '^.* PH .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' PIER ',address) + LENGTH(' PIER ')))
, address = LEFT(address,LOCATE(' PIER ',address) - 1)
where address REGEXP '^.* PIER .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' RM ',address) + LENGTH(' RM ')))
, address = LEFT(address,LOCATE(' RM ',address) - 1)
where address REGEXP '^.* RM .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' SLIP ',address) + LENGTH(' SLIP ')))
, address = LEFT(address,LOCATE(' SLIP ',address) - 1)
where address REGEXP '^.* SLIP .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' SPC ',address) + LENGTH(' SPC ')))
, address = LEFT(address,LOCATE(' SPC ',address) - 1)
where address REGEXP '^.* SPC .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' STE ',address) + LENGTH(' STE ')))
, address = LEFT(address,LOCATE(' STE ',address) - 1)
where address REGEXP '^.* STE .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' STOP ',address) + LENGTH(' STOP ')))
, address = LEFT(address,LOCATE(' STOP ',address) - 1)
where address REGEXP '^.* STOP .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' SUITE ',address) + LENGTH(' SUITE ')))
, address = LEFT(address,LOCATE(' SUITE ',address) - 1)
where address REGEXP '^.* SUITE .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' UNIT ',address) + LENGTH(' UNIT ')))
, address = LEFT(address,LOCATE(' UNIT ',address) - 1)
where address REGEXP '^.* UNIT .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' # ',address) + LENGTH(' # ')))
, address = LEFT(address,LOCATE(' # ',address) - 1)
where address REGEXP '^.* # .*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' #',address) + LENGTH(' #')))
, address = LEFT(address,LOCATE(' #',address) - 1)
where address REGEXP '^.* #.*'
;
update ignore resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' TRLR ',address) + LENGTH(' TRLR ')))
, address = LEFT(address,LOCATE(' TRLR ',address) - 1)
where address REGEXP '^.* TRLR .*'
;
update ignore resident_import
set house_num = concat(house_num,"-","BSMT")
, address = LEFT(address,LOCATE(' BSMT',address) - 1)
where address REGEXP '^.* BSMT$'
;
update ignore resident_import
set house_num = concat(house_num,"-","FRNT")
, address = LEFT(address,LOCATE(' FRNT',address) - 1)
where address REGEXP '^.* FRNT$'
;
update ignore resident_import
set house_num = concat(house_num,"-","LBBY")
, address = LEFT(address,LOCATE(' LBBY',address) - 1)
where address REGEXP '^.* LBBY$'
;
update ignore resident_import
set house_num = concat(house_num,"-","LOWR")
, address = LEFT(address,LOCATE(' LOWR',address) - 1)
where address REGEXP '^.* LOWR$'
;
update ignore resident_import
set house_num = concat(house_num,"-","OFC")
, address = LEFT(address,LOCATE(' OFC',address) - 1)
where address REGEXP '^.* OFC$'
;
update ignore resident_import
set house_num = concat(house_num,"-","PH")
, address = LEFT(address,LOCATE(' PH',address) - 1)
where address REGEXP '^.* PH$'
;
update ignore resident_import
set house_num = concat(house_num,"-","REAR")
, address = LEFT(address,LOCATE(' REAR',address) - 1)
where address REGEXP '^.* REAR$'
;
update ignore resident_import
set house_num = concat(house_num,"-","SIDE")
, address = LEFT(address,LOCATE(' SIDE',address) - 1)
where address REGEXP '^.* SIDE$'
;
update ignore resident_import
set house_num = concat(house_num,"-","UPPR")
, address = LEFT(address,LOCATE(' UPPR',address) - 1)
where address REGEXP '^.* UPPR$'
;
--
-- Prepend 0 to single digit house numbers with unit numbers, to force proper USPS interpretation/standardization.
--
;
update resident_import set house_num = CONCAT('0',house_num) where house_num rlike '^[1-9]-'
;
--
-- Extricate "post-directionals" (such as CENTERVILLE TPKE N) so we can normalize street suffixes.
--
;
update ignore resident_import
set post_directional = 'N'
, address = LEFT(address,LENGTH(address) - LENGTH(' N'))
where address REGEXP '^.* N$'
;
update ignore resident_import
set post_directional = 'NE'
, address = LEFT(address,LENGTH(address) - LENGTH(' NE'))
where address REGEXP '^.* NE$'
;
update ignore resident_import
set post_directional = 'E'
, address = LEFT(address,LENGTH(address) - LENGTH(' E'))
where address REGEXP '^.* E$'
;
update ignore resident_import
set post_directional = 'SE'
, address = LEFT(address,LENGTH(address) - LENGTH(' SE'))
where address REGEXP '^.* SE$'
;
update ignore resident_import
set post_directional = 'S'
, address = LEFT(address,LENGTH(address) - LENGTH(' S'))
where address REGEXP '^.* S$'
;
update ignore resident_import
set post_directional = 'SW'
, address = LEFT(address,LENGTH(address) - LENGTH(' SW'))
where address REGEXP '^.* SW$'
;
update ignore resident_import
set post_directional = 'W'
, address = LEFT(address,LENGTH(address) - LENGTH(' W'))
where address REGEXP '^.* W$'
;
update ignore resident_import
set post_directional = 'NW'
, address = LEFT(address,LENGTH(address) - LENGTH(' NW'))
where address REGEXP '^.* NW$'
;
--
-- Normalized street name suffixes.
--
;
update ignore resident_import set address = NORMALIZED_STREET_SUFFIX_RENDITION(address)
;
--
-- Reattach post-directionals to the end of address.
--
;
update ignore resident_import set address = CONCAT(address,' ',post_directional) where post_directional is not null
;
--
-- STREET
--
;
insert ignore street (name,city_id) select distinct resident_import.address as name, resident_import.city_id as city_id from resident_import
  -- DO NOT POLLUTE street TABLE WITH UNVERIFIED/UNVALIDATED/UNNORMALIZED DATA
  -- 1. In MySQL Workbench, run "select * from street order by id" and make a note of existing watermark.
  -- 2. In MySQL Workbench, uncomment the above INSERT statement WITHOUT SAVING THE CHANGE TO THE SCRIPT.
  -- 3. In MySQL Workbench, run the unsaved script.
  -- 4. In MySQL Workbench, run "select * from street order by id" and make a note of new entries (past watermark).
  -- 5. For UNVERIFIED/UNVALIDATED/UNNORMALIZED new entries, make correction(s) in the work/spreadsheet and re-populate this template.
  -- 6. Once there are no UNVERIFIED/UNVALIDATED/UNNORMALIZED new entries, save the script with the above insert statement UNCOMMENTED.
;
update resident_import join street on (street.name=resident_import.address and street.city_id=resident_import.city_id) set street_id = street.id
;
--
-- NAME
--
;
update resident_import set name = NULL where name = ""
;
--
-- Perform additional nit-picks made easier by the extrication of house_num and street
--
delete from resident_import where name is null and house_num is null
;
--
-- APPEND resident_import TO resident_base
--
;
insert ignore resident_base (id,name,agency,house_num,street_id,id_in_agency_system)
select @id := @id + 1 as id
, name
, agency
, house_num
, street_id
, id_in_agency_system
from (select @id := max(id) from resident_base) as init, resident_import
;
update resident_base
  join resident_import
    on (resident_import.street_id=resident_base.street_id and resident_import.house_num=resident_base.house_num and resident_import.agency=resident_base.agency)
set resident_base.name = resident_import.name, resident_base.id_in_agency_system = resident_import.id_in_agency_system
;
insert ignore donation (id,amount,note,method,in_mem_of,date,entered_by,per_clerk_seq_num)
select id
, amount
, IFNULL(note,'Identified as a donor in external data import') as note
, method
, in_mem_of
, date
, 'OscarTRACK' as entered_by
, @n := @n + 1 as per_clerk_seq_num
from (select @n := max(per_clerk_seq_num) from donation where entered_by = 'OscarTRACK') as init, resident_base
  join resident_import
    on (resident_import.street_id=resident_base.street_id and resident_import.house_num=resident_base.house_num and resident_import.agency=resident_base.agency)
;
COMMIT
