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
      connection = new MySqlConnection();
      connection.ConnectionString = ConfigurationManager.AppSettings["dbhomedb_connection_string"];
      }

    protected void Close()
      {
      connection.Close();
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
