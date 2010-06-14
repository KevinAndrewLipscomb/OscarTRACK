using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Web.UI.WebControls;

namespace Class_db_indicator_shiftwise_vehicles_up_and_current
  {

  public class TClass_db_indicator_shiftwise_vehicles_up_and_current: TClass_db
    {

    private TClass_db_trail db_trail = null;

    public TClass_db_indicator_shiftwise_vehicles_up_and_current() : base()
      {
      // TODO: Add any constructor code here
      db_trail = new TClass_db_trail();
      }

    internal void BindSpecialForMonthlyMedians(object target)
      {
      Open();
      ((target) as BaseDataList).DataSource = new MySqlCommand
        (
        "select short_designator as agency"
        + " , value as shiftwise_factor"
        + " from indicator_shiftwise_vehicles_up_and_current"
        +   " join agency on (agency.id=indicator_shiftwise_vehicles_up_and_current.agency_id)"
        + " where PERIOD_DIFF(DATE_FORMAT(date,'%Y%m'),DATE_FORMAT(CURDATE(),'%Y%m')) = -1",
        connection
        )
        .ExecuteReader();
      ((target) as BaseDataList).DataBind();
      Close();
      }

    public void BindLatestRankedPercentages(object target, bool be_trendable)
      {
      Open();
      var transaction = this.connection.BeginTransaction();
      try
        {
        ((target) as DataGrid).DataSource = new MySqlCommand("select NULL as rank" + " , concat(medium_designator,\" - \",long_designator) as agency" + " , m" + " from indicator_shiftwise_vehicles_up_and_current" + " join agency on (agency.id=indicator_shiftwise_vehicles_up_and_current.agency_id)" + " where be_trendable = " + be_trendable.ToString() + " and year = YEAR(CURDATE())" + " and month = MONTH(CURDATE())" + " and be_agency_id_applicable = TRUE" + " order by m desc", connection, transaction).ExecuteReader();
        ((target) as DataGrid).DataBind();
        ((MySqlDataReader)(((target) as DataGrid).DataSource)).Close();
        if (be_trendable)
          {
          new MySqlCommand("delete from indicator_shiftwise_vehicles_up_and_current where not be_trendable", this.connection, transaction).ExecuteNonQuery();
          }
        transaction.Commit();
        }
      catch
        {
        transaction.Rollback();
        }
      Close();
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
          + " , value = '" + (value*100).ToString() + "'"
          )
        ,connection
        )
        .ExecuteNonQuery();
      Close();
      }

    } // end TClass_db_indicator_shiftwise_vehicles_up_and_current

  }
