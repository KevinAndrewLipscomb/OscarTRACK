using MySql.Data.MySqlClient;
using System;

using Class_db;
using Class_db_trail;

namespace Class_db_milestones
{
    public class TClass_db_milestones: TClass_db
    {
        private readonly TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_milestones() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }
        public void Check(uint code, out bool be_processed, out DateTime value)
        {
            MySqlDataReader dr;
            Open();
            // + biz_fiscal_years.IdOfCurrent
            using var my_sql_command = new MySqlCommand("select be_processed,value" + " from fy_calendar" + " where fiscal_year_id = " + " and milestone_code = " + code.ToString(), connection);
            dr = my_sql_command.ExecuteReader();
            dr.Read();
            be_processed = (dr["be_processed"].ToString() == "1");
            value = DateTime.Parse(dr["value"].ToString());
            dr.Close();
            Close();
        }

        public void MarkProcessed(uint code)
        {
            string cmdText;
            // + biz_fiscal_years.IdOfCurrent
            cmdText = "update fy_calendar" + " set be_processed = TRUE" + " where fiscal_year_id = " + " and milestone_code = " + code.ToString();
            Open();
            using var my_sql_command = new MySqlCommand(db_trail.Saved(cmdText), connection);
            my_sql_command.ExecuteNonQuery();
            Close();
        }

    } // end TClass_db_milestones

}
