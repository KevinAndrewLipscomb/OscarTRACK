using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace Class_dbkeyclick
  {

  public abstract class TClass_dbkeyclick
    {

    protected MySqlConnection connection = null;

    public TClass_dbkeyclick() : base()
      {
      connection = new MySqlConnection(connectionString:ConfigurationManager.AppSettings["dbkeyclick_connection_string"]);
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
