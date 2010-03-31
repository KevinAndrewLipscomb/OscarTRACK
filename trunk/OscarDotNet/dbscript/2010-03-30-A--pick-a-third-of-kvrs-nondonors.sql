update resident
set year_of_last_appeal_to_become_a_donor = 2010
where agency = "KVRS"
  and year_of_last_appeal_to_become_a_donor is not null
  and year_of_last_appeal_to_become_a_donor <> 2009
order by id
limit 13404