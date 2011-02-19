START TRANSACTION
;
update avail_sheet
set odnmid = (select id from member where member.last_name = avail_sheet.last_name and member.first_name = avail_sheet.first_name)
where odnmid is null
;
COMMIT