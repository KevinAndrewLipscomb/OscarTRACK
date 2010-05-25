using Class_db;
using Class_db_trail;
using MySql.Data.MySqlClient;
using System.Collections;

namespace Class_db_indicator_monthly_vehicles_up_and_current
  {

  public class TClass_db_indicator_monthly_vehicles_up_and_current : TClass_db
    {

    private TClass_db_trail db_trail = null;

    public TClass_db_indicator_monthly_vehicles_up_and_current() : base()
      {
      // TODO: Add any constructor code here
      db_trail = new TClass_db_trail();
      }

    internal void Log
      (
      decimal citywide_median,
      decimal mrt_median,
      decimal r01_median,
      decimal r02_median,
      decimal r04_median,
      decimal r05_median,
      decimal r06_median,
      decimal r09_median,
      decimal r13_median,
      decimal r14_median,
      decimal r16_median,
      decimal r17_median,
      decimal sar_median
      )
      {
      Open();
      new MySqlCommand
        (
        db_trail.Saved
          (
          "START TRANSACTION"
          + ";"
          + " replace indicator_monthly_vehicles_up_and_current"
          + " set year = YEAR(CURDATE())"
          + " , month = MONTH(CURDATE())"
          + " , be_agency_id_applicable = FALSE"
          + " , value = " + citywide_median.ToString()
          + ";"
          + " replace indicator_monthly_vehicles_up_and_current"
          + " set year = YEAR(CURDATE())"
          + " , month = MONTH(CURDATE())"
          + " , be_agency_id_applicable = TRUE"
          + " , agency_id = 203"
          + " , value = " + mrt_median.ToString()
          + ";"
          + " replace indicator_monthly_vehicles_up_and_current"
          + " set year = YEAR(CURDATE())"
          + " , month = MONTH(CURDATE())"
          + " , be_agency_id_applicable = TRUE"
          + " , agency_id = 1"
          + " , value = " + r01_median.ToString()
          + ";"
          + " replace indicator_monthly_vehicles_up_and_current"
          + " set year = YEAR(CURDATE())"
          + " , month = MONTH(CURDATE())"
          + " , be_agency_id_applicable = TRUE"
          + " , agency_id = 2"
          + " , value = " + r02_median.ToString()
          + ";"
          + " replace indicator_monthly_vehicles_up_and_current"
          + " set year = YEAR(CURDATE())"
          + " , month = MONTH(CURDATE())"
          + " , be_agency_id_applicable = TRUE"
          + " , agency_id = 4"
          + " , value = " + r04_median.ToString()
          + ";"
          + " replace indicator_monthly_vehicles_up_and_current"
          + " set year = YEAR(CURDATE())"
          + " , month = MONTH(CURDATE())"
          + " , be_agency_id_applicable = TRUE"
          + " , agency_id = 5"
          + " , value = " + r05_median.ToString()
          + ";"
          + " replace indicator_monthly_vehicles_up_and_current"
          + " set year = YEAR(CURDATE())"
          + " , month = MONTH(CURDATE())"
          + " , be_agency_id_applicable = TRUE"
          + " , agency_id = 6"
          + " , value = " + r06_median.ToString()
          + ";"
          + " replace indicator_monthly_vehicles_up_and_current"
          + " set year = YEAR(CURDATE())"
          + " , month = MONTH(CURDATE())"
          + " , be_agency_id_applicable = TRUE"
          + " , agency_id = 9"
          + " , value = " + r09_median.ToString()
          + ";"
          + " replace indicator_monthly_vehicles_up_and_current"
          + " set year = YEAR(CURDATE())"
          + " , month = MONTH(CURDATE())"
          + " , be_agency_id_applicable = TRUE"
          + " , agency_id = 13"
          + " , value = " + r13_median.ToString()
          + ";"
          + " replace indicator_monthly_vehicles_up_and_current"
          + " set year = YEAR(CURDATE())"
          + " , month = MONTH(CURDATE())"
          + " , be_agency_id_applicable = TRUE"
          + " , agency_id = 14"
          + " , value = " + r14_median.ToString()
          + ";"
          + " replace indicator_monthly_vehicles_up_and_current"
          + " set year = YEAR(CURDATE())"
          + " , month = MONTH(CURDATE())"
          + " , be_agency_id_applicable = TRUE"
          + " , agency_id = 16"
          + " , value = " + r16_median.ToString()
          + ";"
          + " replace indicator_monthly_vehicles_up_and_current"
          + " set year = YEAR(CURDATE())"
          + " , month = MONTH(CURDATE())"
          + " , be_agency_id_applicable = TRUE"
          + " , agency_id = 17"
          + " , value = " + r17_median.ToString()
          + ";"
          + " replace indicator_monthly_vehicles_up_and_current"
          + " set year = YEAR(CURDATE())"
          + " , month = MONTH(CURDATE())"
          + " , be_agency_id_applicable = TRUE"
          + " , agency_id = 204"
          + " , value = " + sar_median.ToString()
          + ";"
          + " COMMIT"
          ),
        connection
        )
        .ExecuteNonQuery();
      Close();
      }

    }

  }