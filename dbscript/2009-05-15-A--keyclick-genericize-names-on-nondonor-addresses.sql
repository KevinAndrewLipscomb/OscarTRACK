START TRANSACTION;

update resident
set name = "TO OUR NEIGHBORS AT"
where id in
  (
  select id from
    (
    SELECT id, max( date ) AS max_date
    FROM resident
    LEFT JOIN donation
    USING ( id )
    WHERE id >0
      and name not like "%*%MEM*%"
    GROUP BY id
    HAVING (max_date < "2006-01-01") or (max_date is null)
    ) m
  );

COMMIT