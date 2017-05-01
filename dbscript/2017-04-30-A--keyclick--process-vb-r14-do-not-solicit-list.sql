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
;
insert ignore resident_to_not_solicit set address = 'PO Box 7396', city = 'Princeton', state = 'New Jersey', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3317 Comanche Rd', city = 'Pittsburgh', state = 'Pennsylvania', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3317 Comanche Rd', city = 'Pittsburgh', state = 'Pennsylvania', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 66', city = 'Youngstown', state = 'Pennsylvania', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '9543 Tomstown Rd', city = 'Waynesboro', state = 'Pennsylvania', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3131 Meetinghouse Rd Apt H14', city = 'Upper Chichester', state = 'Pennsylvania', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'c/o Joseph J Norvath', city = 'Purcellville', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 114', city = 'Delaplane', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '612 Third St Ste 4A', city = 'Annapolis', state = 'Maryland', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '8100 Crestridge Rd', city = 'Fx Station', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '9160 Belvoir Woods Pkwy', city = 'Fort Belvoir', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '9120 Belvoir Woods Pkwy Apt 122', city = 'Fort Belvoir', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '9120 Belvoir Woods Pkwy Apt 122', city = 'Fort Belvoir', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '20027 Great Falls Forest Dr', city = 'Great Falls', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1103 Gunston Rd', city = 'Mason Neck', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '6251 Old Dominion Dr Apt 207', city = 'McLean', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2801 Clarendon Blvd Ste 306', city = 'Arlington', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '330 N Muhlenberg St Apt D', city = 'Woodstock', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1007 Smith St', city = 'Charlottesville', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '385 Stone Creek Pt Apt 204', city = 'Charlottesville', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '7090 Covenant Woods Dr Rm B112', city = 'Mechanicsville', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2936 Corbin Hall Dr', city = 'Water View', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 55', city = 'White Marsh', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3717 Governor Yeardley Ln', city = 'Williamsburg', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 8795', city = 'Williamsburg', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '120 Cherwell Ct', city = 'Williamsburg', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '4219 Exbury Ln', city = 'Williamsburg', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '701 E Broad St Fl 5', city = 'Richmond', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'c/o House Flower Fund', city = 'Richmond', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'c/o Rich Behavioral Hth Auth', city = 'Richmond', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3008 Mechanicsville Tpke', city = 'Richmond', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '4811 Seminary Ave', city = 'Richmond', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1612 Brookland Pkwy', city = 'Richmond', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1612 Brookland Pkwy', city = 'Richmond', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '8301 Hungary Spring Rd', city = 'Richmond', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2825 Dumbarton Rd', city = 'Henrico', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '905 Coralberry Pl', city = 'Richmond', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '8912 Ginger Way', city = 'Richmond', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '534 St Albans Way', city = 'Henrico', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 11807', city = 'Richmond', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 11807', city = 'Richmond', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 26234', city = 'Richmond', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 298', city = 'Atlantic', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '920 Corporate Ln', city = 'Chesapeake', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1050 Shoal Creek Trl', city = 'Chesapeake', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2637 N Elizabeth Harbor Dr', city = 'Chesapeake', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1012 Raydon Ln', city = 'Chesapeake', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1324 Teresa Dr', city = 'Chesapeake', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '900 Freers Ct', city = 'Chesapeake', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1857 Varsity Dr', city = 'Chesapeake', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3135 Old Quarry Rd', city = 'Richmond', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '115 Pitchkettle Point', city = 'Suffolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3400 Bob White Ln', city = 'Suffolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 2237', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 2865', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 9768', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'Muncipal Building', city = 'Virginia Bch', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '214 Creeks Edge Dr', city = 'Virginia Bch', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2330 Croix Dr', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2264 First Landing Ln', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2236 Kendall St', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '221 80th St', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '403 34th St Apt 107', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '500 Pacific Ave Unit 202', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2101 Parks Ave Ste 500', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '808 Kennedy Ave', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1284 Laskin Rd Apt 102', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'c/o Renee Berry', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 1696', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '520 S Independence Blvd Ste 2', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '301 Bendix Rd Ste 300', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '233 Victoria Dr', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'c/o Joel Wolf', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '501 Viking Dr', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '477 Viking Dr Ste 130', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'c/o M D Taylor Director', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2828 Pleasant Acres Dr', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '806 Windom Pl', city = 'Virginia Bch', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2209 Sumberg Court', city = 'Virginia Bch', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2808 S Adventure Trl', city = 'Virginia Bch', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2221 Plantation Dr', city = 'Virginia Bch', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'c/o Raymond Troiano', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1858 Duke of York Quay', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2425 Shorehaven Dr', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1233 Parkside Pl', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '940 General Stuart Dr', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1250 Bayne Dr', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '316 Roselynn Ln', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1126 Charter Ct', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '572 Central Dr Ste 102', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1201 Faulkner Rd', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '895 Avatar Dr', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '4529 Guam St', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3663 Marlin Bay Ct', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1370 Dunstan Ln', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1120 Daventry Pl', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5620 Wesleyan Dr Apt 136', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5345 Deford Rd', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2425 Nimmo Pkwy-Court Support', city = 'Virginia Bch', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 6344', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2580 Atwoodtown Rd', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '941 Summerside Ct', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5057 Thatcher Way', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1364 Dalsbury Ln', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2649 Majesty Ln', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2401 Courthouse Dr Ste 9002', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2425 Nimmo Pkwy Ste 9017', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1 Municipal Ctr', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2405 Courthouse Dr', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2416 Courthouse Dr Bldg 19', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '249 Princess Anne Rd', city = 'Virginia Bch', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2164 Pungo Ferry Rd', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1750 Tomcat Blvd Bldg 230/FLOOR', city = 'Virginia Bch', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '821 Baker Rd', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5445 Legacy Way', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '4525 Main St Ste 700', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5264 Lowery Downs', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1993 Sundevil Dr', city = 'Virginia Beach', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 449', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1585 Wesleyan Dr', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '8211 Edwin Dr', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '7211 Granby St Ste105', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '841 Mowbray Arch', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '240 W Freemason St', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'c/o R /c Dickerson Family Fund', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '600 Granby St Ste 400', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '440 Monticello Ave Ste 2000', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '500 E Main St Ste 310', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '9727 Avionics Loop', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '375 A St', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '703 W Princess Anne Rd Apt 6', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '4487 Pleasant Ave', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2720 Console Ave', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 41069', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 41119', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1562 Mitscher Ave', city = 'Norfolk', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '100 Botetourt Rd', city = 'Newport News', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5200 Mercury Blvd', city = 'Newport News', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '11820 Fountain Way Ste 206', city = 'Newport News', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '19 Odd Rd', city = 'Poquoson', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '4509 Glencove Dr', city = 'Portsmouth', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '801 Water St Ste 10', city = 'Portsmouth', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3636 High St', city = 'Portsmouth', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '9846 Lori Rd Ste 200', city = 'Chesterfield', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '4314 Soundview Ln', city = 'Chesterfield', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5316 Copperfield Dr', city = 'Prince George', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2322 Pasley Ave S. W.', city = 'Roanoke', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '621 Highfield Rd', city = 'Salem', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '200 Military Dr', city = 'Chatham', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1012 Peyton Ridge Ct', city = 'Forest', state = 'Virginia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '5132 Brandiles Ln', city = 'Winston Salem', state = 'North Carolina', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3313 Glenhope Ct', city = 'Cary', state = 'North Carolina', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '88 Hamilton Rd', city = 'Chapel Hill', state = 'North Carolina', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '906 Park Ridge Rd Apt 4', city = 'Durham', state = 'North Carolina', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '776 White Horse Dr', city = 'Greenville', state = 'North Carolina', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '120 Willow St', city = 'Hertford', state = 'North Carolina', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 1815', city = 'Kill Devil Hills', state = 'North Carolina', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '108 N Water St', city = 'Point Harbor', state = 'North Carolina', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '728 Klumac Rd', city = 'Salisbury', state = 'North Carolina', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1616 Village Point Rd SW Apt 8', city = 'Shallotte', state = 'North Carolina', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 747', city = 'Newton', state = 'North Carolina', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '24 Highbridge Xing Apt 1302', city = 'Asheville', state = 'North Carolina', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '400 Webber Rd Apt C3-6', city = 'Spartanburg', state = 'South Carolina', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2014 Deren Way NE', city = 'Atlanta', state = 'Georgia', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '104 Egrets Walk Ln', city = 'Ponte Vedra Beach', state = 'Florida', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2238 Nackman Pl', city = 'The Villages', state = 'Florida', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '2701 N Ocean Blvd Apt 705', city = 'Boca Raton', state = 'Florida', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '7330 Kea Lani Dr', city = 'Boynton Beach', state = 'Florida', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '7142 SE Golf Ridge Way', city = 'Hobe Sound', state = 'Florida', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1498 Marcasite Dr', city = 'Brentwood', state = 'Tennessee', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '620 Timber Ln', city = 'Nashville', state = 'Tennessee', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '623 E Scenic Dr', city = 'Pass Christian', state = 'Mississippi', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '1402 Township Road 249', city = 'Toronto', state = 'Ohio', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '3333 Mannington Ave', city = 'Cincinnati', state = 'Ohio', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '6 Fairview Dr', city = 'Hesston', state = 'Kansas', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '42 County Road 4020', city = 'Mount Pleasant', state = 'Texas', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = 'PO Box 492176', city = 'Los Angeles', state = 'California', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '9333 Balboa Ave', city = 'San Diego', state = 'California', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '177 Avenida Miraflores', city = 'Belvedere Tiburon', state = 'California', agency = 'VBVRS';
insert ignore resident_to_not_solicit set address = '25001 180th Ave SE', city = 'Kent', state = 'Washington', agency = 'VBVRS';
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
