using System.Collections.Specialized;


using MySql.Data.MySqlClient;
using System;

using Class_db;
namespace Class_db_user
{
    public class TClass_db_user: TClass_db
    {
        //Constructor  Create()
        public TClass_db_user() : base()
        {
            // TODO: Add any constructor code here

        }
        public string[] RolesOf(string id)
        {
            MySqlDataReader dr;
            StringCollection roles_of_string_collection = new StringCollection();
            this.Open();
            dr = new MySqlCommand("select name" + " from role" + " join role_member_map on (role_member_map.role_id=role.id)" + " join user_member_map on (user_member_map.member_id=role_member_map.member_id)" + " where user_member_map.user_id = \"" + id + "\"" + " order by pecking_order", this.connection).ExecuteReader();
            while (dr.Read())
              {
              roles_of_string_collection.Add(dr["name"].ToString());
              }
            dr.Close();
            this.Close();
            string[] roles_of = new string[roles_of_string_collection.Count];
            roles_of_string_collection.CopyTo(roles_of,0);
            return roles_of;
        }

    } // end TClass_db_user

}
