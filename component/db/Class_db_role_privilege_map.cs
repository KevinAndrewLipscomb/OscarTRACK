using MySql.Data.MySqlClient;
using kix;
using System;


using System.Collections;
using System.Web.UI.WebControls;
using Class_db;
using Class_db_trail;
using Class_db_roles;
namespace Class_db_role_privilege_map
{
    public class TClass_db_role_privilege_map: TClass_db
    {
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_role_privilege_map() : base()
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
            this.Open();
            dr = new MySqlCommand("select id,name,soft_hyphenation_text" + " from role" + " where name <> \"Member\"" + crosstab_where_clause + " order by pecking_order", this.connection).ExecuteReader();
            while (dr.Read())
            {
                crosstab_metadata_rec.index = crosstab_metadata_rec.index + 1;
                crosstab_metadata_rec.id = dr["id"].ToString();
                crosstab_metadata_rec.natural_text = dr["name"].ToString();
                crosstab_metadata_rec.soft_hyphenation_text = dr["soft_hyphenation_text"].ToString();
                crosstab_metadata_rec.sql_name = k.Safe(crosstab_metadata_rec.natural_text, k.safe_hint_type.ECMASCRIPT_WORD);
                crosstab_metadata_rec.tier_id = k.EMPTY;
                crosstab_sql = crosstab_sql + k.COMMA_SPACE + "IFNULL((select 1 from role_privilege_map where role_id = \"" + dr["id"].ToString() + "\" and privilege_id = privilege.id),0) as " + crosstab_metadata_rec.sql_name;
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
            ((target) as GridView).DataSource = new MySqlCommand("select privilege.id as privilege_id" + " , privilege.name as privilege_name" + crosstab_sql + " from privilege" + " left outer join role_privilege_map on (role_privilege_map.privilege_id=privilege.id)" + " left outer join role on (role.id=role_privilege_map.role_id)" + " group by privilege.id" + " order by " + sort_order, this.connection).ExecuteReader();
            ((target) as GridView).DataBind();
            this.Close();

        }

        public void BindActuals(string tier_quoted_value_list, string sort_order, bool be_sort_order_ascending, object target)
        {
            string where_clause;
            where_clause = " where role.name <> \"Member\"";
            if (tier_quoted_value_list != k.DOUBLE_QUOTE)
            {
                where_clause = where_clause + " and (tier_id in (" + tier_quoted_value_list + "))";
            }
            if (be_sort_order_ascending)
            {
                sort_order = sort_order.Replace("%", " asc");
            }
            else
            {
                sort_order = sort_order.Replace("%", " desc");
            }
            this.Open();
            ((target) as GridView).DataSource = new MySqlCommand("select role_id" + " , tier_id as role_tier_id" + " , pecking_order as role_pecking_order" + " , role.name as role_name" + " , privilege.name as privilege_name" + " , privilege_id" + " from role_privilege_map" + " join privilege on (privilege.id=role_privilege_map.privilege_id)" + " join role on (role.id=role_privilege_map.role_id)" + where_clause + " order by " + sort_order, this.connection).ExecuteReader();
            ((target) as GridView).DataBind();
            this.Close();

        }

        public void Save(string privilege_id, string role_id, bool be_granted)
        {
            this.Open();
            if (be_granted)
            {
                new MySqlCommand(db_trail.Saved("insert ignore role_privilege_map set privilege_id = \"" + privilege_id + "\", role_id = \"" + role_id + "\""), this.connection).ExecuteNonQuery();
            }
            else
            {
                new MySqlCommand(db_trail.Saved("delete from role_privilege_map where privilege_id = \"" + privilege_id + "\" and role_id = \"" + role_id + "\""), this.connection).ExecuteNonQuery();
            }
            this.Close();
        }

    } // end TClass_db_role_privilege_map

}

namespace Class_db_role_privilege_map.Units
{
    public class Class_db_role_privilege_map
    {
        public const int CI_PRIVILEGE_ID = 0;
        public const int CI_PRIVILEGE_NAME = 1;
        public const int CI_FIRST_CROSSTAB = 2;
    } // end Class_db_role_privilege_map

}

