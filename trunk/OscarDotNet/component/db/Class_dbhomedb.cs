using MySql.Data.MySqlClient;
using System.Collections;
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

    protected void ExecuteOneOffProcedureScriptWithTolerance
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
          if (!new ArrayList() {"PROCEDURE " + procedure_name + " already exists","PROCEDURE " + connection.Database + "." + procedure_name + " does not exist"}.Contains(the_exception.Message))
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
