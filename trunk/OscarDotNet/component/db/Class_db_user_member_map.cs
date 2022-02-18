using Class_db;
using Class_db_enrollment;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace Class_db_user_member_map
  {
  public class TClass_db_user_member_map: TClass_db
    {

    private static class Static
      {
      public const int CI_MEMBER_ID = 0;
      public const int CI_MEMBER_NAME = 1;
      public const int CI_FIRST_CROSSTAB = 2;
      }

    private readonly TClass_db_trail db_trail = null;

    public TClass_db_user_member_map() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public void BindActuals
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      k.int_sign_range filter
      )
      {
      var filter_clause = " where enrollment_level.pecking_order ";
      if (filter.val == -1)
        {
        filter_clause += ">=";
        }
      else if (filter.val == 1)
        {
        filter_clause += "<";
        }
      filter_clause += k.SPACE + TClass_db_enrollment.MIN_PAST_PECKING_ORDER;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select user.id as user_id"
        + " , user.username as user_name"
        + " , concat(member.last_name,', ',member.first_name) as member_name"
        + " , member.id as member_id"
        + " from user_member_map"
        +   " join member on (member.id=user_member_map.member_id)"
        +   " join user on (user.id=user_member_map.user_id)"
        +   " join enrollment_history on (enrollment_history.member_id=member.id and enrollment_history.end_date is null)"
        +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)"
        + (filter.val == 0 ? k.EMPTY : filter_clause)
        + " order by " + sort_order.Replace("%",be_sort_order_ascending ? " asc" : " desc"),
        connection
        );
      ((target) as GridView).DataSource = my_sql_command.ExecuteReader();
      ((target) as GridView).DataBind();
      Close();
      }

  public void Save(string member_id, string user_id, bool be_granted)
    {
    Open();
    if (be_granted)
      {
      using var my_sql_command = new MySqlCommand(db_trail.Saved("insert ignore user_member_map set member_id = '" + member_id + "', user_id = '" + user_id + "'"), connection);
      my_sql_command.ExecuteNonQuery();
      }
    else
      {
      using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from user_member_map where member_id = '" + member_id + "' and user_id = '" + user_id + "'"), connection);
      my_sql_command.ExecuteNonQuery();
      }
    Close();
    }

  } // end TClass_db_user_member_map

}
