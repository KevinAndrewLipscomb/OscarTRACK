using MySql.Data.MySqlClient;
using kix;
using System;


using System.Web.UI.WebControls;
using Class_db;

namespace Class_db_tiers
{
    public class TClass_db_tiers: TClass_db
    {
        //Constructor  Create()
        public TClass_db_tiers() : base()
        {
            // TODO: Add any constructor code here

        }
        public void BindListControl(object target, string unselected_literal, string selected_id)
        {
            MySqlDataReader dr;
            Open();
            ((target) as ListControl).Items.Clear();
            if (unselected_literal != k.EMPTY)
            {
                ((target) as ListControl).Items.Add(new ListItem(unselected_literal, ""));
            }
            using var my_sql_command = new MySqlCommand("SELECT id,name from tier order by id", connection);
            dr = my_sql_command.ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["name"].ToString(), dr["id"].ToString()));
            }
            dr.Close();
            if (selected_id != k.EMPTY)
            {
                ((target) as ListControl).SelectedValue = selected_id;
            }
            Close();
        }

        public void BindListControl(object target, string unselected_literal)
        {
            BindListControl(target, unselected_literal, "");
        }

        public string IdOfName(string name)
        {
            string result;
            Open();
            using var my_sql_command = new MySqlCommand("select id from tier where name = \"" + name + "\"", connection);
            result = my_sql_command.ExecuteScalar().ToString();
            Close();
            return result;
        }

        public string NameOfId(string id)
        {
            string result;
            Open();
            using var my_sql_command = new MySqlCommand("select name from tier where id = \"" + id + "\"", connection);
            result = my_sql_command.ExecuteScalar().ToString();
            Close();
            return result;
        }

    } // end TClass_db_tiers

}
