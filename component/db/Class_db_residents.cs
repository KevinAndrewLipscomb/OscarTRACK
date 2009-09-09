using MySql.Data.MySqlClient;
using System;
using Class_dbkeyclick;
namespace Class_db_residents
{
    public class TClass_db_residents: TClass_dbkeyclick
    {
        //Constructor  Create()
        public TClass_db_residents() : base()
        {
            // TODO: Add any constructor code here

        }
        public bool BeExtantId(string id)
        {
            bool result;
            this.Open();
            result = null != new MySqlCommand("select TRUE from resident where id = \"" + id + "\"", this.connection).ExecuteScalar();
            this.Close();
            return result;
        }

    } // end TClass_db_residents

}
