START TRANSACTION
;
-- --
--
-- ADJUST THE BELOW STATEMENT!!!
--
-- If you just imported DONORS, you won't want to execute the following statement at all.
--
-- --
;
-- update resident_base set name = NULL where agency = ''  -- ADJUST!!!
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
-- Insert output column from spreadsheet(s) below this comment.  If working with multiple lists, the order should be Donors, Residents, Businesses.
--
-- --
;
insert ignore resident_import set address = '5237 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1064 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5237 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1236 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1277 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5321 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1124 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1144 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5380 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5308 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1177 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1045 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5301 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1152 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5213 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1209 STOCKWELL CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5213 FINCHLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1156 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5348 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1141 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1168 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5249 BATTERSEA CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5261 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1129 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1168 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1252 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5236 FINCHLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5328 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1180 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1189 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5312 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1216 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5205 ORDSALL PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5217 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5329 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5209 BATHLEY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1205 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1317 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1276 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1104 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1109 TENBURY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5228 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1241 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5360 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1280 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5204 BALDERTON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5201 FULWOOD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1149 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1144 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5321 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5309 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1213 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5316 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1101 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5317 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1109 DAVENTRY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1192 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1305 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1101 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1197 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1221 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5221 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1116 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1077 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5305 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5216 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1248 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5320 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1088 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1156 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1129 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5201 HOLBORN CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1121 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1220 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1217 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1117 TENBURY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1033 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1117 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1141 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5237 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1065 RIDGELY MANOR BLVD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1192 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1228 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1208 STOCKWELL CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1257 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5205 HOLBORN CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5332 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1057 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5249 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5332 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1256 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1212 STOCKWELL CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5245 FINCHLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1169 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1116 DAVENTRY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1153 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1136 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1165 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1225 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1076 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5265 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1128 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1016 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5260 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5340 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1036 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5313 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5204 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1265 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1152 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1177 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1197 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1229 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1069 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1236 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1149 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1100 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5208 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1136 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5220 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1177 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5312 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1033 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1100 TENBURY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5236 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1229 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1169 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1089 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1017 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5252 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5344 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5200 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5325 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1181 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5268 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1180 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1101 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1117 DAVENTRY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1189 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1257 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1189 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1268 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1049 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1192 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1128 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1268 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1188 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1149 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5233 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1009 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1053 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1161 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5333 CHARMONT CT STE 277', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5344 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5313 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1173 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1133 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5200 WOOLWICH CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1117 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5228 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1125 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5352 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5212 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1201 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1004 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5325 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1172 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1028 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5229 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1164 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1173 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1113 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5252 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1308 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5269 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1065 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5304 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1241 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1124 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1224 STOCKWELL CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1108 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1284 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1140 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5244 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1137 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1204 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1125 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5320 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5244 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1157 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5356 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5372 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1201 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5240 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1188 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1129 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5324 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1153 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5233 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5232 FINCHLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5216 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5249 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1117 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1189 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1137 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5312 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1124 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5253 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1173 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1004 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5272 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1029 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5209 HOLBORN CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5233 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1020 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1121 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1157 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5340 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1205 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5224 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1197 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1180 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1232 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5205 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1225 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1100 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5232 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1184 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1024 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5312 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1128 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1121 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1024 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1172 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1109 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1108 TENBURY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5212 FULWOOD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1180 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1265 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5209 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5329 CHARMONT CT STE 278', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1201 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1108 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5208 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1101 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5336 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5265 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1137 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1152 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1273 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1224 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1136 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1025 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5237 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5320 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1188 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5313 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1100 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1121 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1120 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5200 BALDERTON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1221 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5221 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1061 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1081 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1312 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1181 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1161 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1213 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1277 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5225 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1137 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5308 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1152 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1260 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1273 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5240 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5220 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1132 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1041 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1172 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1204 STOCKWELL CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1276 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5233 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1117 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1112 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1084 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1228 STOCKWELL CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5209 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1116 TENBURY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1153 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1145 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1213 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1237 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1225 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5312 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5213 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5324 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5348 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1233 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5264 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5200 FULWOOD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1205 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1283 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5317 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1141 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1209 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1197 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5324 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5305 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5332 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1204 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5204 HOLBORN CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5248 BATTERSEA CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1221 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1017 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5317 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1221 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1241 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5248 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1025 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5336 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5333 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1100 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5241 FINCHLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1076 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1201 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1205 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1049 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5237 BATTERSEA CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1100 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5317 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1233 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5333 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5324 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5337 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1144 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1116 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1136 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1133 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5224 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1217 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5204 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5228 ORDSALL PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1249 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1080 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1176 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5205 FULWOOD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5376 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5324 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1220 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1156 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5208 FINCHLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1085 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5248 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1216 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1013 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1249 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1249 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1116 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1316 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1169 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5236 BATTERSEA CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1212 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1272 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1125 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5208 HOLBORN CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1120 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1229 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1117 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5333 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1224 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5253 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1101 TENBURY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1200 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1144 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5228 FINCHLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1121 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5241 BATTERSEA CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1105 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1217 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1124 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5316 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1244 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1140 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1161 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1229 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5328 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1145 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1105 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1136 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5309 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5201 FINCHLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1240 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1009 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5213 FULWOOD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1233 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1101 HAWKSWORTH CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5217 ORDSALL PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1261 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5312 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1208 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1012 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5232 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1237 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5321 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5245 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1245 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5325 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1120 DAVENTRY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1301 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1193 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1045 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5320 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5332 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1160 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1201 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5316 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1165 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1181 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1220 STOCKWELL CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5384 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1253 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1160 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1184 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5200 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1308 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5229 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1112 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5332 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1040 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1145 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1237 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5301 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1037 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5217 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1120 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1220 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5332 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1204 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5208 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1305 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1184 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5229 ORDSALL PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5225 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1021 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1149 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1156 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5236 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1293 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1165 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5209 KIRTON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1193 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5220 FINCHLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1141 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5328 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1068 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1132 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1257 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1112 DAVENTRY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5344 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1032 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1248 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5205 BATHLEY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1148 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5201 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1277 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1140 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1113 TENBURY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5332 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5316 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5356 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1173 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1169 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5233 BATTERSEA CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5225 BATTERSEA CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5200 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1109 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1112 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5320 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1196 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5200 HOLBORN CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1221 STOCKWELL CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1132 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5345 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1181 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1185 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5341 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5364 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1233 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1029 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1056 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5212 BALDERTON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1145 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1093 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5325 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5325 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5209 FINCHLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1140 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1104 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5209 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1148 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1229 STOCKWELL CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1105 HAWKSWORTH CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1136 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1144 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5304 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5352 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1021 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5309 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1228 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1161 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5204 FULWOOD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1281 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1292 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1285 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5300 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1037 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1112 TENBURY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5236 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5245 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1124 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1228 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5256 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1041 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1225 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1144 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5312 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5212 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5328 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1256 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5244 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5368 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1120 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5212 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5328 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5241 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5225 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1217 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5205 FINCHLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1160 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1100 HAWKSWORTH CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1116 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5328 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1104 HAWKSWORTH CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1013 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1128 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1205 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1044 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1176 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1304 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1121 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1205 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1264 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1104 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1168 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1080 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1124 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1125 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5224 FINCHLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1108 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1237 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1012 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1240 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1073 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5336 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1176 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5201 WOOLWICH CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1141 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1184 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1185 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5229 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5316 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5340 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1253 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1125 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1213 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5201 KIRTON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5224 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1236 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5304 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5276 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5204 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1132 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5316 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5229 BATTERSEA CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5209 FULWOOD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1072 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5212 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5209 ORDSALL PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1300 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1061 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1125 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5301 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1120 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1105 TENBURY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1224 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1168 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1193 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5300 HAYTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1228 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5221 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5244 BATTERSEA CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5329 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1017 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1185 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1105 DAVENTRY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5341 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1125 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1105 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1189 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1160 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1145 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1101 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5333 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5329 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1092 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1137 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1008 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1104 TENBURY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5200 ORDSALL PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5337 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1144 BROADHOLME PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5333 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5204 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5208 BALDERTON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1212 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1220 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5301 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1245 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5228 BATTERSEA CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1129 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5333 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1209 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1164 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1212 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1201 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1233 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1109 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5300 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5337 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1200 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5213 ORDSALL PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5349 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5321 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1148 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1252 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1184 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1181 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1196 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1176 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1241 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5241 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1001 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1208 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1269 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5216 BATHLEY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1149 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5316 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1157 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5337 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1112 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1005 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5336 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1193 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5232 BATTERSEA CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1105 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1153 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5328 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1020 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1101 DAVENTRY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1196 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1301 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1225 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5216 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1148 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5329 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1000 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5300 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1216 STOCKWELL CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1120 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1129 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1196 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5229 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1013 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1009 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5228 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1272 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1289 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5300 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1216 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1105 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1053 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1113 DAVENTRY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1320 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5261 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5240 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5205 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1113 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5305 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1005 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1060 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1133 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1108 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1188 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5232 AVERHAM DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5205 KIRTON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1128 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1057 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5257 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1260 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1137 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5324 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5308 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5348 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5329 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5245 BATTERSEA CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1072 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1096 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1113 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5220 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5308 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1140 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1232 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1121 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1145 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1216 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1212 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5216 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5320 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1192 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1129 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1133 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5220 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1021 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1165 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1033 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1232 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1084 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5309 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1113 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5204 BATHLEY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1197 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1188 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1133 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1200 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1209 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5241 SHEPPARTON WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5257 ELSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1213 STOCKWELL CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1136 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5336 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1229 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5225 ORDSALL PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1016 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1001 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5221 ORDSALL PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5213 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5309 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1140 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1185 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1221 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1217 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5305 BRINSLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1193 WESTBRIAR DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5217 FINCHLEY LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5208 BATHLEY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5324 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5208 FULWOOD CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1264 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1273 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5388 CHARMONT CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1000 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1185 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1109 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1261 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5313 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1008 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1117 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1149 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5212 BATHLEY PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1157 BELMEADE DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5320 FAREHAM LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1101 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5248 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1177 YARBROUGH WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1244 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5209 BALDERTON CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1224 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5232 NORWELL LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1113 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1297 KNIGHTS BRIDGE LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5329 TAMWORTH PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1309 LAMBETH LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1245 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1028 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '5304 BRAMCOTE PL', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1041 FARRCROFT WAY', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1037 GAMSTON LN', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1132 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1193 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
insert ignore resident_import set address = '1045 GRACE HILL DR', city = 'VIRGINIA BEACH', state = 'VA', agency = 'DCVRS';
;
-- --
--
--
-- Insert output column from spreadsheet(s) above this comment.  If working with multiple lists, the order should be Donors, Residents, Businesses.
--
-- --
;
--
-- STATE
--
;
update resident_import set state = 'VA' where state = 'VIRGINIA'
;
-- insert ignore state (abbreviation) select distinct UPPER(state) from resident_import
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
-- insert ignore city (name,state_id) select distinct UPPER(resident_import.city) as name, resident_import.state_id as state_id from resident_import
  -- DO NOT POLLUTE city TABLE WITH UNVERIFIED/UNVALIDATED/UNNORMALIZED DATA!
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
set house_num = concat(house_num,"-",SUBSTRING(address,LOCATE(' PH ',address) + LENGTH(' PH ')))
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
insert ignore street (name,city_id) select distinct UPPER(resident_import.address) as name, resident_import.city_id as city_id from resident_import
  -- DO NOT POLLUTE street TABLE WITH UNVERIFIED/UNVALIDATED/UNNORMALIZED DATA!
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
insert ignore resident_base (id,name,agency,house_num,street_id)
select @id := @id + 1 as id
, name
, agency
, house_num
, street_id
from (select @id := max(id) from resident_base) as init, resident_import
;
update resident_base
  join resident_import
    on (resident_import.street_id=resident_base.street_id and resident_import.house_num=resident_base.house_num and resident_import.agency=resident_base.agency)
set resident_base.name = resident_import.name
;
COMMIT
