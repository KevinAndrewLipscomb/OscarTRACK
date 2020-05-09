using MySql.Data.MySqlClient;
using System;


using System.Web.UI.WebControls;
using Class_db;
using Class_db_trail;

namespace Class_db_user_member_map
{
    public class TClass_db_user_member_map: TClass_db
    {
        private readonly TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_user_member_map() : base()
        {
            db_trail = new TClass_db_trail();
        }
        public void BindActuals(string sort_order, bool be_sort_order_ascending, object target)
        {
            if (be_sort_order_ascending)
            {
                sort_order = sort_order.Replace("%", " asc");
            }
            else
            {
                sort_order = sort_order.Replace("%", " desc");
            }
            Open();
            using var my_sql_command = new MySqlCommand("select user_id" + " , user.username as user_name" + " , concat(member.last_name,\", \",member.first_name) as member_name" + " , member_id" + " from user_member_map" + " join member on (member.id=user_member_map.member_id)" + " join user on (user.id=user_member_map.user_id)" + " order by " + sort_order, connection);
            ((target) as GridView).DataSource = my_sql_command.ExecuteReader();
            ((target) as GridView).DataBind();
            Close();

        }

        public void Save(string member_id, string user_id, bool be_granted)
        {
            Open();
            if (be_granted)
            {
                using var my_sql_command = new MySqlCommand(db_trail.Saved("insert ignore user_member_map set member_id = \"" + member_id + "\", user_id = \"" + user_id + "\""), connection);
                my_sql_command.ExecuteNonQuery();
            }
            else
            {
                using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from user_member_map where member_id = \"" + member_id + "\" and user_id = \"" + user_id + "\""), connection);
                my_sql_command.ExecuteNonQuery();
            }
            Close();
        }

    } // end TClass_db_user_member_map

}

namespace Class_db_user_member_map.Units
{
    public class Class_db_user_member_map
    {
        public const int CI_MEMBER_ID = 0;
        public const int CI_MEMBER_NAME = 1;
        public const int CI_FIRST_CROSSTAB = 2;
    } // end Class_db_user_member_map

}

