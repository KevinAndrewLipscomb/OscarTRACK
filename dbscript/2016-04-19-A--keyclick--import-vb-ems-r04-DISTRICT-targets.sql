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
insert resident_import set address = '4952 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5003 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5070 Gunter St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5041 Gunter St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2121 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5026 Joslin St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5049 Pemberton St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5032 Gafney Ln APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4968 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5003 Gunter St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5010 Gafney Ln APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5038 Gunter St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4940 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5041 Gunter St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5024 Darga Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4900 Cotton Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5030 Gafney Ln APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5053 Pemberton St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2113 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5025 Joslin St APT G', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4950 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5024 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4912 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4970 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5030 Gafney Ln APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5018 Joslin St # B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5029 Gafney Ln APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5002 Gunter St APT H', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5034 Gafney Ln APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5011 Gafney Ln APT E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5029 Gafney Ln APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5002 Gunter St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5053 Pemberton St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4956 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1921 Pleasant Pond Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5070 Gunter St APT F-5070', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4934 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5074 Gunter St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4900 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5021 Joslin St APT F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5009 Gafney Ln APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5074 Gunter St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5072 Gunter St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1937 Pleasant Pond Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5021 Joslin St APT E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5058 Pemberton St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5068 Gunter St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5020 Joslin St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2101 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1911 Pleasant Pond Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2139 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1824 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5037 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1825 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5058 Pemberton St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5027 Joslin St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4958 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1808 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5052 Pemberton St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5063 Joslin St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5021 Joslin St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1808 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4995 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5074 Gunter St APT F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5017 Joslin St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2107 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1820 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5001 Gunter St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5069 Gunter St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2145 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5020 Joslin St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2143 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1807 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5006 Gunter St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5056 Pemberton St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1816 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5014 Gafney Ln APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5024 Joslin St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5015 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1915 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5069 Gunter St APT F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5006 Gunter St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2175 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4946 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5049 Pemberton St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5050 Pemberton St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5007 Gafney Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2135 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2159 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5006 Gunter St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5025 Joslin St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5059 Pemberton St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5061 Joslin St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5015 Joslin St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5049 Pemberton St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1915 Pleasant Pond Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5009 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4944 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5022 Joslin St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5070 Gunter St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1810 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5056 Pemberton St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2191 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5027 Joslin St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5045 Joslin St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5057 Pemberton St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5020 Joslin St APT E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5069 Gunter St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5001 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5025 Joslin St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1813 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5047 Pemberton St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1802 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1822 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1806 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5063 Joslin St APT E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5072 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5053 Pemberton St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5040 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5004 Gunter St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5005 Darga Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1917 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4914 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5066 Joslin St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5038 Gunter St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5025 Joslin St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1810 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2165 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4919 Cotton Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4974 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4927 Cotton Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5045 Joslin St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1801 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5037 Gunter St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5061 Joslin St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5042 Joslin St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5057 Pemberton St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5014 Gafney Ln APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4989 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4924 Cotton Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5034 Gafney Ln APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2169 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2115 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5014 Gafney Ln APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5064 Joslin St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5015 Darga Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1814 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4997 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1953 Pleasant Pond Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2133 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5011 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2189 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4906 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5009 Darga Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5063 Joslin St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5045 Joslin St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5052 Pemberton St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5032 Gafney Ln APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1829 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5002 Gunter St APT F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5025 Joslin St APT H', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5051 Pemberton St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2179 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4926 Cotton Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5039 Gunter St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5026 Joslin St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5068 Gunter St APT F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5063 Joslin St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2181 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5074 Gunter St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2105 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5064 Joslin St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2173 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5032 Gafney Ln APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5057 Pemberton St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1819 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4926 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5025 Joslin St APT F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4993 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2149 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5049 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5046 Joslin St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5019 Joslin St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5061 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5036 Gunter St APT G', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5018 Darga Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5073 Gunter St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5011 Gafney Ln APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5047 Pemberton St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5017 Joslin St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1811 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5022 Joslin St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5016 Joslin St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4976 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5001 Darga Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5008 Gafney Ln APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5072 Gunter St APT E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5026 Darga Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5068 Gunter St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5055 Pemberton St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4920 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4949 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4969 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4918 Cotton Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5028 Gafney Ln APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5031 Gafney Ln APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5073 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5004 Gunter St APT E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1801 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5052 Pemberton St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1815 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5051 Pemberton St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1911 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1802 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2153 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5072 Gunter St APT F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1939 Pleasant Pond Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5011 Gafney Ln APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1830 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5021 Joslin St APT G', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1907 Pleasant Pond Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2111 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5027 Joslin St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4929 Cotton Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5073 Gunter St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5049 Pemberton St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5004 Gunter St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5004 Gunter St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1909 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1909 Pleasant Pond Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4914 Cotton Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1821 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5014 Gafney Ln APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5061 Joslin St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5008 Gafney Ln APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4960 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5021 Joslin St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5017 Joslin St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1831 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5051 Pemberton St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4980 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5022 Joslin St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5036 Gunter St APT H', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5059 Pemberton St APT E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5024 Joslin St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5050 Pemberton St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4925 Cotton Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5021 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4918 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2197 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5057 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5007 Darga Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4912 Cotton Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5055 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4910 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4921 Cotton Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5020 Darga Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1809 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5027 Joslin St APT F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5011 Gafney Ln APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5045 Joslin St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1952 Pleasant Pond Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5034 Gafney Ln APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4917 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2193 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5036 Gunter St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5032 Gafney Ln APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2199 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5032 Gafney Ln APT F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5036 Gunter St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5037 Gunter St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2119 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2129 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5062 Joslin St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5007 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1817 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5010 Gafney Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5020 Joslin St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5051 Pemberton St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5055 Pemberton St APT C', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5056 Pemberton St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5010 Gafney Ln APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5074 Gunter St APT H', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5038 Gunter St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5039 Gunter St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5052 Pemberton St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5021 Joslin St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5053 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5031 Gafney Ln APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5035 Gunter St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1919 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5018 Joslin St # A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1916 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5009 Gafney Ln APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1817 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2163 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5059 Pemberton St', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5004 Gunter St APT F', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5055 Pemberton St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5070 Gunter St APT A', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1806 Harvest Farms Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5006 Gunter St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5059 Pemberton St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5068 Gunter St APT B', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '2157 Wellings Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5055 Pemberton St APT D', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1814 Crystal Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '4904 Rustic Arbor Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '1917 Pleasant Pond Ln', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
insert resident_import set address = '5069 Gunter St APT E', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CBVRS';
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
-- insert ignore state (abbreviation) select distinct state from resident_import
  -- DO NOT POLLUTE state TABLE WITH UNVERIFIED/UNVALIDATED/UNNORMALIZED DATA
;
update resident_import join state on (state.abbreviation=resident_import.state) set state_id = state.id
;
--
-- CITY
--
;
update resident_import set city = "VIRGINIA BEACH" where city = "VIRGINIA BCH"
;
-- insert ignore city (name,state_id) select distinct resident_import.city as name, resident_import.state_id as state_id from resident_import
  -- DO NOT POLLUTE city TABLE WITH UNVERIFIED/UNVALIDATED/UNNORMALIZED DATA
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
