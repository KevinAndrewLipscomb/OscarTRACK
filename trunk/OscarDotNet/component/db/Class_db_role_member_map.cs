using MySql.Data.MySqlClient;
using kix;
using System;


using System.Collections;
using System.Web.UI.WebControls;
using Class_db;
using Class_db_trail;
using Class_db_roles;
namespace Class_db_role_member_map
{
    public class TClass_db_role_member_map: TClass_db
    {
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_role_member_map() : base()
        {
            db_trail = new TClass_db_trail();
        }
        public void Bind(string tier_quoted_value_list, string agency_filter, string sort_order, bool be_sort_order_descending, object target, out ArrayList crosstab_metadata_rec_arraylist)
        {
            crosstab_metadata_rec_type crosstab_metadata_rec;
            string crosstab_sql;
            string crosstab_where_clause = k.EMPTY;
            MySqlDataReader dr;
            string where_clause;
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
            dr = new MySqlCommand("select id,name,soft_hyphenation_text,tier_id" + " from role" + " where name <> \"Member\"" + crosstab_where_clause + " order by pecking_order", this.connection).ExecuteReader();
            while (dr.Read())
            {
                crosstab_metadata_rec.index = crosstab_metadata_rec.index + 1;
                crosstab_metadata_rec.id = dr["id"].ToString();
                crosstab_metadata_rec.natural_text = dr["name"].ToString();
                crosstab_metadata_rec.soft_hyphenation_text = dr["soft_hyphenation_text"].ToString();
                crosstab_metadata_rec.sql_name = k.Safe(crosstab_metadata_rec.natural_text, k.safe_hint_type.ECMASCRIPT_WORD);
                crosstab_metadata_rec.tier_id = dr["tier_id"].ToString();
                crosstab_sql = crosstab_sql + k.COMMA_SPACE + "IFNULL((select 1 from role_member_map where role_id = \"" + dr["id"].ToString() + "\" and member_id = member.id),0) as " + crosstab_metadata_rec.sql_name;
                crosstab_metadata_rec_arraylist.Add(crosstab_metadata_rec);
            }
            dr.Close();
            where_clause = " where enrollment_level.description in (\"Applicant\",\"Associate\",\"Regular\",\"Life\",\"Tenured\",\"Atypical\",\"Recruit\",\"Admin\"" + ",\"Reduced (1)\",\"Reduced (2)\",\"Reduced (3)\",\"SpecOps\",\"Transferring\",\"Suspended\",\"New trainee\") ";
            if (agency_filter != k.EMPTY)
            {
                where_clause = where_clause + " and agency_id = \"" + agency_filter + "\"";
            }
            if (be_sort_order_descending)
            {
                sort_order = sort_order.Replace("%", " desc");
            }
            else
            {
                sort_order = sort_order.Replace("%", " asc");
            }
            ((target) as GridView).DataSource = new MySqlCommand("select member.id as member_id" + " , concat(last_name,\"" + k.COMMA_SPACE + "\",first_name,\" (\",IFNULL(cad_num,\"\"),\")\") as member_name" + crosstab_sql + " from member" + " left outer join role_member_map on (role_member_map.member_id=member.id)" + " left outer join role on (role.id=role_member_map.role_id)" + " join enrollment_history" + " on" + " (" + "   enrollment_history.member_id=member.id" + " and" + "   (enrollment_history.end_date is null)" + " )" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + where_clause + " group by member.id" + " order by " + sort_order, this.connection).ExecuteReader();
            ((target) as GridView).DataBind();
            this.Close();

        }

