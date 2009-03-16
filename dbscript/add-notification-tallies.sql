START TRANSACTION;

ALTER TABLE `notification`
  ADD COLUMN `tally_of_messages_for_cycle` INTEGER UNSIGNED NOT NULL DEFAULT 0,
  ADD COLUMN `tally_of_events_for_cycle` INTEGER UNSIGNED NOT NULL DEFAULT 0,
  ADD COLUMN `tally_of_messages_for_lifetime` INTEGER UNSIGNED NOT NULL DEFAULT 0,
  ADD COLUMN `tally_of_events_for_lifetime` INTEGER UNSIGNED NOT NULL DEFAULT 0,
  ADD COLUMN `activity_description` VARCHAR(63) NOT NULL DEFAULT "",
  ADD COLUMN `activity_pecking_order` INTEGER UNSIGNED NOT NULL DEFAULT 0;

UPDATE notification set activity_description = "member additions to database", activity_pecking_order = 100 where name = "member-added";
UPDATE notification set activity_description = "member name changes", activity_pecking_order = 120 where name = "member-name-change";
UPDATE notification set activity_description = "officer code (CAD number) changes", activity_pecking_order = 130 where name = "cad-num-change";
UPDATE notification set activity_description = "driver qualification changes", activity_pecking_order = 140 where name = "driver-qualification-change";
UPDATE notification set activity_description = "medical certification changes", activity_pecking_order = 150 where name = "medical-release-level-change";
UPDATE notification set activity_description = "membership status (enrollment level) changes", activity_pecking_order = 160 where name = "new-enrollment-level";
UPDATE notification set activity_description = "automatic seniority promotions", activity_pecking_order = 170 where name = "seniority-promotion";
UPDATE notification set activity_description = "leave-of-absences granted", activity_pecking_order = 180 where name = "leave-granted";
UPDATE notification set activity_description = "leave-of-absences modified", activity_pecking_order = 190 where name = "leave-modified";
UPDATE notification set activity_description = "leave-of-absences deleted", activity_pecking_order = 200 where name = "leave-deleted";
UPDATE notification set activity_description = "leave of absences ending soon", activity_pecking_order = 210 where name = "leave-ending-soon";
UPDATE notification set activity_description = "leave-of-absences expired", activity_pecking_order = 220 where name = "leave-expired";
UPDATE notification set activity_description = "squad section changes", activity_pecking_order = 230 where name = "section-change";
UPDATE notification set activity_description = "squad transfers", activity_pecking_order = 240 where name = "agency-change";
UPDATE notification set activity_description = "monthly squad-specific progress charts", activity_pecking_order = 250 where name = "report-monthly-per-agency-serial-indicators";
UPDATE notification set activity_description = "OscarTRACK role changes", activity_pecking_order = 260 where name = "role-change";
UPDATE notification set activity_description = "enrollment reviews needed", activity_pecking_order = 270 where name = "needs-enrollment-review";

COMMIT