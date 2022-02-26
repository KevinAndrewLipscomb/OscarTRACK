using Class_db;
using kix;
using MySql.Data.MySqlClient;
using System.Text;
using System.Web.UI.WebControls;

namespace Class_db_privileges
  {
  public class TClass_db_privileges: TClass_db
    {
        public TClass_db_privileges() : base()
        {
        }

    public bool Bind
      (
      string partial_name,
      object target,
      string member_id = k.EMPTY
      )
      {
      var sql = new StringBuilder("SELECT DISTINCT name FROM privilege");
      if (member_id.Length > 0)
        {
        sql.Append(" join role_privilege_map on (role_privilege_map.privilege_id=privilege.id) join role_member_map on (role_member_map.role_id=role_privilege_map.role_id and role_member_map.member_id = '" + member_id + "')");
        }
      sql.Append(" WHERE name like '" + partial_name + "%' order by name");
      //
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand(sql.ToString(),connection);
      using var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["name"].ToString(), dr["name"].ToString()));
        }
      dr.Close();
      Close();
      return ((target) as ListControl).Items.Count > 0;
      }

        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            MySqlDataReader dr;
            ((target) as ListControl).Items.Clear();
            if (unselected_literal.Length > 0)
            {
                ((target) as ListControl).Items.Add(new ListItem(unselected_literal, k.EMPTY));
            }
            Open();
            using var my_sql_command = new MySqlCommand("select privilege.id as privilege_id" + " , name as privilege_name" + " from privilege" + " order by privilege_name", connection);
            dr = my_sql_command.ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["privilege_name"].ToString(), dr["privilege_id"].ToString()));
            }
            dr.Close();
            Close();
            if (selected_value.Length > 0)
            {
                ((target) as ListControl).SelectedValue = selected_value;
            }

        }

        public void BindDirectToListControl(object target)
        {
            BindDirectToListControl(target, "-- Privilege --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, k.EMPTY);
        }

    public bool Get(string name)
      {
      var result = false;
      Open();
      using var my_sql_command = new MySqlCommand("select * from privilege where CAST(name AS CHAR) = '" + name + "'", connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        name = dr["name"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    internal bool HasForAnySpecialAgency
      (
      string member_id,
      string privilege_name
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select 1"
        + " from member"
        +   " join special_role_member_map on (special_role_member_map.member_id=member.id)"
        +   " join role on (role.id=special_role_member_map.role_id)"
        +   " join role_privilege_map on (role_privilege_map.role_id=role.id)"
        +   " join privilege on (privilege.id=role_privilege_map.privilege_id)"
        + " where member.id = '" + member_id + "'"
        +   " and privilege.name = '" + privilege_name + "'",
        connection
        );
      var has_for_special_agency_obj = my_sql_command.ExecuteScalar();
      Close();
      return (has_for_special_agency_obj != null);
      }

    internal bool HasForSpecialAgency
      (
      string member_id,
      string privilege_name,
      string agency_id
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select 1"
        + " from member"
        +   " join special_role_member_map on (special_role_member_map.member_id=member.id)"
        +   " join role on (role.id=special_role_member_map.role_id)"
        +   " join role_privilege_map on (role_privilege_map.role_id=role.id)"
        +   " join privilege on (privilege.id=role_privilege_map.privilege_id)"
        + " where member.id = '" + member_id + "'"
        +   " and privilege.name = '" + privilege_name + "'"
        +   " and (special_role_member_map.agency_id = '" + agency_id + "')",
        connection
        );
      var has_for_special_agency_obj = my_sql_command.ExecuteScalar();
      Close();
      return (has_for_special_agency_obj != null);
      }

    } // end TClass_db_privileges

}
