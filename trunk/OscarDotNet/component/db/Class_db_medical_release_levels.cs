using Class_db;
using MySql.Data.MySqlClient;
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

    public bool BeValidForCurrentEnrollmentLevel
      (
      string code,
      string enrollment_level_description
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select"
        + " ("
        + " select TRUE"
        + " from enrollment_level"
        + " where description = '" + enrollment_level_description + "'"
        +   " and core_ops_commitment_level_code = 1"
        + " )"
        + " or"
        + " ("
        + " select TRUE"
        + " from medical_release_code_description_map"
        + " where code = '" + code + "'"
        +   " and pecking_order >= (select pecking_order from medical_release_code_description_map where description = 'BLS Intern')"
        + " )",
        connection
        );
      var result = "1" == my_sql_command.ExecuteScalar().ToString();
      Close();
      return result;
      }

        internal void BindBaseDataList(object target)
          {
          Open();
          using var my_sql_command = new MySqlCommand
            (
            "select watchbill_rendition"
            + " , description"
            + " from medical_release_code_description_map"
            + " where be_hereafter_valid"
            + " order by pecking_order desc",
            connection
            );
          (target as BaseDataList).DataSource = my_sql_command.ExecuteReader();
          (target as BaseDataList).DataBind();
          ((target as BaseDataList).DataSource as MySqlDataReader).Close();
          Close();
          }

        public void BindListControl(object target)
        {
            MySqlDataReader dr;
            Open();
            ((target) as ListControl).Items.Clear();
            ((target) as ListControl).Items.Add(new ListItem("-- Select --", ""));
            using var my_sql_command = new MySqlCommand("SELECT code, description from medical_release_code_description_map where be_hereafter_valid order by pecking_order", connection);
            dr = my_sql_command.ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["description"].ToString(), dr["code"].ToString()));
            }
            dr.Close();
            Close();
        }

        public string DescriptionOf(string code)
        {
            string result;
            Open();
            using var my_sql_command = new MySqlCommand("select description from medical_release_code_description_map where code = " + code, connection);
            result = my_sql_command.ExecuteScalar().ToString();
            Close();
            return result;
        }

        internal string PeckCodeOf(string level_code)
          {
          Open();
          using var my_sql_command = new MySqlCommand("select pecking_order from medical_release_code_description_map where code = '" + level_code + "'",connection);
          var peck_code_of = my_sql_command.ExecuteScalar().ToString();
          Close();
          return peck_code_of;
          }

        internal int PeckingOrderCompareTo
          (
          string description_x,
          string description_y
          )
          {
          Open();
          using var my_sql_command_x = new MySqlCommand("select pecking_order from medical_release_code_description_map where description = '" + description_x + "'",connection);
          using var my_sql_command_y = new MySqlCommand("select pecking_order from medical_release_code_description_map where description = '" + description_y + "'",connection);
          var pecking_order_compare_to = int.Parse(my_sql_command_x.ExecuteScalar().ToString()).CompareTo(int.Parse(my_sql_command_y.ExecuteScalar().ToString()));
          Close();
          return pecking_order_compare_to;
          }

    } // end TClass_db_medical_release_levels

}
