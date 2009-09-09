using MySql.Data.MySqlClient;
using kix;
using System;


using System.Collections;
using System.Web.UI.WebControls;
using Class_db;
using Class_db_trail;
using Class_db_members;
namespace Class_db_enrollment
{
    public class TClass_db_enrollment: TClass_db
    {
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_enrollment() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }
        public void BindMemberHistory(string member_id, object target)
        {
            this.Open();
            // column 0
            // column 1
            // column 2
            // column 3
            ((target) as DataGrid).DataSource = new MySqlCommand("select enrollment_history.id as id" + " , date_format(start_date,\"%Y-%m-%d\") as start_date" + " , enrollment_level.description as description" + " , note" + " from enrollment_history" + " join member on (member.id=enrollment_history.member_id)" + " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" + " where member.id = " + member_id + " order by start_date desc, enrollment_history.id desc", this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
        }

        public void BindTransitionRadioButtonList(string member_id, string tier_id, object target)
        {
            MySqlDataReader dr;
            string display_html;
            this.Open();
            ((target) as RadioButtonList).Items.Clear();
            dr = new MySqlCommand("SELECT DISTINCT valid_next_level_code" + " , description" + " , elaboration" + " FROM enrollment_transition" + " join enrollment_level on (enrollment_level.code=enrollment_transition.valid_next_level_code)" + " where current_level_code =" + " (select level_code from enrollment_history where member_id = " + member_id + " order by start_date desc, end_date limit 1)" + " and" + " (" + " (required_historical_level_code is null)" + " or" + " (required_historical_level_code in (select level_code from enrollment_history where member_id = " + member_id + "))" + " )" + " and" + " (" + " (disallowed_historical_level_code is null)" + " or" + " (disallowed_historical_level_code not in (select level_code from enrollment_history where member_id = " + member_id + "))" + " )" + " and" + " authorized_tier_id >= " + tier_id + " order by pecking_order", this.connection).ExecuteReader();
            while (dr.Read())
            {
                display_html = "<b>" + dr["description"].ToString() + "</b>";
                if (dr["elaboration"].ToString() != k.EMPTY)
                {
                    display_html = display_html + "<table>" + "<tr>" + "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" + "<td><small><i>" + dr["elaboration"].ToString() + "</i></small></td>" + "</tr>" + "</table>";
                }
                ((target) as RadioButtonList).Items.Add(new ListItem(display_html, dr["valid_next_level_code"].ToString()));
            }
            dr.Close();
            this.Close();
        }

        public void BindUncontrolledListControl(object target)
        {
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            ((target) as ListControl).Items.Add(new ListItem("-- Select --", ""));
            dr = new MySqlCommand("SELECT code, description from enrollment_level where be_hereafter_valid order by pecking_order", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["description"].ToString(), dr["code"].ToString()));
            }
            dr.Close();
            this.Close();
        }

        public string ElaborationOf(string description)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select elaboration from enrollment_level where description = \"" + description + "\"", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public string CodeOf(string description)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select code from enrollment_level where description = \"" + description + "\"", this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public string DescriptionOf(string level_code)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select description from enrollment_level where code = " + level_code, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public Queue FailureToThriveDemotionsSince(string watermark)
        {
            Queue result;
            MySqlDataReader dr;
            Queue member_id_q;
            member_id_q = new Queue();
            this.Open();
            dr = new MySqlCommand("select member_id" + " from enrollment_history" + " where id > " + watermark + " and level_code = 16" + " and end_date is null", this.connection).ExecuteReader();
            while (dr.Read())
            {
                member_id_q.Enqueue(dr["member_id"]);
            }
            dr.Close();
            this.Close();
            result = member_id_q;
            return result;
        }

        public string MakeFailureToThriveDemotions()
        {
            string result;
            string watermark;
            this.Open();
            watermark = new MySqlCommand("select max(id) from enrollment_history", this.connection).ExecuteScalar().ToString();
            // Deliberately not db_trail.Saved.
            new MySqlCommand("START TRANSACTION;" + " insert into enrollment_history (member_id,level_code,start_date,end_date)" + " SELECT member_id,16,curdate(),NULL" + " FROM enrollment_history" + " join member on (member.id=enrollment_history.member_id)" + " where level_code = 17" + " and end_date is null" + " and start_date <= date_sub(curdate(),interval 1 year)" + " and enrollment_history.id <= " + watermark + " ;" + " update enrollment_history" + " join member on (member.id=enrollment_history.member_id)" + " set end_date = curdate()" + " where level_code = 17" + " and end_date is null" + " and start_date <= date_sub(curdate(),interval 1 year)" + " and enrollment_history.id <= " + watermark + " ;" + " COMMIT", this.connection).ExecuteNonQuery();
            this.Close();
            result = watermark;
            return result;
        }

        public string MakeSeniorityPromotions()
        {
            string result;
            string watermark;
            this.Open();
            watermark = new MySqlCommand("select max(id) from enrollment_history", this.connection).ExecuteScalar().ToString();
            // Deliberately not db_trail.Saved.
            new MySqlCommand("START TRANSACTION;" + " insert into enrollment_history (member_id,level_code,start_date,end_date)" + " SELECT member_id,3,date_add(equivalent_los_start_date,interval 10 year),NULL" + " FROM enrollment_history" + " join member on (member.id=enrollment_history.member_id)" + " where level_code = 2" + " and end_date is null" + " and equivalent_los_start_date <= date_sub(curdate(),interval 10 year)" + " and enrollment_history.id <= " + watermark + " ;" + " update enrollment_history" + " join member on (member.id=enrollment_history.member_id)" + " set end_date = date_add(equivalent_los_start_date,interval 10 year)" + " where level_code = 2" + " and end_date is null" + " and equivalent_los_start_date <= date_sub(curdate(),interval 10 year)" + " and enrollment_history.id <= " + watermark + " ;" + " insert into enrollment_history (member_id,level_code,start_date,end_date)" + " SELECT member_id,4,date_add(equivalent_los_start_date,interval 20 year),NULL" + " FROM enrollment_history" + " join member on (member.id=enrollment_history.member_id)" + " where level_code = 3" + " and end_date is null" + " and equivalent_los_start_date <= date_sub(curdate(),interval 20 year)" + " and enrollment_history.id <= " + watermark + " ;" + " update enrollment_history" + " join member on (member.id=enrollment_history.member_id)" + " set end_date = date_add(equivalent_los_start_date,interval 20 year)" + " where level_code = 3" + " and end_date is null" + " and equivalent_los_start_date <= date_sub(curdate(),interval 20 year)" + " and enrollment_history.id <= " + watermark + " ;" + " COMMIT", this.connection).ExecuteNonQuery();
            this.Close();
            result = watermark;
            return result;
        }

        public uint NumObligedShifts(string description)
        {
            uint result;
            object num_obliged_shifts_obj;
            this.Open();
            num_obliged_shifts_obj = new MySqlCommand("select num_shifts from enrollment_level where description = \"" + description + "\"", this.connection).ExecuteScalar();
            if (num_obliged_shifts_obj != DBNull.Value)
            {
                result = uint.Parse(num_obliged_shifts_obj.ToString());
            }
            else
            {
                result = 0;
            }
            this.Close();
            return result;
        }

        public Queue SeniorityPromotionsSince(string watermark)
        {
            Queue result;
            MySqlDataReader dr;
            Queue member_id_q;
            member_id_q = new Queue();
            this.Open();
            dr = new MySqlCommand("select member_id" + " from enrollment_history" + " where id > " + watermark + " and level_code in (3,4)" + " and end_date is null", this.connection).ExecuteReader();
            while (dr.Read())
            {
                member_id_q.Enqueue(dr["member_id"]);
            }
            dr.Close();
            this.Close();
            result = member_id_q;
            return result;
        }

        public bool SetLevel(string new_level_code, DateTime effective_date, string note, string member_id, object e_item)
        {
            bool result;
            uint current_level_code;
            MySqlDataReader dr;
            string effective_date_string;
            DateTime latest_start_date;
            MySqlTransaction transaction;
            result = false;
            effective_date_string = effective_date.ToString("yyyy-MM-dd");
            this.Open();
            transaction = this.connection.BeginTransaction();
            try {
                // No matter what, we need to know the latest start date of the member's enrollment history because we must make sure the new
                // status does not take effect prior.  We might also need to know the current level.  Just retrieve both values.
                dr = new MySqlCommand("select start_date,level_code from enrollment_history where member_id = \"" + member_id + "\" and end_date is null limit 1", this.connection, transaction).ExecuteReader();
                dr.Read();
                latest_start_date = (DateTime)(dr["start_date"]);
                current_level_code = uint.Parse(dr["level_code"].ToString());
                dr.Close();
                if (effective_date >= latest_start_date)
                {
                    if ((new ArrayList(new int[] {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 18, 21}).Contains(uint.Parse(new_level_code))) && (DBNull.Value == new MySqlCommand("select equivalent_los_start_date from member where id = \"" + member_id + "\"", this.connection, transaction).ExecuteScalar()))
                    {
                        // This member's new status counts toward length-of-service, and the member has never had such a status before.
                        new MySqlCommand(db_trail.Saved("update member set equivalent_los_start_date = \"" + effective_date_string + "\" where id = \"" + member_id + "\""), this.connection, transaction).ExecuteNonQuery();
                    }
                    else if (new ArrayList(new int[] {11, 12, 13, 14, 15, 16, 22}).Contains(current_level_code))
                    {
                        // The member has been spending time in a status that does not count toward length-of-service, so advance the member's
                        // equivalent_los_start_date.
                        new MySqlCommand(db_trail.Saved("update member" + " set equivalent_los_start_date =" + " ADDDATE(equivalent_los_start_date,DATEDIFF(\"" + effective_date_string + "\",\"" + latest_start_date.ToString("yyyy-MM-dd") + "\"))" + " where id = \"" + member_id + "\""), this.connection, transaction).ExecuteNonQuery();
                    }
                    new MySqlCommand(db_trail.Saved("update enrollment_history" + " set end_date = \"" + effective_date_string + "\"" + " where member_id = " + member_id + " and end_date is null"), this.connection, transaction).ExecuteNonQuery();
                    new MySqlCommand(db_trail.Saved("insert enrollment_history" + " set member_id = " + member_id + " , level_code = " + new_level_code + " , start_date = \"" + effective_date_string + "\"" + " , note = \"" + note + "\""), this.connection, transaction).ExecuteNonQuery();
                    transaction.Commit();
                    ((e_item) as DataGridItem).Cells[Class_db_members_Static.TCCI_ENROLLMENT].Text = DescriptionOf(new_level_code);
                    result = true;
                }
            }
            catch {
                transaction.Rollback();
            }
            this.Close();
            return result;
        }

    } // end TClass_db_enrollment

}

namespace Class_db_enrollment.Units
{
    public class Class_db_enrollment
    {
        public const int TCCI_ID = 0;
        public const int TCCI_START_DATE = 1;
        public const int TCCI_DESCRIPTION = 2;
        public const int TCCI_NOTE = 3;
    } // end Class_db_enrollment

}

