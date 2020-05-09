using MySql.Data.MySqlClient;
using kix;
using System;


using System.Collections;
using System.Web.UI.WebControls;
using Class_db;
using Class_db_trail;
using Class_db_roles;

namespace Class_db_role_notification_map
{
    public class TClass_db_role_notification_map: TClass_db
    {
        private readonly TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_role_notification_map() : base()
        {
            db_trail = new TClass_db_trail();
        }
        public void Bind(string tier_quoted_value_list, string sort_order, bool be_sort_order_descending, object target, out ArrayList crosstab_metadata_rec_arraylist)
        {
            crosstab_metadata_rec_type crosstab_metadata_rec;
            string crosstab_sql;
            string crosstab_where_clause = k.EMPTY;
            MySqlDataReader dr;
            crosstab_metadata_rec.index = 1;
            // init to index of last non-dependent column
            crosstab_metadata_rec_arraylist = new ArrayList();
            crosstab_sql = k.EMPTY;
            if (tier_quoted_value_list == k.DOUBLE_QUOTE)
            {
                crosstab_where_clause = k.EMPTY;
            }
            else
            {
                crosstab_where_clause = " and tier_id in (" + tier_quoted_value_list + ")";
            }
            Open();
            using var my_sql_command_1 = new MySqlCommand("select id,name,soft_hyphenation_text" + " from role" + " where name <> \"Member\"" + crosstab_where_clause + " order by pecking_order", connection);
            dr = my_sql_command_1.ExecuteReader();
            while (dr.Read())
            {
                crosstab_metadata_rec.index++;
                crosstab_metadata_rec.id = dr["id"].ToString();
                crosstab_metadata_rec.natural_text = dr["name"].ToString();
                crosstab_metadata_rec.soft_hyphenation_text = dr["soft_hyphenation_text"].ToString();
                crosstab_metadata_rec.sql_name = k.Safe(crosstab_metadata_rec.natural_text, k.safe_hint_type.ECMASCRIPT_WORD);
                crosstab_metadata_rec.tier_id = k.EMPTY;
                crosstab_sql = crosstab_sql + k.COMMA_SPACE + "IFNULL((select 1 from role_notification_map where role_id = \"" + dr["id"].ToString() + "\" and notification_id = notification.id),0) as " + crosstab_metadata_rec.sql_name;
                crosstab_metadata_rec_arraylist.Add(crosstab_metadata_rec);
            }
            dr.Close();
            if (be_sort_order_descending)
            {
                sort_order = sort_order.Replace("%", " desc");
            }
            else
            {
                sort_order = sort_order.Replace("%", " asc");
            }
            using var my_sql_command_2 = new MySqlCommand("select notification.id as notification_id" + " , notification.name as notification_name" + crosstab_sql + " from notification" + " left outer join role_notification_map on (role_notification_map.notification_id=notification.id)" + " left outer join role on (role.id=role_notification_map.role_id)" + " group by notification.id" + " order by " + sort_order, connection);
            ((target) as GridView).DataSource = my_sql_command_2.ExecuteReader();
            ((target) as GridView).DataBind();
            Close();

        }

        public void BindActuals(string tier_quoted_value_list, string sort_order, bool be_sort_order_ascending, object target)
        {
            string where_clause;
            where_clause = " where role.name <> \"Member\"";
            if (tier_quoted_value_list != k.DOUBLE_QUOTE)
            {
                where_clause += " and (tier_id in (" + tier_quoted_value_list + "))";
            }
            if (be_sort_order_ascending)
            {
                sort_order = sort_order.Replace("%", " asc");
            }
            else
            {
                sort_order = sort_order.Replace("%", " desc");
            }
            Open();
            using var my_sql_command = new MySqlCommand("select role_id" + " , tier_id as role_tier_id" + " , pecking_order as role_pecking_order" + " , role.name as role_name" + " , notification.name as notification_name" + " , notification_id" + " from role_notification_map" + " join notification on (notification.id=role_notification_map.notification_id)" + " join role on (role.id=role_notification_map.role_id)" + where_clause + " order by " + sort_order, connection);
            ((target) as GridView).DataSource = my_sql_command.ExecuteReader();
            ((target) as GridView).DataBind();
            Close();

        }

        public void Save(string notification_id, string role_id, bool be_granted)
        {
            Open();
            if (be_granted)
            {
                using var my_sql_command = new MySqlCommand(db_trail.Saved("insert ignore role_notification_map set notification_id = \"" + notification_id + "\", role_id = \"" + role_id + "\""), connection);
                my_sql_command.ExecuteNonQuery();
            }
            else
            {
                using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from role_notification_map where notification_id = \"" + notification_id + "\" and role_id = \"" + role_id + "\""), connection);
                my_sql_command.ExecuteNonQuery();
            }
            Close();
        }

    } // end TClass_db_role_notification_map

}

namespace Class_db_role_notification_map.Units
{
    public class Class_db_role_notification_map
    {
        public const int CI_NOTIFICATION_ID = 0;
        public const int CI_NOTIFICATION_NAME = 1;
        public const int CI_FIRST_CROSSTAB = 2;
    } // end Class_db_role_notification_map

}

