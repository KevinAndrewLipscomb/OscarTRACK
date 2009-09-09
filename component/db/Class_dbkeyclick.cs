using System.Data;
using MySql.Data.MySqlClient;

using System.Configuration;



using System;

namespace Class_dbkeyclick
{
    public abstract class TClass_dbkeyclick
    {
        protected MySqlConnection connection = null;
        //Constructor  Create()
        public TClass_dbkeyclick() : base()
        {
            // TODO: Add any constructor code here
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

    } // end TClass_dbkeyclick

}
