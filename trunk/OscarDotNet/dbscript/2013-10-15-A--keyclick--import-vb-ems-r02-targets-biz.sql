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
insert ignore resident_import set name = '13 THE MOVEMENT', address = '602 AUBREY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = '1800SKILLED.COM', address = '4663 HAYGOOD RD # 208', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = '7-ELEVEN', address = '325 KELLAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = '7-ELEVEN', address = '4903 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = '7-ELEVEN', address = '521 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = '7-ELEVEN', address = '812 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = '7-ELEVEN', address = '896 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A & B ELECTRIC CO', address = '5107 WITCHDUCK CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A 75 DOLLAR CHIMNEY SWEEP', address = '4663 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A ABUNDANT ACCIDENT AWARDS', address = '4601 PAUL REVERE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A CHILDS DREAM LLC', address = '1270 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A COMMUNITY OF PARADIGMS', address = '5604 BENTLEY CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A CUT ABOVE', address = '291 INDEPENDENCE BLVD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A M I FLOORING', address = '636 DE LAURA LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A MOBILE EXPRESS DETAILING', address = '5501 ISLAND CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A MOTHERS LOVE DAYCARE', address = '5932 MARGATE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A PL 2 GROW LEARNING CTR', address = '815 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A PLACE IN THE WILDERNESS INC', address = '4516 HAYGOOD ESTATE WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A PLACE TO GROW EARLY LEARNING', address = '815 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A R TRANSPORTATION SVC LLC', address = '5332 LYNBROOK LNDG', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A SWEDISH TOUCH', address = '4604 PEMBROKE LAKE CIR # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A TIME TO DANCE', address = '5600 VIRGINIA BEACH BLVD # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A TOUCH OF ELEGANCE', address = '5461 WESLEYAN DR # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A V ASSOC', address = '4529 E HONEYGROVE RD # 307', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A VIRGINIA BEACH ESCROW & TTL', address = '1115 INDEPENDENCE BLVD # 212', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A WILLING TRANSPORTATION LLC', address = '921 NEWTOWN RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A-1 BETTER HEATING & COOLING', address = '684 KENNETH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A-1 HOME SPECIALIST', address = '1037 PATRICK HENRY WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A-1 PREMIER HEALTH CHIRO', address = '333 KELLAM RD # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A-1 QUALITY FLOORS', address = '4461 DRUM CASTLE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AAA POOL SVC INC', address = '4856 HAYGOOD RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AAA SWIM', address = '4856 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AAAA SELF STORAGE', address = '4656 HONEYGROVE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AARONS SALES & LEASE OWNERSHIP', address = '1012 FALLBROOK BND', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ABBTECH', address = '287 INDEPENDENCE BLVD # 113', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ABLE VENTURES LLC', address = '4337 WISHART RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ABNB FEDERAL CREDIT UNION', address = '4524 WISHART RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ABSOLUTE EYE CARE CTR', address = '1209 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ABUNDANT CARE ASSISTED LIVING', address = '5556 PACA LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ABUNDANT HARVEST CHURCH', address = '4452 HINSDALE ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ACCESSORIES PLUS', address = '750 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ACCREDITED HEALTH CARE', address = '4602 WESTGROVE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ACCURATE BOOKKEEPING & TAX SVC', address = '4636 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ACCURATE MEDICAL SUPPLY INC', address = '4602 WESTGROVE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ACUPULCO INC', address = '470 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ADD IT UP BOOKKEEPING & ADMINI', address = '762 INDEPENDENCE BLVD # 100C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ADULT OUTPATIENT SVC-VA BCH', address = '297 INDEPENDENCE BLVD # 126', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ADVANCE AUTO ELECTRIC & CAR', address = '5518 AMHURST CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ADVANCE AUTO PARTS', address = '1016 FALLBROOK BND', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ADVANCED DOOR SOLUTIONS & GLSS', address = '404 DAVIS ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ADVANTAGE INSURANCE', address = '4445 CORPORATION LN # 150', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AERO MEDICAL TRANSPORT-VTRNS', address = '4620 HAYGOOD RD # 1', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AFFORDABLE CANVAS OF VA LLC', address = '4356 ALFRIENDS TRL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AFFORDABLE FIVE STAR PLUMBING', address = '5013 SANCILLIO DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AFFORDABLE MORTGAGE', address = '4663 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AFLAC', address = '4608 WESTGROVE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AFRICAN HAIR BRAIDING', address = '800 BAKER RD # 116', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AGVIQ LLC', address = '4610 WESTGROVE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AIR & GAS COMPONENTS', address = '5366 LAKE LAWSON RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AIR FORCE RECRUITING', address = '1115 INDEPENDENCE BLVD # 210', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AIRLIFT VOLUNTEERS IN DISASTER', address = '4620 HAYGOOD RD # 1', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AL-ANON', address = '281 INDEPENDENCE BLVD # 406', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALBANO CLEANERS', address = '4511 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALBEMARLE HOME IMPROVEMENT SVC', address = '1228 HABITAT LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALCOHOLIC BEVERAGE CONTROL', address = '1067 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALCOVA MORTGAGE', address = '806 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALEJANDRO J MEDINA STUDIOS', address = '5500 LYNBROOK LNDG', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALEXION ASSOCIATES', address = '1317 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALFA OMEGA SVC', address = '4829 HONEYGROVE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALL ABOUT YOU OCCASSIONS', address = '645 SIRINE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALL AMERICAN BEAUTY & BARBER', address = '549 NEWTOWN RD # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALL SAFE SELF STORAGE', address = '4850 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALL SEASON MARINE REPAIR', address = '416 TORY RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALLEGIANCE HOME LENDING', address = '293 INDEPENDENCE BLVD # 310', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALLEN VANGUARD INTL', address = '4456 CORPORATION LN # 340', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALLIED ELECTRONICS', address = '4525 E HONEYGROVE RD # 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GARY B ALLISON', address = '291 INDEPENDENCE BLVD # 541', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALLSTATE INSURANCE AGENCY', address = '665 NEWTOWN RD # 107', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALLYGATOR DESIGNS', address = '1009 HAYGOOD ESTATE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALMLOFF ACUPUNCTURE LLC', address = '287 INDEPENDENCE BLVD # 210', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALPERIN LAW', address = '4605 PEMBROKE LAKE CIR # 300', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALPHA OMEGA LOGISTICS', address = '5559 CAMPUS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALPRIN LAW', address = '4605 PEMBROKE LAKE CIR # 300', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AMBER HURLY ENTERTAINMENT', address = '5845 E HASTINGS ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AMBIANCE SALON & DAY SPA', address = '369 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AMERICAN CLASSIC SELF STORAGE', address = '909 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AMERICAN EXPRESS', address = '4732 LITTLE JOHN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AMERICAN FURNITURE RENTAL', address = '762 LAKE EDWARD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AMERICAN GENERAL LIFE & ACCDNT', address = '1115 INDEPENDENCE BLVD # 114', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AMERICAN MORTGAGE GROUP INC', address = '4456 CORPORATION LN # 206', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AMERICAN OFFICE', address = '4445 CORPORATION LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AMERICAN PILE DRIVING EQUIP', address = '500 NEWTOWN RD # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AMERICAR', address = '680 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AMERIGROUP CORP', address = '4425 CORPORATION LN # 400', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AMP BOOKKEEPING SVC', address = '5410 WOBURN LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ANDERSON ELECTRONICS INC', address = '4425 JEANNE ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JACQUELINE ANDERSON', address = '701 HOUDON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ANDRIANOS LLC', address = '1115 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ANDYS WHOLESALE', address = '418 DAVIS ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ANESNAH DESIGN & MARKETING SVC', address = '5509 LYNBROOK LNDG', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ANGELS KEEPERS', address = '329 KELLAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ANGIES BEAUTY SUPPLY', address = '800 BAKER RD # 124', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ANGIOCEUTICS INTERNATIONAL LLC', address = '1141 KINGS WAY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ANOINTE HANDS OF STYLING', address = '5635 CAXTON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ANOTHER BEAUTIFUL JOB', address = '700 WHITECHAPEL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ANTIQUE PROMENADE', address = '928 DIAMOND SPRINGS RD # 143', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ANYTIME FITNESS', address = '1079 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'APPLE FLOOR SOLUTIONS', address = '412 KELLAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AQUA LEISURE POOLS SPAS & FIRE', address = '4604 PEMBROKE LAKE CIR # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ARAGONA ARMS LLC', address = '752 STELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ARAGONA CHURCH OF CHRIST', address = '527 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ARAGONA SIGNS & LETTERING', address = '609 KELLAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ARBYS', address = '4800 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ARMISTEAD LINDA C', address = '1213 WITCHDUCK BAY CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ARROW MOBILE ELECTRIC', address = '507 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ART BOND & CO', address = 'PO BOX 5019', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ART BY SYLVIA LIU', address = '1017 WITCH POINT TRL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ART STUDIO', address = '4605 PEMBROKE LAKE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ARTISTIC DESIGN & PHOTOGRAPHY', address = '855 CARIBE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ARTWORKS OF ROB CROPPER', address = '5432 WOBURN LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ASSET MANAGEMENT GROUP', address = '4624 PEMBROKE BLVD # S102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ASSOCIATED COUNSELORS', address = '287 INDEPENDENCE BLVD # 219', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ASSOCIATED PHYSICIANS FOR WMN', address = '813 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ASSOCIATES AT YORK INC', address = '870 NEWTOWN RD # 201', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ASSURETY TITLE & ESCROW', address = '4445 CORPORATION LN # 154', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ASTRO DISC JOCKEY', address = '1115 INDEPENDENCE BLVD # 203', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ASTRO VIDEO PRODUCTIONS', address = '1115 INDEPENDENCE BLVD # 203', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AT THE TOP MOBILE DETAILING', address = '5317 KINDLEWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ATLANTIC AIR CORP', address = '484 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ATLANTIC HOME LOANS', address = '4605 PEMBROKE LAKE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ATLANTIC NEUROSURGERY', address = '1020 INDEPENDENCE BLVD # 210', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ATLANTIC OPHTHALMOLOGY', address = '700 INDEPENDENCE CIR # 2D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ATTENTION TO DETAIL', address = '817 S GROSVENOR CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AUNT LIBBYS PANTRY', address = '4449 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AUNT MAGGIES CLEANING SVC', address = '509 HINSDALE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AUTHENTIC HAIR BRAIDING', address = '5514 KEYDET DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AUTO ACCIDENT SPECLSTS OF VA', address = '4445 CORPORATION LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AUTO BOUTIQUE', address = '413 DAVIS ST # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AUTO VILLAGE', address = '4865 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AUTOBELL CAR WASH INC', address = '1060 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AUTOZONE', address = '4673 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AVALON DRY CLEANERS', address = '600 N WITCHDUCK RD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AVELIE GRAPHICS', address = '804 HOLLADAY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AVIATION INVESTMENTS', address = '4121 HERMITAGE PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'AXIS ROAD MARKINGS INC', address = '630 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'B & B REMODELING', address = '4701 BROMFIELD AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'B & E SVC', address = '1417 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'B G B PERSONAL TRAINING', address = '977 DONATION DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'B O R E', address = '5728 CONSTANCE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BABY STEPS INC', address = '870 NEWTOWN RD # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BACK BAY BREWING CO', address = '630 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BACKSTAGE TECHNICAL SVC', address = '4605 VALLEY FORGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAKER CROSSING APARTMENTS', address = '631 LAKE EDWARD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAKERS POOL MAINTENANCE', address = '1277 SMITH COVE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BANK OF AMERICA', address = '1091 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BANK OF AMERICA', address = '4616 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BANK OF HAMPTON ROADS', address = '281 INDEPENDENCE BLVD # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BARBOUR REALTY INC', address = '4605 PEMBROKE LAKE CIR # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BARMASTERS BARTENDING SCHOOL', address = '1141 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BARRITTES BOOKS', address = '750 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BATH & BODY WORKS', address = '4550 VIRGINIA BEACH BLVD # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAWCOM CHIROPRACTIC', address = '762 INDEPENDENCE BLVD # 786', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAY AREA BOOKKEEPING SVC', address = '1491 FIVE FORKS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAY AREA GLASS', address = '5512 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAY INSURANCE AGENCY', address = '4877 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAY INVESTMENT GROUP', address = '291 INDEPENDENCE BLVD # 420', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAY WATCH POINTE APARTMENTS', address = '5414 CATINA ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAYSIDE HEALTH CARE CTR', address = '1004 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAYSIDE HEMATOLOGY & ONCOLOGY', address = '4044 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAYSIDE HIGH SCHOOL', address = '4960 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAYSIDE INTERNAL MEDICINE', address = '1020 INDEPENDENCE BLVD # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAYSIDE MEDICAL ASSOC', address = '1020 INDEPENDENCE BLVD # 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAYSIDE MEDICAL NUTRITION SVC', address = '4505 BEXLEY CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAYSIDE MIDDLE SCHOOL', address = '965 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAYSIDE PEDIATRICS', address = '1020 INDEPENDENCE BLVD # 311', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAYSIDE PRESBYTERIAN CHURCH', address = '1400 EWELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAYSIDE PRESBYTERIAN PRESCHOOL', address = '1400 EWELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAYSIDE-AMABILE MEDICAL CTR', address = '816 INDEPENDENCE BLVD # 1H', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BAYWATCH POINTE ARM', address = '5414 CATINA ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BB&T', address = '536 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BB&T', address = '944 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BEACH BARBER SHOP', address = '4642 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BEACH EAR NOSE & THROAT PC', address = '1020 INDEPENDENCE BLVD # 313', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BEACH FORWARDERS INC', address = '4981 CLOVER ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BEAN GLOBAL', address = '1125 LADY GINGER LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BEAR BOTTOM TANNING', address = '377 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BEAT THAT BITCH UP', address = '4309 DELRAY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BEE MY BUZZ', address = '5204 HOLBORN CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BEHAVIORAL NEUROPSYCHIATRIC', address = '1020 INDEPENDENCE BLVD # 310', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BELANGER APPRAISALS', address = '4620 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BELIEVERS HOUSE WORLDWIDE', address = '544 NEWTOWN RD # 152', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BELMONT PIZZA', address = '1270 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BELTONE HEARING AID CTR', address = '291 INDEPENDENCE BLVD # 132', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BENCHMARK CARPET CARE', address = '404 DAVIS ST # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BENEFICIAL INSURANCE', address = '4456 CORPORATION LN # 330', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BEST & DEPENDABLE HOME HEALTH', address = '812 NEWTOWN RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BEST & DEPENDABLE PRO NURSING', address = '812 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BEST RECOGNITION', address = 'PO BOX 62226', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BETH ANN R LAWSON LAW OFFICE', address = '4445 CORPORATION LN # 278', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BETHANY CHRISTIAN SVC', address = '287 INDEPENDENCE BLVD # 241', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BETIS ENTERPRISES LLC', address = '513 DECLARATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BEYOND THE CLL BOOKING SVC LLC', address = '509 DECLARATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BIG ALS MUFFLERS & BRAKES', address = '4857 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BIG TONYS TILE', address = '4629 PRISCILLA LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BILL THE PAINTER', address = '622 AUBREY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BINGO AT WITCHDUCK HALL', address = '660 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BISHARD DEVELOPMENS CORP', address = '5524 CURTIS BREATHWAITE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BIZPORT LIMITED', address = '632 N WITCHDUCK RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BLACKS PHOTOGRAPHY', address = '793 CHIPPENDALE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BLAKEWAY CORP', address = '770 INDEPENDENCE CIR # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BLUEWATER CARPET & UPHOLSTERY', address = '4620 JOHN ALDEN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BOATING S', address = '628 TIMON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BOB MCCREARYINS AGY-NATIONWI', address = '533 NEWTOWN RD # 112', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BODY MATRIXX BY JEWRELL', address = '293 INDEPENDENCE BLVD # 118', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BOLIN LAWN CARE', address = '729 EMERALD LAKE DR # 201', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BOLLINGER ENTERPRISES', address = '637 LIBERTY BELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BONNEY ALLENBERG & OREILLY PC', address = '4854 HAYGOOD RD # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BOOST MOBILE', address = '649 NEWTOWN RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BORDEAUX & ASSOC', address = '4654 HAYGOOD RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BOTTORFF ASSOCIATES', address = '5352 LAKE LAWSON RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BOULEVARD JEWELERS', address = '373 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BOULEVARD MEDICAL CTR', address = '1020 INDEPENDENCE BLVD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BOWLING ASSOCIATION OFFICE', address = '700 BAKER RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BOY SCOUTS OF AMERICA', address = '1032 HEATHERWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BOYD HOMES', address = 'PO BOX 62209', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BOYKINS DAYCARE', address = '608 SIRINE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BRAIDS R US', address = '5461 WESLEYAN DR # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BRANDYWINE APARTMENTS', address = '749 TRELLIS WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FRED BRASWELL', address = '5304 WARMINSTER DR # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BREEZ-IN CONVENIENCE STORE', address = '921 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BRIDGES ELECTRIC INC', address = '4869 PEACHCREEK LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BRIGHTEST STARR', address = '5934 W HASTINGS ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BRINKS FLOORING', address = '4833 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BRITISH SHOP', address = '676 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BROOK BAPTIST CHURCH', address = '4397 WISHART RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BROS FISH TACOS', address = '858 FIVE FORKS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BRT AUTO REPAIR', address = '5564 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BRUDER ALCOHOL-DRUG TREATMENT', address = '289 INDEPENDENCE BLVD # 221', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BUCKYS TRANSMISSION & AUTO', address = '4849 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BUDDHIST EDUCATION CTR', address = '423 DAVIS ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BUDGET TRAVEL AGENCY', address = '1143 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BUKHARI CHAUTAUQUA', address = '1265 GRAND CYPRESS SQ', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BURGER KING', address = '564 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BURGESS SNYDER WINDOW CO', address = '560 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'C & C SVC INC', address = '1121 BATTLE ROYAL CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'C E H BILLING & CODING', address = '5328 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'C E O TRANSPORTATION LLC', address = '5269 SUMMER CRES', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'C M COURIER', address = '4713 WINDERMERE CT # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'C N B TALENT & E-MARKETING SVC', address = '609 CATANO CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'C S BALDWIN PAINTING', address = '600 HESSIAN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CAERCIVE NAILS', address = '624 INDEPENDENCE BLVD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CALZ PIZZA SUBS & CHICKEN', address = '624 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CALVARY BAPTIST CHURCH', address = '4832 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CALZ PIZZA SUBS & CHKN WINGS', address = '998 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CAMPUS EAST COMMUNITY ASSOC', address = '5642 CAMPUS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CANDL COINS & STAMPS', address = '536 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CAPITAL CENTER LLC', address = '1016 FALLBROOK BND', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CAPTAINS DS SEAFOOD RSTRNT', address = '416 DAVIS ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CAR MASTERS AUTOMOTIVE LLC', address = '528 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CAR START', address = '4893 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CARDINAL ASSOCIATES INSURANCE', address = '4652 HAYGOOD RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CARDIOLOGY CONSULTANTS', address = '1016 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CARE GIVER RESOURCES INC', address = '5376 CLUB HEAD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CARIBBEAN GROCERY INC', address = '544 NEWTOWN RD # 146', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CARNEY RETINA & MACULA CTR', address = '4433 CORPORATION LN # 195', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CARPENTERS HOUSE MINISTRIES', address = '980 BROAD MEADOWS BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CARR MORTGAGE SVC', address = '281 INDEPENDENCE BLVD # 429', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CARRIAGE HOUSE APARTMENTS', address = '5340 CARRIAGE HOUSE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CARRS ENTERPRISES INC', address = '4320 DELRAY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CASA PIZZA', address = '344 CONSTITUTION DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CATWALK CUTS', address = '752 INDEPENDENCE BLVD # 4578', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CDI HEAD START', address = '5691 HAMPSHIRE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CELLULAR SALES', address = '1048 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CENTER FOR EFFECTIVE CHANGE', address = '870 NEWTOWN RD # 201', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CENTER FOR WEIGHT MANAGEMENT', address = '4551 PROFESSIONAL CIR # 201', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CENTURY CAPITAL MORTGAGE INC', address = '762 INDEPENDENCE BLVD # 400', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CETERA ADVISORS', address = '291 INDEPENDENCE BLVD # 542', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CFP SALES', address = '4720 BRIDGEMAN LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SAGHANA CHAKRABORTTY MD', address = '1020 INDEPENDENCE BLVD # 305', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHANDLER SCARBOROUGH REALTY', address = '287 INDEPENDENCE BLVD # 321', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHANELLOS PIZZA', address = '1002 ARAGONA BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHECK INTO CASH', address = '1031 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHECKSMART', address = '5650 VIRGINIA BEACH BLVD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHEESECAKE WEDDING CAKE-MRS B', address = '1133 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHEFS TABLE', address = '550 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHERYL EDDY BENN PC', address = '700 INDEPENDENCE BLVD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHESAPEAKE BAY ACADEMY', address = '821 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHESAPEAKE BAY ASAP', address = '868 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHESAPEAKE BAY CARDIOLOGY PC', address = '1020 INDEPENDENCE BLVD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHESAPEAKE PEDICATRICS-FAMILY', address = '1020 INDEPENDENCE BLVD # 203', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHESTER SMITH ATTORNEYS AT LAW', address = '293 INDEPENDENCE BLVD # 231', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHEWNING INSURANCE INC', address = '1105 CLUB HEAD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHICK-FIL-A', address = '1097 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHILD & FAMILY WELLNESS CTR', address = '314 CONSTITUTION DR # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHILD & YOUTH SVC', address = '289 INDEPENDENCE BLVD # 245', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHILD CARE NETWORK', address = '1056 FERRY PLANTATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHILDRENS BOOK SHOPPE STOP', address = '503 SUMMIT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHILDRESS FLAX & LEVINE PC', address = '533 NEWTOWN RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHINESE COMMUNITY ASSN-HAMPTON', address = '722 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHIROPRACTIC SOLUTION CTR', address = '287 INDEPENDENCE BLVD # 311', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHOE CENTER FOR FACIAL PLASTIC', address = '4400 CORPORATION LN # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHRIST PRESBYTERIAN CHURCH', address = '709 ARAGONA BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHRISTIAN MEDICAL ASSOC', address = '1020 INDEPENDENCE BLVD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHRISTIAN PSHCHO THERAPY', address = '281 INDEPENDENCE BLVD # 326', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHROMATIC PHANTASIE LLC', address = '5447 LYNBROOK LNDG', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHRYSM INSTITUTE', address = '281 INDEPENDENCE BLVD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHUCKS CONSTRUCTION', address = '600 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CINEMA CAFE', address = '752 INDEPENDENCE BLVD # 4590', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ANTHONY CIOTTI DDS', address = '4512 OLD ENGLISH CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CITY-VA BEACH', address = '297 INDEPENDENCE BLVD # 218', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CLAPHAM ENTERPRISES', address = '4608 RED COAT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CLARK REALTY SVC', address = '4456 CORPORATION LN # 145', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CLEVELAND WINDOW CLEANING', address = '4821 FROSTBURG LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CLEVELAND WINDOW CLEANING CO', address = '641 BIRCHRIDGE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CLIPPERS', address = '5461 WESLEYAN DR # 107', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CLOUD 9 WORK & PLAY', address = '4663 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CMIT SOLUTIONS OF VA BEACH', address = '5304 HICKORY RDG', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'COASTAL GROUP', address = '4634 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'COASTAL MASSAGE THERAPY', address = '762 INDEPENDENCE BLVD # 786', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'COASTAL SURGICAL SPECIALISTS', address = '1020 INDEPENDENCE BLVD # 212', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'COLONY BEACH FLORIST INC', address = '4668 PEMBROKE BLVD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'COLOR BY JANET PAINTING', address = '1116 TENBURY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'COLOR GRAPHICS', address = '355 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'COMMONWEALTH APPRAISAL', address = '4663 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'COMMONWEALTH INDUSTRIAL SUPPLY', address = '4737 SULLIVAN BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'COMMUNITY SERVICES OF VIRGINIA', address = '4551 PROFESSIONAL CIR # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'COMPUTER SHOPPE', address = '1140 KINGS WAY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CONDOR HAULING INC', address = '4737 BUNKER HILL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CONSORTIUM FINANCIAL', address = '556 SANDBURG ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'COPELAND COMPUTER', address = '601 HESSIAN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CORNERSTONE SERVICE INTRVNTN', address = '4620 HAYGOOD RD # 6', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'COUSINS CONSTRUCTION CO', address = '5220 WINDING BANK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CROSSDARTS AMUSEMENTS', address = '5320 LYNBROOK LNDG', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MELVIN E CRUSER III DDS', address = '1209 INDEPENDENCE BLVD # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CRYSTAL CLEAR CLEANING SVC', address = '5509 AMHURST CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CURVACEOUS', address = '549 NEWTOWN RD # 107', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CUTTING EDGE SYSTEMS LLC', address = '4640 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CYPRESS POINT COUNTRY CLUB', address = '5340 CLUB HEAD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'D & H AUTO', address = '500 NEWTOWN RD # 15', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'D GREEN STORYTELLING', address = '920 SOUTHMOOR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'D J RODNEY CHARLES', address = '885 ROCKWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DA VITA INC', address = '740 INDEPENDENCE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DAIRY QUEEN', address = '1093 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DALE CARNEGIE TRAINING', address = '291 INDEPENDENCE BLVD # 515', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DANIELLE LINGERIE', address = '1080 CHARITY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DARRELL A MEEKS LTD', address = '281 INDEPENDENCE BLVD # 225', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DAVANZO INSURANCE & FINANCIAL', address = '281 INDEPENDENCE BLVD # 438', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DAVID JERNIGAN MASTER ELCTRCN', address = '4023 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DAVIS CORNER FIRE DEPT', address = 'PO BOX 61733', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DAVIS MASONRY INC', address = '761 DE LAURA LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FLOYD R DAVIS', address = '281 INDEPENDENCE BLVD # 431', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SANDRA DEAN', address = '4445 CORPORATION LN # 120', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DEANE WILLIAMS', address = '4321 ALFRIENDS TRL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DECKED OUT BUILDERS', address = '813 GABLE WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DEDICARE STAFFING SOLUTIONS', address = '4445 CORPORATION LN # 20', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DEES CORNER', address = '5416 HEATHERTON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DEJA VU CONSIGNMENT BOUTIQUE', address = '1115 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DELL LAWSON-ALLSTATE AGENT', address = '1145 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DELOREANS', address = '649 TYSON RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DENNY & DENNY', address = '4461 DRUM CASTLE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DEREK DUNN MINISTRIES', address = '1309 BERTRUM CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DESIGNER STYLISTS', address = '1270 DIAMOND SPRINGS RD # 114', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DIAMOND MOBILE DETAILING', address = '5812 W HASTINGS CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DIAMOND SPRING CONDO', address = '808 ZIRCON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DIAMOND SPRING ELEMENTARY SCHL', address = '5225 LEARNING CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DIAMOND SPRINGS KINDERCARE', address = '990 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DIAMOND SPRINGS PET SPA', address = '1270 DIAMOND SPRINGS RD # 119', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DIAMONDS BY DEZIGN', address = '899 CARIBE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DIANNE D EPPLEIN & ASSOC', address = '818 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DIERDORF DAYCARE', address = '719 OAK HURST CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DIGITAL SOUND', address = '4049 SCHILLING PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DIGITEK', address = '293 INDEPENDENCE BLVD # 135', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DISCOUNT PLUMBING', address = '1100 LAWSON COVE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DIVERSE PROFESSIONAL SVC', address = '752 GLENSHIRE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DIVURGENT CORP', address = '4445 CORPORATION LN # 228', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DOLLAR GENERAL', address = '649 NEWTOWN RD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DOLLAR TREE', address = '1055 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DOMINION DELIVERIES INC', address = '4740 WESTGROVE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DOMINION ENERGY MANAGEMENT', address = '4445 CORPORATION LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DOMINOS PIZZA', address = '996 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DONALD SEALS FLOORING SVC', address = '4924 WESTGROVE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DORNBRACK ELECTRIC APPL REPIAR', address = '405 SCHUYLER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DOUGS AUTO REPAIR', address = '5127 WITCHDUCK CT # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DOUGS UPHOLSTERY', address = '4863 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DOUGLAS H MURPHY APPRAISER', address = '4609 CHIPPENDALE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DOVE LANDING APARTMENTS', address = '5305 JUSTIN CT # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DOVE LANDING NORTH', address = '5305 JUSTIN CT # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DOWNS PROPERTIES INC', address = '505 N WITCHDUCK RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DR KINGS FAMILY DENTISTRY', address = '4605 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DRAEGER SAFETY DIAGNOSTICS INC', address = '5125 WITCHDUCK CT # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DRS TECHNICAL SVC INC', address = '1205 WITCHDUCK BAY CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DUNKIN DONUTS', address = '4600 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DUNKIN DONUTS', address = '627 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DWAB CO', address = '5822 E HASTINGS ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'E & S SVC', address = '4740 WINDERMERE CT # 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'E A S CLEANING SVC', address = '816 S GROSVENOR CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'E SCRIBE SOLUTIONS INC', address = '4665 HAYGOOD RD # 406', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'E Z CAREGIVERS', address = '5600 FANSHAW CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'E Z MEDICAL TRANSPORT LLC', address = '5600 FANSHAW CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EAGLE MARITIME CONSLNTS INC', address = '281 INDEPENDENCE BLVD # 208', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EAGLE REALTY', address = '4300 SAINT MARTIN CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EASTERN VA EAR NOSE & THROAT', address = '816 INDEPENDENCE BLVD # 3H', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EASTWEST CONSTRUCTION', address = '700 INDEPENDENCE BLVD # 201', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ECHOES OF TIME COSTUMES', address = '600 N WITCHDUCK RD # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EDA HANDCRAFTED CONCRETE', address = '564 SANDBURG ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EDDIE LEVON GAMBLE', address = '5140 SAMMY ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WILBUR E EDWARDS JR', address = '4456 CORPORATION LN # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EFFECTIVE LEADERSHIP', address = '4705 SPRINGTREE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EFT INC', address = '312 CONSTITUTION DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EL AZTECA', address = '314 CONSTITUTION DR # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ELDER CARE AT HOME INC', address = '4663 HAYGOOD RD # 206', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ELEGANT DRAPERIES LTD', address = '5127 WITCHDUCK CT # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ELEGANT JEWELRY DESIGNS', address = '4321 ALFRIENDS TRL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ELIZABETH L LASSEIGNE ELCTRLYS', address = '4441 CHELSEA ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ELIZABETH RIVER DISTRICT', address = 'PO BOX 12654', city = 'NORFOLK', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ELLENS CUISINE', address = '610 CHARLES CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EMARC COMMUNICATIONS INC', address = '4654 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EMJ PAINTING', address = '5168 HOLLY FARMS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EMMANONS II', address = '332 CONSTITUTION DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EMPIRE INSURANCE 1619 INC', address = '4445 CORPORATION LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ENCOMPASS', address = '287 INDEPENDENCE BLVD # 135', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ENLIGHTEN SEO', address = '4445 CORPORATION LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ENOCH BAPTIST CHURCH', address = '5641 HERBERT MOORE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ENVIRONMENTAL CHEMICAL CORP', address = '4433 CORPORATION LN # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ESPIONAGE RESEARCH INSTITUTE', address = '4445 CORPORATION LN # 291C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ESSENTIAL WELLNESS', address = '1209 INDEPENDENCE BLVD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ETHERIDGE CONCRETE & CONSTR', address = '412 KELLAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EUROSTYLE FURNITURE', address = 'PO BOX 9281', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EVAN TAYLOR PHOTOGRAPHY', address = '5440 LAWSON HALL KY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EVENTS TO ENRICH', address = 'PO BOX 9031', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EXECUTIVE HOMES CORP OF VA', address = '4205 EWELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EXIT REALTY CENTRAL', address = '4654 HAYGOOD RD # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EXOUSIA INTERNATIONAL CHRSTN', address = '5049 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EXPERIENCE CONCRETE DESIGN', address = '576 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EXPERTS', address = '640 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EXPRSSS EMPLOYMENT PRO', address = '4530 PROFESSIONAL CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EYE SPECIALISTS LTD', address = '813 INDEPENDENCE BLVD # E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'EYES 4 ORGANIZING', address = '1041 GAS LIGHT LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'F M CLEANING', address = '615 SPIRIT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FAMILY DOLLAR STORE', address = '1012 FALLBROOK BND', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FAMILY DOLLAR STORE', address = '928 DIAMOND SPRINGS RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FAMILY MEDICAL PRACTIONER', address = '1147 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FAMILY THRIFT CTR', address = '5393 WESLEYAN DR # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FARM FRESH', address = '1069 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FARM FRESH PHARMACY', address = '928 DIAMOND SPRINGS RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FARM FRESH SUPERMARKET', address = '1069 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FARM FRESH SUPERMARKET', address = '737 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FARM FRESH SUPERMARKET', address = '928 DIAMOND SPRINGS RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FARMERS INSURANCE', address = '4445 CORPORATION LN # 225', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FAST LANE INTL', address = '4856 HAYGOOD RD # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FASTAX INC', address = '1270 DIAMOND SPRINGS RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FAZE II', address = '533 NEWTOWN RD # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FERRY PLANTATION HOUSE', address = '4136 CHESWICK LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FICARRA JEWELERS', address = '1081 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FICARRA JEWELERS INC', address = '4425 CHANDLER LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FIELD N GROUND', address = '1137 FERRY PLANTATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'A ELLETT FIELDS JR CPA', address = '281 INDEPENDENCE BLVD # 416', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FINGERS N MOTION', address = '809 CHALK CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FIRST CHURCH OF THE NARAZENE', address = '4413 WISHART RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FIRST COLONIAL UROLOGICAL', address = '4501 N WITCHDUCK RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FIRST REALTY OF TIDEWATER', address = '4656 HAYGOOD RD # E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FIVE GUYS BURGERS & FRIES', address = '750 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FLEX COATINGS', address = '1412 WAKEFIELD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FLOOR ONE ONE LLC', address = '5617 FANSHAW CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FLORA NOVARA INC', address = '1243 LAWSON COVE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FLORAL DESIGNS BY JOYCE', address = '5069 HOLLY FARMS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FOOD LION', address = '5461 WESLEYAN DR # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FOOD LION', address = '748 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FOODSTAFF OF HAMPTON ROADS', address = '287 INDEPENDENCE BLVD # 246', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOSEPH FORESTIERE MD', address = '533 NEWTOWN RD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FOREVER YOUNG MONTESSORI', address = '4604 PEMBROKE LAKE CIR # 108', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FORREST ARTS & SPORTING ADVNTR', address = '4145 HERMITAGE PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FOUR SEASONS ORIENTAL GROCERY', address = '311 KELLAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FOX CREEK TACTICAL', address = '648 DECLARATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FOX MUSIC INC', address = '4068 SAW PEN POINT CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FRANCHISE SELECTOR', address = '4213 MERCEDES CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FRATERNAL ORDER OF EAGLES', address = '1061 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FRAWG WIRELESS', address = '5650 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FREEDOM WHEELERS', address = '721 BRINSON ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FRONTLINE INITIATIVE LLC', address = '4617 GEORGETOWN PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FRUIT-THE SPIRIT HAIRCARE', address = '4604 PEMBROKE LAKE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FUN TOURS INC', address = '520 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FURRY HILLS', address = '772 MEADE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'G S DAVIS CONCRETE & MASONRY', address = '820 STELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GAMBLE ACCOUNTING SVC', address = '4225 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GAMESTOP', address = '1063 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GARRETT CONTRACTING', address = 'PO BOX 61883', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GARY B ALLISON PC', address = '291 INDEPENDENCE BLVD # 541', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GASP', address = '4856 HAYGOOD RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GASTROENTEROLOGY CONSULTANTS', address = '1020 INDEPENDENCE BLVD # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GEM OBSESSION', address = '5109 MARACAS ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GEO SOLICE RENEWABLE HTG', address = '4445 CORPORATION LN # 267', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GEORGES PLUMBING', address = '752 DE LAURA LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GET IN GET OUT', address = '5675 LANDFALL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GINOS PIZZERIA', address = '928 DIAMOND SPRINGS RD # 109', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GISCO', address = '1289 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GLASS SLIPPER CLEANING', address = '704 BOLERO CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ARTHUR L GLICK DDS', address = '533 NEWTOWN RD # 117', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GLOBAL ENTERTAINMENT GROUP INC', address = '665 NEWTOWN RD # 111', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GLORYS BAKER INC', address = '665 ARAGONA BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GODS GRACE & GOD IS GRACIOUS', address = '807 FRATERNITY CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GOFFIGAN FAMILY CLEANING', address = '5801 W HASTINGS CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GOLDEN CITY', address = '5461 WESLEYAN DR # 108', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GOLDEN GLOVE', address = '671 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GOLDEN SLIPPERS DANCE ACADEMY', address = '1115 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GOOD SAMARITAN EPISCOPAL CHR', address = '848 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GOODE WORKS INC', address = '4412 BEN FRANKLIN LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GOODMAN ALLEN & FILETTI', address = '4456 CORPORATION LN # 135', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GOODWOOD FURNITURE', address = '363 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GORDON ENTERPRISES & HM MNTNC', address = '704 OLIVIERI LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GOT WRINKLES FLOORING', address = '4405 CAMBRIA ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GOURMET GANG INC', address = '1089 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GRACE EPISCOPAL CHURCH', address = '848 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GRACES CANTONESE RESTAURANT', address = '424 TICONDEROGA RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GRAND CYPRESS APARTMENTS', address = '1200 GRAND CYPRESS SQ', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GRAND MART', address = '649 NEWTOWN RD # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GRANDE PIZZA', address = '1270 DIAMOND SPRINGS RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GRANT FOOT ANKLE', address = 'PO BOX 55335', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GRAPHIC DIMENSIONS', address = '700 BAKER RD # 114', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GREAT CLIPS', address = '1027 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GREATER POTOMAC MORTGAGE', address = 'PO BOX 718', city = 'GREAT FALLS', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOHN D GREENSIDE', address = '701 INDEPENDENCE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GRIEF SOLUTIONS', address = '1029 BACKWOODS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GRIM YO FACE ENTERTAINMENT', address = '4848 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GROUNDS GUYS', address = '600 N WITCHDUCK RD # 107', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GROWING ESSENTIALS DAYCARE CTR', address = '600 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'GROWTH RESOURCES LLC', address = '4413 WAKEFIELD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'H & H CONSTRUCTION CO INC', address = '5125 WITCHDUCK CT # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'H M C', address = '5564 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'H N H C', address = '803 TENURE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'H R A MOBILE DRY CLEANING', address = '535 LANDFALL ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MICHAEL HAGAN', address = '5489 CLUB HEAD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAIR 2000', address = '928 DIAMOND SPRINGS RD # 124', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAIR CONNECTION', address = '4601 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAIR DE LA CREME INC', address = '5600 VIRGINIA BEACH BLVD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAIR GRAPHICS INC', address = '342 CONSTITUTION DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAIR LOVERS BEAUTY SUPPLY', address = '700 BAKER RD # 116', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HALCROW', address = '4445 CORPORATION LN # 238', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAMPTON APARTMENTS', address = '5781 LAKE EDWARD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAMPTON ROADS BLACK', address = '650 ARVIDA LN # 201', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAMPTON ROADS FAMILY PRACTICE', address = '665 NEWTOWN RD # 114', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAMPTON ROADS FASTENERS', address = '416 DAVIS ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAMPTON ROADS LIFE & HEALTH', address = '633 INDEPENDENCE BLVD # D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAMPTON ROADS TITLE OF VA INC', address = '281 INDEPENDENCE BLVD # 610', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HANA ASIAN MARKET', address = '4885 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HANDS ON PROFESSIONAL SVC', address = '4632 BROAD ST # 203', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HANDY TEAM', address = '704 GLENSHIRE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HANNAHS HALLMARK', address = '1065 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAPPY SHOPPERS', address = '601 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HARDEES', address = '701 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHRISTOPHER HARRELL CPA', address = '291 INDEPENDENCE BLVD # 501', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'BERARD HARRISON DDS', address = '4600 WESTGROVE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HARRYS MOBILE DISTR-MED EQUIP', address = '4661 HAYGOOD RD # 109', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAVOLINE XPRESS LUBE', address = '5440 WESLEYAN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAWKINS HEATING & AIR INC', address = '4445 CORPORATION LN # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAYDEN FRYE & ASSOC', address = '333 KELLAM RD # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAYES HOMECRAFT LLC', address = '1196 LAWSON COVE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAYGOOD BARBER SHOP', address = '1017 ARAGONA BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAYGOOD FLOWERS & GIFTS', address = '1115 INDEPENDENCE BLVD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAYGOOD HALL APARTMENTS', address = '1101 FERRY PLANTATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAYGOOD KINDERCARE', address = '4621 CROSSBOROUGH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAYGOOD MEDICAL CTR', address = '1020 INDEPENDENCE BLVD # 113', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAYGOOD PHYSICAL THERAPY PC', address = '1024 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAYGOOD RESIDENTIAL CORP', address = '1015 LUXFORD LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAYGOOD ROLLER SKATING CTR', address = '1036 FERRY PLANTATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAYGOOD UNITED METHODIST CHR', address = '4713 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAYGOOD UNITED MTHDST PRE-SCHL', address = '4713 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HAZE ELECTRIC', address = '4616 CAPE COD CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HEALING FOUNTAIN', address = '762 INDEPENDENCE BLVD # 100C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HEALING TOP HANDS', address = '338 CONSTITUTION DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HEALTH SCREEN VIRGINIA', address = '4668 PEMBROKE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HEART 2 HEART FAMILY CHILDCARE', address = '585 LAVENDER LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HEART TO HEART CARING', address = '829 TRAFALGAR CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HELEN SPORE FREELANCE WRITING', address = '1042 CHARITY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HENRY HANSON TUCKER REALTY', address = '4634 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HENRY STONE SOLUTIONS LLC', address = '1512 WESTERFIELD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HERB GORDON FINANCIAL SVC', address = '4504 DRUM CASTLE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HERBALIFE', address = '4328 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HERCULES HAULING INC', address = '4617 COPPERFIELD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HERITAGE HALL', address = '5580 DANIEL SMITH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HERITAGE UNITED METHODIST CHR', address = '715 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HERMITAGE CONSULTING ASSOC LTD', address = '4109 HERMITAGE PT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HERRICK & HAY PC', address = '281 INDEPENDENCE BLVD # 224', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HI-TECH INVESTIGATIONS', address = '1270 DIAMOND SPRINGS RD # 118', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HIGH IMPACT TELEVISION SYSTEMS', address = '4844 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HIGH ON THE HOG PIT BBQ & MORE', address = '1049 PATRICK HENRY WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HIPK LLC', address = '1209 INDEPENDENCE BLVD # 108', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HIPOL CLINIC', address = '701 INDEPENDENCE CIR # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HK ARTISAN', address = '716 ABBEY ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HOLISTIC HEALING CHIROPRACTIC', address = '4652 HAYGOOD RD # C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HOLISTIC HEALTH', address = '1209 INDEPENDENCE BLVD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HOLLADAY AIRBRUSH TATTOOS', address = '4741 HOLLADAY RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HOLLOMON-BROWN FUNERAL HOME', address = '1457 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HOME INSTEAD SENIOR CARE', address = '751 INDEPENDENCE CIR # 204', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HOME PARAMOUNT PEST CONTROL CO', address = '501 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HONEY BEES ORGANIZATION', address = '819 HAMPSTEAD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HONG KONG EXPRESS', address = '928 DIAMOND SPRINGS RD # 129', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HOPE IN HOME CARE', address = '804 NEWTOWN RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HORACE MANN INSURANCE CO', address = '4605 PEMBROKE LAKE CIR # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HORIZON GROUP REAL ESTATE INC', address = '4605 PEMBROKE LAKE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HORIZONS UNLIMITED', address = '4432 CHELSEA ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HOUSE OF DELEGATES', address = '4304 ALFRIENDS TRL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HOY CONSTRUCTION INC', address = '4500 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HR MARKETING GROUP', address = '5190 CYPRESS POINT CIR # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HRIT DYNAMICS', address = '641 SPOONER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HUDSON ASSOCIATES CONSULTING', address = 'PO BOX 68609', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUE BETH HUDSON MD', address = '802 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HUNTER REALTY', address = '4605 PEMBROKE LAKE CIR # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'HYPNOTHERAPY FOR HEALING', address = '762 INDEPENDENCE BLVD # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'I & O MEDICAL CTR', address = '1290 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'I O U SOLUTIONS INC', address = '4445 CORPORATION LN # 163', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'IHOP RESTAURANT', address = '4452 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'IMAGE AT HAYGOOD', address = '1039 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'IMAGES BY GENTRY', address = '4413 CAMBRIA ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'IMAGES OF SATIN & LACE', address = '5065 HOLLY FARMS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'IN HOUSE LEGAL SVC', address = '4456 CORPORATION LN # 345', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'INDEPENDENCE DENTAL CARE', address = '4530 PROFESSIONAL CIR # 3', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'INDEPENDENCE FAMILY MEDICINE', address = '813 INDEPENDENCE BLVD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'INDEPENDENCE LABORATORY', address = '800 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'INDEPENDENCE MIDDLE SCHOOL', address = '1370 DUNSTAN LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'INDEPENDENCE THERAPY CTR', address = '700 INDEPENDENCE CIR # 3D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'INDEPENDENCE VETERINARY HOSP', address = '4608 PEMBROKE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'INDIA PALACE', address = '5600 VIRGINIA BEACH BLVD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'INDUSTRIAL STEAM CLEANING INC', address = '5581 FROG POND LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'INSPIRATION CONNECTIONS INC', address = '1148 POND CYPRESS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'INSURANCE DOCTOR', address = '4507 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'INTEGRITY CONTRACTING OF HR', address = '779 HUYBERT PL # 201', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'INTERIOR DESIGN SEAMSTRESS', address = '4740 WINDERMERE CT # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'INTERNATIONAL SOCCER CAMPS', address = '1364 SIR RICHARD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'IONIC DEZIGN STUDIOS', address = '293 INDEPENDENCE BLVD # 308', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ITS ALL GREEK TO ME', address = '357 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'IVY LEAGUE ACADEMY', address = '520 CONSTITUTION DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'IYOGI COMPUTER TCHNCL SUPPORT', address = '4445 CORPORATION LN # 29', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'J & J INVESTMENT CORP', address = '649 NEWTOWN RD # 109', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'J & S PLUMBING & HEATING', address = '1205 CAPTAIN ADAMS CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'J & T TRANSPORTATION', address = '5606 BANBURY CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'J B TECHNOLOGIES', address = '603 SPIRIT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'J BAILEY ONEAL ASSOC INC', address = '4523 SIR JOHNS LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'J G HORTON & SON CONSTRUCTION', address = '5113 WITCHDUCK CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'J HART TRUCKING', address = '6022 MARGATE AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'J J E M', address = '691 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'J K BEAUTY SUPPLY', address = '5461 WESLEYAN DR # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'J M C INVEST LLC', address = '1176 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'J M RICHARD INVESTIGATION LLC', address = 'PO BOX 1412', city = 'NORFOLK', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'J M THOROUGHGOOD HOUSE', address = '1391 MARSHALL CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'J R BUSINESSES INC', address = 'PO BOX 5646', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'J W SYKES CONSTRUCTION CO', address = '1355 WAKEFIELD CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JACK RABBIT SELF STORAGE', address = '4664 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JACKSON HEWITT TAX SVC', address = '4800 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'M E JACKSON OD', address = '4642 HAYGOOD RD # 1', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JACOBS LAWN SVC', address = '841 ROCKWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JADA MOTORSPORTS', address = '701 BISHOP DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JADE GARDEN', address = '649 NEWTOWN RD # 107', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JADE VILLA', address = '353 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JALISCO RESTAURANT & TIENDA', address = '5600 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JAMES WRITESEL PHOTOGRAPHY', address = '4812 JERICHO RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JARRETTS AUTO PARTS', address = '416 DAVIS ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JASON SWANGO LAW OFCS', address = '4445 CORPORATION LN # 205', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JAY H ZIMMERMAN', address = '1224 LAWRENCE GREY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JAY YI CPA & ASSOC', address = '4663 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JDRF', address = '291 INDEPENDENCE BLVD # 517', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JEN & C HOME CARE', address = '905 ARAGONA BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JENROSE DINNER', address = '1085 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JERSEY MIKES SUBS', address = '1047 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JESSMAR ENTERPRISES', address = '4801 LUXFORD CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JGW ENDEAVORS', address = '4729 BRIDGEMAN CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JIFFY LUBE', address = '1116 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JIMS HOME IMPROVEMENTS', address = '4417 JOHN JAY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JIMS SERVICES', address = '613 KELLAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JING JIANG CHINESE RESTAURANT', address = '1115 INDEPENDENCE BLVD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JJSA ADVISORS LTD', address = '4456 CORPORATION LN # 112', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOEL N ZABA LTD', address = '281 INDEPENDENCE BLVD # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOHN W LEE LAW OFFICE', address = '291 INDEPENDENCE BLVD # 530', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOHNNIE NINE TOES', address = '4952 CARNATION AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOHNSON PEDIATRICS AT PEMBROKE', address = '293 INDEPENDENCE BLVD # 330', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOHNSONS BRICK REPAIR CO', address = '773 CREPE MYRTLE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOSEPH DI CENZO', address = '4644 PAUL REVERE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOSEPH L WEDDLE CONSTRUCTION', address = '4853 HONEYGROVE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOSEPH R LEE CERTIFIED ALXNDR', address = '700 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOSH APPLIANCE', address = '652 KENNETH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOY CLEANERS', address = '5393 WESLEYAN DR # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOY HOME CARE LLC', address = '4619 MERRIMAC LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOYCES QUALITY CREATIONS', address = '700 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JUDYS SICHUAN CUISINE', address = '330 CONSTITUTION DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JULIETTE HILLIARD PHOTOGRAPHY', address = '5205 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JUMPIN JAX', address = '4605 CROWN POINT LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'K & B TRUCKING', address = '820 TUITION DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'K & L DELIVERIES', address = '4671 MERRIMAC LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'K M A NOVELTIES', address = '421 SCHUYLER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'K NAILS', address = '1270 DIAMOND SPRINGS RD # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'K S SMALL ENGINE REPAIR', address = '707 GOOSE CREEK CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RAMESH B KADAKKAL MD', address = '1020 INDEPENDENCE BLVD # 304', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KAHN & CO', address = '624 REDKIRK LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KANPAI SUSHI', address = '371 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KARENS TRINKETS & BLANKETS', address = '748 STELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KATHLEEN DRING', address = '1020 INDEPENDENCE BLVD # 214', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KELLUM FUNERAL HOME', address = '601 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KEMPS LANDING MAGNET SCHOOL', address = '4722 JERICHO RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KFC', address = '1010 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KFC', address = '556 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KHHR TWO INDEPENDENCE LLC', address = '4530 PROFESSIONAL CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KIMBERLIN GRAY PHOTOGRAPHY', address = '4708 PICKLE BARN CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'THOMAS D KIMBLE MD', address = '515 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KING HUA', address = '752 INDEPENDENCE BLVD # 4550', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MICHAEL KINGEN', address = '4605 PEMBROKE LAKE CIR # 204', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KINGSBURY HOME REPAIR', address = '608 KELLAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KMART STORE PHARMACY', address = '312 CONSTITUTION DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KOBE SUSHI STEAKHOUSE', address = '1035 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KENNETH KOCHLER DO', address = '1209 INDEPENDENCE BLVD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KOHLER CONSTRUCTION', address = '4929 WESTGROVE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'L M ENTERTAINMENT', address = '5529 AMHURST CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LA CASA DELLA PASTA', address = '4960 CHAUCER ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LAB CORP', address = '1020 INDEPENDENCE BLVD # 201', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LABOR FINDERS', address = '4625 PEMBROKE LAKE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LANAS LITTLE HANDS', address = '5728 CONSTANCE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LANDMARK PROPERTY SVC', address = '5781 LAKE EDWARD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LANDY PERIODONTICS', address = '281 INDEPENDENCE BLVD # 231', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LANG SARAH DR', address = '5348 PARSONAGE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LANGLEY ENTERPRISES', address = '1013 HUNTING HILL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LANGUAGE GROUP LLC', address = '1137 REVERE POINT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LAST MINUTE METAL & HANDYMAN', address = '4864 PEACHCREEK LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LAUNDRY CHEMICAL PRODUCTS INC', address = '4105 ROENKER LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LAUREL STADTMAUER DR', address = '4040 BRIDGEHAMPTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DUANE A LAWRENCE MD', address = '1020 INDEPENDENCE BLVD # 211', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LAYLA GLAM SALON', address = '1080 ARAGONA BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LAZER SHARP', address = '413 DAVIS ST # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LCP INC', address = '4201 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'E MICHELLE LE CLAIRE', address = '4605 PEMBROKE LAKE CIR # 204', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LEADING CHANGE', address = '1133 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LEARNING RX', address = '633 INDEPENDENCE BLVD # C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LEES TAILORS', address = '752 INDEPENDENCE BLVD # 4562', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LEGAL AID SOCIET OF EASTERN VA', address = '291 INDEPENDENCE BLVD # 532', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LETS MAKE IT DIFFICULT FOR OUR', address = '5351 KINDLEWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LEWIS GENERAL CONTRACTING', address = '705 COFFEE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LIBERTY ENGINEERING PC', address = '4521 E HONEYGROVE RD # 108', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LIBERTY TAX SVC', address = '4609 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LIFESHIELD HOME SECURITY SYST', address = '4445 CORPORATION LN # 291', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LINDSEY BROTHERS INC', address = '865 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LIONS CHARITY FOUNDATION DIST', address = '1229 COURSE VIEW CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LITTLE ANGELS MONTESSORI', address = '329 KELLAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LITTLE CREEK INVESTMENT CORP', address = '700 INDEPENDENCE BLVD # 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LOAN MAX', address = '4700 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LOCAL LOCKSMITH', address = '5121 WITCHDUCK CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LOCAL SEO CONSULTING SVC', address = '4513 JOHN PARKER LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LOCKSMITH SOLUTIONS', address = '1002 ARAGONA BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LONG JOHN SILVERS', address = '804 NEWTOWN RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LONG TERM CARE FINANCIAL', address = '281 INDEPENDENCE BLVD # 412', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LOVE NEW JERUSALEM & LABOR', address = '913 JAY ARE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LOVE TO COOK', address = '4512 BISCAYNE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LOVING KARE HM HEALTH KARE SVC', address = '4633 PEMBROKE LAKE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LUALLIN SERVICES', address = '601 HUDGINS CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LUCAS & LUCAS PS', address = '5409 CLUB HEAD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LUCAS SYSTEMS', address = '421 MAJOR ANDRE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LUNA INC', address = '5393 WESLEYAN DR # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LUPUS FOUNDATION OF AMERICA', address = '281 INDEPENDENCE BLVD # 434', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LUXFORD ELEMENTARY SCHOOL', address = '4808 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LUXURY BROWN SPORTS BAR', address = '800 BAKER RD # 148', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LUXURY NAILS', address = '5461 WESLEYAN DR # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LXG MANAGEMENT INC', address = '4665 HAYGOOD RD # 401', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'LYNESSA GLASS INC', address = '5276 DEFORD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'M & L CARE INC', address = '4605 PEMBROKE LAKE CIR # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'M D & S STUDIOS', address = '4633 PEMBROKE LAKE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'M S M MEDICAL TRANSPORTATION', address = '838 CARIBE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'M2 HAIR SYSTEMS', address = '752 INDEPENDENCE BLVD # 4578', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MACHINERY MOUNTING SOLUTIONS', address = '4216 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MAGGIES ENTERPRISES', address = '5393 WESLEYAN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MAGIC CARPET CLEANING SVC', address = '4308 CAMBRIA CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MAGIC CLEANING', address = '508 HINSDALE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FERNANDO B MAGLAYA MD', address = '800 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MAGNER LANDSCAPING', address = '1316 SMITH COVE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NORMA O MAGPOC MD', address = '1020 INDEPENDENCE BLVD # 206', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MAID 2 SHINE 4 U', address = '725 EMERALD LAKE DR # 203', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MAID IN PARADISE', address = '812 WOOLARD CRES', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MAID TO IMPRESS', address = '5232 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MARGARET E HICKS', address = '4925 WESTGROVE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MARINERS COVE APT & TOWNHOMES', address = '832 BLACKFRIARS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MARKETING NSIGHT INC', address = '1109 LADY GINGER LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MARSHALLS', address = '1071 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DONALD R MARTIN', address = '816 INDEPENDENCE BLVD # 1A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MARTINAS CHILD CARE HOME', address = '594 DE LAURA LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TEOFILO MASCARINAS JR MD', address = '4551 PROFESSIONAL CIR # D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MATTRESS DISCOUNTERS', address = '5393 WESLEYAN DR # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MAXIM HEALTHCARE SVC', address = '287 INDEPENDENCE BLVD # 118', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MC DONALD GARDEN CTR', address = '1144 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MC DONALDS', address = '4608 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHARLES MC NEFF', address = '5345 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MEA MARKETING LLC', address = '5343 KINDLEWOOD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MEADOWS & SON', address = '4611 TRUMAN LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MEDICAL SETTLEMENT ADVANTAGE', address = '5228 CHIPPING LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MEDITERRANEAN CUISINE', address = '624 INDEPENDENCE BLVD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MERCHANTS TIRE & AUTO CTR', address = '1136 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MERCURY MOBILE WELDING & AUTO', address = '410 SHELTER DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MERIDIAN PSYCHOTHERAPY', address = '4509 WHITECHAPEL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MET LIFE', address = '4460 CORPORATION LN # 130', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'METAMORPHASIS SALON & SPA', address = '624 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MIAS BEAUTY CARE', address = '404 BETSY ROSS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MICHAEL BECK INSURANCE', address = '287 INDEPENDENCE BLVD # 320', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MICHAEL BUXTON & ASSOC PC', address = '1020 INDEPENDENCE BLVD # 309', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MICHAEL S DAVIS LAW OFFICE', address = '4445 CORPORATION LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MICROFILMING SERVICE INC', address = '824 ARAGONA BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MID-ATLANTIC AUTO SPECIALISTS', address = '4877 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MID-ATLANTIC FAMILY PRACTICE', address = '1020 INDEPENDENCE BLVD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MILESTONE PAINTING', address = '4969 CHAUCER CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MILLENNIUM CAFE & SPORT BAR', address = '544 NEWTOWN RD # 158', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MILLER MART', address = '627 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MILLION RAGS LLC', address = '1145 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MIND BODY BEAUTIFUL', address = '762 INDEPENDENCE BLVD # 100C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MINI ITALIA NEW YORK PIZZERIA', address = '665 NEWTOWN RD # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MIRACLE-EAR HEARING AID CTR', address = '4588 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MIRROR IMAGE HAIR STUDIO', address = '700 BAKER RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MISCHIEFS PARTIES', address = '5621 BAKER CT # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MISS KITTYS VILLAGE INN', address = '660 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MISTER SPARKY', address = '4445 CORPORATION LN # 186', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MOBILE PHONE SPECIALISTS', address = '1270 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PAUL G MOERSHELL III OD', address = '291 INDEPENDENCE BLVD # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MOJITO BURRITO', address = '549 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MONTAGNAS SHOES', address = '752 INDEPENDENCE BLVD # 4546', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MONTEGO CARIBBEAN GROCERY', address = '544 NEWTOWN RD # 146', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MORAN HEARING AID CTR', address = '1020 INDEPENDENCE BLVD # 307', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MSH', address = '905 HOPWOOD LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MULLINS & CO CONCRETE', address = '4512 YARMOUTH CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MULTILINK SOLUTIONS INC', address = '1270 DIAMOND SPRINGS RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MURPHY H MOORE INSURANCE', address = '700 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'N C O FINANCIAL SVC', address = '708 OAK HURST CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'N NOVA COMM', address = '1068 MEADOW GROVE TRL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'N V US PINK', address = '5634 CAMPUS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NTRIGUE', address = '4604 PEMBROKE LAKE CIR # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NAIL PLACE', address = '1043 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NAILS NUMBER 5', address = '928 DIAMOND SPRINGS RD # 114', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NAILS ONLY', address = '649 NEWTOWN RD # 113', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NAMI', address = 'PO BOX 2342', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NANCYS CLEANING', address = '640 WHITECHAPEL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NANIQ SYSTEMS', address = '4602 WESTGROVE CT # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NANNY TEMPS', address = '4961 WHITMAN LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NARA SUSHI JAPANESE RESTAURANT', address = '1115 INDEPENDENCE BLVD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NATIONAL FORECLOSURE SOLUTIONS', address = '4605 PEMBROKE LAKE CIR # 301A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NATIONAL POOL LINER INSTALLERS', address = '4404 OLD PEWTER CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NATIONWIDE INSURANCE', address = '4870 HAYGOOD RD # 108', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NATIONWIDE STRUCTURES', address = '4216 HERMITAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NAVAL MID ATLANTIC FEDERAL CU', address = '4920 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEPTUNE REALTY', address = '4445 CORPORATION LN # 190', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEUROMUSCULAR PAIN RELIEF', address = '700 BAKER RD # 108', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEW BEGINNINGS APOSTOLIC FAITH', address = 'PO BOX 65096', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEW BEGINNINGS CHRISTIAN', address = '5620 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEW BETHEL CATHEDRAL WORSHIP', address = '5691 WEBLIN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEW ST JOHN AME CHURCH', address = '5501 ROCK CREEK LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEW VISION FELLOWSHIP', address = '519 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEW WAVE CONCEPTS', address = '5316 CATINA ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEW WAVE RENOVATIONS', address = '4713 ADLER AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEW YORK MASTER BARBERS', address = '649 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEW YORK TAILORS', address = '1051 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEWMAN ACADEMY PRESCHOOL', address = '600 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEWMAN CHIROPRACTIC CTR', address = '1139 INDEPENDENCE BLVD # G', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEWPOINT CONDOMINIUM', address = '512 TREBLE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEWPOINT SALES OFFICE', address = '544 NEWTOWN RD # 132', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEWTOWN ELEMENTARY SCHOOL', address = '5277 LEARNING CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEWTOWN EXPRESS INC', address = '640 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEWTOWN SMOKE SHOP', address = '665 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NEWTOWN TITLE AGENCY INC', address = '804 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NICE DREAMS', address = '4717 DEERFIELD LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NICHOLAS FINANCIAL INC', address = '928 DIAMOND SPRINGS RD # 137', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NOAHS ARK ANIMAL WORKSHOP', address = '536 ARAGONA BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NORFOLK MARITIME SURVEYORS INC', address = '700 BAKER RD # 109', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NORTHEASTERN MECHANICAL SVC', address = '5137 SAMMY ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NUTEC DUSTLESS BLASTING', address = '811 GABLE WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'NY HAIR BRAIDS & WEAVES', address = '649 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'OCEAN BAY CONTRACTORS INC', address = '409 DAVIS ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'OCEAN SEAFOOD INC', address = '649 NEWTOWN RD # 112', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FRED P OCHAVE DDS', address = '289 INDEPENDENCE BLVD # 229', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'OFFICE SPACE & SOLUTIONS', address = '4445 CORPORATION LN # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'OKINAWA SUSHI & GRILL', address = '928 DIAMOND SPRINGS RD # 112', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'OLD DONATION APARTMENTS', address = '4441 E HONEYGROVE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'OLD DONATION CTR', address = '1008 FERRY PLANTATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'OLD DONATION EPSCPL DAY SCHOOL', address = '4449 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'OLD POINT NATIONAL BANK', address = '351 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'OLDANI & OLDANI', address = '5212 WINDING BANK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'OLIVE BRANCH INTL', address = '604 CAVENDISH DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ON THE MOVE', address = '5305 JUSTIN CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ONE ACCORD CHURCH', address = '333 KELLAM RD # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ONE PRICE CLEANERS', address = '379 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'OPTICAL INC', address = '649 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ORGANIZATION', address = '513 SUMMIT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VENITA C OWENS MD', address = '4452 CORPORATION LN # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'OWL RESEARCH & INVESTIGATION', address = '1270 DIAMOND SPRINGS RD # 11', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'OXFORD HOUSE-PEMBROKE', address = '416 MINUTE MEN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'G K PALAT MD', address = '1020 INDEPENDENCE BLVD # 302', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PAMPER YOURSELF SPA & NAIL SLN', address = '5650 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PAPA JOHNS PIZZA', address = '4505 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PARADIGMS COMMUNITY', address = '5600 HAMPSHIRE LN # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PARENT HELPING PARENTS INC', address = '287 INDEPENDENCE BLVD # 234', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KIMBERLY M PASQUALE MD', address = '816 INDEPENDENCE BLVD # 3H', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PAT DAVIS & ASSOC', address = '4696 HONEYGROVE RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ANIL N PATEL MD', address = '816 INDEPENDENCE BLVD # 3C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PATHWAYS TO PARENTING', address = '1004 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PATRICIA A LOTT PC', address = '762 INDEPENDENCE BLVD # 794', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PAYLESS SHOE SOURCE', address = '1021 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PAYNE', address = '533 NEWTOWN RD # 115', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEACHY CLEAN CLEANING SVC', address = '5820 WESTERWALD PL # 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEGASUS PSYCHIATRIC & WELLNESS', address = '4854 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ANTHONY R PELUSO DDS', address = '4008 SHERWOOD LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEMBROKE CHIROPRACTIC', address = '4668 PEMBROKE BLVD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEMBROKE COMMERCIAL RLTY CORP', address = '4460 CORPORATION LN # 300', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEMBROKE CROSSING APARTMENTS', address = '825 CROSSING CT # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEMBROKE ELEMENTARY SCHOOL', address = '4622 JERICHO RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEMBROKE FAMILY DENTAL CARE', address = '4400 CORPORATION LN # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEMBROKE LAKE APARTMENTS', address = '700 MORAINE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEMBROKE MEADOWS ELEMENTARY', address = '820 CATHEDRAL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEMBROKE PIT STOP', address = '4600 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEMBROKE PIZZA & PASTA', address = '633 INDEPENDENCE BLVD # E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEMBROKE SQUARE APARTMENTS', address = '4616 BROAD ST # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEMBROKE VETERINARY CLINIC INC', address = '4548 WISHART RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEMCCO INC', address = '4445 CORPORATION LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PENSKE TRUCK RENTAL', address = '4672 CROSSBOROUGH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PEONY NAILS', address = '750 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PERFORMANCE DELIVERIES INC', address = '5032 HOLLY FARMS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PERLIN & ASSOC', address = '4656 HAYGOOD RD # E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PERSON CENTERED PLACE LLC', address = '4667 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PET PARADISE', address = '307 KELLAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PHOENIX FINANCIAL TAX SVC', address = '293 INDEPENDENCE BLVD # 225', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PHOENIX GROUP', address = '5504 CLUB HEAD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PHYSICAL MEDICINE SPEC BAYSIDE', address = '816 INDEPENDENCE BLVD # 2C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PIANO LEARNING CTR', address = '4537 BISCAYNE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PIC SURE IT', address = '800 CHALK CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PIER SIDE SUPPLY', address = '1080 ARAGONA BLVD # C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PILLOWRIFFIC', address = '628 REDKIRK LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PINK PEARL GYMNASTICS', address = '406 DAVIS ST # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PIZZA HUT', address = '5393 WESLEYAN DR # 111', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PIZZA TIME CORPORATE OFFICES', address = '1006 ARAGONA BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PLANNED PARENTHOOD', address = '515 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PLAZA AZTECA MEXICAN RSTRNT', address = '4501 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'POINT TO POINT', address = '1270 DIAMOND SPRINGS RD # 118', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHARLES K POOLE DDS', address = '5393 WESLEYAN DR # 107', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'POPE', address = '1288 SMITH COVE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'POPPYS PLAYHOUSE', address = '5405 SCHOLARSHIP DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PORT PROJECTS CONSULTING LLC', address = '5244 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PORTOBELLO INC CSTM INTERIOR', address = '4529 E HONEYGROVE RD # 302', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'POWELL DEVELOPMENT LLC', address = '630 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'POWERFUL LEARNING PRACTICE', address = '4068 BRIDGEHAMPTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PRECISION KUTTS', address = '800 BAKER RD # 108', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PREFERRED FINISHES', address = '612 LIBERTY BELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PREFERRED PROPERTIES', address = '1203 FOURSOME LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PRENATAL MIRACLES 3D 4D ULTRA', address = '762 INDEPENDENCE BLVD # 100B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PRESTIGE TITLE AGENCY LLC', address = '291 INDEPENDENCE BLVD # 218', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PRI CORP', address = '4604 PEMBROKE LAKE CIR # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PRINCESS ANNE HIGH SCHOOL', address = '4400 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PRINCESS ANNE SURGERY PC', address = '816 INDEPENDENCE BLVD # 3L', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PROFESSIONAL CODING CONNECTION', address = 'PO BOX 55350', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PROFESSIONAL ELECTRIC SVC', address = '648 SPOONER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PROFESSIONAL FINANCIAL SVC', address = '4445 CORPORATION LN # 110', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PROFESSIONAL FIRE PROTECTION', address = '600 N WITCHDUCK RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PROFITABLE CONCEPTS & MKTG', address = '988 LARDER POST # 201', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PROSPECT MORTGAGE', address = '4456 CORPORATION LN # 206', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PROTIME AUTOMOTIVE', address = '4880 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PROTOCOL & ETIQUETTE', address = '4605 PEMBROKE LAKE CIR # 301', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PSC TECHNOLOGY INC', address = '4445 CORPORATION LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PSYCHOLOGICAL SERVICES', address = '291 INDEPENDENCE BLVD # 140', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PULMONARY & SLEEP MEDICINE', address = '1020 INDEPENDENCE BLVD # 205', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PURO CLEAN', address = '640 BREEDS HILL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PURSUASION', address = '5624 OLD GUARD CRES', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'QED SYSTEMS INC', address = '4646 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'QUALITY CARE WORKERS', address = '712 GEMSTONE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'QUALITY VAC INC', address = '549 NEWTOWN RD # 108', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'QUIZNOS', address = '5650 VIRGINIA BEACH BLVD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RADIOSHACK', address = '1037 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RAIN DOCTOR', address = '625 S WESTGROVE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RAINBOW PRESCHOOL & CHILD CARE', address = '1115 INDEPENDENCE BLVD # 107', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RATNER CO LLC', address = '4509 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RAY NEWMAN FARMS', address = '4124 RICHARDSON RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RAYS TRUCKING', address = '700 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RDS VIRGINIA', address = '632 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'REBUY CO', address = '4606 WESTGROVE CT # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RED LOBSTER', address = '709 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RED SQUARE TEA', address = '4460 CORPORATION LN # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'REFRESH EXPRESS LLC', address = '4721 LONEWILLOW LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'REGENCY SHELL', address = '565 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'REGIONAL ACCEPTANCE CORP', address = '304 KELLAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'REGISTER LINK INC', address = '1115 INDEPENDENCE BLVD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'REHABILITATION UNLIMITED INC', address = '4209 EGGLESTON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RENT LEASE ASSOC INC', address = '1094 GRAND OAK LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RENUVARE', address = '4400 CORPORATION LN # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'REPRODUCTIVE HEALTH CARE', address = '4624 PEMBROKE BLVD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'REPUBLIC ROLLER CORP', address = '4609 MILES STANDISH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RETINA GROUP OF TIDEWATER PC', address = '400 GRESHAM DR # 308', city = 'NORFOLK', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RETIREMENT PLANNERS', address = '1294 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'REYNOLDS CLEANING SVC', address = '712 TRELLIS WAY # 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'REYNOLDS EXTERIORS INC', address = '4870 HAYGOOD RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RHEMA HARVEST CHURCH', address = 'PO BOX 68296', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RHIKERS STRAITS COURIERS', address = '629 PAWLEYS ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RI HUANG ZHENG', address = '1025 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RICHARD H GREEN FINANCIAL SVC', address = '4856 HAYGOOD RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RICHARD N VALENTINE JR PC', address = '700 INDEPENDENCE CIR # 3A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RICHARD W SETZER ELECTRICAL', address = '300 GENERAL GAGE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RIDDLE ASSOCIATES INC', address = '5461 WESLEYAN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RIGEL SCIENCE & TECHNOLOGY LLC', address = '4445 CORPORATION LN # 209', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RIGHT TIME FOR THE BLUES', address = '604 DE LAURA LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RINGSIDE MARTIAL ARTS-FITNESS', address = '314 CONSTITUTION DR # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RISING TIDE THERAPY', address = '4764 RED COAT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RITE AID', address = '1075 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RITE AID', address = '748 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ROBERT E TITCOMB PC', address = '1020 INDEPENDENCE BLVD # 307', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ROD ROGGE PC', address = '762 INDEPENDENCE BLVD # 500', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TIMOTHY W ROOF', address = '281 INDEPENDENCE BLVD # 443', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ROSE & WOMBLE REALTY CO', address = '1140 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ROSEWOOD MEMORIAL PARK', address = '631 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ROSEWOOD-KELLUM FUNERAL HOME', address = '601 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ROSS DENTAL LAB', address = '5502 KEYDET DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ROY LARSEN CARNES ROMM PC', address = '4456 CORPORATION LN # 330', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'RUSTIC TIMBER CO', address = '5117 WITCHDUCK CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'S 2 HOLISTIC LIFE', address = '4605 PEMBROKE LAKE CIR # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'S I C DESIGNS', address = '924 SOUTHMOOR DR # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'S R DESIGN LLC', address = '700 BAKER RD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SAFE PLACE MINI STORAGE', address = '617 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SAI BAZAR', address = '5650 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SAJO VETERINARY HOSPITAL', address = '1094 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SAKURA JAPANESE RESTAURANT', address = '4716 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SALVATION ARMY ADULT REHAB CTR', address = 'PO BOX 62225', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SAMPLE FOLIO', address = '5584 ARBORETUM AVE', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SCANLON ENTERPRISES', address = '4716 CLYMER CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'G DOUGLAS SCHEPP', address = '4605 PEMBROKE LAKE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SCHONBRUN DENTAL CARE', address = '4529 E HONEYGROVE RD # 301', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'DOUGLAS R SCHREIBER MD', address = '1020 INDEPENDENCE BLVD # 306', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SCM HOME REPAIR', address = '1011 BACKWOODS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SCOOTER SCOOT & RLLRSKT PARTS', address = '645 AUBREY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SDC INC', address = '4663 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SEABREEZE INC', address = '4865 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SEAPOWER INC', address = '5204 HOLBORN CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SEARS RESUME WRITING SVC', address = '4588 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SEARS AUTO CTR', address = '4588 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SEARS OPTICAL', address = '4588 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SEASIDE JEWLERY', address = '4517 S HESSIAN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SEASIDE SERVICES LLC', address = '830 N GROSVENOR CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SECRETS RESTAURANT & TAVERN', address = '928 DIAMOND SPRINGS RD # 118', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SECUR-CAM INC', address = '4654 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SENDAK INTERNATIONAL CORP', address = 'PO BOX 5667', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SENTARA BAYSIDE HOSPITAL', address = '800 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SENTARA HEALTH HAYGOOD HALLS', address = '4731 POOL SIDE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SENTARA INDEPENDENCE', address = '800 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SENTARA SENIOR COMMUNITY CARE', address = '665 NEWTOWN RD # 1', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SENTARA THERAPY CTR-INDEP', address = '816 INDEPENDENCE BLVD # 3', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SEPRADO SOUND & PRODUCTIONS', address = '5061 HOLLY FARMS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SEVEN CITIES PLUMBING', address = '713 HAMPSHIRE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SEVEN CITIES RECYCLING', address = '608 CHARLES CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SEVEN CITIES SURGICAL INC', address = '5297 PIRATA PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TRACEY J SHAFFER OD', address = '4588 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SHAG N4U INC', address = '793 CHIPPENDALE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SHAMROCK SERVICES LLC', address = '4652 HAYGOOD RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SHANA DEITRICH GARLAND', address = '4629 MERRIMAC LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SHAPIRO COOPER LEWIS APPLETON', address = '1294 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'CHRISTOPHER SHEETS', address = '839 SAINT DENIS CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SHEFFYS PEST CONTROL', address = '4613 MILES STANDISH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SHELLEY MARTEL INC', address = '4604 PEMBROKE LAKE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SHELLY BEAN & ASSOC LLC', address = '1125 LADY GINGER LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SHORE ADOPTION SVC INC', address = '287 INDEPENDENCE BLVD # 219', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SHORE COMMUNICATIONS', address = '600 N WITCHDUCK RD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SHORE RENTAL SVC', address = '4656 HAYGOOD RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SIGNATURE NAILS', address = '921 NEWTOWN RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SILK KISS OCCASIONS', address = '681 KENNETH RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SIMONES DAYCARE', address = '806 S GROSVENOR CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SIMPLE PRICE MOVING', address = '4640 MERRIMAC LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SIMPLY CREMATION', address = '4445 CORPORATION LN # 263', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SIMPLY HAIR', address = '4661 HAYGOOD RD # 107', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SIMPLY SWEETS', address = '421 BREAKWATER CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'PARBHUR SINGH MD', address = '1020 INDEPENDENCE BLVD # 213B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SKIN RESTORATION', address = '4445 CORPORATION LN # 243', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SLATER & SLATER', address = '4317 WESTWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SLG MARKET RESEARCH', address = '5405 SWEETWATER CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SMILE BY DESIGN', address = '281 INDEPENDENCE BLVD # 210', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JOSEPH G SMITH', address = '4620 BUNKER HILL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SMOKEY BONES BBQ & GRILL', address = '4590 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SNYDERS RV', address = '5632 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SOCIAL SERVICES DEPT', address = '291 INDEPENDENCE BLVD # 300', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SOLEYA SKIN CARE', address = '533 KELLAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SOMATIC SYSTEMS INC', address = '4445 CORPORATION LN # 272', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SONGS TAILOR', address = '928 DIAMOND SPRINGS RD # 130', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SONIA & NGONE AFRICAN HAIR', address = '5680 HAMPSHIRE LN # 203', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SONIC DRIVE-IN', address = '1014 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SONIC DRIVE-IN', address = '5453 WESLEYAN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SOUND ADVICE HEARING AID CTR', address = '4656 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SOUTHERN BAY MARINE', address = '4825 FROSTBURG LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SOUTHERN REGIONAL TESTING', address = '4698 HONEYGROVE RD # 2', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SOUTHERN SURGICAL', address = '1020 INDEPENDENCE BLVD # 308', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SOUTHERN TRUST MORTGAGE LLC', address = '4433 CORPORATION LN # 300', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SOUTHSIDE TRANSMISSION', address = '680 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'MURRAY SPAIN DDS', address = '1127 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SPARE ROOM', address = '1270 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SPECTRUM PRINTING', address = '4716 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SPECTRUM PSYCHOLOGICAL SVC', address = '1020 INDEPENDENCE BLVD # 204', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SPORTSMAN RESTAURANT', address = '4525 E HONEYGROVE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SPOTLESS JANITORIAL SVC', address = '4509 YARMOUTH CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SPRINTERBUS.NET', address = '5461 WESLEYAN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SQUARE ONE SCHOOL READY', address = '287 INDEPENDENCE BLVD # 120', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ST CROIX APARTMENTS', address = '801 CARIBE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STACEYS WINDOW CLEANING SVC', address = '804 ANGELA CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STARZ BRAIDS', address = '549 NEWTOWN RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STAT GAS SVC', address = '4661 HAYGOOD RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STATE FARM INSURANCE', address = '1115 INDEPENDENCE BLVD # 214', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STATE FARM INSURANCE', address = '928 DIAMOND SPRINGS RD # 131', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STAY BRIGHT REFINISHING', address = '5530 OLD GUARD CRES', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STELLAR', address = '649 NEWTOWN RD # 108', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STEPBYSEP HEALTH LLC', address = '740 HARRIS POINT DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STEPPIN STONES PRESCHOOL', address = '649 NEWTOWN RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STERLING ARTS', address = '661 TYSON RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STEVEN F MCSWEENEY', address = '4348 BLACKTHORNE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STITCHES FOR YOU', address = '1333 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STORAWAY & ALLSAFE SELF STGE', address = '636 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STRAIGHT EDGE LAWN CARE', address = '838 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'STYLES UNLIMITED', address = '1270 DIAMOND SPRINGS RD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUBWAY', address = '1115 INDEPENDENCE BLVD # 120', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUBWAY', address = '1270 DIAMOND SPRINGS RD # 101A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUBWAY', address = '5650 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUBWAY', address = '665 NEWTOWN RD # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUH YOO KYUNG', address = '1264 GRAND CYPRESS SQ', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SULLIVAN HOME REPAIR LLC', address = '4312 WESTWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUMMER PLACE TOWNHOMES', address = '808 NEWTOWN RD # 102', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUN EQUIPMENT INC', address = '1140 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUN RESORTS TANNING CTR', address = '928 DIAMOND SPRINGS RD # 107', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUNDAYS BLUE BOX TANNING RSRT', address = '750 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUNPRES PROPERTIES', address = '1305 GRAND CYPRESS SQ', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUNTRUST BANK', address = '4550 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUNTRUST BANK', address = '750 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUPERCUTS', address = '928 DIAMOND SPRINGS RD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUPERIOR PAWN CO', address = '4760 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUPERSUDS VIRGINIA BEACH I', address = '549 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUPPORT SYSTEMS ASSOC INC', address = '291 INDEPENDENCE BLVD # 517', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUPREME CLEANING', address = '761 LAKE EDWARD DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SURF RIDER NORTH', address = '928 DIAMOND SPRINGS RD # 135', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SURF RIDER RESTAURANT', address = '1270 DIAMOND SPRINGS RD # 115', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SURVIVAL HOUSE INC', address = '5364 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SUSANS KITCHENETTE FILIPINO', address = '1270 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SWEENEY UTTERBACK DENTISTRY', address = '814 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ELI SWEIRY DDS', address = '4667 HAYGOOD RD # 501', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SYKES BOURDON AHERN & LEVY PC', address = '281 INDEPENDENCE BLVD # 500', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WILLIAM G SYKES', address = '4633 PEMBROKE LAKE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'SYMPHONICITY-SYMPHONY ORCHSTR', address = '291 INDEPENDENCE BLVD # 421', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'T & K TAILORS', address = '5393 WESLEYAN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'T & S MEDIA', address = '1344 FIVE FORKS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'T NAILS', address = '4604 PEMBROKE LAKE CIR # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TAKE TIME TO SHOP', address = '832 ZIRCON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TAM CONSULTING', address = '900 ARAGONA BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TANGOS TAVERN', address = '4668 PEMBROKE BLVD # 106', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TANYAG & CO', address = '4445 CORPORATION LN # 284', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TASTEFULLY SIMPLE', address = '4416 SAINT MARK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TAYLORS DO-IT CTR', address = '1123 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'JULIE TEABAULT', address = '4624 PEMBROKE BLVD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TECHNIQUES HOLISTIC SALON', address = '544 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TECHS ON WHEELZ', address = '1009 BELWOOD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TELCOM SYSTEMS LLC', address = '808 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TEMPLE LAW GROUP PC', address = '291 INDEPENDENCE BLVD # 219', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TERRYS MULTISURFACE RSTRTN', address = '616 CONNIE WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'THAI EXPRESS LLC', address = '5117 HOLLY FARMS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'THALIA LYNN BAPTIST CHURCH', address = '4392 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'THERAPY NETWORK', address = '762 INDEPENDENCE BLVD # 772', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'THOMAS MILITARY PLACEMENT GRP', address = '1121 LAWSON COVE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'THOMPSON SERVICES LLC GL', address = '740 HARRIS POINT DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TIDA THAI CUISINE', address = '336 CONSTITUTION DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TIDEWATER DESIGN WORKS', address = '5413 CLEEVE ABBEY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TIDEWATER FAMILY PRACTICE', address = '4660 HAYGOOD RD # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TIDEWATER HOME HEALTH CARE', address = '4445 CORPORATION LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TIDEWATER HOMESPEC LLC', address = '1024 PATRICK HENRY WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TIDEWATER HUMANE INC', address = '4604 PEMBROKE LAKE CIR # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TIDEWATER SECURITY SVC', address = '4604 WESTGROVE CT # C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TIDEWATER SEW & VAC', address = '1045 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TIDY TEAM', address = '621 CEDAR SPRINGS CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TIFFANY & TIFFANY PLLC', address = '770 INDEPENDENCE CIR # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TIGNOR CONSTRUCTION', address = '832 SAINT MARTIN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TIME MACHINE', address = '4640 HAYGOOD RD # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TLBC KINDERGARTEN & CHLDCR', address = '4392 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TLBC WEEKDAY LEARNING PRGM', address = '4392 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TOBACCO ROAD', address = '4413 HUDGINS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TODAY BUS', address = '649 NEWTOWN RD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TODDLER STATION PRESCHOOL', address = '601 DECLARATION RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TONE HUT', address = '665 CUNNINGHAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TORRENTIAL DATA SOLUTIONS INC', address = '4456 CORPORATION LN # 235', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'FRANK R TOSCANO OD', address = '1020 INDEPENDENCE BLVD # 312', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TOWNE CENTER AUTO REPAIR', address = '4861 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TOWNE CENTER HAIR & NAIL ELITE', address = '532 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TRADESTAFF & CO', address = '4663 HAYGOOD RD # 208', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TREAD QUARTERS DISCOUNT TIRE', address = '390 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TREAD QUARTERS DISCOUNT TIRE', address = '628 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TRI STAR PLUMBING & DRAIN', address = '4329 SAINT ALBANS ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TRINI STAR', address = '805 HAMPSTEAD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TROPICAL SMOOTHIE CAFE', address = '4515 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TRUE VICTORY OUTREACH MNSTRS', address = '1270 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TRUST BUILDERS LAW GROUP', address = '4445 CORPORATION LN # 165', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'TWISTED PAIR TECHNOLOGIES', address = '5316 LYNBROOK LNDG', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'UNCLAIMED FREIGHT CO CLEARANCE', address = '5508 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'UNIQUE ONE AUTOMOTIVE MOBILE', address = '4760 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'UNITED MEDICAL', address = '762 INDEPENDENCE BLVD # 798', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'UNITED METHODIST FAMILY SVC-VA', address = '815 BAKER RD # 201', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'UNIVERSAL CUTS', address = '5393 WESLEYAN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'UNIVERSAL WEIGHT LOSS', address = '4501 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'UNIVERSITY OF VIRGINIA-HAMPTON', address = '291 INDEPENDENCE BLVD # 418', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'UPS STORE', address = '1083 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'US LEC OF VIRGINIA LLC VA', address = '1120 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'US NAVAL RECRUITING', address = '287 INDEPENDENCE BLVD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'US POST OFFICE', address = '1053 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'US TAE KWON DO CTR', address = '1077 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'USA NATIONAL KARATE DO', address = '600 N WITCHDUCK RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'USA NKF OF VIRGINIA INC', address = '600 N WITCHDUCK RD # 103', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'V CAR', address = '4636 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VA 757 CARPET CLEANING SYSTEMS', address = '5655 SUMMIT ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VA FLAMES SPORTS ASSN', address = '738 GLENSHIRE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VALARIE ROSS FIELD DANCE STD', address = '4548 GOOD ADAMS LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VALCOURT BUILDING SVC', address = '5127 WITCHDUCK CT # 105', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VALKYRIE ENTERPRISES LLC', address = '4460 CORPORATION LN # 130', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VANELLA CHIROPRACTIC', address = '1115 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VANELLA CHIROPRACTIC', address = '4663 HAYGOOD RD # 207', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VAUGHAN DIGITAL MEDIA NETWORK', address = '5048 HOLLY FARMS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VESSEL OF HOPE', address = '5508 BULLS BAY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WALTER E VEST III MD', address = '800 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VETSHELPVETS.COM', address = '629 PAWLEYS ARCH', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIDEO HORIZONS', address = '1131 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VILLAGE INN', address = '313 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VINCENT RECA', address = '4125 RICHARDSON RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH DEPT HUMAN SVC', address = '289 INDEPENDENCE BLVD # 138', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH ENVIRONMENTAL', address = '4452 CORPORATION LN # 224', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH ESTATES', address = '937 DIAMOND SPRINGS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH FIRE DEPT', address = '4672 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH HEALTH DEPT', address = '4452 CORPORATION LN # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH HUMAN SVC DEPT', address = '297 INDEPENDENCE BLVD # 218', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH LIBRARY', address = '936 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH MIRROR & GLASS', address = '605 RAFF RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH POLICE DEPT', address = '926 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH PUBLIC SCHOOL', address = '4722 JERICHO RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH PUBLIC SCHOOL', address = '4808 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH SCANNING', address = '4445 CORPORATION LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH SONRISE', address = '600 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH SUN', address = '4561 GOOD ADAMS LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH VITAL STATISTIC', address = '4452 CORPORATION LN # 224', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH WIC OFFICE', address = '4452 CORPORATION LN # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA BEACH WIC PROGRAM', address = '4452 CORPORATION LN # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA CAPITAL MANAGEMENT', address = '806 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA SEAGULL TRAVEL BUS', address = '329 KELLAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA STARZ', address = '1006 COACH CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA SUPPORT GROUP LLC', address = '4661 HAYGOOD RD # 201', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA SUPPORT GROUP LLC', address = '4663 HAYGOOD RD # 204', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRGINIA SURGICAL CTR', address = '291 INDEPENDENCE BLVD # 202', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VIRTUOL DESIGNS LLC', address = '5694 CAMPUS DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VOB CHILD CARE', address = '544 NEWTOWN RD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VOGEL-UNIVERSAL PEDIATRICS', address = '4624 PEMBROKE BLVD # 101', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VOLOUR PUB', address = '5635 BANBURY CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VOLUNTEERS OF AMERICA', address = '5677 HERBERT MOORE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'VSD INC', address = '4460 CORPORATION LN # 200', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'W D CONTRACTING SVC', address = '4638 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'W S DAWNSON CO', address = '801 CATHEDRAL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALEXANDER WAITKUS DDS', address = '293 INDEPENDENCE BLVD # 108', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WALGREENS', address = '4500 VIRGINIA BEACH BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WALGREENS', address = '5501 WESLEYAN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WALGREENS', address = '801 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WARD & HOLLINGSWORTH RLTY CORP', address = '4868 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WARDS CORNER BEAUTY ACADEMY', address = '544 NEWTOWN RD # 160B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WARRENS FIX IT', address = '4200 EGGLESTON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WASH', address = '590 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WATER TREATMENT SVC', address = '293 INDEPENDENCE BLVD # 135', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WE CAN HELP', address = '1028 CHARITY DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WEAVE MASTERS', address = '649 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WEBLIN PLACE APARTMENTS', address = '5670 WEBLIN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WEDDING PLANNER BY CMT EVENT', address = '1115 INDEPENDENCE BLVD # 212', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WEEKLY WEEDER & CO', address = '4404 BEN FRANKLIN LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WELLS FARGO BANK', address = '1068 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WELLS FARGO BANK', address = '699 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WELLS FARGO HOME MORTGAGE', address = '4456 CORPORATION LN # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WENDYS', address = '1066 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WEPRO LLC', address = '811 HAMPSTEAD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'KAREN A WERNICKE', address = '700 INDEPENDENCE CIR # 3D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WESLEYAN COURTS APARTMENTS', address = '609 WINDING WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WESTRAYS ASSORTED CHEESECAKES', address = '5741 WEBLIN DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WILBURDON INVESTIGATION INC', address = '5441 LAWSON HALL KY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WILCO HESS', address = '4873 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WILLIAM E WOOD & ASSOC', address = '800 NEWTOWN RD # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WILLIAM E WOOD & ASSOC RLTRS', address = '4598 BROAD ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WILLIAMS ELEMENTARY SCHOOL', address = '892 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WILLIAMS FARM', address = '952 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WILLOWWOOD MARKETING', address = '1416 SIR RICHARD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WILSON CONTRACTING CO INC', address = '424 DAVIS ST', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WITCHDUCK CRESENT', address = '909 SHAMAN CRES', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WITCHDUCK NOVELTY SHOP', address = '660 N WITCHDUCK RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WIZ KIDS LEARNING ZONE LLC', address = '4698 HONEYGROVE RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WIZARD OF SPAS', address = '792 ARAGONA BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WIZKIDZ', address = '724 BAKER RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ELEANORA WOLOY MD', address = '833 DE LA FAYETTE CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WOMEN@WORK.COM', address = '912 SOUTHMOOR DR # 302', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WOOD ROOFING', address = '918 EWELL RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WOOD WILLIAM E & ASSOC', address = '800 NEWTOWN RD # 100', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WOODRUFF TIMBERLINE', address = '5436 KIAWAH CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WOODY ENTERPRISE', address = '4712 KELLAM CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WORKERS COMPENSATION COMMN', address = '281 INDEPENDENCE BLVD # 600', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WORLD GROUP SECURITIES INC', address = '293 INDEPENDENCE BLVD # 210', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'WORLDS AFFAIRS COUNCIL-GREATER', address = '4501 N WITCHDUCK RD # G', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'XIANG WANG INC', address = '329 KELLAM RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'YMCA', address = '4808 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'YMCA', address = '892 NEWTOWN RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'YOU', address = '4663 HAYGOOD RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'YOUNG SEAFOOD', address = '549 NEWTOWN RD # 104', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ALVIN R YOUNG', address = '4605 PEMBROKE LAKE CIR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'Z C XEFTERIS CAPT', address = '4753 RED COAT RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ZEW CORP', address = '1349 FIVE FORKS RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set name = 'ZOOM WIRELESS OF HAYGOOD INC', address = '1087 INDEPENDENCE BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
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