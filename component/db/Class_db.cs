using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace Class_db
{
    public abstract class TClass_db
    {
        protected MySqlConnection connection = null;
        //Constructor  Create()
        public TClass_db() : base()
        {
            // TODO: Add any constructor code here
            connection = new MySqlConnection();
            connection.ConnectionString = ConfigurationManager.AppSettings["db_connection_string"];
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

    } // end TClass_db

}
