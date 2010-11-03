using MySql.Data.MySqlClient;
using kix;
using System;

using System.Web.UI.WebControls;
using Class_dbkeyclick;
using Class_dbkeyclick_trail;
namespace Class_db_states
{
    public class TClass_db_states: TClass_dbkeyclick
    {
        private TClass_dbkeyclick_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_states() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_dbkeyclick_trail();
        }
        public bool Bind(string partial_spec, object target)
        {
            bool result;
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            dr = new MySqlCommand("SELECT id" + " , abbreviation" + " FROM state" + " WHERE abbreviation like \"%" + partial_spec + "%\"" + " order by abbreviation", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["id"].ToString() + k.SPACE_HYPHENS_SPACE + dr["abbreviation"].ToString(), dr["id"].ToString()));
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
            dr = new MySqlCommand("SELECT id,abbreviation FROM state where abbreviation <> \"(none specified)\" order by id", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["abbreviation"].ToString(), dr["id"].ToString()));
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
            BindDirectToListControl(target, "-- court kind --");
        }

        public void BindDirectToListControl(object target, string unselected_literal)
        {
            BindDirectToListControl(target, unselected_literal, k.EMPTY);
        }

        public bool Delete(string id)
        {
            bool result;
            result = true;
            this.Open();
            try {
                new MySqlCommand(db_trail.Saved("delete from state where id = " + id), this.connection).ExecuteNonQuery();
            }
            catch(System.Exception e) {
                if (e.Message.StartsWith("Cannot delete or update a parent row: a foreign key constraint fails", true, null))
                {
                    result = false;
                }
                else
                {
                    throw e;
                }
            }
            this.Close();
            return result;
        }

        public bool Get(string id, out string abbreviation)
        {
            bool result;
            MySqlDataReader dr;

            abbreviation = k.EMPTY;
            result = false;
            this.Open();
            dr = new MySqlCommand("select abbreviation from state where id = \"" + id + "\"", this.connection).ExecuteReader();
            if (dr.Read())
            {
                abbreviation = dr["abbreviation"].ToString();
                result = true;
            }
            dr.Close();
            this.Close();
            return result;
        }

        public void Set(string id, string abbreviation)
        {
            string childless_field_assignments_clause;
            childless_field_assignments_clause = "abbreviation = \"" + abbreviation.ToUpper() + "\"";
            this.Open();
            new MySqlCommand(db_trail.Saved("insert state" + " set id = NULLIF(\"" + id + "\",\"\")" + " , " + childless_field_assignments_clause + " on duplicate key update " + childless_field_assignments_clause), this.connection).ExecuteNonQuery();
            this.Close();

        }

    } // end TClass_db_states

}
