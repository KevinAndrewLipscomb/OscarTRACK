START TRANSACTION
;
drop table if exists resident_to_not_solicit
;
CREATE  TABLE `resident_to_not_solicit`
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
insert ignore resident_to_not_solicit set address = 'PO BOX 7396', city = 'PRINCETON', state = 'NEW JERSEY', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3317 COMANCHE RD', city = 'PITTSBURGH', state = 'PENNSYLVANIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3317 COMANCHE RD', city = 'PITTSBURGH', state = 'PENNSYLVANIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 66', city = 'YOUNGSTOWN', state = 'PENNSYLVANIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '9543 TOMSTOWN RD', city = 'WAYNESBORO', state = 'PENNSYLVANIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3131 MEETINGHOUSE RD APT H14', city = 'UPPER CHICHESTER', state = 'PENNSYLVANIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '18737 HAPS LN', city = 'PURCELLVILLE', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 114', city = 'DELAPLANE', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '612 THIRD ST STE 4A', city = 'ANNAPOLIS', state = 'MARYLAND', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '8100 CRESTRIDGE RD', city = 'FX STATION', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '9160 BELVOIR WOODS PKWY', city = 'FORT BELVOIR', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '20027 GREAT FALLS FOREST DR', city = 'GREAT FALLS', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '6251 OLD DOMINION DR APT 207', city = 'MCLEAN', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2801 CLARENDON BLVD STE 306', city = 'ARLINGTON', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 4710', city = 'ARLINGTON', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1213 BIXHAM LN', city = 'CHARLOTTESVLE', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1007 SMITH ST', city = 'CHARLOTTESVLE', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '385 STONE CREEK PT APT 204', city = 'CHARLOTTESVLE', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '7090 COVENANT WOODS DR RM B112', city = 'MECHANICSVLLE', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2936 CORBIN HALL DR', city = 'WATER VIEW', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 55', city = 'WHITE MARSH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3717 GOVERNOR YEARDLEY LN', city = 'WILLIAMSBURG', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 8795', city = 'WILLIAMSBURG', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '120 CHERWELL CT', city = 'WILLIAMSBURG', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '4219 EXBURY LN', city = 'WILLIAMSBURG', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '701 E BROAD ST FL 5TH', city = 'RICHMOND', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1000 BANK ST STE 303', city = 'RICHMOND', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '107 S 5TH ST', city = 'RICHMOND', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3008 MECHANICSVILLE TPKE', city = 'RICHMOND', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1612 BROOKLAND PKWY', city = 'RICHMOND', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1612 BROOKLAND PKWY', city = 'RICHMOND', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '8301 HUNGARY SPRING RD', city = 'RICHMOND', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2825 DUMBARTON RD', city = 'HENRICO', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 11807', city = 'RICHMOND', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 11807', city = 'RICHMOND', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 26234', city = 'RICHMOND', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 298', city = 'ATLANTIC', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '920 CORPORATE LN', city = 'CHESAPEAKE', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1050 SHOAL CREEK TRL', city = 'CHESAPEAKE', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2637 N ELIZABETH HARBOR DR', city = 'CHESAPEAKE', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1324 TERESA DR', city = 'CHESAPEAKE', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '900 FREERS CT', city = 'CHESAPEAKE', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1857 VARSITY DR', city = 'CHESAPEAKE', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3135 OLD QUARRY RD', city = 'RICHMOND', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 9768 BS', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 2237', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 2865', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'MUNCIPAL BUILDING', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2330 CROIX DR', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2924 BUCCANEER RD', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2264 FIRST LANDING LN', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '403 34TH ST APT 107', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '500 PACIFIC AVE APT 202', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2101 PARKS AVE STE 500', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '808 KENNEDY AVE', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1284 LASKIN RD APT 102', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1000 19TH ST', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 1696', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '301 BENDIX RD STE 300', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '233 VICTORIA DR', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '321 GARRISON PL', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '501 VIKING DR', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '477 VIKING DR STE 130', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1800 COLLEGE CRES', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2828 PLEASANT ACRES DR', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1858 DUKE OF YORK QUAY', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2425 SHOREHAVEN DR', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1233 PARKSIDE PL', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '940 GENERAL STUART DR', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1250 BAYNE DR', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1060 FIRST COLONIAL RD', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '316 ROSELYNN LN', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1126 CHARTER CT', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '572 CENTRAL DR STE 102', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1201 FAULKNER RD', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '4529 GUAM ST', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3663 MARLIN BAY CT', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1370 DUNSTAN LN', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1120 DAVENTRY PL', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5620 WESLEYAN DR APT 136', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5345 DEFORD RD', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2425 NIMMO PKWY-COURT SUPPORT', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 6344', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2580 ATWOODTOWN RD', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '941 SUMMERSIDE CT', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5057 THATCHER WAY', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1364 DALSBURY LN', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2649 MAJESTY LN', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1 MUNICIPAL CTR', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2401 COURTHOUSE DR', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2405 COURTHOUSE DR', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2425 NIMMO PKWY', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2416 COURTHOUSE DR BLDG 19', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '249 PRINCESS ANNE RD', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2164 PUNGO FERRY RD', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1750 TOMCAT BLVD BLDG 230/FLOOR', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '821 BAKER RD', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5445 LEGACY WAY', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '4525 MAIN ST STE 700', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1993 SUNDEVIL DR', city = 'VIRGINIA BCH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 449', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1585 WESLEYAN DR', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '8211 EDWIN DR', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '7211 GRANBY ST # 105', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '841 MOWBRAY ARCH', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '240 W FREEMASON ST', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '101 W MAIN ST STE 4500', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '600 GRANBY ST STE 400', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1 COMMERCIAL PL FL 15', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '500 E MAIN ST STE 310', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '9727 AVIONICS LOOP', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '375 A ST', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '703 W PRINCESS ANNE RD APT 6', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '4487 PLEASANT AVE', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3309 RIDGEFIELD DR', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 41069', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 41119', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1562 MITSCHER AVE', city = 'NORFOLK', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '100 BOTETOURT RD', city = 'NEWPORT NEWS', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5200 MERCURY BLVD', city = 'NEWPORT NEWS', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '11870 MERCHANTS WALK STE 104', city = 'NEWPORT NEWS', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '19 ODD RD', city = 'POQUOSON', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '4509 GLENCOVE DR', city = 'PORTSMOUTH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '801 WATER ST STE 10', city = 'PORTSMOUTH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '16 CRAWFORD CIR', city = 'PORTSMOUTH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3636 HIGH ST', city = 'PORTSMOUTH', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '9846 LORI RD STE 200', city = 'CHESTERFIELD', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '4314 SOUNDVIEW LN', city = 'CHESTERFIELD', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5316 COPPERFIELD DR', city = 'PRINCE GEORGE', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2322 PASLEY AVE S. W.', city = 'ROANOKE', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '200 MILITARY DR', city = 'CHATHAM', state = 'VIRGINIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5132 BRANDILES LN', city = 'WINSTON SALEM', state = 'NORTH CAROLINA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '22 CEDAR BRANCH DR', city = 'GREENSBORO', state = 'NORTH CAROLINA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3313 GLENHOPE CT', city = 'CARY', state = 'NORTH CAROLINA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '88 HAMILTON RD', city = 'CHAPEL HILL', state = 'NORTH CAROLINA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '776 WHITE HORSE DR', city = 'GREENVILLE', state = 'NORTH CAROLINA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '120 WILLOW ST', city = 'HERTFORD', state = 'NORTH CAROLINA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '108 N WATER ST', city = 'POINT HARBOR', state = 'NORTH CAROLINA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 747', city = 'NEWTON', state = 'NORTH CAROLINA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '24 HIGHBRIDGE XING APT 1302', city = 'ASHEVILLE', state = 'NORTH CAROLINA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '104 ELM VIEW TER', city = 'SPARTANBURG', state = 'SOUTH CAROLINA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2014 DEREN WAY NE', city = 'ATLANTA', state = 'GEORGIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '104 EGRETS WALK LN', city = 'PONTE VEDRA', state = 'FLORIDA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2238 NACKMAN PL', city = 'THE VILLAGES', state = 'FLORIDA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2701 N OCEAN BLVD APT 705', city = 'BOCA RATON', state = 'FLORIDA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '7330 KEA LANI DR', city = 'BOYNTON BEACH', state = 'FLORIDA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '7142 SE GOLF RIDGE WAY', city = 'HOBE SOUND', state = 'FLORIDA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1498 MARCASITE DR', city = 'BRENTWOOD', state = 'TENNESSEE', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '620 TIMBER LN', city = 'NASHVILLE', state = 'TENNESSEE', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1402 TOWNSHIP ROAD 249', city = 'TORONTO', state = 'OHIO', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3333 MANNINGTON AVE', city = 'CINCINNATI', state = 'OHIO', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '6 FAIRVIEW DR', city = 'HESSTON', state = 'KANSAS', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '100 CHRISTWOOD BLVD APT 705', city = 'COVINGTON', state = 'LOUISIANA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO BOX 492176', city = 'LOS ANGELES', state = 'CALIFORNIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '9333 BALBOA AVE', city = 'SAN DIEGO', state = 'CALIFORNIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '177 AVENIDA MIRAFLORES', city = 'BEL TIBURON', state = 'CALIFORNIA', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '25001 180TH AVE SE', city = 'KENT', state = 'WASHINGTON', agency = 'VBVRS';
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
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' PIER ',address) + LENGTH(' PH ')))
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
