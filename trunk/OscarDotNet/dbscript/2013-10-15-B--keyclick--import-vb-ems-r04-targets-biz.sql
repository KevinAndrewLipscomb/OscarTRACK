START TRANSACTION
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
    `state_id` BIGINT UNSIGNED
  ,
    `city_id` BIGINT UNSIGNED
  ,
    `house_num` VARCHAR(15)
  ,
    `street_id` BIGINT UNSIGNED
  )
;
insert ignore resident_import set name = '1031 ENTERTAINMENT', address = '1421 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = '1ST CLASS TAXI', address = '5765 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = '2 B DETERMINED STUDIOS', address = '4604 GUAM ST # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = '7-ELEVEN', address = '1700 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = '7-ELEVEN', address = '1900 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = '7-ELEVEN', address = '2220 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = '7-ELEVEN', address = '5756 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'A & L INVESTMENTS', address = '1113 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'A & L LLC', address = '4419 OCEAN VIEW AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'A CHILDS DREAM LLC', address = '1270 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'A TO Z PROMOTIONAL PRODUCTS', address = '1395 LAKESIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'A YELLOW CAB CO', address = '1122 PRIDDY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'A-AA FOUR WINDS CHARTERING', address = '5436 SUNNYWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'A-DELSIGNORE & CO', address = '4612 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'A-T SOLUTIONS', address = '1300 DIAMOND SPRINGS RD # 206', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ABACUS RACING', address = '1372 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ABC CONSTRUCTION & SVC', address = '1209 BAKER RD # 306', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ABERDEEN BARN OF VA BEACH', address = '5805 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ABLER COMMUNICATIONS', address = 'PO BOX 5744', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ACCENT LANDSCAPING', address = '1642 PLEASURE HOUSE RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ACCENT TREE CARE', address = '1642 PLEASURE HOUSE RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ACCU TUNE N LUBE', address = '1613 INDEPENDENCE BLVD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ACE HOUSE MOVERS INC', address = '1353 LAKESIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ACOSTA SALES & MARKETING', address = '5820 WARD CT # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ACS LOGISTICS', address = '1345 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ADAM THOROUGHGOOD HOUSE', address = '3131 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ADAMS HANDY SVC', address = '1241 BAKER RD # 15', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ADAMS HANDYMAN SVC LLC & CONTR', address = '4940 RUTHERFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ADMIRALS HOCKEY', address = '1300 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ADRIAS PET SVC', address = '5629 ARAGON DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ADVANCE AUTO PARTS', address = '4733 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ADVANCED AEROMEDICAL', address = '4801 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ADVANCED EPOXY COATINGS LLC', address = '2401 COURTYARD LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ADVANCED GLASS TINTING', address = '1493 DIAMOND SPRINGS RD # 108', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AETNA INSULATED WIRE LLC', address = '1537 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AFFORDABLE CONCRETE HOMES INC', address = '3948 MEETING HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AFFORDABLE DOOR SOLUTIONS', address = '4607 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AFFORDABLE FLOORS INC', address = '5788 WARD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AFFORDABLE FLOORS SALES & SVC', address = '5741 BAYSIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AFFORDABLE PLUMBING LLC', address = '4827 TULIP DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AFFORDABLE PLUMBING SVC', address = '5420 LAKE SMITH DR # 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AFFORDABLE TREE SVC', address = '5337 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AFFORDABLE VETERINARY SVC-VA', address = '1924 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AFK BOOKS', address = '4801 SHORE DR # D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AGRICULTURAL RESEARCH & EXT', address = '1444 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AIT', address = '5741 BAYSIDE RD # 109', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALANS PLUMBING', address = '4717 NEWGATE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALBEMARLE HOME IMPROVEMENT SVC', address = '1228 HABITAT LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALCAR MULTIMEDIA', address = '5425 SHADOWWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALERE TOXICOLOGY SVC', address = '1399 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALEXANDERS ON THE BAY', address = '4536 OCEAN VIEW AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALL ABOUT FLOORING LLC', address = '1209 BAKER RD # 304', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALL ASPECTS CONSTRUCTION', address = '4441 OCEAN VIEW AVE # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALL MARBLE INC', address = '4801 BEACH COVE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALL STAR ENTERTAINMENT', address = '2341 BAYVILLE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALLEGRA MARKETING PRINT MAIL', address = '1429 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALLEN CO', address = '4416 POWELLS POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALLIED RESEARCH TECHNOLOGY INC', address = '1425 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALLIED TECHNOLOGY GROUP INC', address = '1569 DIAMOND SPRINGS RD # C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALSCO INC', address = 'PO BOX 5513', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ALSIDE SUPPLY CTR', address = '1431 BAKER RD # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AMAZING REGLAZING', address = '4749 BAY QUARTER CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AMER BUILDING INSPECTION SVC', address = '2364 ROOKERY WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AMERICAN AIR SOLUTIONS', address = '2244 ACORN CV', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AMERICAN EQUIPMENT CLEANING', address = '5620 AURORA DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AMERICAN FABRICATION & SURPLUS', address = '4853 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AMERICAN TRANSMISSION SVC', address = '1613 INDEPENDENCE BLVD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AMERICAS BEST VALUE INN', address = '5725 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AMSOIL SYNTHETIC LUBRICANTS', address = '1370 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'J WESLEY ANDERSON JR DDS', address = '1658 PLEASURE HOUSE RD # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ANGEL SYSTEM INC', address = '4940 RUTHERFORD RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ANGELICAS TOUCH', address = '4608 GALEFORCE CT # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ANOINTED HANDS OF ELEGANCE HR', address = '5636 ANTHONY RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ANTIQUES APPRAISAL & ESTATE', address = '4552 CHURCH POINT PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'APARTMENT GUIDE', address = '1457 MILLER STORE RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ARAI AMERICAS INC', address = '5878 BAYSIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ARBONNE INTERNATIONAL', address = '4934 LAUDERDALE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ARBYS', address = '5197 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ARCHADECK', address = '4304 COUNTRY CLUB CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ARGO MARINE & INDL', address = '1209 BAKER RD # 511', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ARMED SERVICES YMCA', address = '1465 LAKESIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ARMSTRONG KAREN M PHD PC', address = '1644 WAKEFIELD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ARTISTIC CREATIONS ART GALLERY', address = '4425 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ASAHI JAPANESE RESTAURANT', address = '1528 THOROUGHGOOD SHOP CTR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ATBP', address = '1637 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ATLANTIC CLEARING & GRADING CO', address = '1337 DOWNS LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ATLANTIC HEATING & COOLING', address = '1427 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ATLANTIC LANDSCAPE MANAGEMENT', address = '4912 SHELL RD # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ATLANTIC SERVICES OF VA INC', address = '1209 BAKER RD # 303', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ATLANTIC SERVICES OF VIRGINIA', address = '1395 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AUTO LAND', address = '1608 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AVATECH SOLUTIONS', address = '5656 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'AVIATION INVESTMENTS', address = '4121 HERMITAGE PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'B & B TECHNICAL SVC', address = '5629 QUARTERPATH GATE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'B & T INVESTMENT SOLUTIONS', address = '5545 AURORA DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'B & T KITCHENS & BATHS', address = '4429 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BALLOON CITY USA VIRGINIA BCH', address = '4309 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAMBOO HUT CHINESE RESTAURANT', address = '1801 PLEASURE HOUSE RD # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BASE CHAPEL', address = '1160 D ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BATHROOM MAGIC OF VIRGINIA', address = '5369 BAYSIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAY BEACH MASSAGE', address = '4440 OCEAN VIEW AVE # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAY BREEZE LIMOUSINE SVC INC', address = '4213 COUNTRY CLUB CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAY COAST RAILROAD', address = '2429 FERRY RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAY CONCIERGE', address = '4511 OCEAN VIEW AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAY GARAGE DOORS', address = 'PO BOX 5170', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAY OFFICE INSTALLATIONS INC', address = '5721 BAYSIDE RD # I', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAY POINT CONSTRUCTION', address = '4249C E LITTLE CREEK RD # 305', city = 'NORFOLK', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYLAKE UNITED METHODIST CHR', address = '4300 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYLAKES PINES PRIVATE SCHOOL', address = '4444 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE BAPTIST CHURCH', address = '1920 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE BAPTIST PRESCHOOL', address = '1920 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE CHIROPRACTIC', address = '1658 PLEASURE HOUSE RD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE CHRISTIAN CHR LEARNING', address = '2224 GREENWELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE CHRISTIAN CHURCH', address = '2224 GREENWELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE CHURCH OF CHRIST', address = '5025 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE CLEANERS', address = '4801 SHORE DR # A1', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE COMMUNITY RECREATION', address = '4500 FIRST COURT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE ELEMENTARY SCHOOL', address = '5649 BAYSIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE INN RSTRNT & LOUNGE', address = '2104 PLEASURE HOUSE RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE LAUNDRY & GRILL', address = '4865 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE TIRE & AUTO CTR', address = '4460 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE VETERINARY CLINIC', address = '4464 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE VILLAGE DAY SCHOOL', address = '1565 BRADFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYSIDE WELLNESS & FITNESS CTR', address = '1608 PLEASURE HOUSE RD # 113', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYVILLE GOLF CTR', address = 'PO BOX 5570', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BAYVILLE PARK', address = '4132 FIRST COURT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEACH FISH CO', address = '5092 GATEHOUSE WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEACH LAWN & GARDEN INC', address = '1760 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEACH MOBILE PC MEDIC', address = '5240 MILE COURSE WALK', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEACH TAE KWON DO', address = '4841 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEACH TAXI', address = '1122 PRIDDY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEACON ENTERPRISES', address = '5840 BURTON STATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEARD PHOTOGRAPHY', address = 'PO BOX 5863', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEARFOOT CONTRACTING', address = '4649 LAKE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEAVEX', address = '1209 BAKER RD # 314', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BECK COMMUNICATIONS & CONTRS', address = '2013 CASTLEREA CT # 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEE REALTY CORP', address = '4465 SHORE DR # 3', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEHAVIORAL INVENTIONS TRNNGS', address = '2108 THOROUGHGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BELLISSIMA HOME CLEANING LLC', address = '2521 BEAUFORT AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BELMONT PIZZA', address = '1270 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BENDING TREE TAI CHI KUNG', address = '1716 PLEASURE HOUSE RD # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BENTER HOMES', address = '4873 S OLIVER DR # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BENTER HOMES LLC', address = '1209 BAKER RD # 401', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEST COAT CUSTOM PAINTING', address = 'PO BOX 5175', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEST FAMILY MOVING & STORAGE', address = '4701 SHORE DR # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEST NEST HOME FURNISHINGS', address = '4640 SHORE DR # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEST VALUE HARDWARE', address = '4801 SHORE DR # H', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEST WAY TOWING INC', address = '4501 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BEST WESTERN', address = '5718 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BIG ALS MUFFLERS & BRAKES', address = '14100 WARWICK BLVD', city = 'NEWPORT NEWS', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BIG CHARLIES TRUCK PLAZA', address = '5792 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BIOGUARD PEST CONTROL', address = '1431 AIR RAIL AVE # E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BISEK & CO INC', address = 'PO BOX 5527', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BLUSH BEAUTY BAR', address = '4425 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BOJANGLES FAMOUS CHICKEN', address = '5753 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BOWMAN CONSULTING GROUP', address = '1561 BRADFORD RD # 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BRAID LOUNGE', address = '1220 BAKER RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BRASS BELL RESTAURANT & LOUNGE', address = '1628 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BRAVE ELECTRICAL CONTRACTING', address = '5629 LAWSON HALL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BREWSTERS PAINTING & PRESSURE', address = '5240 BARDITH CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BRIAN KILBY MECHANICAL SVC', address = '4512 DELMAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BROAD BAY SEAFOOD', address = '5000 VIRGIL ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BROADBAY COTTON CO', address = '5908 THURSTON AVE # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BROOME NICKEL ENTERPRISES', address = '2373 ROOKERY WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BROWNINGS ALTERNATOR STARTER', address = '1736 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BUGGY BATHE AUTO WASH & DETAIL', address = '4357 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BURKETT APPRAISAL SVC INC', address = 'PO BOX 231302', city = 'CENTREVILLE', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BUTTERFIELD BUILDING LLC', address = '1820 SUNRISE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'C & T VENTURES', address = '5152 LAKE SHORES RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'C A M SVC', address = '1013 PASTERN BRIEF', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'C D HAULING INC', address = 'PO BOX 5990', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'C D IMAGES & DATA', address = '4729 PRICE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'C P MARINE & DIESEL SVC', address = '5900 THURSTON AVE # E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'C X B PADDLE CO', address = '4654 GUAM ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CABIN FEVER ADVERTISING INC', address = '1300 DIAMOND SPRINGS RD # 206', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CABINETMAKERS HARDWARE', address = '5292 SHENSTONE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CAMELLIA FOOD STORES INC', address = '1300 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CAMPBELLS ASPHALT PAVING CO', address = '5420 SUNNYWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CAR DIRECT USA', address = '4740 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CAR SPA', address = '5715 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KENNETH CARBAUGH', address = '4400 SANDY BAY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CARDINAL ASSOCIATES INC', address = '1300 DIAMOND SPRINGS RD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CARDINAL MESSENGER LLC', address = '1449 MILLER STORE RD # C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CARE A LOT DAYCARE & BOARDING', address = '1924 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CARE A LOT TRAINING', address = '1924 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CARE-A-LOT PETS SUPPLIES', address = '1617 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CAYS POOLS & CONCRETE', address = '5268 BARDITH CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CCS CARIBBEAN & SOUL FOOD', address = '5765 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CDI MARINE CO', address = '1391 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CDI MARINE CO', address = '5700 WARD AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CEILINGS LESS FAN SUPPORTS', address = '2280 GREENWELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CEILINGS UNLIMITED INC', address = '4940 RUTHERFORD RD # 206', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CELLARS RESTAURANT', address = '4001 CHURCH POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CENTURION GROUP INC', address = '1431 BAKER RD # C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CENTURY CONCRETE', address = '1364 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CENTURY TOWING SVC INC', address = '1244 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHAKRABORTTY & CHAKRABORTTY', address = '4069 TIMBER RIDGE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHANELLOS PIZZA', address = '2226 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHARIS SUPPORT SVC INC', address = '1561 BRADFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHCG TELEPHONE INSTALLATION', address = '5925 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHEETAHS GENTLEMANS CLUB', address = '1812 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHEETAHS GO GO LOUNGE', address = '1808 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHENS WOK', address = '4861 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHERIE A JAMES CPA', address = '1444 SHAMROCK AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHESAPEAKE BAY BRIDGE & TUNL', address = '32386 LANKFORD HWY', city = 'CAPE CHARLES', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHESAPEAKE BAY PAIN MEDICINE', address = '4813 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHESAPEAKE BEACH RESCUE DEPT', address = '2444 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHESAPEAKE BUILDERS INC', address = '4430 GULLS QUAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHINA GARDEN EXPRESS', address = '1621 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHITRA PRODUCTIONS', address = '4948 LAUDERDALE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHURCH OF CHRIST SOUTHSIDE', address = '1925 SUNRISE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CHURCH POINT MANOR', address = '4001 CHURCH POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CLARUS CO THE LLC', address = '2231 GREENWELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CLEANX CLEANING SVC CO', address = '4333 SANDY BAY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CLEAR WATER AQUARIUMS', address = '5512 SUNNYWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CLOWNING AROUND', address = '5523 FINESPUN LAST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CMG APPRAISALS', address = '5560 AURORA DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'COASTAL HARDWARE INC', address = '5840 BURTON STATION RD # 109', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'COASTAL MARINE SOLUTIONS', address = '1537 GARDENWOOD PKWY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'COASTAL MARINE SVC INC', address = '1453 MILLER STORE RD # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'COLFAX CORP', address = '5840 BURTON STATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'COMFORT INN', address = '5808 BURTON STATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'COMMERCIAL CONSTRUCTION SVC', address = '4912 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'COMMONWEALTH TRAVEL CTR', address = '4341 SANDY BAY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'COMMUNICATIONTELECOM GROUP-CTG', address = '1183 HILLOCK XING', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'COMMUNITY ASSOCIATIONS INST', address = '1300 DIAMOND SPRINGS RD # 400', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'COMMUNITY DATA SVC', address = '1825 SUNRISE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'COMPASION LLC', address = '5700 THURSTON AVE # 209', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'COMPLETE AUTOMOTIVE UPHOLSTERY', address = '1493 DIAMOND SPRINGS RD # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CONCERT GROUP LOGISTICS', address = '1561 BRADFORD RD # 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CONTEMPORARY NAILS', address = '2104 PLEASURE HOUSE RD # E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CORE SOLUTIONS OF VA LLC', address = '5109 MANSARDS CT # 203', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CORY HOME DELIVERIES', address = '5820 WARD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'COURTYARD LAWN MAINTENANCE', address = '1533 LAKEVIEW DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CRAWLSPACE DOOR SYSTEMS INC', address = '5741 BAYSIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CREATIVE SALES & MARKETING', address = '1401 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CRUISES INC', address = '5505 LIVERY BRIEF', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CUSTOM CYCLE DESIGN', address = '1493 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CUSTOM DRYWALL & ACOUSTICS INC', address = '1209 BAKER RD # 515', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CUSTOM DVR SOLUTIONS', address = '5225 W LAKE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CUSTOM TOPS INC', address = '4940 RUTHERFORD RD # 209', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CUTT-N-LOOSE', address = '2424 SEAVIEW AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CUTTLES DOG GROOMING', address = '2456 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CVS/PHARMACY', address = '1701 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'D & CLEANING SVC INC', address = '4932 ADELIA DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'D M SHIELDS ELECTRIC CO', address = '4429 DELCO RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'D N A PHOTOGRAPHY', address = '1263 HILLOCK XING', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DA-VI NAILS', address = '4249 E LITTLE CREEK RD # B', city = 'NORFOLK', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DACCO DETROIT OF VA INC', address = '1399 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DADSON ARMS APARTMENTS', address = '4797 DADSON CT # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DAL-TILE', address = '5733 BAYSIDE RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DAM NECK SQUARE APARTMENTS', address = '4797 DADSON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DANS POOLS', address = '4428 OCEAN VIEW AVE # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DANNYS UPHOLSTERY', address = '4904 RUTHERFORD RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DATA PRO DIRECT MAIL', address = '1637 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DAVID SCHWARTZ PHOTOGRAPHY', address = '1700 PLEASURE HOUSE RD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DCS COMPUTER SVC', address = '4757 BIRDSONG LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DEFINITIVE HOMES', address = '4904 RUTHERFORD RD # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DELACRUZ JONALYN', address = '4600 DOWNEAST CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DELEGATE CHRISTOPHER P STOLLE', address = 'PO BOX 5429', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DELTA DEMOLITION GROUP INC', address = '5701 THURSTON AVE # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DENIZ', address = '4209 BATTERY RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DENNIS GERWITZ LAND SURVEYORS', address = '2348 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DENNYS', address = '5720 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DESIGNER STYLISTS', address = '1270 DIAMOND SPRINGS RD # 114', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DESIGNS BY SHIRLENE', address = '5021 CULLEN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DIAMOND SPRINGS APARTMENTS', address = '5800 BANGOR SQ', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DIAMOND SPRINGS BAPTIST CHURCH', address = '5644 BAYSIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DIAMOND SPRINGS CHRISTIAN CHR', address = '5612 HADEN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DIAMOND SPRINGS CITGO', address = '1560 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DIAMOND SPRINGS GARDENWOOD', address = '5652 HADEN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DIAMOND SPRINGS PET SPA', address = '1270 DIAMOND SPRINGS RD # 119', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DIAPER JUNCTION', address = '1209 BAKER RD # 301', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DIFFERENTIAL PRESSURE INSTRMNT', address = '1619 DIAMOND SPRINGS RD # D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DIVERS UNLIMITED', address = '4247 E LITTLE CREEK RD', city = 'NORFOLK', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DIVINE RATIO', address = '5025 GATEHOUSE WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DLUSH EUROPEAN DAY SPA', address = '4425 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DNA RECORDING STUDIO', address = '4940 RUTHERFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DOLLAR GENERAL', address = '1948 DIAMOND SPRINGS RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DOLLAR GENERAL', address = '4807 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DOLLAR TREE', address = '4805 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DONNA ROANE-ALLSTATE AGENT', address = '1801 PLEASURE HOUSE RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DOORS ON DEMAND', address = '1209 BAKER RD # 303', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DOUBLE TAP SURPLUS LLC', address = '5760 NORTHAMPTON BLVD # 118', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DOUGLAS BUILDING & DECK', address = '4525 DELMAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DOYLE ENTERPRISES', address = '4425 BOWDEN AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DRAJON', address = '4807 SHORE DR # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DRAJON INC', address = '4807A SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DRD CO', address = '4740 BIRDSONG LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DRIFTWOOD APARTMENTS', address = '1634 DIAMOND SPRINGS RD # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DRUCKER & FALK', address = '5770 THURSTON AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DUPRES SALON & DAY SPA', address = '1708 PLEASURE HOUSE RD # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DYNARIC INC', address = '5740 BAYSIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DYNARIC INC', address = '5925 THURSTON AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'DYNASTY', address = '5725 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'E & C ENTERPRISES INC', address = '4492 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'E C & C', address = '4434 GULLS QUAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EAGLE PAPER INTL INC', address = '4912 RUTHERFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EAGLE TAILOR & CLEANERS', address = '2021 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EARLYBIRD MARKETING', address = '997 LARDER POST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EAST COAST ENTERTAINMENT', address = 'PO BOX 5457', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EASTERN ALUMINUM SUPPLY OF VA', address = '5770 THURSTON AVE # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EASTERN COMMERCIAL FLOORING', address = 'PO BOX 5459', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EASTERN SHORE VA WELCOME CTR', address = '32383 LANKFORD HWY', city = 'CAPE CHARLES', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EATABLE AFFAIRS', address = '1036 FAIRLAWN AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ECK SUPPLY CO', address = '5894 THURSTON AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ECONO LODGE-I-64', address = '5819 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ECOTUBES.NET', address = '1912 MEREDITH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EDDYS BUSINESS SVC', address = '1700 PLEASURE HOUSE RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EDGEWATER ASSET MANAGEMENT', address = '5244 SHENSTONE CIR # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EDWARD JONES', address = '1642 PLEASURE HOUSE RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EDWARDS-COUNCILOR CO INC', address = '1427 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EIMSKIP LOGISTICS', address = '1424 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ELITE POOL SVC', address = '1609 SHENSTONE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ELLERBROCK ROBIN', address = '4437 OCEAN VIEW AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ENERGY IN MOTION', address = '4640 SHORE DR # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ENLIGHTEN MASSAGE & BODYWORK', address = '1517 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ENTERPRISE RENT-A-CAR', address = '2017 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ENVIRONMENTAL CONSULTANTS', address = '4640 THOROUGHGOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ENVIRONMENTAL HEALTH SVC', address = '5700 THURSTON AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EQUITY DEVELOPMENT CORP', address = '4640 SHORE DR # 113', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EQUITY INDUSTRIES CORP', address = '5721 BAYSIDE RD # G', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ESSENCE WEDDINGS PRODUCTIONS', address = '1236 HILLOCK XING', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ESSENTIAL EATS LLC', address = '1716 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ESTES FORWARDING WORLDWIDE', address = '5733 BAYSIDE RD # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ESTONE INC', address = 'PO BOX 68171', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ETHAN ALLEN', address = '5908 THURSTON AVE # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EURPAC', address = '1421 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EVAN TAYLOR PHOTOGRAPHY', address = '5440 LAWSON HALL KY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EXECUTIVE HOMES CORP OF VA', address = '4205 EWELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'EXHIBIT SERVICES', address = '5770 THURSTON AVE # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'F D WELL DRILLING', address = '5456 SUNNYWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FAMARCO LIMITED', address = '1381 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FARMERS INSURANCE', address = '1700 PLEASURE HOUSE RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FASTAX INC', address = '1270 DIAMOND SPRINGS RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FEDEX FREIGHT', address = '5729 BAYSIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FEDEX OFFICE PRINT & SHIP CTR', address = '5824 NORTHAMPTON BLVD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FELIX AUTO INTERIOR & RSTYLNG', address = '1493 DIAMOND SPRINGS RD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FELIX AUTO INTERIORS INC', address = '1493 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FERQUERON HOME REPAIRS', address = '6004 WESLEYAN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FEX TRANSPORT INC', address = '1209 BAKER RD # 506', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FICARRA JEWELERS INC', address = '4425 CHANDLER LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FIELDTECH', address = '1905 SUNRISE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FILTREX USA LLC', address = 'PO BOX 68304', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FINAL TOUCH-UP & RESTORATION', address = '1220 BAKER RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FIRE SERVICES INC', address = 'PO BOX 5765', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FIRST LANDING AUTOCARE', address = '2900 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FLEET & FAMILY SUPPORT CTR', address = '1450 D ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FLEXSYNTHESIS SCIENTIFIC SVC', address = '1556 FROST RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FLINT CONSTRUCTION CO', address = '1397 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FLOUR CHILD BAKERY', address = '1716 PLEASURE HOUSE RD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FOOD LION', address = '5193 SHORE DR # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FOR YOUR HEAD ONLY', address = '1541 FULLER LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FOR YOUR PETS SAKE', address = 'PO BOX 55336', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FORENSIC PHOTO FRAMES LLC', address = '4137 COUNTRY CLUB CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FORREST ARTS & SPORTING ADVNTR', address = '4145 HERMITAGE PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FORREST STUDIO PHOTOGRAPHY', address = '5473 SHORE DR # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FOSTER DR LINDA BOMBINO DR-CHR', address = '1705 KEELING RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FR8 SOLUTIONS LLC', address = '1385 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FRANCAVILLA BUILDING CO', address = '4312 SANDY BAY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FRANKIES RESTAURANT', address = '4494 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FULFILLTOPIA.COM', address = '1457 MILLER STORE RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'FUNCTIONAL HUMAN DEVELOPMENT', address = '5921 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'G & C MOBILE', address = '4493 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'G C FINANCIAL SOLUTIONS', address = '4705 WINDSHORE DR # 204', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'G H MECHANICAL INC', address = '5069 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GAMBLE ACCOUNTING SVC', address = '4225 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GAMESTOP', address = '4701 SHORE DR # 115', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GARDNER & MENDOZA PC', address = '2106 THOROUGHGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GEKAY SOUTHEAST INC', address = '1209 BAKER RD # 201', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GEM', address = '4817 S OLIVER DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GENE GORMAN AUTO SALES', address = '4493 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GENERAL BUILDERS LLC', address = '5840 BURTON STATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GERALD LUCHS J LUCHS SIDING', address = '4449 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GERONIMO CONSTRUCTION INC', address = '1452 SHAMROCK AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GET HOMES LLC', address = '5205 TERN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GHENT MARKET ESTATE SALES', address = '4701 SHORE DR # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GLASS BARON INC', address = '1601 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GLENS COMPLETE TREE SVC', address = '1315 HILLOCK XING', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GLOBAL SUPPLY SOLUTIONS LLC', address = '1569 DIAMOND SPRINGS RD # C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GLOW AIRBRUSH TANNING LLC', address = '5048 GATEHOUSE WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GNC', address = '1170 AMPHIBIOUS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GOFORTH & GROW', address = '5030 GAFNEY LN # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GOOD GUYS PLUMBING', address = '5592 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GOOD ODD JOBS', address = '4822 BAY LANDING DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GOODWILL', address = '1345 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GORDON PAPER CO INC', address = 'PO BOX 1806', city = 'NORFOLK', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GOSPEL ASSEMBLY CHURCH', address = '4933 RUTHERFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GRAND AFFAIRS-A TOUCH OF CLASS', address = '2036 PLEASURE HOUSE RD # E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GRAND FURNITURE', address = '1301 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GRAND FURNITURE', address = 'PO BOX 5970', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GRANDE PIZZA', address = '1270 DIAMOND SPRINGS RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GRANDMA ANNAS TREASURES', address = '2215 CASABLANCA RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GRAPHICS TO GO INC', address = '2104 PLEASURE HOUSE RD # H', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GRAY SCALE PRODUCTIONS', address = '1423 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GREAT CLIPS', address = '4701 SHORE DR # 107', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GRECO RESEARCH ENGINEERING', address = '1637 INDEPENDENCE BLVD # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'CARY GRECO', address = '3837 CHURCH POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GREEN CLEAN', address = '1641 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GREEN TEAM', address = '4400 POWELLS POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GREGORY P JELLENEK & ASSOC PC', address = '1170 AMPHIBIOUS DR # 3443', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GREIF FLEXIBLES USA', address = '5921 THURSTON AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GROUP LEI LLC MAR', address = '4225 COUNTRY CLUB CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GROWTH RESOURCES LLC', address = '4413 WAKEFIELD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GULF', address = '5740 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'H & L TOMS DISTRIBUTORS', address = '5900 THURSTON AVE # D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'H K ON THE BAY', address = '4600 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'H L THOMPSON INC', address = '4700 OCEAN VIEW AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'H2O TO GO', address = '5821 WARD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HAIR & NAILS', address = '4801 SHORE DR # E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HAIR BY THE C', address = '1801 PLEASURE HOUSE RD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HAIR SHAPERS INC', address = '2222 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HAIR SOLUTIONS ETC LLC', address = '1642 PLEASURE HOUSE RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HAIRLINE BEAUTY SALON', address = '5193 SHORE DR # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HAMMER INC', address = '4704 WELDON ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HAMPTON DENTAL CLINIC', address = '1304 BRADDOCK AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HAMPTON ROADS AGRICULTURE', address = '1444 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HAMPTON ROADS CATHOLIC FED CU', address = '1209 BAKER RD # 309', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HAMPTON ROADS CONTACT INC', address = '1300 DIAMOND SPRINGS RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HAMPTON ROADS SANITATION DIST', address = '1436 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HAN WOO RI KOREAN RESTAURANT', address = '1209 BAKER RD # 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HARBOR INN APARTMENTS', address = '5600 ELIZABETH CT # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HARDEES', address = '1201 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HARMONY INVESTMENTS INC', address = '1300 DIAMOND SPRINGS RD # 204', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HAROLD J JR & SON MOVING', address = '5900 BURTON STATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HARRELL & HARRELL', address = '4501 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HARRINGTON GRAPHICS CO', address = '1411 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HARRISON CONTRACTING SVC LLC', address = '4861 S OLIVER DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HARRY T LESTER', address = '4139 FIRST COURT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HAWKINS 5 STAR CLEANING', address = '2154 KIMBALL CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HEAVENLY SWEETS BY ANITA', address = '4930 COTTON CREEK DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HELLS KITCHEN', address = '4600 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HENRY STONE SOLUTIONS LLC', address = '1512 WESTERFIELD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HERITAGE MOTOR CO', address = '5151 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HERITAGE MOTOR CO SVC CTR', address = '5037 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HERMITAGE CONSULTING ASSOC LTD', address = '4109 HERMITAGE PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HERMITAGE ELEMENTARY SCHOOL', address = '1701 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HERNDON SOLUTIONS LLC', address = '4460 LEE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HERON DEVELOPMENT', address = '1561 BRADFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HI 5 BALLOONS', address = '1234 HILLOCK XING', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HI-TECH INVESTIGATIONS', address = '1270 DIAMOND SPRINGS RD # 118', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HIBACHI KING BUFFET', address = '4249 E LITTLE CREEK RD # A', city = 'NORFOLK', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MANUEL A HIPOL MD', address = '4208 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HOBOS DEN', address = '5580 AURORA DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HOLLEYS FLORIST', address = '6036 WESLEYAN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HOME GRUN', address = '2509 CHUBB LAKE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HOMER OPTICAL INC', address = '5819A WARD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HONEST HANDYMAN SVC INC', address = '1208 MINION BRIEF', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HOPE DIAMONDS', address = '1712 LADYSMITH MEWS', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HOWARD JOHNSON', address = '5173 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HRSD', address = '5332 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HRUBS-HRSD CUSTOMER SVC', address = '1440 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HUNGERS HOME INSPECTIONS', address = '4716 BRADSTON RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WESLEY S HUNT', address = '4123 CHURCH POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HVAC WAREHOUSE', address = '1766 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'I & O MEDICAL CTR', address = '1290 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ICEPRESS', address = '1424 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ICEXPRESS', address = '1424 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'IGH APPRAISALS', address = '4701 SHORE DR # 103-182', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'IKE SPORTZ BAR & GRILL', address = '5760 NORTHAMPTON BLVD # 120', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'IMPALA LOGISTICS INC', address = '1424 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'IMPLANT DENTISTRY-VA', address = '2021 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'INDEPENDENCE CHILD THERAPY', address = '4807 LAUDERDALE AVE # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'INERTIA GLASS', address = '4404 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'INJURY LAW CTR', address = '4360 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'INNOVATION PRODUCT CO', address = '1675 MEREDITH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'INNOVATIVE MANAGEMENT', address = '5701 THURSTON AVE # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'INTEGRATIVE THERAPY', address = '2213 WESTSAIL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'INTEGRITY TELECOM INC', address = '1209 BAKER RD # 313', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'INTEGRITY TRANSPORTATION SVC', address = '2104 THOROUGHGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'J & D ICE CREAM', address = '1105 FREEHOLD CLOSE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'J & J FLOWERS DIRECT', address = '1387 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'J & J TOWN FLOORING', address = '1275 BAKER RD # 61', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'J C DRISKILL INC', address = '1297 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'J HAROLD JR & SON MOVING', address = '5900 BURTON STATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'J NELSON LANDSCAPE ARCHITECT', address = '4612 BRADSTON RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'J W DENTAL SVC', address = '2220 W BERRIE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JACK RABBIT SELF STORAGE', address = '5185 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JACOB GOMPERS', address = '5569 QUARTERPATH GATE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JACOB SPIRER SALES', address = '5205 LAKE SHORES RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JADE GARDEN IV', address = '5193 SHORE DR # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JAMAICA INN', address = '1948 DIAMOND SPRINGS RD # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JAMES DOORCHECK INC', address = '1453 MILLER STORE RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JANETS', address = '1642 PLEASURE HOUSE RD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JANMAR DOOR CONTROLS & GLASS', address = '2464 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JEAN J OWENS INSURANCE', address = '4905 ATHENS BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JEFCO INC', address = '1449 MILLER STORE RD # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JEFF EDNEY STUDIOS', address = '1209 BAKER RD # 307', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JEFFS HOME FOODS', address = '1905 PERREL ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JENNAS CAFE', address = '2104 PLEASURE HOUSE RD # 1', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JENNIFERS CREATIONS', address = '5117 MANSARDS CT # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JERSEY MIKES SUBS', address = '5832 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JJM ASSOCIATE', address = '1300 DIAMOND SPRINGS RD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JOAN GELLER DESIGNS', address = '5233 SHENSTONE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JOE AGUSTIN WALLCOVERING', address = '5601 QUARTERPATH GATE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JORDAN CO D', address = '1801 SUNRISE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JOSEPH LUST PHOTOGRAPHERS', address = '4428 LEE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JSH FLOORING', address = '4916 LAUDERDALE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JUST GRASS', address = '14 BRADFORD PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'K NAILS', address = '1270 DIAMOND SPRINGS RD # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'K T CO LLC', address = '1373 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STEVEN KAYOTA MD', address = '1300 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KAZAM', address = '5816 WARD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KEITH WATER GARDENS LANDSCPG', address = '1441 SHAMROCK AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KEN MORRAY RABIN ENTERPRISES', address = '4433 DELMAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KENNY BZ PRODUCTIONS', address = '4613 THOROUGHGOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KEVIN K CHARLES INC', address = '4701 SHORE DR # 103-435', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KIS TAILORS', address = '1716 PLEASURE HOUSE RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KIMIA INVEST', address = '4648 CHURCH POINT PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KIMS NAILS', address = '4845 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KINGS CHINESE RESTAURANT', address = '4701 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KOSMIC KHAMELEON', address = '1608 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'GARY L KREBS', address = '4201 THOROUGHGOOD LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KRISPY KREME DOUGHNUTS', address = '5832 NORTHAMPTON BLVD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KROGER', address = '4625 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KSR CONTRACTING', address = '4452 BLACKBEARD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'KYRUS ENTERPRISES', address = '4008 LAMBS CREEK CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'L M & P SANDBLASTING INC', address = '5437 SHADOWWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'L-3 UNIDYNE', address = '1619 DIAMOND SPRINGS RD # F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LA BAHIA RESTAURANT', address = '1948 DIAMOND SPRINGS RD # E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LA HERRADURA', address = '4801 SHORE DR # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LAKE BRADFORD APARTMENTS', address = '2252 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LAKEWRIGHT CITGO', address = '5820 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LAND & COATES INC', address = '5795 THURSTON AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LAND CONTAINER CO', address = '5720 BAYSIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LANDSCAPE CONNECTION', address = '4637 THOROUGHGOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LARSON JOYNES CABINET WORKS', address = '5900 THURSTON AVE # G', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LAT MARKETING', address = '1109 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LAW & LAW', address = '5548 FOREST VIEW DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LAWN & ORDER LANDSCAPING', address = '4452 OCEAN VIEW AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LCP INC', address = '4201 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LE WHITE BLDG CORP INC', address = '4533 BLACK COVE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LEAPING LIZARD CAFE', address = '4408 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LEARNING TREE', address = '5112 SHENSTONE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LEASHTEC LLC', address = '4449 BLACKBEARD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LEE MILTEER INC', address = '2100 THOROUGHGOOD RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LETADA DERMATOLOGY LLC', address = '1709 LAMBS CREEK LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LETHE ET CREPES', address = '1801 PLEASURE HOUSE RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LEVINSKY ELECTRIC INC', address = '5896 THURSTON AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LIBERTY TAX SVC', address = '5760 NORTHAMPTON BLVD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LINCOLN MILITARY HOUSING', address = '2100 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LION IN THE SAND', address = '4213 COUNTRY CLUB CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LITTLE BAY CANVAS & MORE', address = '1209 BAKER RD # 403', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LITTLE CAESARS PIZZA', address = '4801 SHORE DR # A5', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LITTLE CREEK SVC CTR', address = '1948 DIAMOND SPRINGS RD # F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LIVING WATERS MUSIC', address = '4452 OCEAN VIEW AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LIVINGSTON GROUP', address = '4768 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LLOYD & LLOYD', address = '1704 BIRCHWOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LOCKHEED MARTIN CORP', address = '5813 WARD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LOGIC CONSULTING', address = '4740 PRICE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LONG ISLAND OVERHEAD GARAGE', address = '4940 RUTHERFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LOVE PAIGE ART', address = '5224 SHENSTONE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LUBO WINE TASTING ROOM', address = '1658 PLEASURE HOUSE RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LUCYS FAMILY HAIR CARE', address = '1517 PLEASURE HOUSE RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LYNNHAVEN RIVER NOW', address = '1608 PLEASURE HOUSE RD # 108', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LYNX SERVICE', address = '5852 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'M & B HAULING', address = '5428 LAKE SMITH DR # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'M & S SHIPPING LTD', address = '5701 THURSTON AVE # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'M SUZANNA DUCKWORTH', address = '1701 BENNS CHURCH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MAACO', address = '1321 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MACS BBQ', address = '1444 LAKEVIEW DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MACHAMER FINANCIAL', address = '1708 PLEASURE HOUSE RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MACHINERY MOUNTING SOLUTIONS', address = '4216 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MAGNUSON HOTEL', address = '5708 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MAINTENANCE SOLUTIONS', address = '1249 HILLOCK XING', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MAMA MIA PIZZERIA', address = '1532 THOROUGHGOOD SHOP CTR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MAMMA MIA PIZZERIA', address = '1628 INDEPENDENCE BLVD # 1532', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MANAGEMENT CONSULTING INC', address = '1569 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MANCON INC', address = '1961 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MANNINOS ITALIAN BISTRO', address = '1608 PLEASURE HOUSE RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MANSARDS', address = '1501 KINDLY LN # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MAP ENVIRONMENTAL MAINTENANCE', address = '5612 ODESSA DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MARCHESE ITALIAN MARKET', address = '1700 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MARGARETS HOT DOG STAND', address = '4865 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MARINE CONTRACTING CORP', address = '1397 AIR RAIL AVE # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MARINE PROTECTION SYSTEMS INC', address = '1724 FIVE FORKS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MARINE SPILL RESPONSE CORP', address = '2465 FERRY RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MARITIME UNIVERSITY LLC', address = '5705 THURSTON AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MARLIN SOCCER ACADEMY', address = '4738 HOLLIS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MARTINS SOUL FOOD TO GO', address = '5765 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MARY PAINTER OPITZ PLC', address = '1701 BURROUGHS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MASA CORP', address = '5820 WARD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MASON DIXON INTERMODAL', address = '5858 BAYSIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MASON LANDSCAPING SUPPLIES', address = '1347 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MATHEWS GREEN', address = 'PO BOX 55202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MAYA TORTILLA LLC', address = '1393 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MC CORMICK INSULATION SUPPLY', address = '5892 THURSTON AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MC DONALDS', address = '1300 GATOR BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MC DONALDS', address = '5833 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MC FARLAND CONSTRUCTION', address = '4860 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MC NULTY MANAGEMENT GROUP', address = '4769 HERMITAGE RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MCKESSON', address = '5921 TAJO AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MEA MARKETING LLC', address = 'PO BOX 55065', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MECHANICAL CONCEPTS INC', address = '5569 DUNLOE DR # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MEEKINS & ASSOC', address = 'PO BOX 12773', city = 'NORFOLK', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MERCY ENTERTAINERS', address = '4731 BAY QUARTER CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MERMAID CHIX & TRITON', address = '4621 CORAL REEF LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MGT VIRGINIA', address = '4209 SANDY BAY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MICHAEL HENAHAN SALES REP', address = '2309 BAYVILLE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MICHELLE COBB CREATIVE', address = '5049 MADEIRA RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MID ATLANTIC TACO LLC', address = '5195 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MIKE STRADDECK & ASSOC', address = '4711 TULIP DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MIKES SKATE PARK', address = '4247 E LITTLE CREEK RD', city = 'NORFOLK', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MIKES TREE SVC', address = '4517 POWELLS POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MILITARY CHRISTIAN CTR', address = '5632 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MILITARY DELI & BAKERY SVC', address = '1180 AMPHIBIOUS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MILITARY SEWING SVC INC', address = '1774 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MILITARYCARFINANCING.COM', address = '5151 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MILLER STORE', address = '1449 MILLER STORE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MILLWOOD QUALITY CLEANERS', address = '5760 NORTHAMPTON BLVD # 114', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MINI MIRACLES LEARNING CTR', address = '4801 SHORE DR # F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MINISTRY TO SAINTS', address = '4720 THOROUGHGOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MINUTEMAN PRESS', address = '1637 INDEPENDENCE BLVD # D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MIRADA VENDING SVC', address = '1401 MAHARIS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MITCHUM MOTOR SPORTS', address = '5840 BURTON STATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MOBILE ONE COURIER', address = '1457 MILLER STORE RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MOBILE PHONE SPECIALISTS', address = '1270 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MOBILE SOLUTIONS', address = '1493 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MOBILE TAX SVC', address = '1065 NORWICH AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MOORES RENTALS', address = '5029 SMITH FARM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MORANS BOOKKEEPING SVC', address = '1436 LAKESIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MORGAN WELLNESS CTR', address = '4807 SHORE DR # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MORNING STAR BAPTIST CHURCH', address = '4780 FIRST COURT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MORNINGSTAR MINI-STORAGE', address = '5684 HADEN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MORTGAGE MARKET INFO SVC INC', address = 'PO BOX 61940', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MOSQUITO JOE', address = '2302 MERL CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MPI FASTECH LLC', address = '1561 BRADFORD RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MR & MRS RENE VASQUEZ', address = '2033 LOUGH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MR WRIGHTS SMALL REPAIRS', address = '5608 ELIZABETH CT # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MRS SOPHIA EGYPTAIN READER', address = '1604 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MULTILINK SOLUTIONS INC', address = '1270 DIAMOND SPRINGS RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MURRAY HOME IMPROVEMENTS', address = '1500 CHATHAM CT # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MY BEST FRIENDS CLOSET', address = '1637 INDEPENDENCE BLVD # F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MYGRANT GLASS CO', address = '5913 THURSTON AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'MYKONOS RESTAURANT', address = '5785 NORTHAMPTON BLVD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'N GOOD HANDS CONSTRUCTION', address = '4792 FIRST COURT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NANCY NAILS', address = '5193 SHORE DR # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NAOMIS NEST', address = '1029 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NATIONAL CAR CARE', address = '1948 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NATIONAL PATIENT TRAVEL HELP', address = '1457 MILLER STORE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NATIONWIDE STRUCTURES', address = '4216 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NAVAL AMPHIBIOUS BASE LIBRARY', address = '1432 HEWITT DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NAVY LODGES', address = '1125 GATOR BLVD # 3335', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NAVY SEAL FOUNDATION', address = 'PO BOX 5965', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NAVY UNITED STATES DEPT', address = '1120 A ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NAVY UNITED STATES DEPT', address = '2465 GUADALCANAL RD # 8', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NELSON E BRUCE', address = '4628 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NETARUS LLC', address = '4873 S OLIVER DR # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NETLINK SOLUTIONS', address = '1661 SPRING HOUSE TRL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NEW CITY OPTICAL CO', address = '1630 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NEW CITY OPTICAL CO', address = '5819 WARD CT # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NEW CREATION ASSEMBLY OF GOD', address = '4933 RUTHERFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NGK-LOCKE POLYMER INSULATORS', address = '1609 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NLG USA', address = '4504 CURTISS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NORFOLK CAFE EXPRESS LLC', address = '1766 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NORFOLK FLORIST', address = '1220 BAKER RD # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NORMACORP INC', address = '4505 POWELLS POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NORTH AMERICAN BULK TRANSPORT', address = '1321 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NORTH BEACH APARTMENTS', address = '4605 GALEFORCE CT # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NORTHWEST LOCKSMITH', address = '4900 FARRINGTON DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NORTON LANDSCAPE MANAGEMENT', address = 'PO BOX 55144', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NOVA MARKETING MEDIA', address = '1561 BRADFORD RD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NUNEZ INDALECIO', address = '1529 ADAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'NY STYLE PIZZA BY B', address = '2104 PLEASURE HOUSE RD # F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ODELLS UPHOLSTERY', address = '4940 RUTHERFORD RD # 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OREILLY AUTO PARTS', address = '1291 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OREILLY AUTO PARTS', address = '1630 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OBERWEIS DAIRY INC', address = '5721 BAYSIDE RD # K', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OCEAN BREEZE DESIGNS CORP', address = '5023 LAUDERDALE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OCEAN CREEK APPAREL', address = '5713 THURSTON AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OCEANS EAST 2 TACKLE SHOP', address = '5785 NORTHAMPTON BLVD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OFFSHORE ANGELS LLC', address = '5009 CLIFF CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OMEGA CONTRACTING LLC', address = '1630 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OMEGA CONTRACTING LLC', address = '4940 RUTHERFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ONE FRESH START', address = '4701 SHORE DR # 103-164', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ONE PIECE FABRICATION LLC', address = '1393 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ORAMAS NAUTICAL', address = 'PO BOX 5031', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ORANGEMEN SERVICES', address = '5508 ARAGON DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ORIENTAL DELIGHT LLC', address = '1209 BAKER RD # 514', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ORIENTAL SPA', address = '4849 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ORKIN', address = '5717 THURSTON AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OSGOOD CONSULTING', address = '1208 FREEHOLD CLOSE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OST TRUCKING CO INC', address = '1357 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OTTOBOCK ORTHOPEDIC SVC', address = '1209 BAKER RD # 508', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OUR SAVIOURS LUTHERAN CHURCH', address = '4200 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OVERHEAD DOOR CO OF NORFOLK', address = '1417 MILLER STORE RD # D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OWL RESEARCH & INVESTIGATION', address = '1270 DIAMOND SPRINGS RD # 11', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'OXFORD HOUSE LAKE SMITH', address = '5541 QUARTERPATH GATE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'P TEL FOR C', address = '1408 GARWOOD AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PACKRAT RENT-A-TRAILER INC', address = '4864 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ANILKUMAR R PATEL MD', address = '1704 CHURCH POINT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PATWELL CONSULTING', address = '2525 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PAWS VACCINATION CLINIC', address = '1924 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PBG ENGINEERING', address = '4487 LAUDERDALE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PC DOC', address = '1025 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PEARCE MEEKINS LLC', address = '5153 CRYSTAL POINT DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PEPPERIDGE FARM', address = '1435 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PERMA CERAM OF TIDE WATER', address = '4812 ALGONAC AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PHILIP J GEIB PC', address = '4360 SHORE DR # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PHOTOGRAPHICS', address = '4816 LEE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PILATES CENTERAL', address = '5521 LAMBDIN ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PINE SHORES', address = '2239 PINE SHORE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PIRTEK USA LLC', address = '5760 NORTHAMPTON BLVD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PLANET FITNESS', address = '4245 E LITTLE CREEK RD', city = 'NORFOLK', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PLAZA AZTECA RESTAURANT EQPT', address = '1387 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'POE ENTERPRISES', address = '1209 BAKER RD # 311', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'POINT TO POINT', address = '1270 DIAMOND SPRINGS RD # 118', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'POND SECURITY SVC LLC', address = '1300 DIAMOND SPRINGS RD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'POPPAS PUB & RESTAURANT', address = '2105 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PORT NORFOLK COMMODITY WHSE', address = 'PO BOX 5297', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PORTSIDE INN', address = '1540 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'POWER HOME TECHNOLOGIES INC', address = '5760 NORTHAMPTON BLVD # 112', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'POWERTRAIN INDUSTRIES INC', address = '1409 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PRECISION MEASURE SVC', address = '5025 JAKEMAN ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PREFERRED SERVICES INC', address = '4930 LAUDERDALE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PRO TOUCH MOBILE DETAILING', address = '1503 CHATHAM CT # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PROFESSIONAL SUPPLY', address = '1373 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PROFITABLE CONCEPTS & MKTG', address = '988 LARDER POST # 201', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PROTRADE STEEL LLC', address = '2429 FERRY RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PUBLIC STORAGE', address = '1409 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PUBLIC STORAGE', address = '2109 GREENWELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PULLAR CONSULTING LLC', address = '1609 MEETING HOUSE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PURVIS SYSTEMS INC', address = '5700 THURSTON AVE # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'PWA ENGINEERING LLC', address = '2112 THOROUGHGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'QUALICON CORP', address = 'PO BOX 3050', city = 'CHESAPEAKE', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'QUALITY INN', address = '5189 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'QUEEN OF CLEANING', address = '2110 PIER POINT PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'QUICK IT INC', address = '5449 SHADOWWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'QUICK SILVER INTL', address = '1397 AIR RAIL AVE # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'QUINN CONSULTING SVC', address = '1801 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'QUIZNOS', address = '5824 NORTHAMPTON BLVD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'R & R MARKETING OF VIRGINIA', address = '5048 MADEIRA RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'R BAUTISTA & SONS LLC', address = '4076 TIMBER RIDGE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'R T WINDOW & REPAIR CO INC', address = '1209 BAKER RD # 509', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RADICALLY GAMING', address = '4801 SHORE DR # 86', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RADIOSHACK', address = '4241 E LITTLE CREEK RD', city = 'NORFOLK', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RAM TRANSPORT', address = '1385 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RAYTHEON TECHNICAL SVC CO LLC', address = '5820 WARD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RE/MAX ALLIANCE', address = '4360 SHORE DR # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'REACTIVE CLEANING SVC INC', address = '1700 JANKE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'REALTY RESTORATIONS LLC', address = '5512 HADEN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RED CARPET INN', address = '1808 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RED ROOF INN-NORFOLK AIRPORT', address = '5745 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'REDECK HAMPTON ROADS', address = '4632 BRADSTON RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'REHABILITATION UNLIMITED INC', address = '4209 EGGLESTON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'REINHOLD CHIROPRACTIC GROUP', address = '4640 SHORE DR # 108', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'REPAIR SPECIALIST', address = '4940 RUTHERFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'REPRODIVE HEALTHCARE ASSOC', address = '4633 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RESCUE ME DOG TRAINING', address = '4848 S OLIVER DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RESIDEX CORP', address = '1449 MILLER STORE RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JAMES F RESKE DDS', address = '4121 THOROUGHGOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RETIREMENT PLANNERS', address = '1294 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'REYNOLDS COATINGS & SUPPLIES', address = '1209 BAKER RD # 503', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RIBS WINGS & THINGS', address = '2021 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RICHARD W SETZER ELEC & MECH', address = 'PO BOX 5113', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LESLIE I RICHMOND DDS', address = '4417 SHORE DR # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'LESLIE I RICHMOND DDS', address = '4417A SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RICHPSXPART.COM', address = '1419 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RICKERS PERSONAL TRAINING', address = '4856 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HARRY S RILEY', address = '4341 TWO WOODS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STEPHEN W RIPPARD JR CPA', address = '5121 SHENSTONE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RITAS WATER ICE', address = '4640 SHORE DR # 111', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RITE AID', address = '1660 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RMS HOLDINGS INC', address = '4225 SANDY BAY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ROAD WARRIOR AUTO FINANCE', address = '4749 BIRDSONG LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ROADRUNNER TAXI VIRGINIA BEACH', address = '5708 NORTHAMPTON BLVD # 245', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ROADSIDE REPAIR', address = '5792 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ROAR ENTERPRISES INC', address = '2320 BAYVILLE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ROBINSON & WETMORE INC', address = '5733 BAYSIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ROGERS CHRISTMAS TREES', address = '4097 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ROWE GROUP CONSTRUCTION', address = 'PO BOX 5099', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ROYAL CUP COFFEE INC', address = '5741 BAYSIDE RD # 111', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'RUNNYMEDE CORP', address = '5785 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'JAMES L RUTLEDGE DDS', address = '2025 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'S L SMALLEY ENTERPRISE', address = '5008 STEDWICK CT # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SAFEGUARD PEST CONTROL', address = '5828 WARD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SAFELITE AUTO GLASS', address = '4708 TULIP DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SAJO VETERINARY HOSPITAL', address = '1094 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SAKURA JAPANESE RESTAURANT', address = '5824 NORTHAMPTON BLVD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SALS NEW YORK PIZZA', address = '1608 PLEASURE HOUSE RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SALES SERVICES', address = '2415 PLEASURE HOUSE RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SALT', address = '1716 PLEASURE HOUSE RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SAMPLE FOLIO', address = '5584 ARBORETUM AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SAMPSON ASSOCIATES ARCHITECTS', address = '4812 CULLEN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SANDRAS INTERNATIONAL SALON', address = '2104 PLEASURE HOUSE RD # C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SAWGRASS DEVELOPMENT LTD', address = '5331 PANDORIA AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SAXON COORDINATION CTR', address = '5725 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SCHINDLER ELEVATOR CORP', address = '1209 BAKER RD # 501', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SCOTTS LAWN SVC', address = '1209 BAKER RD # 310', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SEA TOW', address = '4701 SHORE DR # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SEABREEZE CONSTRUCTION', address = '4616 THOROUGHGOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SEKO WORLDWIDE', address = '5741 BAYSIDE RD # 109', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SENATOR FRANK W WAGNER', address = '1705 JORDANS PARISH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SENTARA FAMILY MEDICINE PHYSIC', address = '2017 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SERCO INC', address = '5700 THURSTON AVE # 120', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SERENITY SKIN CARE INC', address = '1532 BRADFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SERVICE MASTER CO', address = '1236 BAKER RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SHAKLEE DISTRIBUTOR', address = '1921 PERREL ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SHANGRI LA', address = '5104 VENTURE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SHAPIRO COOPER LEWIS APPLETON', address = '1294 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SHELTON PARK ELEMENTARY SCHOOL', address = '1700 SHELTON RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SHIP MATES BOAT DETAILING', address = '4724 BRADSTON RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SHOEMAKER VISION CTR', address = '1608 PLEASURE HOUSE RD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SHORE DRIVE AUTO WORLD', address = '5657 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SHORE DRIVE BAYSIDE TRANS', address = '4501 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SHORES OF LAKE SMITH', address = '2105 LAKE SMITH CT # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SIGNMAKERS', address = '2209 BAYLAKE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SIMPLY SALES', address = '1420 CLAUDIA DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SKINNERS FRAMES & ART INC', address = '4417 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SLATER & SLATER', address = '4317 WESTWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SMART REALTY LLC', address = '4640 SHORE DR # 113', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SMITTYS MOBILE AUTO REPAIR', address = '1913 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SMOKE SHACK', address = '1628 INDEPENDENCE BLVD # 1520', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SNIPS OF VIRGINIA BEACH INC', address = '1431 AIR RAIL AVE # E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SNYDERS OF HANOVER INC', address = '1619 DIAMOND SPRINGS RD # C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SOLUTIONS BY PEGGY & CO', address = '1637 INDEPENDENCE BLVD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SONSHINE HAIR STUDIOS', address = '4425 SHORE DR # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SOUTH BEACH DEVELOPMENT CORP', address = '4426 LEE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SOUTHEAST EXPEDITIONS', address = 'PO BOX 2014', city = 'CHERITON', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SOUTHEASTERN PRESSURE WASHING', address = '4813 TULIP DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SPARE ROOM', address = '1270 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SPECIAL ASSIGNMENT', address = '1209 BAKER RD # 512', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SPECIAL PERSONS MAILING SVC', address = '4716 TULIP DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SPECTRUM STRATEGIES', address = '1300 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SPLASH MOBILE DETAILING', address = '4709 WINDSONG DR # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SPOT SPORTS BAR & GRILLE', address = '5708 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SPRING WATER APARTMENTS', address = '1205 COLGIN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SPRINT', address = '1628 INDEPENDENCE BLVD # 1500', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ST LEO UNIVERSITY', address = '1481 D ST # 3016', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ST THOMAS', address = '4601 LOOKOUT RD # 1', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STAFFORD PROPERTIES INC', address = 'PO BOX 55370', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STANLEY BLACK & DECKER', address = '5760 NORTHAMPTON BLVD # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STAR IMAGING', address = '5900 THURSTON AVE # C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STARBUCKS', address = '1170 AMPHIBIOUS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STARBUCKS', address = '5824 NORTHAMPTON BLVD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STASHED', address = '4904 RUTHERFORD RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STELLAR SUPPORT SVC PROLOG INC', address = '5721 BAYSIDE RD # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STEVE BUDMAN PHOTOGRAPHY', address = '1209 BAKER RD # 315', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STEVES TOWING VIRGINIA BEACH', address = '5890 THURSTON AVE # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STEVENSONS MODELING AGENCY', address = 'PO BOX 55456', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STRATFORD PRESCHOOL', address = 'PO BOX 55407', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STRATUM NEW MEDIA', address = '4873 S OLIVER DR # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STS SECURITY PRODUCTS LLC', address = '1569 DIAMOND SPRINGS RD # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'STYLES UNLIMITED', address = '1270 DIAMOND SPRINGS RD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SUBWAY', address = '1170 AMPHIBIOUS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SUBWAY', address = '1270 DIAMOND SPRINGS RD # 101A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SUBWAY', address = '4801 SHORE DR # A4', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SULLIVAN HOME REPAIR LLC', address = '4312 WESTWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ROBERT W SULLIVAN DPM', address = '1700 PLEASURE HOUSE RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SUMMIT RESEARCH CORP', address = '1300 DIAMOND SPRINGS RD # 207', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SUN RESORT', address = '4701 SHORE DR # 111', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SUNS TAILORS', address = '4640 SHORE DR # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SUNBELT SUPPLY CO', address = '5733 BAYSIDE RD # 107', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SUNKISSED EVENTS & DESIGN', address = '1460 GARWOOD AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SUNSET BEACH RESORT HOTEL', address = '32246 LANKFORD HWY', city = 'CAPE CHARLES', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SURF RIDER RESTAURANT', address = '1270 DIAMOND SPRINGS RD # 115', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SUSANS KITCHENETTE FILIPINO', address = '1270 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SW LIBERMAN & ASSOC INC', address = '5187 LAKE SHORES RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'SYNDICATE BARBELL', address = '5741 BAYSIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'T JS LAWN SVC', address = '4853 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'HOWARD C TACKETT DC', address = '5792 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TACO BELL', address = '5195 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TACTICAL M1 LLC', address = '4701 SHORE DR # 113', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TAIKO SUSHI', address = '4701 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TANDOOR RESTAURANT', address = '5760 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TASTE UNLIMITED', address = '4097 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TATE JAMES A CAPT CAPT RET', address = '1705 BURROUGHS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TDG RESOURCES', address = '5904 YOULOUS AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TECH ELEMENTS', address = '1608 WAXHAWS LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TELEARK LLC', address = '4873 S OLIVER DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TELEPHONE GUY', address = '2333 ROOKERY WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TERRI DENISON COMMUNICATIONS', address = '1209 BAKER RD # 315', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TERRY-PETERSON RESIDENTIAL CO', address = '4640 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TETRA CO LLC', address = '2276 GREENWELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'THOMAS ASSOCIATES INC', address = '5700 THURSTON AVE # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'THOMAS TRANSCRIPTION', address = '1000 HACKNEY BRIEF', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'THORNBERRY CHURCH SUPPLY', address = '4701 SHORE DR # 103-258', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'THOROUGHGOOD DENTAL OFFICE', address = '1609 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'THOROUGHGOOD ELEMENTARY SCHOOL', address = '1444 DUNSTAN LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'THYSSEN KRUPP MATERIALS', address = '1347 DIAMOND SPRINGS RD # 10', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TIDAL WEB DESIGN', address = '4913 LEATHERNECK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TIDEWATER INTEGRATED MED SVC', address = '1300 DIAMOND SPRINGS RD # 400', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TIDEWATER POWER EQUIPMENT', address = '5795 THURSTON AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TIDEWATER SCHOOL-NAVIGATIONS', address = '5760 NORTHAMPTON BLVD # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TIDEWATER SOCCER REFEREE ASSN', address = 'PO BOX 5666', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TIDEWATER TACTICAL LLC', address = '4940 RUTHERFORD RD # 300', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TIME & PARKING CONTROL', address = '1209 BAKER RD # 505', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TIMELESS DIAMONDS & JEWELRY', address = '1642 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TLC TOUCHLESS LOVING', address = '1641 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TOTAL HEALTH CTR', address = '1801 PLEASURE HOUSE RD # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TOULAS PIZZA', address = '4640 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TOWN & COUNTRY STYLE INC', address = '1601 SPRING HOUSE TRL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TOWN HALL PAINTING CORP', address = '1128 PRIDDY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TOWNE AIR FREIGHT', address = '1345 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TRADITIONAL LANDSCAPING CO', address = '4937 FARRINGTON DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TRAN ALTERATIONS', address = '4853 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TRANS ATLANTIC LNS INC', address = '2517 FERRY RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TRANSGROUP WORLDWIDE LOGISTICS', address = '5760 NORTHAMPTON BLVD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TRANSPORT PLUS CORP', address = '1025 ANOKA AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TREASURE SHOP', address = 'PO BOX 15351', city = 'NORFOLK', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TRI STATE PAINTING', address = '1421 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TRI TRONICS LTD', address = '1209 BAKER RD # 203', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TRI-ED DISTRIBUTION', address = '5760 NORTHAMPTON BLVD # 116', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TRIDENT AIRSOFT', address = '2230 PINE SHORE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TROPICAL SMOOTHIE CAFE', address = '1724 HUNGERS PARISH CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TROPICAL SMOOTHIE CAFE', address = '4701 SHORE DR # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TROY UNIVERSITY', address = '1328 8TH ST # 3005', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TRUE VICTORY OUTREACH MNSTRS', address = '1270 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'TURNING POINT CLEANING SLTNS', address = '5600 QUARTERPATH GATE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'UNCLE BOBS SELF STORAGE', address = '4929 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'UNIDYNE L3 COMMUNICATIONS', address = '1619 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'UNITED HEALTH GROUP', address = '1548 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'UNITED SERVICE ORGANIZATIONS', address = '1168 GATOR BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'UNITED STATES DEPT OF NAVY', address = '2555 AMPHIBIOUS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'UNITED WHOLESALERS', address = '4493 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'UNITY CHURCH OF TIDEWATER', address = '5580 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'UNWINE NAIL SPA', address = '4640 SHORE DR # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'UPS CUSTOMER CTR', address = '1390 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'UPS STORE', address = '4701 SHORE DR # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'URBANCIRCLE.NET INC', address = '1552 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'US CLUB FIELD HOCKEY LEAGUE', address = '2309 TREASURE ISLAND DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'US FEDERAL AVIATION AGENCY', address = '1245 MILLER STORE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'US NAVY', address = '1575 GATOR BLVD # 243', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'US NAVY COMMISSARY', address = '1180 AMPHIBIOUS DR # 3445', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'US NAVY DEPT AMPHIBIOUS CONSTR', address = '1815 SEABEE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'US NAVY DEPT ASSAULT UNIT 4', address = '2155 11TH ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'US NAVY DEPT MILITARY PRSNL', address = '1155 NIDER BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'US POST OFFICE', address = '2109 THOROUGHGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'US REMODELERS INC', address = '1457 MILLER STORE RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VA BEACH KAYAK INSTRUCTION', address = 'PO BOX 5171', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VALKYRIE ENTERPRISES LLC', address = '5724 WARD AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VANTAGE APARTMENTS', address = '2212 VANTAGE PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VANTEK MOBILE LLC', address = '4808 LAKE BRADFORD LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VB ORTHO', address = '1609 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VEL-TYE LLC', address = '4940 RUTHERFORD RD # 208', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VERSA TILE', address = '2225 WATERSPOINT PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIDYA DEEP FOODMART INC', address = '5740 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VINTAGE REVIVAL', address = '1642 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH BEVERAGES', address = '1400 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH CITY PUBC SCHL', address = '5649 BAYSIDE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH PAINTING', address = '1428 SHAMROCK AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH PUBLIC SCHOOL', address = '1444 DUNSTAN LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH VETERINARY HOSP', address = '2013 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIRGINIA CLOSETS & SUPPLY', address = '1640 JACK FROST RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIRGINIA DRYWALL INC', address = '1431 AIR RAIL AVE # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIRGINIA ELECTRONIC', address = '1417 MILLER STORE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIRGINIA ELECTRONIC SYSTEMS', address = '4465 SHORE DR # 5', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIRGINIA INDEPENDENT AUTO ASSN', address = '4700 THOROUGHGOOD SQ', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIRGINIA INFORMATION TECH', address = '4862 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIRGINIA PATH & PATIO', address = '1516 LAKEVIEW DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIRGINIA POLYTECHNIC INSTITUTE', address = '1444 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VIRTIXCO TRAILER', address = '1420 GATOR BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VISION MORTGAGE SVC', address = '1700 PLEASURE HOUSE RD # 102A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VISTA BUILDERS LLC', address = '1060 SANFORD AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VITAC CORP', address = '2214 E BERRIE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VSC FIRE & SECURITY', address = '1417 MILLER STORE RD # C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'VSD LLC', address = '5724 WARD AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'W & O SUPPLY INC', address = '1569 DIAMOND SPRINGS RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'W C CARPENTER CO LC', address = '5890 THURSTON AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'W E LUDWICK PLUMBING & HEATING', address = '1616 SHENSTONE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WAFFLE HOUSE', address = '5825 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WAFFLETOWN USA LTD', address = '2113 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WALGREENS', address = '4768 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WALKER ARCHITECTURAL ASSOC PC', address = '2504 CHUBB LAKE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WALLYS CABINETS & COUNTER TOPS', address = '5208 TERN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WARNER CONSTRUCTION', address = '2005 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WARRENS FIX IT', address = '4200 EGGLESTON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WATERFORD APARTMENTS', address = '5500 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WATERSIDE MEDIA', address = '1700 PLEASURE HOUSE RD # 102A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WAVE CASTERS', address = '4940 RUTHERFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WAVE OF LIFE CHIROPRACTIC', address = '4640 SHORE DR # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WAWA FOOD MARKET', address = '4800 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WAWA FOOD MARKET', address = '5701 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WEATHER MASTERS HTG & AIR COND', address = '2348 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WEATHERSBY ENTERPRISES', address = '2032 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WEL-VANT CONTSTRUCTION', address = '4858 SHELL RD # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WELLS FARGO BANK', address = '1612 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WENDYS', address = '4747 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WENDYS', address = '5808 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WEST ROOFING', address = '2316 BAYLAKE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WHALEBONE AUTO CTR INC', address = '1605 PLEASURE HOUSE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WHITETAIL PLUMBING', address = '4412 POWELLS POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WHOLISTIC HARMONY', address = '5069 LAUDERDALE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WHTIE GOODS SVC INC', address = '1209 BAKER RD # 502', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WIFE 360 LLC', address = '2205 CASABLANCA RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WINDMARK RECORDING', address = '4924 SHELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WINDSONG APARTMENTS', address = '2352 WINDWAY LN # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WING STREET', address = '4425 SHORE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WINGATE BY WYNDHAM', address = '5800 BURTON STATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WISE RECYCLING LLC', address = '1435 AIR RAIL AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WOODEN USEFULS', address = '5000 REGINA LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WOODMEN INSURANCE CO', address = '5824 NORTHAMPTON BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WORLD CO SOLUTIONS', address = '5469 SUNNYWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WORLD COLLECTIBLES & PAWN', address = '2104 PLEASURE HOUSE RD # G', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WOUNDED SPIRITS', address = '1115 GLEANING CLOSE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WPTD LLC', address = '1628 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'BILL WRIGHT', address = '1400 SHAMROCK AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WRS', address = 'PO BOX 68505', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'WYSHMOOR INTERIORS', address = '4909 ADELIA DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'XHILARATION TRAVEL', address = '5596 QUARTERPATH GATE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'YMCA', address = '1700 SHELTON RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'YOUR BEAUTY REFINED', address = '1124 HILLOCK XING', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ZEROS SUBS', address = '5760 NORTHAMPTON BLVD # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert ignore resident_import set name = 'ZIA MARIE', address = '4497 LOOKOUT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
;
--
-- STATE
--
;
insert ignore state (abbreviation) select distinct state from resident_import
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
--
-- Extricate house_num and street from the address field, and convert Sub-Unit Designator phrases into house_num suffixes.
--
;
update resident_import
set house_num = LEFT(address,LOCATE(' ',address) - 1)
 , address = SUBSTRING(address,LOCATE(' ',address) + 1)
