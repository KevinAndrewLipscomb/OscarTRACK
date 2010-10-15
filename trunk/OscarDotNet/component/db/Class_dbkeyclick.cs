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
      connection = new MySqlConnection();
      connection.ConnectionString = ConfigurationManager.AppSettings["dbkeyclick_connection_string"];
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
