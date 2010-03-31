START TRANSACTION;

ALTER TABLE `resident`
  MODIFY COLUMN `agency` ENUM('KVRS','PVRS','DCVRS','PACHVRS') NOT NULL DEFAULT 'KVRS',
  ADD PRIMARY KEY (`id`);

delete from `user`
where name = "Kala DiCiero";

ALTER TABLE `resident`
  ENGINE = InnoDB
  CHARACTER SET ascii COLLATE ascii_general_ci;

ALTER TABLE `donation`
  ENGINE = InnoDB
  CHARACTER SET ascii COLLATE ascii_general_ci;

delete FROM donation
where id not in (select id from resident);

ALTER TABLE `donation`
  ADD CONSTRAINT `donation_id_resident_id` FOREIGN KEY `donation_id_resident_id` (`id`) REFERENCES `resident` (`id`)
    on delete cascade;

COMMIT