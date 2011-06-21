using Class_db;
using MySql.Data.MySqlClient;
using System.Collections.Specialized;

namespace Class_db_user
  {
  public class TClass_db_user: TClass_db
    {

    public TClass_db_user() : base()
      {
      }

    public string[] RolesOf(string id)
      {
      var roles_of_string_collection = new StringCollection();
      Open();
      var dr = new MySqlCommand
        (
        "select name"
        + " from role"
        +   " join role_member_map on (role_member_map.role_id=role.id)"
        +   " join user_member_map on (user_member_map.member_id=role_member_map.member_id)"
        + " where user_member_map.user_id = '" + id + "'"
        +   " and not be_occasional"
        + " order by pecking_order",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        roles_of_string_collection.Add(dr["name"].ToString());
        }
      dr.Close();
      Close();
      var roles_of = new string[roles_of_string_collection.Count];
      roles_of_string_collection.CopyTo(roles_of,0);
      return roles_of;
      }

    } // end TClass_db_user

  }
