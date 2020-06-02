SELECT last_name
, first_name
, cad_num
, email_address
, date
, CONCAT(uniform_priority.value,'-',layer,'-',uniform_class.short_designator,'-',uniform_piece.name) as piece
, uniform_piece_make.name as make
, uniform_piece_model.name as model
FROM uniform_issuance
  join member on (member.id=uniform_issuance.member_id)
  join uniform_catalog on (uniform_catalog.id=uniform_issuance.catalog_id)
  join uniform_piece_model on (uniform_piece_model.id=uniform_catalog.model_id)
  join uniform_piece_make on (uniform_piece_make.id=uniform_piece_model.make_id)
  join uniform_piece on (uniform_piece.id=uniform_catalog.piece_id)
  join uniform_priority on (uniform_priority.id=uniform_piece.priority_id)
  join uniform_class on (uniform_class.id=uniform_piece.class_id)
where uniform_piece.name like '%respirator%'
order by last_name, first_name, cad_num, date