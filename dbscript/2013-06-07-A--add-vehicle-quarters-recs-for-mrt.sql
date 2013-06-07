START TRANSACTION
;
insert ignore vehicle_quarters (medium_designator,long_designator,pecking_order) values
("Back Bay Landing","Princess Anne Wildlife Management Area, Back Bay Landing Rd",20500),
("Indian Cove","Indian Cove",20600),
("Long Bay Pointe Marina","Long Bay Pointe Marina",20700),
("312 Winston Salem Ave","312 Winston Salem Ave",20800)
;
COMMIT