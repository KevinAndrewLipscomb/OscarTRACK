START TRANSACTION;

ALTER TABLE `custom_model`
  DROP INDEX `name`,
  ADD UNIQUE INDEX `name` USING BTREE(`make_id`, `name`);

COMMIT