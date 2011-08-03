SELECT distinct id
, IFNULL(name,"CURRENT RESIDENT")
, address1
, city
, state
FROM `keyclick`.`donation`
  join resident using (id)
where date > "2011-05-15"
order by amount desc, date
limit 500