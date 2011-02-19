START TRANSACTION
;
create view avail_sheet as
select * from oscar_d.avail_sheet
;
COMMIT