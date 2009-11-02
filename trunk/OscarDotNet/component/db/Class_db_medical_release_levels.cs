using Class_db;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_medical_release_levels
{
    public static class Class_db_medical_release_levels_Static
    {
        public const int LOWEST_RELEASED_PECK_CODE = 20;
    } // end Class_db_medical_release_levels

    public class TClass_db_medical_release_levels: TClass_db
    {
        //Constructor  Create()
        public TClass_db_medical_release_levels() : base()
        {
            // TODO: Add any constructor code here

        }
        public bool BeValidForCurrentEnrollmentLevel(string code, string enrollment_level_description)
        {
            bool result;
            this.Open();
            result = "1" == new MySqlCommand("select" + " (" + " select TRUE" + " from enrollment_level" + " where description = \"" + enrollment_level_description + "\"" + " and core_ops_commitment_level_code = 1" + " )" + " or" + " (" + " select TRUE" + " from medical_release_code_description_map" + " where code = \"" + code + "\"" + " and pecking_order >= (select pecking_order from medical_release_code_description_map where description = \"Trainee\")" + " )", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public bool BeValidEnrollmentForCurrent(string enrollment_level_code, string description)
        {
            this.Open();
            var be_valid_enrollment_for_current = "1" == new MySqlCommand("select" + " (" + " select TRUE" + " from enrollment_level" + " where code = \"" + enrollment_level_code + "\"" + " and core_ops_commitment_level_code = 1" + " )" + " or" + " (" + " select TRUE" + " from medical_release_code_description_map" + " where description = '" + description + "'" + " and pecking_order >= (select pecking_order from medical_release_code_description_map where description = 'Trainee')" + " )", this.connection).ExecuteScalar().ToString();
            this.Close();
            return be_valid_enrollment_for_current;
        }

        public void BindListControl(object target)
        {
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            ((target) as ListControl).Items.Add(new ListItem("-- Select --", ""));
            dr = new MySqlCommand("SELECT code, description from medical_release_code_description_map where be_hereafter_valid order by pecking_order", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["description"].ToString(), dr["code"].ToString()));
            }
            dr.Close();
            this.Close();
        }

        public string DescriptionOf(string code)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select description from medical_release_code_description_map where code = " + code, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

    } // end TClass_db_medical_release_levels

}