where address REGEXP '^[0-9].+'
;
update resident_import
set house_num = SUBSTRING(address,LOCATE('PO BOX ',address) + 7)
 , address = 'PO BOX'
where address like 'PO BOX %'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' APT ',address) + LENGTH(' APT ')))
, address = LEFT(address,LOCATE(' APT ',address) - 1)
where address REGEXP '^.* APT .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' BLDG ',address) + LENGTH(' BLDG ')))
, address = LEFT(address,LOCATE(' BLDG ',address) - 1)
where address REGEXP '^.* BLDG .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' DEPT ',address) + LENGTH(' DEPT ')))
, address = LEFT(address,LOCATE(' DEPT ',address) - 1)
where address REGEXP '^.* DEPT .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' FL ',address) + LENGTH(' FL ')))
, address = LEFT(address,LOCATE(' FL ',address) - 1)
where address REGEXP '^.* FL .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' HNGR ',address) + LENGTH(' HNGR ')))
, address = LEFT(address,LOCATE(' HNGR ',address) - 1)
where address REGEXP '^.* HNGR .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' LOT ',address) + LENGTH(' LOT ')))
, address = LEFT(address,LOCATE(' LOT ',address) - 1)
where address REGEXP '^.* LOT .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' PIER ',address) + LENGTH(' PIER ')))
, address = LEFT(address,LOCATE(' PIER ',address) - 1)
where address REGEXP '^.* PIER .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' RM ',address) + LENGTH(' RM ')))
, address = LEFT(address,LOCATE(' RM ',address) - 1)
where address REGEXP '^.* RM .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' SLIP ',address) + LENGTH(' SLIP ')))
, address = LEFT(address,LOCATE(' SLIP ',address) - 1)
where address REGEXP '^.* SLIP .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' SPC ',address) + LENGTH(' SPC ')))
, address = LEFT(address,LOCATE(' SPC ',address) - 1)
where address REGEXP '^.* SPC .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' STE ',address) + LENGTH(' STE ')))
, address = LEFT(address,LOCATE(' STE ',address) - 1)
where address REGEXP '^.* STE .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' STOP ',address) + LENGTH(' STOP ')))
, address = LEFT(address,LOCATE(' STOP ',address) - 1)
where address REGEXP '^.* STOP .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' SUITE ',address) + LENGTH(' SUITE ')))
, address = LEFT(address,LOCATE(' SUITE ',address) - 1)
where address REGEXP '^.* SUITE .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' UNIT ',address) + LENGTH(' UNIT ')))
, address = LEFT(address,LOCATE(' UNIT ',address) - 1)
where address REGEXP '^.* UNIT .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' # ',address) + LENGTH(' # ')))
, address = LEFT(address,LOCATE(' # ',address) - 1)
where address REGEXP '^.* # .*'
;
update resident_import
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' TRLR ',address) + LENGTH(' TRLR ')))
, address = LEFT(address,LOCATE(' TRLR ',address) - 1)
where address REGEXP '^.* TRLR .*'
;
update resident_import
set house_num = concat(house_num,"-","BSMT")
, address = LEFT(address,LOCATE(' BSMT',address) - 1)
where address REGEXP '^.* BSMT$'
;
update resident_import
set house_num = concat(house_num,"-","FRNT")
, address = LEFT(address,LOCATE(' FRNT',address) - 1)
where address REGEXP '^.* FRNT$'
;
update resident_import
set house_num = concat(house_num,"-","LBBY")
, address = LEFT(address,LOCATE(' LBBY',address) - 1)
where address REGEXP '^.* LBBY$'
;
update resident_import
set house_num = concat(house_num,"-","LOWR")
, address = LEFT(address,LOCATE(' LOWR',address) - 1)
where address REGEXP '^.* LOWR$'
;
update resident_import
set house_num = concat(house_num,"-","OFC")
, address = LEFT(address,LOCATE(' OFC',address) - 1)
where address REGEXP '^.* OFC$'
;
update resident_import
set house_num = concat(house_num,"-","REAR")
, address = LEFT(address,LOCATE(' REAR',address) - 1)
where address REGEXP '^.* REAR$'
;
update resident_import
set house_num = concat(house_num,"-","SIDE")
, address = LEFT(address,LOCATE(' SIDE',address) - 1)
where address REGEXP '^.* SIDE$'
;
update resident_import
set house_num = concat(house_num,"-","UPPR")
, address = LEFT(address,LOCATE(' UPPR',address) - 1)
where address REGEXP '^.* UPPR$'
;
--
-- STREET
--
;
insert ignore street (name,city_id) select distinct resident_import.address as name, resident_import.city_id as city_id from resident_import
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
-- update resident_import set street = address1 where house_num is null and street = ''
-- ;
--
-- APPEND resident_import TO resident_base
--
;
insert ignore resident_base (id,name,agency,house_num,street_id,year_of_last_appeal_to_become_a_donor)
select @id := @id + 1 as id
, name
, agency
, house_num
, street_id
, "2012" as year_of_last_appeal_to_become_a_donor
from (select @id := max(id) from resident_base) as init, resident_import
;
COMMIT