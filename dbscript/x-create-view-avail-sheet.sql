START TRANSACTION
;
create view avail_sheet as
select * from oscar_x.avail_sheet
;
COMMIT