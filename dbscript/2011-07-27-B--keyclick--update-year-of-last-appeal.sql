START TRANSACTION
;
update resident_base
set year_of_last_appeal_to_become_a_donor = "2011"
where year_of_last_appeal_to_become_a_donor = "2008"
;
COMMIT