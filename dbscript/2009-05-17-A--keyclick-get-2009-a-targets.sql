select id,name,address1,city,state,zip
from resident
where
    (
      name <> "TO OUR NEIGHBORS AT"
    or
      id >= 37000
    )
  and
    agency = "KVRS";