        public void BindActuals(string tier_quoted_value_list, string agency_filter, string sort_order, bool be_sort_order_ascending, object target)
        {
            string where_clause;
            where_clause = " where role.name <> \"Member\"";
            if (tier_quoted_value_list != k.DOUBLE_QUOTE)
            {
                where_clause = where_clause + " and (tier_id in (" + tier_quoted_value_list + "))";
            }
            if (agency_filter != k.EMPTY)
            {
                where_clause = where_clause + " and (agency_id = \"" + agency_filter + "\")";
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
            ((target) as GridView).DataSource = new MySqlCommand("select role_id" + " , tier_id as role_tier_id" + " , pecking_order as role_pecking_order" + " , role.name as role_name" + " , concat(member.last_name,\", \",first_name,\" (\",IFNULL(cad_num,\"\"),\")\") as member_designator" + " , member_id" + " , cad_num" + " , agency_id" + " from role_member_map" + " join member on (member.id=role_member_map.member_id)" + " join role on (role.id=role_member_map.role_id)" + where_clause + " order by " + sort_order, this.connection).ExecuteReader();
            ((target) as GridView).DataBind();
            this.Close();

        }

        public void BindHolders(string role_name, object target, string sort_order, bool be_sort_order_ascending)
        {
            this.Open();
            if (be_sort_order_ascending)
            {
                sort_order = sort_order.Replace("%", " asc");
            }
            else
            {
                sort_order = sort_order.Replace("%", " desc");
            }
            ((target) as GridView).DataSource = new MySqlCommand("select concat(last_name,\", \",first_name) as member_name" + " , short_designator as agency_designator" + " , email_address" + " from role_member_map" + " join member on (member.id=role_member_map.member_id)" + " join agency on (agency.id=member.agency_id)" + " join role on (role.id=role_member_map.role_id)" + " where role.name = \"" + role_name + "\"" + " order by " + sort_order, this.connection).ExecuteReader();
            ((target) as GridView).DataBind();
            this.Close();

        }

        public void BindHoldersPerAgency(string agency_id, object target)
        {
            string role_name_construction_clause;
            string tier_specific_sort_hint_column;
            string tier_specific_where_conditions;
            if (agency_id == "0")
            {
                role_name_construction_clause = "IF(role.name = \"Squad Commander\",concat(agency.short_designator,\" \",role.name),role.name)";
                tier_specific_sort_hint_column = " , IF(role.name = \"Squad Commander\",agency.short_designator,\"\") as sort_hint";
                tier_specific_where_conditions = k.EMPTY + " and (tier_id is null or tier_id = \"1\")" + " or role.name = \"Squad Commander\"";
            }
            else
            {
                role_name_construction_clause = "role.name";
                tier_specific_sort_hint_column = " , \"\" as sort_hint";
                tier_specific_where_conditions = k.EMPTY + " and agency_id = \"" + agency_id + "\"" + " and tier_id > \"1\"";
            }
            this.Open();
            ((target) as GridView).DataSource = new MySqlCommand("select " + role_name_construction_clause + " as role_name" + " , concat(first_name,\" \",last_name,\" (\",IFNULL(cad_num,\"\"),\")\") as member_name" + " , cad_num" + tier_specific_sort_hint_column + " from role_member_map" + " join role on (role.id=role_member_map.role_id)" + " join member on (member.id=role_member_map.member_id)" + " join agency on (agency.id=member.agency_id)" + " where role.name <> \"Member\"" + tier_specific_where_conditions + " order by role.pecking_order,sort_hint,cad_num", this.connection).ExecuteReader();
            ((target) as GridView).DataBind();
            this.Close();

        }

        public void BindUnassignedPerAgency(string agency_id, object target)
        {
            string sql;
            if (agency_id == "0")
            {
                sql = k.EMPTY + " select role.name as role_name" + " , pecking_order" + " , \"\" as sort_hint" + " from role" + " where role.name not in" + " (" + " select distinct role.name" + " from role_member_map" + " join role on (role.id=role_member_map.role_id)" + " where role.name <> \"Member\"" + " and (tier_id is null or tier_id = \"1\")" + " )" + " and (name <> \"Member\")" + " and (tier_id is null or tier_id = \"1\")" + " UNION" + " select concat(agency.short_designator,\" \",role.name) as role_name" + " , pecking_order" + " , agency.short_designator as sort_hint" + " from role,agency" + " where be_active" + " and short_designator like \"R%\"" + " and concat(agency.short_designator,\" \",role.name) not in" + " (" + " select distinct concat(agency.short_designator,\" \",role.name)" + " from role_member_map" + " join role on (role.id=role_member_map.role_id)" + " join member on (member.id=role_member_map.member_id)" + " join agency on (agency.id=member.agency_id)" + " where role.name = \"Squad Commander\"" + " )" + " and name = \"Squad Commander\"" + " ORDER BY pecking_order,sort_hint";
            }
            else
            {
                sql = k.EMPTY + "select distinct role.name as role_name" + " , \"\" as sort_hint" + " from role_member_map" + "   join role on (role.id=role_member_map.role_id)" + "   join member on (member.id=role_member_map.member_id)" + "   join agency on (agency.id=member.agency_id)" + " where role.name not in" + "   (" + "   select distinct role.name" + "   from role_member_map" + "     join role on (role.id=role_member_map.role_id)" + "     join member on (member.id=role_member_map.member_id)" + "     join agency on (agency.id=member.agency_id)" + "   where role.name <> \"Member\"" + "     and tier_id > \"1\"" + "     and agency_id = \"" + agency_id + "\"" + "   )" + "   and tier_id > \"1\"" + " order by role.pecking_order,sort_hint";
            }
            this.Open();
            ((target) as GridView).DataSource = new MySqlCommand(sql, this.connection).ExecuteReader();
            ((target) as GridView).DataBind();
            this.Close();

        }

        public string EmailTargetOf(string role_name, string agency_short_designator)
        {
            string result;
            MySqlDataReader dr;
            string email_target_of = k.EMPTY;
            this.Open();
            dr = new MySqlCommand("select email_address" + " from role_member_map" + " join role on (role.id=role_member_map.role_id)" + " join member on (member.id=role_member_map.member_id)" + " join agency on (agency.id=member.agency_id)" + " where role.name = \"" + role_name + "\"" + " and agency.short_designator = \"" + agency_short_designator + "\"", this.connection).ExecuteReader();
            while (dr.Read())
            {
                email_target_of = email_target_of + dr["email_address"].ToString() + k.COMMA;
            }
            dr.Close();
            this.Close();
            if (email_target_of != k.EMPTY)
            {
                result = email_target_of.Substring(0, email_target_of.Length - 1);
            }
            else
            {
                result = k.EMPTY;
            }

            return result;
        }

        public string HolderOf(string role_name)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select concat(first_name,\" \",last_name)" + " from role_member_map" + " join role on (role.id=role_member_map.role_id)" + " join member on (member.id=role_member_map.member_id)" + " where role.name = \"" + role_name + "\"" + " limit 1", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public void Save(string member_id, string role_id, bool be_granted)
        {
            this.Open();
            if (be_granted)
            {
                new MySqlCommand(db_trail.Saved("insert ignore role_member_map set member_id = \"" + member_id + "\", role_id = \"" + role_id + "\""), this.connection).ExecuteNonQuery();
            }
            else
            {
                new MySqlCommand(db_trail.Saved("delete from role_member_map where member_id = \"" + member_id + "\" and role_id = \"" + role_id + "\""), this.connection).ExecuteNonQuery();
            }
            this.Close();
        }

    } // end TClass_db_role_member_map

}

namespace Class_db_role_member_map.Units
{
    public class Class_db_role_member_map
    {
        public const int CI_MEMBER_ID = 0;
        public const int CI_MEMBER_NAME = 1;
        public const int CI_FIRST_CROSSTAB = 2;
        public const int ROLE_HOLDER_EMAIL_ADDRESS_CI = 2;
    } // end Class_db_role_member_map

}

