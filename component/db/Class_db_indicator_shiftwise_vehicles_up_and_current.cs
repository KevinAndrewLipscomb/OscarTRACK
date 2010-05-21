using MySql.Data.MySqlClient;
using System;

using System.Web.UI.WebControls;
using Class_db;
using Class_db_trail;
using kix;

namespace Class_db_indicator_shiftwise_vehicles_up_and_current
{
    public class TClass_db_indicator_shiftwise_vehicles_up_and_current: TClass_db
    {
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_indicator_shiftwise_vehicles_up_and_current() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }
        public void BindLatestRankedPercentages(object target, bool be_trendable)
        {
            MySqlTransaction transaction;
            this.Open();
            transaction = this.connection.BeginTransaction();
            try {
                ((target) as DataGrid).DataSource = new MySqlCommand("select NULL as rank" + " , concat(medium_designator,\" - \",long_designator) as agency" + " , m" + " from indicator_shiftwise_vehicles_up_and_current" + " join agency on (agency.id=indicator_shiftwise_vehicles_up_and_current.agency_id)" + " where be_trendable = " + be_trendable.ToString() + " and year = YEAR(CURDATE())" + " and month = MONTH(CURDATE())" + " and be_agency_id_applicable = TRUE" + " order by m desc", this.connection, transaction).ExecuteReader();
                ((target) as DataGrid).DataBind();
                ((MySqlDataReader)(((target) as DataGrid).DataSource)).Close();
                if (be_trendable)
                {
                    new MySqlCommand("delete from indicator_shiftwise_vehicles_up_and_current where not be_trendable", this.connection, transaction).ExecuteNonQuery();
                }
                transaction.Commit();
            }
            catch {
                transaction.Rollback();
            }
            this.Close();

        }

        internal void Log
          (
          string agency_filter,
          decimal value
          )
          {
          Open();
          new MySqlCommand
            (
            db_trail.Saved
              (
              "replace indicator_shiftwise_vehicles_up_and_current"
              + " set date = CURDATE()"
              + " , be_for_night_shift = (HOUR(NOW()) > 12)"
              + " , be_agency_id_applicable = " + (agency_filter != k.EMPTY).ToString()
              + " , agency_id = '" + (agency_filter == k.EMPTY ? "0" : agency_filter) + "'"
              + " , value = '" + value.ToString() + "'"
              )
            ,connection
            )
            .ExecuteNonQuery();
          Close();
          }
    } // end TClass_db_indicator_shiftwise_vehicles_up_and_current

}
