START TRANSACTION;

update enrollment_level
set elaboration = concat(elaboration,'  If the member could have covered their remaining scheduled duties but opted not to, use "Dismissed".')
where description = "Resigned";

update enrollment_level
set elaboration = concat(elaboration,', or left without covering their remaining scheduled duties')
where description = "Dismissed";

COMMIT