START TRANSACTION
;
ALTER TABLE `uniform_class` 
  ADD UNIQUE `agency_id_short_designator` (`agency_id` ASC, `short_designator` ASC)
,
  ADD UNIQUE `agency_id_long_designator` (`agency_id` ASC, `long_designator` ASC)
,
  DROP INDEX `id_2`
,
  DROP INDEX `id`
;
ALTER TABLE `uniform_class` ADD CONSTRAINT `uniform_class_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
;
ALTER TABLE `uniform_piece` 
  ADD UNIQUE `practical` (`agency_id` ASC, `priority_id` ASC, `layer` ASC, `class_id` ASC, `name` ASC)
,
  ADD INDEX `priority_id` (`priority_id` ASC)
,
  ADD INDEX `class_id` (`class_id` ASC)
,
  DROP INDEX `id_2`
,
  DROP INDEX `id`
;
ALTER TABLE `uniform_piece`
  ADD CONSTRAINT `uniform_piece_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
,
  ADD CONSTRAINT `uniform_piece_priority_id` FOREIGN KEY (`priority_id`) REFERENCES `uniform_priority` (`id`)
,
  ADD CONSTRAINT `uniform_piece_class_id` FOREIGN KEY (`class_id`) REFERENCES `uniform_class` (`id`)
;
ALTER TABLE `uniform_priority` 
  ADD UNIQUE `practical` (`agency_id` ASC, `value` ASC)
,
  DROP INDEX `id_2`
,
  DROP INDEX `id`
;
ALTER TABLE `uniform_priority` ADD CONSTRAINT `uniform_priority_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
;
ALTER TABLE `rank_group` 
  ADD UNIQUE `agency_id_name` (`agency_id` ASC, `name` ASC)
,
  ADD UNIQUE `agency_id_pecking_order` (`agency_id` ASC, `pecking_order` ASC)
,
  DROP INDEX `id_2`
,
  DROP INDEX `id` ;
ALTER TABLE `rank_group` ADD CONSTRAINT `rank_group_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
;
ALTER TABLE `uniform_option_category` 
  ADD UNIQUE `agency_id_name` (`agency_id` ASC, `name` ASC)
,
  DROP INDEX `id_2`
,
  DROP INDEX `id`
;
ALTER TABLE `uniform_option_category` ADD CONSTRAINT `uniform_option_category_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
;
ALTER TABLE `uniform_piece_vendor` 
  ADD UNIQUE `agency_id_name` (`agency_id` ASC, `name` ASC)
,
  DROP INDEX `id_2`
,
  DROP INDEX `id`
;
ALTER TABLE `uniform_piece_vendor` ADD CONSTRAINT `uniform_piece_vendor_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
;
ALTER TABLE `uniform_piece_make` 
  ADD UNIQUE `agency_id_name` (`agency_id` ASC, `name` ASC)
,
  DROP INDEX `id_2`
,
  DROP INDEX `id`
;
ALTER TABLE `uniform_piece_make` ADD CONSTRAINT `uniform_piece_make_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
;
ALTER TABLE `uniform_piece_model` 
  ADD UNIQUE `make_id_name` (`make_id` ASC, `name` ASC)
,
  DROP INDEX `id_2`
,
  DROP INDEX `id`
;
ALTER TABLE `uniform_piece_model` ADD CONSTRAINT `uniform_piece_model_make_id` FOREIGN KEY (`make_id`) REFERENCES `uniform_piece_make` (`id`)
;
ALTER TABLE `uniform_piece_color` 
  ADD UNIQUE `agency_id_name` (`agency_id` ASC, `name` ASC)
,
  DROP INDEX `id_2`
,
  DROP INDEX `id`
;
ALTER TABLE `uniform_piece_color` ADD CONSTRAINT `uniform_piece_color_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
;
ALTER TABLE `uniform_catalog` 
  ADD UNIQUE `piece_id` (`piece_id` ASC, `rank_group_id` ASC, `medical_release_code` ASC, `option_category_id` ASC, `be_male` ASC)
,
  ADD INDEX `rank_group_id` (`rank_group_id` ASC)
,
  ADD INDEX `medical_release_code` (`medical_release_code` ASC)
,
  ADD INDEX `option_category_id` (`option_category_id` ASC)
,
  ADD INDEX `vendor_id` (`vendor_id` ASC)
,
  ADD INDEX `model_id` (`model_id` ASC)
,
  ADD INDEX `base_color_id` (`base_color_id` ASC)
,
  ADD INDEX `trim_color_id` (`trim_color_id` ASC)
,
  ADD INDEX `metal_color_id` (`metal_color_id` ASC)
,
  DROP INDEX `id_2`
,
  DROP INDEX `id`
;
ALTER TABLE `uniform_catalog`
  ADD CONSTRAINT `uniform_catalog_piece_id` FOREIGN KEY (`piece_id`) REFERENCES `uniform_piece` (`id`)
,
  ADD CONSTRAINT `uniform_catalog_rank_group_id` FOREIGN KEY (`rank_group_id`) REFERENCES `rank_group` (`id`)
,
  ADD CONSTRAINT `uniform_catalog_medical_release_code` FOREIGN KEY (`medical_release_code`) REFERENCES `medical_release_code_description_map` (`code`)
,
  ADD CONSTRAINT `uniform_catalog_option_category_id` FOREIGN KEY (`option_category_id`) REFERENCES `uniform_option_category` (`id`)
,
  ADD CONSTRAINT `uniform_catalog_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `uniform_piece_vendor` (`id`)
,
  ADD CONSTRAINT `uniform_catalog_model_id` FOREIGN KEY (`model_id`) REFERENCES `uniform_piece_model` (`id`)
,
  ADD CONSTRAINT `uniform_catalog_base_color_id` FOREIGN KEY (`base_color_id`) REFERENCES `uniform_piece_color` (`id`)
,
  ADD CONSTRAINT `uniform_catalog_trim_color_id` FOREIGN KEY (`trim_color_id`) REFERENCES `uniform_piece_color` (`id`)
,
  ADD CONSTRAINT `uniform_catalog_metal_color_id` FOREIGN KEY (`metal_color_id`) REFERENCES `uniform_piece_color` (`id`)
;
ALTER TABLE `rank` 
  ADD UNIQUE `agency_id_name` (`agency_id` ASC, `name` ASC)
,
  ADD UNIQUE `agency_id_pecking_order` (`agency_id` ASC, `pecking_order` ASC)
,
  DROP INDEX `id_2`
,
  DROP INDEX `id`
;
ALTER TABLE `rank` ADD CONSTRAINT `rank_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
;
COMMIT
