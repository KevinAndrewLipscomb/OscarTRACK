using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace Class_dboscar
  {

  public abstract class TClass_dboscar
    {

    protected MySqlConnection connection = null;

    public TClass_dboscar() : base()
      {
      connection = new MySqlConnection();
      connection.ConnectionString = ConfigurationManager.AppSettings["dboscar_connection_string"];
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
