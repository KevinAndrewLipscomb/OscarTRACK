START TRANSACTION;
update member
  set first_name = upper(first_name),
    last_name = upper(last_name);
COMMIT;