using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using System.Collections;

namespace Class_dbkeyclick
  {

  public abstract class TClass_dbkeyclick
    {

    private MySqlConnection the_connection = null;
    public MySqlConnection connection
      {
      get => the_connection;
      set => the_connection = value;
      }

    public TClass_dbkeyclick() : base()
      {
      the_connection = new MySqlConnection(connectionString:ConfigurationManager.AppSettings["dbkeyclick_connection_string"]);
      }

    protected void Close()
      {
      the_connection.Close();
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
          if (!new ArrayList() {"PROCEDURE " + procedure_name + " already exists","PROCEDURE " + the_connection.Database + "." + procedure_name + " does not exist"}.Contains(the_exception.Message))
            {
            throw;
            }
          }
        }
      }

    protected void Open()
      {
      if (the_connection.State != ConnectionState.Open)
        {
        the_connection.Open();
        }
      }

    }

  }
