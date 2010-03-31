START TRANSACTION;

ALTER TABLE `resident`
  MODIFY COLUMN `agency` ENUM('KVRS','PVRS','DCVRS') NOT NULL DEFAULT 'KVRS';

update resident
set agency = 'PVRS'
where name = "TO OUR NEIGHBORS AT"
  and
    (
      (zip >= "23453-1600" and zip <= "23453-9999")
    or
      (zip >= "23462-4856" and zip <= "23462-4912")
    or
      (zip >= "23462-5200" and zip <= "23462-5267")
    );

update resident
set agency = 'DCVRS'
where name = "TO OUR NEIGHBORS AT"
  and
    (
      (zip = "23462-1673")
    or
      (zip = "23462-1802")
    or
      (zip = "23462-1820")
    or
      (zip = "23462-1835")
    or
      (zip >= "23462-1859" and zip <= "23462-1867")
    or
      (zip >= "23462-1910" and zip <= "23462-1937")
    or
      (zip = "23462-2017")
    or
      (zip >= "23462-2020" and zip <= "23462-2399")
    or
      (zip >= "23462-2600" and zip <= "23462-2609")
    or
      (zip >= "23462-2626" and zip <= "23462-2702")
    or
      (zip = "23462-2716")
    or
      (zip >= "23462-5611" and zip <= "23462-5614")
    or
      (zip = "23462-5619")
    or
      (zip = "23462-7102")
    or
      (zip = "23462-7119")
    or
      (zip >= "23462-7802" and zip <= "23462-7832")
    );

COMMIT