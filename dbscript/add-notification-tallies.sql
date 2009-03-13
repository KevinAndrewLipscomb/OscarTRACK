START TRANSACTION;

ALTER TABLE `notification`
  ADD COLUMN `tally_of_messages_for_cycle` INTEGER UNSIGNED NOT NULL DEFAULT 0,
  ADD COLUMN `tally_of_events_for_cycle` INTEGER UNSIGNED NOT NULL DEFAULT 0,
  ADD COLUMN `tally_of_messages_for_lifetime` INTEGER UNSIGNED NOT NULL DEFAULT 0,
  ADD COLUMN `tally_of_events_for_lifetime` INTEGER UNSIGNED NOT NULL DEFAULT 0;

COMMIT