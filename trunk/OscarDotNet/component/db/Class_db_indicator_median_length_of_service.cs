using MySql.Data.MySqlClient;
using System;

using System.Web.UI.WebControls;
using Class_db;
using Class_db_trail;
namespace Class_db_indicator_median_length_of_service
{
    public class TClass_db_indicator_median_length_of_service: TClass_db
    {
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_indicator_median_length_of_service() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }
        public void BindLatestRankedYearsOfService(object target, bool be_trendable)
        {
            MySqlTransaction transaction;
            this.Open();
            transaction = this.connection.BeginTransaction();
            try {
                ((target) as DataGrid).DataSource = new MySqlCommand("select NULL as rank" + " , concat(medium_designator,\" - \",long_designator) as agency" + " , m" + " from indicator_median_length_of_service" + " join agency on (agency.id=indicator_median_length_of_service.agency_id)" + " where be_trendable = " + be_trendable.ToString() + " and year = YEAR(CURDATE())" + " and month = MONTH(CURDATE())" + " and be_agency_id_applicable = TRUE" + " order by m desc", this.connection, transaction).ExecuteReader();
                ((target) as DataGrid).DataBind();
                ((MySqlDataReader)(((target) as DataGrid).DataSource)).Close();
                if (be_trendable)
                {
                    new MySqlCommand("delete from indicator_median_length_of_service where not be_trendable", this.connection, transaction).ExecuteNonQuery();
                }
                transaction.Commit();
            }
            catch {
                transaction.Rollback();
            }
            this.Close();

        }

        public void Log(bool be_trendable, decimal citywide_median, decimal ems_median, decimal r01_median, decimal r02_median, decimal r04_median, decimal r05_median, decimal r06_median, decimal r09_median, decimal r13_median, decimal r14_median, decimal r16_median, decimal r17_median)
        {
            string sql;
            sql = "START TRANSACTION" + ";" + " replace indicator_median_length_of_service" + " set be_trendable = " + be_trendable.ToString() + " , year = YEAR(CURDATE())" + " , month = MONTH(CURDATE())" + " , be_agency_id_applicable = FALSE" + " , m = " + citywide_median.ToString() + ";" + " replace indicator_median_length_of_service" + " set be_trendable = " + be_trendable.ToString() + " , year = YEAR(CURDATE())" + " , month = MONTH(CURDATE())" + " , be_agency_id_applicable = TRUE" + " , agency_id = 0" + " , m = " + ems_median.ToString() + ";" + " replace indicator_median_length_of_service" + " set be_trendable = " + be_trendable.ToString() + " , year = YEAR(CURDATE())" + " , month = MONTH(CURDATE())" + " , be_agency_id_applicable = TRUE" + " , agency_id = 1" + " , m = " + r01_median.ToString() + ";" + " replace indicator_median_length_of_service" + " set be_trendable = " + be_trendable.ToString() + " , year = YEAR(CURDATE())" + " , month = MONTH(CURDATE())" + " , be_agency_id_applicable = TRUE" + " , agency_id = 2" + " , m = " + r02_median.ToString() + ";" + " replace indicator_median_length_of_service" + " set be_trendable = " + be_trendable.ToString() + " , year = YEAR(CURDATE())" + " , month = MONTH(CURDATE())" + " , be_agency_id_applicable = TRUE" + " , agency_id = 4" + " , m = " + r04_median.ToString() + ";" + " replace indicator_median_length_of_service" + " set be_trendable = " + be_trendable.ToString() + " , year = YEAR(CURDATE())" + " , month = MONTH(CURDATE())" + " , be_agency_id_applicable = TRUE" + " , agency_id = 5" + " , m = " + r05_median.ToString() + ";" + " replace indicator_median_length_of_service" + " set be_trendable = " + be_trendable.ToString() + " , year = YEAR(CURDATE())" + " , month = MONTH(CURDATE())" + " , be_agency_id_applicable = TRUE" + " , agency_id = 6" + " , m = " + r06_median.ToString() + ";" + " replace indicator_median_length_of_service" + " set be_trendable = " + be_trendable.ToString() + " , year = YEAR(CURDATE())" + " , month = MONTH(CURDATE())" + " , be_agency_id_applicable = TRUE" + " , agency_id = 9" + " , m = " + r09_median.ToString() + ";" + " replace indicator_median_length_of_service" + " set be_trendable = " + be_trendable.ToString() + " , year = YEAR(CURDATE())" + " , month = MONTH(CURDATE())" + " , be_agency_id_applicable = TRUE" + " , agency_id = 13" + " , m = " + r13_median.ToString() + ";" + " replace indicator_median_length_of_service" + " set be_trendable = " + be_trendable.ToString() + " , year = YEAR(CURDATE())" + " , month = MONTH(CURDATE())" + " , be_agency_id_applicable = TRUE" + " , agency_id = 14" + " , m = " + r14_median.ToString() + ";" + " replace indicator_median_length_of_service" + " set be_trendable = " + be_trendable.ToString() + " , year = YEAR(CURDATE())" + " , month = MONTH(CURDATE())" + " , be_agency_id_applicable = TRUE" + " , agency_id = 16" + " , m = " + r16_median.ToString() + ";" + " replace indicator_median_length_of_service" + " set be_trendable = " + be_trendable.ToString() + " , year = YEAR(CURDATE())" + " , month = MONTH(CURDATE())" + " , be_agency_id_applicable = TRUE" + " , agency_id = 17" + " , m = " + r17_median.ToString() + ";" + " COMMIT";
            if (be_trendable)
            {
                sql = db_trail.Saved(sql);
            }
            this.Open();
            new MySqlCommand(sql, this.connection).ExecuteNonQuery();
            this.Close();
        }

    } // end TClass_db_indicator_median_length_of_service

}
