START TRANSACTION
;
insert ignore agency (id,short_designator,medium_designator,long_designator,be_ems_post) values
(701,"SE1","Special Event 1","Special Event #1",1),
(702,"SE2","Special Event 2","Special Event #2",1),
(703,"SE3","Special Event 3","Special Event #3",1),
(704,"SE4","Special Event 4","Special Event #4",1)
;
COMMIT
