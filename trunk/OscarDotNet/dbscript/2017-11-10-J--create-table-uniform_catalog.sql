DROP TABLE IF EXISTS uniform_catalog;
CREATE TABLE IF NOT EXISTS uniform_catalog (
  id SERIAL,
  piece_id BIGINT UNSIGNED NOT NULL,
  be_branded BOOLEAN NOT NULL,
  be_size_dependent BOOLEAN NOT NULL,
  be_specific_rank_dependent BOOLEAN NOT NULL,
  be_extra_individualized BOOLEAN NOT NULL,
  rank_group_id BIGINT UNSIGNED,
  medical_release_code TINYINT UNSIGNED,
  option_category_id BIGINT UNSIGNED,
  be_male BOOLEAN,
  vendor_id BIGINT UNSIGNED NOT NULL,
  model_id BIGINT UNSIGNED NOT NULL,
  base_color_id BIGINT UNSIGNED,
  trim_color_id BIGINT UNSIGNED,
  metal_color_id BIGINT UNSIGNED,
  instruction_to_vendor VARCHAR(2046),
  elaboration VARCHAR(1022),
  unit_cost DECIMAL(10,2) UNSIGNED NOT NULL,
  PRIMARY KEY(id),
  UNIQUE (id)
)
ENGINE = InnoDB;
