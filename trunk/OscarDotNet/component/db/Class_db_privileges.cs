using MySql.Data.MySqlClient;
using kix;
using System;

using System.Web.UI.WebControls;
using Class_db;
using Class_db_trail;
namespace Class_db_privileges
{
    public class TClass_db_privileges: TClass_db
    {
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_privileges() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }
        public bool Bind(string partial_name, object target)
        {
            bool result;
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            dr = new MySqlCommand("SELECT name FROM privilege WHERE name like \"" + partial_name + "%\" order by name", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["name"].ToString(), dr["name"].ToString()));
            }
            dr.Close();
            this.Close();
            result = ((target) as ListControl).Items.Count > 0;
            return result;
        }

        public void BindDirectToListControl(object target, string unselected_literal, string selected_value)
        {
            MySqlDataReader dr;
            ((target) as ListControl).Items.Clear();
            if (unselected_literal != k.EMPTY)
            {
                ((target) as ListControl).Items.Add(new ListItem(unselected_literal, k.EMPTY));
            }
            this.Open();
            dr = new MySqlCommand("select privilege.id as privilege_id" + " , name as privilege_name" + " from privilege" + " order by privilege_name", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["privilege_name"].ToString(), dr["privilege_id"].ToString()));
            }
            dr.Close();
            this.Close();
            if (selected_value != k.EMPTY)
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

        public bool Get(string name, out string soft_hyphenation_text)
        {
            bool result;
            MySqlDataReader dr;

            soft_hyphenation_text = k.EMPTY;
            result = false;
            this.Open();
            dr = new MySqlCommand("select * from privilege where CAST(name AS CHAR) = \"" + name + "\"", this.connection).ExecuteReader();
            if (dr.Read())
            {
                name = dr["name"].ToString();
                soft_hyphenation_text = dr["soft_hyphenation_text"].ToString();
                result = true;
            }
            dr.Close();
            this.Close();
            return result;
        }

    internal bool HasForSpecialAgency
      (
      string member_id,
      string privilege_name,
      string agency_id
      )
      {
      Open();
      var has_for_special_agency_obj = new MySqlCommand
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
        )
        .ExecuteScalar();
      Close();
      return (has_for_special_agency_obj != null);
      }

    } // end TClass_db_privileges

}
