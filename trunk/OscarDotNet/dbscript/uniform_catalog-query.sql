select agency.short_designator
, uniform_priority.value as priority
, uniform_priority.description
, uniform_piece.layer
, uniform_class.short_designator as class_short
, uniform_class.long_designator as class_long
, uniform_piece.name as piece_name
, uniform_piece.authorized_quantity
, be_branded
, be_size_dependent
, be_specific_rank_dependent
, be_extra_individualized
, rank_group.name, rank_group.pecking_order
, medical_release_code_description_map.description
, uniform_option_category.name
, be_male
, uniform_piece_vendor.name
, uniform_piece_make.name
, uniform_piece_model.name
, base_color.name
, metal_color.name
, base_color.name
, instruction_to_vendor
, elaboration
, unit_cost
from uniform_catalog
  left join uniform_piece on (uniform_piece.id=uniform_catalog.piece_id)
  left join agency on (agency.id=uniform_piece.agency_id)
  left join uniform_priority on (uniform_priority.id=uniform_piece.priority_id)
  left join uniform_class on (uniform_class.id=uniform_piece.class_id)
  left join rank_group on (rank_group.id=uniform_catalog.rank_group_id)
  left join medical_release_code_description_map on (medical_release_code_description_map.code=uniform_catalog.medical_release_code)
  left join uniform_option_category on (uniform_option_category.id=uniform_catalog.option_category_id)
  left join uniform_piece_vendor on (uniform_piece_vendor.id=uniform_catalog.vendor_id)
  left join uniform_piece_model on (uniform_piece_model.id=uniform_catalog.model_id)
  left join uniform_piece_make on (uniform_piece_make.id=uniform_piece_model.make_id)
  left join uniform_piece_color base_color on (base_color.id=uniform_catalog.base_color_id)
  left join uniform_piece_color trim_color on (trim_color.id=uniform_catalog.trim_color_id)
  left join uniform_piece_color metal_color on (metal_color.id=uniform_catalog.metal_color_id)
order by priority, layer, class_short desc, piece_name
