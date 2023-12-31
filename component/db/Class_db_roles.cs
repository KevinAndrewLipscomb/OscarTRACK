using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_roles
{
    internal struct crosstab_metadata_rec_type
    {
        public uint index;
        public string sql_name;
        public string id;
        public string natural_text;
        public string soft_hyphenation_text;
        public string tier_id;
    }

    public class TClass_db_roles: TClass_db
    {

        private readonly TClass_db_trail db_trail = null;

        public TClass_db_roles() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }

        internal bool BePeckingOrderAtLeast
          (
          string subject_name,
          string object_name
          )
          {
          Open();
          using var my_sql_command = new MySqlCommand
            ("select IF((select pecking_order from role where name = '" + subject_name + "') <= (select pecking_order from role where name = '" + object_name + "'),1,0)",connection);
          var be_pecking_order_at_least = "1" == my_sql_command.ExecuteScalar().ToString();
          Close();
          return be_pecking_order_at_least;
          }

        public bool Bind(string partial_name, object target)
        {
            bool result;
            MySqlDataReader dr;
            Open();
            ((target) as ListControl).Items.Clear();
            using var my_sql_command = new MySqlCommand("SELECT name FROM role WHERE name like \"" + partial_name + "%\" order by pecking_order", connection);
            dr = my_sql_command.ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["name"].ToString(), dr["name"].ToString()));
            }
            dr.Close();
            Close();
            result = ((target) as ListControl).Items.Count > 0;
            return result;
        }

        public void BindDirectToListControl(object target, bool has_config_roles_and_matrices, string tier_quoted_value_list, string unselected_literal, string selected_value)
        {
            MySqlDataReader dr;
            string where_clause;
            ((target) as ListControl).Items.Clear();
            if (unselected_literal.Length > 0)
            {
                ((target) as ListControl).Items.Add(new ListItem(unselected_literal, k.EMPTY));
            }
            where_clause = " where name <> \"Member\"";
            if (tier_quoted_value_list != k.DOUBLE_QUOTE)
            {
                where_clause += " and (tier_id in (" + tier_quoted_value_list + "))";
            }
            if (!has_config_roles_and_matrices)
            {
                where_clause += " and (name <> \"Application Administrator\")";
            }
            Open();
            using var my_sql_command = new MySqlCommand("SELECT id,name FROM role" + where_clause + " order by pecking_order", connection);
            dr = my_sql_command.ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["name"].ToString(), dr["id"].ToString()));
            }
            dr.Close();
            Close();
            if (selected_value.Length > 0)
            {
                ((target) as ListControl).SelectedValue = selected_value;
            }

        }

        public void BindDirectToListControl(object target, bool has_config_roles_and_matrices)
        {
            BindDirectToListControl(target, has_config_roles_and_matrices, k.DOUBLE_QUOTE);
        }

        public void BindDirectToListControl(object target, bool has_config_roles_and_matrices, string tier_quoted_value_list)
        {
            BindDirectToListControl(target, has_config_roles_and_matrices, tier_quoted_value_list, "-- Role --");
        }

        public void BindDirectToListControl(object target, bool has_config_roles_and_matrices, string tier_quoted_value_list, string unselected_literal)
        {
            BindDirectToListControl(target, has_config_roles_and_matrices, tier_quoted_value_list, unselected_literal, k.EMPTY);
        }

        public bool Delete(string name)
        {
            bool result;
            result = true;
            Open();
            try {
                using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from role where name = \"" + name + "\""), connection);
                my_sql_command.ExecuteNonQuery();
            }
            catch(System.Exception e) {
                if (e.Message.StartsWith("Cannot delete or update a parent row: a foreign key constraint fails", true, null))
                {
                    result = false;
                }
                else
                {
                    throw;
                }
            }
            Close();
            return result;
        }

        public bool Get
          (
          string name,
          out string tier_id,
          out string pecking_order,
          out bool be_occasional
          )
          {
          tier_id = k.EMPTY;
          pecking_order = k.EMPTY;
          be_occasional = false;
          var result = false;
          Open();
          using var my_sql_command = new MySqlCommand("select * from role where CAST(name AS CHAR) = '" + name + "'", connection);
          var dr = my_sql_command.ExecuteReader();
          if (dr.Read())
            {
            name = dr["name"].ToString();
            tier_id = dr["tier_id"].ToString();
            pecking_order = dr["pecking_order"].ToString();
            be_occasional = (dr["be_occasional"].ToString() == "1");
            result = true;
            }
          dr.Close();
          Close();
          return result;
          }

        public string NameOfId(string id)
        {
            string result;
            Open();
            using var my_sql_command = new MySqlCommand("select name from role where id = \"" + id + "\"", connection);
            result = my_sql_command.ExecuteScalar().ToString();
            Close();
            return result;
        }

        public void Set
          (
          string name,
          string tier_id,
          string pecking_order,
          bool be_occasional
          )
          {
          var childless_field_assignments_clause = " tier_id = NULLIF('" + tier_id + "','')"
          + " , pecking_order = NULLIF('" + pecking_order + "','')"
          + " , be_occasional = " + be_occasional.ToString();
          Open();
          using var my_sql_command = new MySqlCommand
            (
            db_trail.Saved
              (
              "insert role"
              + " set name = NULLIF('" + name + "','')"
              + " , " + childless_field_assignments_clause
              + " on duplicate key update "
              + childless_field_assignments_clause
              ),
            connection
            );
          my_sql_command.ExecuteNonQuery();
          Close();
          }

        public string TierOfId(string id)
        {
            string result;
            Open();
            using var my_sql_command = new MySqlCommand("select tier_id from role where id = \"" + id + "\"", connection);
            result = my_sql_command.ExecuteScalar().ToString();
            Close();
            return result;
        }

        internal string TierOfName(string name)
          {
          const string LOWEST_POSSIBLE_TIER_STRING = "255";
          Open();
          using var my_sql_command = new MySqlCommand("select IFNULL(tier_id," + LOWEST_POSSIBLE_TIER_STRING + ") as tier_id from role where name = '" + name + "'",connection);
          var tier_of_name_obj = my_sql_command.ExecuteScalar().ToString();
          Close();
          return (tier_of_name_obj == null ? LOWEST_POSSIBLE_TIER_STRING : tier_of_name_obj.ToString());
          }

    } // end TClass_db_roles

}
