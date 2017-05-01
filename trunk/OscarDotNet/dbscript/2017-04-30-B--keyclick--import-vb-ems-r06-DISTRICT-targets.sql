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
update resident_base set name = NULL where agency = 'CVRS'  -- ADJUST!!!
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
insert ignore resident_import set name = 'Marc Tripicco', address = '1888 Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Aaron Ingram', address = '636 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ada Kelly', address = '897 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Adam Dixon', address = '678 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Adam Taylor', address = '4764 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Aida Ingram', address = '4349 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Al Ablosich', address = '4176 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Albert Lowe', address = '2000 Oakun Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Alexandra Ford', address = '3943 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Alfred Bevan', address = '5449 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Alfred Jacocks', address = '3937 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Alfred Midgett', address = '1300 Shipps Cabin Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Alfred White', address = '913 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Allen Grimstead', address = '1401 Public Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Allen Sakolik', address = '4483 Nanneys Creek Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Allen Tauchen', address = '6245 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Alton Edmonds', address = '4264 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Amanda Cadwell', address = '506 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Amber Young', address = '1027 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'ames and Yvette Montgomery', address = '1509 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Amy Ward', address = '5920 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Andrew Jones', address = '3988 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Andrew Martin', address = '4752 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Andrew Rice', address = '1544 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Andrew Walck', address = '5712 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Angela Jones', address = '4001 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Anita Killen', address = '5717 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ann Hockenberry', address = '675 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Anne Lawrence', address = '2221 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Anthony and Ray Vannostrand', address = '640 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Anthony and Theresa Scigliano', address = '4100 Charity Farm Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Anthony Calcogni', address = '1218 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Anthony Davis', address = '1848 Munder Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Anthony Dickman', address = '6156 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Anthony Hooper', address = '944 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Anthony Simons', address = '5560 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Anthony Yoder', address = '713 Semmie Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Artie Rose', address = '1944 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ashraf Lauka', address = '2101 Munden Point Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Audrey Hodges', address = '1460 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Back Bay Auto', address = '1064 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Barbara Collins', address = '701 Carmel Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Barry Knight', address = '1852 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ben Ramsey', address = '3960 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ben Sutherland', address = '2065 Williams Farm Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Benjamin Scott', address = '1852 Munden Point Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bernard Hayes', address = '652 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bernard Hayes JR', address = '5468 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bernard Kemp', address = '704 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bettily Chapman', address = '4849 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Betty Ackiss', address = '5981 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Betty Styron', address = '2236 Old Pungo Ferry Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Betty Whitehurst', address = '4420 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bill Champion', address = '5248 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bill Stutzman', address = '4769 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Blake Cacace', address = '4248 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bobby Burton', address = '1425 Drum Point Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bobby Townsend', address = '948 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bonnie Crane', address = '1808 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bradford Herrington', address = '2131 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bradley McCann', address = '1937 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Brent Munz', address = '1037 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Brent Young', address = '1321 Public Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Brian Herman', address = '2192 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Brian Hugen', address = '2201 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Brian McLaughlin', address = '5940 Hattie Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bridgette Keene', address = '561 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Brittany Polland', address = '4763 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Brooks Lowery', address = '5701 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bruce Bennett', address = '4772 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bruce Boyd', address = '1907 Clifton Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bryan Biesanz', address = '2244 Cedar Crescent Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bryan Brakeman', address = '5521 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Bryan Jarrett', address = '1653 Salmons Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Calvin Fritts', address = '1052 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Carey and Kathy Brothers', address = '4832 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Carey Grimstead', address = '1539 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Carl Sawyer', address = '1413 Campbells Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Carol Clark', address = '416 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Carol Darden', address = '1151 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Carol Evans', address = '1376 Shipps Cabin Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Carolyn Engel', address = '1673 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Carolyn Hatchell', address = '1217 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Carolyn Haywood', address = '4761 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Carolyn Horvath', address = '2321 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Carolyn Pittman', address = '5476 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Carrie Roberts', address = '670 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Carroll and Julia Cooke', address = '4801 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Cassie Bell', address = '1559 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Cathy Garrett', address = '333 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Chad Vincelette', address = '2233 Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Chandler Cole', address = '1258 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Charles and Anna Foy', address = '4235 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Charles and Lori Robinson', address = '1000 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Charles and Rhonda Forbes', address = '544 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Charles Capps', address = '4744 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Charles Morris', address = '1645 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Charles Peflty', address = '2021 Pefley Lane', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Charles Rice', address = '2124 N Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Charles Sager', address = '5425 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Charles Seidel', address = '2081 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Charles Vanseiver', address = '5317 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Charlie and Mary Smith', address = '332 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Cheryl Mitchell', address = '1943 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Chester Eason', address = '3995 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Chris Deford', address = '5912 Hattie Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Chris Heier', address = '1761 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Chris Shipp', address = '516 Oakun Creek Lane', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Chrisine Batkins', address = '2044 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Chrisopher Parsons', address = '1992 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Christian Kalassey', address = '1317 Public Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Christine Smith', address = '468 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Christopher and Ashley Parker', address = '1505 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Christopher Doering', address = '677 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Christopher Donahue', address = '4104 Charity Farn Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Christopher Glass', address = '1567 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Christopher Johnson', address = '1313 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Christopher Wells', address = '2245 Cedar Crescent Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Christy Billings', address = '5904 Hattie Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Clarence Joyner', address = '1504 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Clark Pettit', address = '4904 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Clayborn Bryant', address = '2309 S Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Clifford Mahon', address = '2144 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Clifford Reid', address = '2316 S. Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Clifton Scott', address = '2213 N Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Clufford and Judy Seckman', address = '2108 Blossom Hill Ct.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Clyde and Marguerite Bryant', address = '1632 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Clyde Seeley', address = '5864 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Cody Burnside', address = '100 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Cody Chaplain', address = '4021 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Colleen Cullen', address = '1309 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Corey Pepper', address = '2001 Oakun Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Craig Jones', address = '1312 Shipps Cabin Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Craig Zeigler', address = '5197 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Crystal Salmons', address = '1928 Clifton Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Curtis Chappelle', address = '931 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Curtis Massey', address = '2068 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Cynthia Bright', address = '1525 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Cynthia Smith', address = '338 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Dale Griffith', address = '1516 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Dana and Hope Riggs', address = '3905 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Dana Marchand', address = '4482 Nanneys Creek Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Daniel and Michelle Bledsoe', address = '226 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Daniel Hand', address = '2028 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Daniel Hugeback', address = '2033 Williams Farm Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Daniel Kinzie', address = '1853 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Daniel Veber', address = '1501 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Danny Graham', address = '717 Carmel Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Darion Lovitt', address = '4104 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Darlene Johnson', address = '2020 Oakun Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Darlene Kemp', address = '4001 Vaughan Town Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Darrel Heller', address = '709 Semmie Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Darrell Brewer', address = '1425 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Darrell Edwards', address = '1324 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Darrin Savino', address = '1929 Claudia May', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Daryl Aldridge', address = '1705 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Daryl Funaiock', address = '6153 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David and Deborah Meiers', address = '4121 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David and Kim Thieman', address = '1400 Campbells Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Barnett', address = '6184 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Beers', address = '1733 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Brisbois', address = '460 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Daugherty', address = '1625 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Dearborn', address = '4844 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Gamboni', address = '1984 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Granger', address = '1580 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Johnston', address = '3893 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Jones', address = '2028 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Kaufman', address = '4281 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Kaufmand', address = '4256 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Kenkel', address = '4728 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Peterson', address = '4237 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Portlock', address = '1657 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Salmons', address = '894 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Shultz', address = '3913 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Simpson', address = '1936 Claudia May', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Sprouse', address = '301 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Tarvin', address = '2249 Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Whitaker', address = '1986 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Wilson', address = '1517 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Workman', address = '1757 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Wright', address = '4101 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'David Young', address = '5924 Hattie Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Dawn Kramer', address = '5217 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Dean Ives', address = '2372 S. Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Dean Wordell', address = '1648 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Deborah Dietz', address = '5704 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Deborah Duncan', address = '1728 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Deborah Taylor', address = '2108A Jarvis Road', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Debra Capps', address = '4836 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Debra Shaffer', address = '5701 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Debra Walsh', address = '5200 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Deena ONeil', address = '928B Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Delbert Edwards', address = '2321 S. Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Della Hale', address = '1649 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Delmas James', address = '4333 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Delores Harris', address = '5033 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Denise Walkins', address = '1604 Ray Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Dennis Adkins', address = '1605 Ray Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Dennis and Jeanette Hoggard', address = '1841 Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Dennis Dorshimon', address = '4478 Nanneys Creek Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Dennis Essay', address = '1641 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Dennis Hennessey', address = '2300 S Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Dennis Hoggard', address = '1549 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Dennis Moses', address = '1617 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Dennis Nagle', address = '1585 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Deon Cummings', address = '4498 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Don and Sarsh Burke', address = '911 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Don Trammell', address = '4472 Nanneys Creek CT', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Donald Flinn', address = '1564 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Donald Lee', address = '1504 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Donald Nelson', address = '1709 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Donald Saunders', address = '5169 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Donald Vivier', address = '2017 Williams Farm Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Donna Vaughan', address = '2373 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Doug and Charlene Brown', address = '2117 Blossom Hill Ct.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Doug and Kellie Williams', address = '712 Carmel Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Doug Humphrey', address = '1345 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Doug Moreland', address = '5429 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Doug Paschall', address = '1508 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Doug Saunders', address = '5237 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Douglas Day', address = '2260 Cedar Crescent Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Douglas Munden', address = '1377 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Douglas Revell', address = '534 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Duane Depew', address = '2224 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'E.L. Ingram', address = '363 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'E.S. Ransone', address = '5341 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ed Seeley', address = '1585B Munden Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Edgar and Lisa VonSchlichting', address = '1628 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Edith Sherman', address = '3856 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Edna Lee', address = '5465 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Edward Adamson', address = '5228 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Edward Biller', address = '5224 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Edward Kennedy', address = '4305 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Edward Quiroga', address = '1620 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Edward Thomas', address = '5489 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Elise Simpson', address = '1917 Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Elliot Ortiz', address = '5540 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Elwin and Anne Ansell', address = '5901 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Elwood Waterfield', address = '2089 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ely and Elizabeth Pangilinan', address = '1633 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Emily Duckwitz', address = '1036 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Eric Popp', address = '1608 Ray Way', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Eric Schacht', address = '4117 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ernest Griffin', address = '1588 Munden Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Eugene King', address = '4828 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ewing Best', address = '2065 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Florence Weidman', address = '6364 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Floyd Bonney', address = '1359 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Floyd Tatem', address = '1964 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Floyd Waterfield', address = '1590 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Floyd Waterfield III', address = '1592 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Fran Dixon', address = '4345 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Francis Snider', address = '512 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Frank Catlani', address = '4740 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Frank McCosh', address = '1760 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Frank Williams', address = '5021 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Franklin Brant', address = '3977 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Franz Leek', address = '1247 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Fred and Pat Storminger', address = '4276 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Fred Marsh', address = '4308 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Fred Ward', address = '1924 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Frederick Amidon', address = '4865 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Gail Carroll', address = '4172 Gum Bridge Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Garland Loftis', address = '1309 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Garry Paschang', address = '5732 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Gary Augusta', address = '928B Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Gary Butler', address = '1973 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Gary Strawhand', address = '5252 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Gary Stump', address = '4160 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Gary Whetzal', address = '3912 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Gene Lindsey', address = '1030 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'George and Jennie Cason', address = '590 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'George and Kim Bryan', address = '309 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'George Gentry', address = '4173 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'George Glass', address = '5300 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'George Hogge', address = '5216 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'George Kellas', address = '3956 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'George Piccillo', address = '4036 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'George Ransom', address = '4140 Gum Bridge Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'George Walsh', address = '1529 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Geral Skowronski', address = '5925 Lettie Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Gerald Moore', address = '1925 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Gerhard Seber', address = '5709 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Gilbert and Gail Taylor', address = '817 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Glen Cooper', address = '916 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Glenda Lane', address = '1325 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Glenn and Susan Taylor', address = '1217 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Glenn Bianchi', address = '1593 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Glenn Freeman', address = '5681 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Glenn Quiban', address = '2044 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Glenn Walsh', address = '5212 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Grace McGee', address = '1537 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Graham Nichols', address = '4921 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Greg Jaquith', address = '4166 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Gregory and Teresa Roberts', address = '4113 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Gregory Pugh', address = '1401 Drum Point RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Gus Armeniox', address = '1925 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'H.M. Dudley', address = '2121 Old Pungo Ferry Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Hans Rodnguez', address = '5568 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Harold and Brenda Owens', address = '713 Carmel Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Harry Finley', address = '2017 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Harry Stretz', address = '1028 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Helen Pittman', address = '725 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Helen Tatem', address = '1956 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Herb Culpepper', address = '2232 Cedar Crescent Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Herbert and Pearl Crichton', address = '4231 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Herbert Culpepper', address = '2233 Cedar Crescent Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Hilary Watters', address = '1520 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Houston Shirk', address = '1948 Clifton Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Howard Brewster', address = '1921 Clifton Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Howard Hindia', address = '1473 Public Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Howard Salmons', address = '809 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Howard Sawyer', address = '5413 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Irene Nunneley', address = '1588 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'J.D. Waterfield', address = '5892 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jac and Patricia Johnson', address = '684 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jack and Mikele Holmes', address = '4113 Charity Farm Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jack McElveen', address = '1912 Munden Point Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jack Spruill', address = '1984 Oakun Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jackie Pavlidis', address = '1053 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jackie Roland', address = '1056 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jacob Brown', address = '3912 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jacob Deweese', address = '4833 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jacqueline Fanney', address = '4700 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Allen', address = '5725 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James and Dena McElligot', address = '2101 Blossom Hill Ct.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James and Tammy Lam', address = '1168 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Argabright', address = '1130 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Castner', address = '1500 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Crisher', address = '4900 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Cushing', address = '2329 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Dawson', address = '4300 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Dinsmore', address = '4857 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Donnelly', address = '1669 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Dozier', address = '5153 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Graeff', address = '1301 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Harman', address = '2296 Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Hefferman', address = '930 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Jones', address = '1452 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Keown', address = '4788 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Martinette', address = '1241 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Parnell', address = '4489 Catfish Road', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Reynol', address = '2009 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Rice', address = '1816 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Salmons III', address = '5953 Hattie Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Shannon', address = '3925 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Smith', address = '1512 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Smith', address = '340 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'james Vandergiessen', address = '4353 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Wilson', address = '1588A Munden Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Wilson', address = '3900 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'James Zobel', address = '749 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jameson Cotter', address = '5226 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jamie Armstrong', address = '4157 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jamie Dockiewicz', address = '5400 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Janie Williams', address = '4713 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jared Brandwein', address = '1472 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jared Thieman', address = '1404 Campbells Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jason Gentry', address = '4185 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jason Knight', address = '5648 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jason Waguespack', address = '1300 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jay Meadows', address = '1225 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jay Merkel', address = '5916 Hattie Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jeff and Jody Salmons', address = '801 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jeff and Judy Pace', address = '4295 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jeff and Pam Froman', address = '721 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jeff Bonney', address = '1361 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jeff Gervickas', address = '3890 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jeff Grover', address = '4493 Catfish Road', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jeff Hunt', address = '1600 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jeff Kroll', address = '2216 N Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jeff Sherwood', address = '4852 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jeff Whitsell', address = '5888 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jeff Woolard', address = '5924 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jeffrey Frankowski', address = '216 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jenn Darden', address = '101 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jennifer Rowe', address = '1737 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jeremy and Jessica Daughtry', address = '1420 Campbells Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jeremy Brown', address = '1653 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jerry Chappell', address = '1601 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jerry Culpepper', address = '2008 Oakun Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jerry Ferren', address = '550 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jesse and Kelly Chammberlain', address = '480 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jesse Martin', address = '2049 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jesse Martin', address = '2069 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jesse Martin', address = '4836 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jessica Soafiere', address = '1033 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jim and Anne Bright', address = '643 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jim and Gail Salmons', address = '1956 Clifton Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jim Gray', address = '1972 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jim Smith', address = '2201 Old Pungo Ferry Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jimmy and Malinda Etheridge', address = '4841 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jo Czarnecki', address = '900 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joan Mills', address = '4188 Gum Bridge Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joann Bonney', address = '4400 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joanne Dudley', address = '1123 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joanne Hodges', address = '325 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jody Capenter', address = '2056 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joe Waller', address = '1709 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John and Balligh Cross', address = '716 Carmel Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John and Kathy Robertson', address = '4101 Charity Farm Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John and Sherrie Newell', address = '664 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Beory', address = '2029 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Borman', address = '720 Semmie Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Catonia', address = '1901 Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Cherkis', address = '432 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Cook', address = '1357 Public Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Fisher', address = '3924 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Gray', address = '1337 Public Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Kern', address = '649 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Lefeaux', address = '5600 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Malkowski', address = '224 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Munden', address = '6065 Marvin Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Munden', address = '669 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Norton', address = '1548 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Peake', address = '4000 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Pitts', address = '1902 Dudley Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Rathbone', address = '1301 Public Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Robbins', address = '5721 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Salmons', address = '2476 S. Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Stewart', address = '2221 Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Taylor', address = '2408 Three Oaks Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Williams', address = '4284 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'John Zwahl', address = '441 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Johnnie and Rae Williams', address = '564 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Johnnie Williams', address = '3989 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jon Jenkins', address = '1049 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jon Patterson', address = '508 Oakun Creek Lane', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jonathan Zook', address = '2245 Old Pungo Ferry Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Jonthan MeLaughlin', address = '1468 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joseph Cictko', address = '5457 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joseph Franzese', address = '717 Semmie Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joseph Freeman', address = '5976 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joseph Hoffenberger', address = '4021 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joseph Mantych', address = '1911 Clifton Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joseph Neidrick', address = '433 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joseph Pennel', address = '2080 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joseph Pfiffer', address = '6233 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joseph Schnurbusch', address = '1364 Shipps Cabin Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joseph Wandling', address = '4105 Charity Farm Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joseph Woliver', address = '4491 Nanneys Creek Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Josh Mauer', address = '4812 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joshua and Lauren Girdler', address = '972 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Joy Fincham', address = '1945 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Juanita Swoope', address = '1338 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Judy Cannon', address = '4840 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Judy Dudley', address = '2248 Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Julia Ogden', address = '2177 Pungo Ferry Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Justin and Jennifer Roberts', address = '2104 Blossom Hill Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Karen Keays', address = '1032 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Karen Petty', address = '1869 Munden Point Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kathleen Elliott', address = '1305 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Katie Keane', address = '3968 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kay France', address = '2000 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Keith and Sandra Mulkey', address = '2105 Blossom Hill Ct.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Keith Brocki', address = '736 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Keith Freeman', address = '1947 Clifton Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kelly Baldwin', address = '4394 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kelly Bennett', address = '4405 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kelly Capps', address = '1924 Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kelly Coppedge', address = '612 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kelly Moore', address = '1909 Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kelly Wardwell', address = '5728 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kelly Williams', address = '222 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ken Etheridge', address = '5885 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kenneth and Dolores Marinello', address = '635 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kenneth Edwards', address = '1608 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kenneth Harris', address = '4495 Nanneys Creek Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kenneth Holnes', address = '1944 Claudia May', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kenny and Carol Halstead', address = '6296 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kenny Gee', address = '1647 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kenny Newton', address = '5721 Grimstead Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kenny Twiford', address = '5447 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kent Kidwell', address = '633 Planters Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Keri Mills', address = '1780 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kermit Mitchell', address = '1945 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kerry Burns', address = '617 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kevin Dauber', address = '4017 Vaughan Town Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kevin Halstead', address = '1315 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kevin Martorell', address = '4032 Vaughan Town Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kevin Stevenson', address = '3972 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kevin Sullivan', address = '3840 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kimberely Horay', address = '928 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kirk Pringle', address = '5505 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kristy Johnson', address = '1833 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kurt Straub', address = '4256 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kyle Bosiljevic', address = '5909 Hattie Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kyle Pfeifer', address = '4212 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Kyle Soderberg', address = '937 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lannin Norkeveck', address = '600 Planters Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Larry Deel', address = '1925 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Larry Heidlebaugh', address = '1928 Claudia May', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Larry Pinkson', address = '1428 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Laura Salmons', address = '722 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lauren Lake', address = '1437 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lawerence and Susan Pinckney', address = '1648 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lawrence and Maria Stalcup', address = '1601 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lawrence and Nellie Leonardson', address = '345 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lawrence Joyner', address = '1042 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lawson Rogers', address = '1665 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lee Sawyer', address = '5417 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lee Twiford', address = '5401 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Leon Dextradeur', address = '6181 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Leon Zook', address = '721 Semmie Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Les Naghiu', address = '682 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lewis Cannon', address = '1468 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lilly Keisel', address = '1177 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Linda Grant', address = '1376 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lisa Riggs', address = '4845 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lloyd Murden', address = '2076 Jarvis Road', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lloyd Riggs', address = '712 Semmie Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lon Kennedy', address = '6252 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lori Kieste', address = '4796 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lori Sawyer', address = '4726 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Louis Cullipher', address = '1449 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Louis Klag', address = '1541 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Louisa Orr', address = '1540 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lucy Ritter', address = '2165 Pungo Ferry Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Luke Jones', address = '700 Semmie Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lynn Baker', address = '1041 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Lynne Bailey', address = '700 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'M. Kuaminski', address = '4312 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mandy Cason', address = '2037 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Margaret Akers', address = '1633 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Margaret Cartwright', address = '3993 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Margaret Hayes', address = '5460 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Marie Flinn', address = '1576 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Marie Loehmer', address = '1305 Munden Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Marisa Hagan', address = '1325 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mark and Lisa Hundley', address = '704 Carmel Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mark Anderton', address = '1465 Public Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mark Burkett', address = '2116 Jarvis Road', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mark Croft', address = '1172 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mark Etheridge', address = '4816 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mark Ferry', address = '4328 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mark Gresalfi', address = '6216 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mark Thorne', address = '3881 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mark Vaughan', address = '2253 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mark West', address = '1609 Ray WAy', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Martha McLeod', address = '1957 Munden Point Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Martin Duffy', address = '1357 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Martin Kernutt', address = '1413 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Martin Merzwa', address = '6169 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Martin Pomeroy', address = '1377 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Martin Wheeler', address = '5724 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Marty and Ann Etheridge', address = '5889 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Marty Rollins', address = '1533 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Marvin and Frances Mae Etheridge', address = '621 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Marvin Anderson', address = '4116 Charity Farm Ct.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Marvin Rollins', address = '1521 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mary Dolton', address = '639 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mary Dozier', address = '5149 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mary Ellen Brinkley', address = '4853 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mary Wedertz', address = '5209 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mason Green', address = '629 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Matthew and Robin Puryear', address = '1684 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Matthew Erkinger', address = '1369 Munden Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Matthew Gianniny', address = '409 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Matthew Leward', address = '5061 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Matthew McGroarty', address = '5433 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Matthew Strohl', address = '674 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Max Crosson', address = '2345 S. Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Maxine Martin', address = '5329 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mechael Boomer', address = '728 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Megan Hammond', address = '1236 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Melissa Hendrix', address = '1900 Dudley Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Melissa Hendrix', address = '2121 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Melissa Stallard', address = '4777 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Merlin Swartzentraber', address = '5430 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael and Angela Cole', address = '4108 Charity Farm Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael and Beulah Morgan', address = '549 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael and Eileen Ware', address = '2116 Blossom Hill Ct.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael and Karla McCarraher', address = '449 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Brown', address = '1661 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Culliper', address = '2088 Jarvis Road', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Davis', address = '1321 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Derwent', address = '2014 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Drumm', address = '359 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Elliott', address = '1951 Clifton Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Frazer', address = '1048 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Gafney', address = '4137 Gum Bridge Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Glendon', address = '1648 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Gourdeau', address = '1665 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Hathaway', address = '3813 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Haverdash', address = '5928 Hattie Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Hazelwood', address = '1440 Campbells Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Mathews', address = '1905 Claudia May', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael McLaughlin', address = '1349 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Nahl', address = '4810 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Peters', address = '1316 Shipps Cabin Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Sherwood', address = '256 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Sherwood', address = '6121 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Spruill', address = '4772 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Strawhand', address = '557 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Swift', address = '1568 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Thompson', address = '2001 Williams Farm Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Ware', address = '4490 Nanneys Creek Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Williams', address = '5025 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Winesett', address = '1417 Drum Point Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michael Yoder', address = '2224 Old Pungo Ferry Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Micheal Lovitt', address = '3997 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michelle Okrasinski', address = '513 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Michelle Okrasinski', address = '925 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mike and Patrica Dudley', address = '1736 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mike Harris', address = '1465 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mike Salmons', address = '969 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mitchell Taylor', address = '1357 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mitzie Puente', address = '1940 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mr. and Mrs. Brian Whitsell', address = '5817 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mr. and Mrs. James Banton', address = '1428 Campbells Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mr. and Mrs. Laron Payne', address = '1537 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mr. Andes', address = '601 Planters Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mr. Ansell', address = '1031 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mr. Buzzy', address = '401 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mr. Dieffenbach', address = '625 Planters Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mr. Dozier', address = '592 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mr. James', address = '617 Planters Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mr. Perez', address = '608 Planters Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Mr. Vangergiessen', address = '1540 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Muddy Creek Farms', address = '4381 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Murry Curtis', address = '4416 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Myron Lee Waterfield', address = '364 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Myron Waterfield', address = '356 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Nancy Hatfield', address = '4960 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Nancy Hollingsworth', address = '921 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Nancy Porter', address = '1669 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Nancy White', address = '4224 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Nathan Davis', address = '3973 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Nathaniel OKelly', address = '1944 Clifton Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Neal Chavas', address = '5660 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Neal Chaves', address = '2164 Pungo Ferry Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Nell Malbon', address = '1008 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Nicholas and Linda Xenakis', address = '1436 Campbells Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Nicholas Sitarski', address = '4487 Nanneys Creek Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Nick and Stephanie Balestrieri', address = '226 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Nikita Bright', address = '6081 Marvin Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Noreen Rodgers', address = '1736 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Norma Bell', address = '425 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'OD and Charlotte Waterfield', address = '6260 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Olivia Dabney', address = '1616 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2100 Blossom Hill Ct.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2029B Pefley Lane', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2097 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1039 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1107 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1132 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1145 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1253 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1255 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1305 Shipps Cabin Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1317 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1317 Shipps Cabin Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1325 Shipps Cabin Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1332 Shipps Cabin Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1405A Drum Point Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1424 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '144 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1464 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1500 Campbells Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1509 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1521 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1521 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1525 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1528 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1556 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1557 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1560 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1572 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1572 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1585 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1593 Campbells Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1601 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1601 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1609 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1612 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1624 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1628 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1668 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1676 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1700 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1748 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1753 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1780 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1789 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1793 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1904 Dudley Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1905 Dudley Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1906 Dudley Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1907 Dudley Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1924 Clifton Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1933 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1937 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1965 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1969 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1992 Oakun Creek Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2005 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2009 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2013 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2016 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2029 Pefley Lane', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2029A Pefley Lane', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2029C Pefley Lane', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2033 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2049 Williams Farm Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2057 Williams Farm Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2100 Jarvis Road', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2112 Blossom Hill Ct.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2112 Munden Point Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2120 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2145 Old Pungo Ferry Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2173 Old Pungo Ferry Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2200 N Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2200 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2251 Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2253 Jarvis Road', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2261 Cedar Crescent Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2276 Cedar Crescent Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2276 Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2284 Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2301 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2320 S. Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2337 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2348 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '2409 Three Oaks Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '329 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '350 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '3940 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '3945 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '398 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4028 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4033 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4040 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4048 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4072 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4085 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4093 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4097 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4101 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4129 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4144 Gum Bridge Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4165 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4188 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4213 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4221 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4228 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4230 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4237 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4249 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4264 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4268 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4276 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4292 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4309 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4384 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4392 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4393 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4404 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4408 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '443 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4469 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4479 Nanneys Creek Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4499 Nanneys Creek Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4849 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5049 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5093 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '516 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5172 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5244 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '525 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5263 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5309 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5405 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5437 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5449 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5452 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5477 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5484 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5608 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5636 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '5668 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '569 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '581 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '616 Planters Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '6220 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '6225 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '6257 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '632 Planters Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '905 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '927 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '944A Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '949 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '6224 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '4156 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '584 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = '', address = '1043 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'P.J. Whitehurst', address = '571 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Pat Halstead', address = '5933 Hattie Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Patrick Abernethy', address = '1165 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Patrick and Hilary Dixon', address = '6140 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Patrick and Susan Ferentz', address = '1676 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Patrick McQuilkin', address = '1405 Drum Point RD', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Patty Holmes', address = '917 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Patty Lee', address = '1505 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Paul and Alicia Mahar', address = '4345 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Paul and Debbie Smith', address = '709 Carmel Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Paul and Judy Brumley', address = '698 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Paul Bodnar', address = '1528 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Paul Grosch', address = '5709 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Paul Iwanowski', address = '4876 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Paul Porter', address = '624 Planters Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Peggy Bryan', address = '313 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Pervis Thompson', address = '1585 Munden Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Pete Hartley', address = '2301 S. Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Peter and Carli Bruni', address = '1705 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Peter and Christine Brennon', address = '5700 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Peter Boone', address = '1051 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Peter Leonardson', address = '339 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Phillip Hall', address = '662 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Phillip Hurni', address = '3864 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Phyllis Vinson', address = '2000 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'R.M. Joseph', address = '1956 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Rafael Flores', address = '637 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Raietta Johnson', address = '1124 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Raleigh Monley', address = '919 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Randall Baber', address = '1609 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Randall Gilbert', address = '4869 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Randell Good', address = '1540 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Randy Harrell', address = '5736 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Randy Karr', address = '4148 Gum Bridge Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Randy Kerr', address = '1797 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Randy Thompson', address = '1544 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ray McLaughlin', address = '1133 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Raymond Arnold', address = '1920 Clifton Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Raymond Garvey', address = '4716 Stone Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Rebecca Salmons', address = '708 Carmel Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Rebekah Missale', address = '1573 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Reeves Johnson', address = '1857 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Reggie Morrison', address = '4000 Vaughan Town Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Reid Baker', address = '4961 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Rev Sung Ryu', address = '4080 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Rev. Charles Moseley', address = '685 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard and Joanne Hudson', address = '4200 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard and Tracey Hudson', address = '679 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Bordelon', address = '1012 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Britton', address = '3872 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Duty', address = '3911 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Elliott', address = '2032 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Forrest', address = '1577 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Fortune', address = '3892 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Gibson', address = '5429 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Horning', address = '6161 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Raehl', address = '4108 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Ray', address = '1050 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Rhines', address = '1400 Public Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Shearer', address = '1772 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Smith', address = '2015 Williams Farm Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Smith', address = '926 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Spink', address = '2088 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Spreder', address = '1820 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Twiford', address = '1913 Munden Point Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Vandyke', address = '658 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Woodward', address = '2308 S. Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Richard Wren', address = '2109 Blossom Hill Ct.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ricki Wright', address = '3848 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Rita Jones', address = '400 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert and Debra McGanty', address = '2113 Blossom Hill Ct.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert and Lisa Venner', address = '589 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert and Martha Giovanelli', address = '109 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert and Sarh Pasey', address = '5708 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert Arbuckle', address = '2092 Jarvis Road', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert Braswell', address = '4304 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert Brimson', address = '1409 Drum Point Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert Clark', address = '1209 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert Delauney', address = '5745 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert Dixon', address = '1409 Public Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert Irizarry', address = '5925 Hattie Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert Martin', address = '2417 Three Oaks Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert Rohner', address = '609 Planters Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert Royer', address = '5980 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert Smith', address = '1652 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert Traugptt', address = '1880 Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert Vaughan', address = '2388 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robert West', address = '4192 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robin Craft', address = '1565 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Robin Morse', address = '1604 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Rochelle Griffin', address = '1382A Munden Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Rodney and Leona Cason', address = '594 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Rodney Budd', address = '1142 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ronald and Jo Robinson', address = '4820 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ronald Stillman', address = '1317 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Rory Carter', address = '1548 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Roxanne Snell', address = '337 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Roy Kingan', address = '4868 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Russell Baker', address = '1416 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Russell Harris', address = '2324 S. Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ruth Bell', address = '3981 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ruth Sawyer', address = '4720 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ryan Atwood', address = '940 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ryan McMichael', address = '644 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Samuel Baker', address = '344 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Samuel Kline', address = '5181 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Sara Henbree', address = '2080 Jarvis Road', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Sarah Tendoy', address = '1582 Munden Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Scot and Mary Beach', address = '673 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Scott and Patsy Mond', address = '5729 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Scott Howard', address = '1920 Claudia May', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Scott Liszeo', address = '886 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Scott Williams', address = '5441 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Shane Brezler', address = '1045 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Shane Gersley', address = '5628 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Sharon Link', address = '1876 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Shaun Gayhart', address = '1636 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Shawn Pouthier', address = '5716 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Shawn Pratt', address = '1933 Claudia May', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Shelby Etheridge', address = '4813 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Shelley Bruzler', address = '686 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Shelton Prince', address = '1624 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Sherri Hendrix', address = '541 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Shirley Fentress', address = '1908 Claudia May', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Shirley McChesney', address = '1901 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Shirley Murphy', address = '5657 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Shirley Saunders', address = '5161 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Shooting CC', address = '6025 Marvin Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Sidney Screws', address = '738 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Spencer Capps', address = '1585 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Stacey Byrum', address = '4912 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Stacey Gibbs', address = '1965 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Stanley Twiford', address = '5452 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Stanley Wilson', address = '4856 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Stephan Lesinski', address = '1672 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Stephen Riley', address = '1916 Claudia May', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Sterling Salmons', address = '4156 Gum Bridge Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Steve and Olive Butts', address = '1864 Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Steve Holloway', address = '5236 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Steve Salmons', address = '908 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Steve Shepard', address = '640 Planters Court', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Steve Wilson', address = '536 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Steven Brinkley', address = '4857 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Steven Clark', address = '1633 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Steven Gilman', address = '4933 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Steven Hund', address = '1916 Clifton Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Steven Johns', address = '5189 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Steven Kent', address = '129 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Steven Munden', address = '3864 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Steven Reiner', address = '4397 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Steven Townsend', address = '2092 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Sueann Colombo', address = '4497 Catfish Road', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Susan Backer', address = '2100 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Susan Coakley', address = '705 Carmel Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Susan Davis', address = '6348 Pocahontas Club Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Susan Etheridge', address = '4160 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Susan Wallace', address = '909 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Tammy Lewis', address = '2068 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ted Goranson', address = '1976 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Teddy Lindsay', address = '5677 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Terri Freeman', address = '5413 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Terri Morris', address = '1405 Public Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Theodore and Gayle Thieman', address = '1464 Campbells Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thersa Weatherly', address = '1977 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas and Carol Etheridge', address = '613 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas and Dena Kimball', address = '4316 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas and Marsha Allen', address = '4136 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas and Page Count', address = '1941 Claudia May', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas Baker', address = '2060 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas Bozard', address = '1717 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas Corso', address = '1584 Nanneys Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas Grygotis', address = '5720 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas Hayden', address = '2076 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas Johnson', address = '2108 Jarvis Road', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas Leavitt', address = '4117 Charity Farm Ct.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas Martin', address = '1725 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas Messer', address = '524 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas Shearer', address = '1913 Claudia May', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas Snider', address = '5717 Aura Drive', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas Wheeler', address = '1800 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Thomas Zimmerman', address = '1744 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Tim Lee', address = '1660 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Tim McNulty', address = '1016 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Timothy and Donna Nunneley', address = '1588 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Timothy Seibert', address = '1437 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Timothy Vann', address = '5509 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Todd Jones', address = '5917 Lettie Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Todd Martin', address = '4888 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Todd Shields', address = '893 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Todd Starkey', address = '1492 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Todd Whitesell', address = '5262 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Tom and Serena Conboy', address = '4848 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Tom and Susan Pittman', address = '725 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Tom Weikel', address = '4924 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Tommy Tatem', address = '1936 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Toni Morgan', address = '1501 Back Bay Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Tyler Greenwell', address = '1924 Munden Point Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Tyson Boeshe', address = '1301 Munden Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Va. Beach Airport', address = '1301 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Valerie Oyer', address = '4940 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Velma Cartwright', address = '4057 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Velma Martin', address = '1713 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Vernon and Linda Etheridge', address = '933 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Vernon Strawhand', address = '236 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Victor Watson', address = '2213 Vaughan Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'W.L. Richardson', address = '1229 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Wade Bell', address = '3957 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Walter and Sheila Hutts', address = '477 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Walter Logioco', address = '4317 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Walter Moore', address = '4016 Vaughan Town Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Walter Rowe', address = '5125 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Walter Tully', address = '5921 Lettie Street', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Wanda Elliott', address = '3888 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Ward Kromho', address = '4816 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Wayne Davis', address = '4073 Muddy Creek Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Wayne Gordon', address = '2176 Old Pungo Ferry Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Wayne Holloman', address = '5489 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Wayne McClain', address = '3832 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Wayne Schultz', address = '1396 Shipps Cabin Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Wesley Whitehurst', address = '1013 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Wilbur Carawan', address = '2416 Three Oaks Dr', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Wilcie Leonhardt', address = '4736 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Willard Parr', address = '240 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William and Janie Spence', address = '761 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William and Joni Greene', address = '1900 Landing Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William and Nancy Cosentino', address = '4112 Charity Farm Ct', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Ashton', address = '3861 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Bryant', address = '1929 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Buckman', address = '2072 Pefley Lane', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Crane', address = '5438 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Cromwell', address = '3993 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Fentress', address = '4120 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Ficke', address = '5532 Morris Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Gray', address = '1926 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Grimstead', address = '1561 Mill Landing Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Harper', address = '1577 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Harrill', address = '229 Princess Anne Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Kilian', address = '1933 Clifton Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Nielson', address = '4e09 Charity Neck Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Osborne', address = '3953 Dawley Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Seemuller', address = '5537 Fitztown Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Smith', address = '2265 Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Watson', address = '1413 Gum Bridge Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William White', address = '4313 Charity Neck Rd.', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'William Woods', address = '1265 Shipps Cabin Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Wilmer Aygarn', address = '2264 Stowe Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
insert ignore resident_import set name = 'Wilson Sawyer', address = '1900 Munden Point Rd', city = 'VIRGINIA BEACH', state = 'VA', agency = 'CVRS';
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
