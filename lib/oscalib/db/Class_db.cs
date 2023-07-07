using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Configuration;
using System.Data;

namespace Class_db
  {

  public abstract class TClass_db
    {

    private MySqlConnection the_connection = null;

    protected MySqlConnection connection
      {
      get => the_connection;
      set => the_connection = value;
      }

    public TClass_db() : base()
      {
      the_connection = new MySqlConnection(connectionString:ConfigurationManager.AppSettings["db_connection_string"]);
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

    } // end TClass_db

  }
