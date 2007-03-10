ALTER TABLE member
  ADD COLUMN section_num TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  ADD INDEX section_num (section_num);
