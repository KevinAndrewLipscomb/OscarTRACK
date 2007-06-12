START TRANSACTION;

insert notification
  set name = 'needs-enrollment-review';

insert role_notification_map
  set role_id = 6,
    notification_id =
      (select id from notification where name = 'needs-enrollment-review');

COMMIT;