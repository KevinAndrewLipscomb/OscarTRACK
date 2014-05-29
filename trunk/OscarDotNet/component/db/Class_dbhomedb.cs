using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace Class_dbhomedb
  {

  public abstract class TClass_dbhomedb
    {

    protected MySqlConnection connection = null;

    public TClass_dbhomedb() : base()
      {
      connection = new MySqlConnection(connectionString:ConfigurationManager.AppSettings["dbhomedb_connection_string"]);
      }

    protected void Close()
      {
      connection.Close();
      }

    protected static void ExecuteOneOffProcedureScriptWithTolerance
      (
      string procedure_name,
      MySqlScript my_sql_script
      )
      {
      var done = false;
      while (!done)
        {
        try
          {
          my_sql_script.Execute();
          done = true;
          }
        catch (MySqlException the_exception)
          {
          if (the_exception.Message != "PROCEDURE " + procedure_name + " already exists")
            {
            throw;
            }
          }
        }
      }

    protected void Open()
      {
      if (connection.State != ConnectionState.Open)
        {
        connection.Open();
        }
      }

    }

  }
