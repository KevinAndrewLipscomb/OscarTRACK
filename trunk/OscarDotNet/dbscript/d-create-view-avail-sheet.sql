START TRANSACTION
;
drop view if exists avail_sheet
;
create view avail_sheet as
select * from oscar_d.avail_sheet
;
COMMIT