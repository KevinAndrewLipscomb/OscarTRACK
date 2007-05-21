update member
  join user_member_map on (user_member_map.member_id=member.id)
  join user on (user.id=user_member_map.user_id)
  set email_address = password_reset_email_address;