using Class_db;
using kix;
using MySql.Data.MySqlClient;

namespace Class_db__information_schema
  {

  public class TClass_db__information_schema: TClass_db
    {

    public TClass_db__information_schema() : base()
      {
      }

    public string EngineInnodbStatus()
      {
      var engine_innodb_status = k.EMPTY;
      Open();
      using var my_sql_command = new MySqlCommand("SHOW ENGINE INNODB STATUS",connection);
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        engine_innodb_status = dr["Status"].ToString();
        }
      dr.Close();
      Close();
      return engine_innodb_status;
      }

    } // end TClass_db__information_schema

  }
