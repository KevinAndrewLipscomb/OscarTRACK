using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Class_db_leaves
{
    public static class Class_db_leaves_Static
    {
        public const int TCCI_ID = 0;
        public const int TCCI_START_DATE = 1;
        public const int TCCI_END_DATE = 2;
        public const int TCCI_KIND_OF_LEAVE = 3;
        public const int TCCI_NUM_SHIFTS = 4;
        public const int TCCI_NOTE = 5;
    } // end Class_db_leaves

    public class TClass_db_leaves: TClass_db
    {
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_leaves() : base()
        {
            // TODO: Add any constructor code here
            db_trail = new TClass_db_trail();
        }
        public bool BeOverlap(string member_id, string relative_start_month, string relative_end_month, string id)
        {
            bool result;
            string cmdtext;
            cmdtext = "select 1" + " from leave_of_absence" + " where" + " member_id = " + member_id + " and" + " (" + " (" + " start_date <= DATE_ADD(DATE_FORMAT(CURDATE(),\"%Y-%m-01\"),INTERVAL " + relative_start_month + " MONTH)" + " and" + " end_date >= DATE_ADD(DATE_FORMAT(CURDATE(),\"%Y-%m-01\"),INTERVAL " + relative_start_month + " MONTH)" + " )" + " or" + " (" + " start_date <= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_end_month + " MONTH))" + " and" + " end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_end_month + " MONTH))" + " )" + " )";
            if (id != k.EMPTY)
            {
                cmdtext = cmdtext + " and id <> " + id;
            }
            cmdtext = cmdtext + " limit 1";
            this.Open();
            result = (new MySqlCommand(cmdtext, this.connection).ExecuteScalar() != null);
            this.Close();
            return result;
        }

        public bool BeOverlap(string member_id, string relative_start_month, string relative_end_month)
        {
            return BeOverlap(member_id, relative_start_month, relative_end_month, "");
        }

        public void BindKindDropDownList(object target, bool use_select)
        {
            MySqlDataReader dr;
            this.Open();
            ((target) as ListControl).Items.Clear();
            if (use_select)
            {
                ((target) as ListControl).Items.Add(new ListItem("-- Select --", ""));
            }
            dr = new MySqlCommand("SELECT code,description FROM kind_of_leave_code_description_map ORDER BY description", this.connection).ExecuteReader();
            while (dr.Read())
            {
                ((target) as ListControl).Items.Add(new ListItem(dr["description"].ToString(), dr["code"].ToString()));
            }
            dr.Close();
            this.Close();
        }

        public void BindKindDropDownList(object target)
        {
            BindKindDropDownList(target, true);
        }

        public void BindMemberRecords(string member_id, string sort_order, bool be_sort_order_ascending, object target)
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
            // column 0
            // column 1
            // column 2
            // column 3
            // column 4
            // column 5
            ((target) as DataGrid).DataSource = new MySqlCommand("select leave_of_absence.id as id" + " , date_format(start_date,\"%Y-%m\") as start_date" + " , date_format(end_date,\"%Y-%m\") as end_date" + " , kind_of_leave_code_description_map.description as kind_of_leave" + " , num_obliged_shifts" + " , note" + " from leave_of_absence" + " join member on (member.id=leave_of_absence.member_id)" + " join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)" + " where member.id = " + member_id + " order by " + sort_order, this.connection).ExecuteReader();
            ((target) as DataGrid).DataBind();
            this.Close();
        }

        public void Change(string id, string new_relative_start_month, string new_relative_end_month, string new_kind_of_leave_code, string new_num_obligated_shifts, string new_note)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("update leave_of_absence" + " set start_date = DATE_ADD(DATE_FORMAT(CURDATE(),\"%Y-%m-01\"),INTERVAL " + new_relative_start_month + " MONTH)" + " , end_date = LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + new_relative_end_month + " MONTH))" + " , kind_of_leave_code = " + new_kind_of_leave_code + " , num_obliged_shifts = " + new_num_obligated_shifts + " , note = \"" + new_note + "\"" + " where id = " + id), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void Delete(string id)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("delete from leave_of_absence where id = " + id), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public void CurtailOnEffectiveDate
          (
          string member_id,
          DateTime effective_date
          )
          {
          this.Open();
          new MySqlCommand
            (
            db_trail.Saved
              (
              "START TRANSACTION;"
              + " delete from leave_of_absence where member_id = '" + member_id + "' and start_date >= '" + effective_date.ToString("yyyy-MM-dd") + "'"
              + "; "
              + " update leave_of_absence"
              + " set end_date = LAST_DAY(DATE_SUB('" + effective_date.ToString("yyyy-MM-dd") + "',INTERVAL 1 MONTH))"
              +   " , note = CONCAT(note,'  [Curtailed by " + ConfigurationManager.AppSettings["application_name"] + " due to initiation of transfer.]')"
              + " where member_id = '" + member_id + "' and end_date >= '" + effective_date.ToString("yyyy-MM-dd") + "'"
              + "; "
              + "COMMIT"
              ),
            this.connection
            )
            .ExecuteNonQuery();
          this.Close();
          }

        public void DescribeThisAndNextMonthForMember(string member_id, out string this_month_description, out string next_month_description, string null_description)
        {
            object this_month_description_obj;
            object next_month_description_obj;
            this.Open();
            this_month_description_obj = new MySqlCommand("select description" + " from leave_of_absence" + " join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)" + " where member_id = " + member_id + " and start_date <= CONCAT(DATE_FORMAT(CURDATE(),\"%Y-%m-\"),\"01\")" + " and end_date >= LAST_DAY(CURDATE())", this.connection).ExecuteScalar();
            if (this_month_description_obj == null)
            {
                this_month_description = null_description;
            }
            else
            {
                this_month_description = this_month_description_obj.ToString();
            }
            next_month_description_obj = new MySqlCommand("select description" + " from leave_of_absence" + " join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)" + " where member_id = " + member_id + " and start_date <= CONCAT(DATE_FORMAT(DATE_ADD(CURDATE(),INTERVAL 1 MONTH),\"%Y-%m-\"),\"01\")" + " and end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH))", this.connection).ExecuteScalar();
            if (next_month_description_obj == null)
            {
                next_month_description = null_description;
            }
            else
            {
                next_month_description = next_month_description_obj.ToString();
            }
            this.Close();
        }

        public string DescriptionOf(string code)
        {
            string result;
            this.Open();
            result = new MySqlCommand("SELECT description FROM kind_of_leave_code_description_map WHERE code = " + code, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public DateTime EndDateOf(string id)
        {
            DateTime result;
            this.Open();
            result = (DateTime)(new MySqlCommand("select end_date from leave_of_absence where id = " + id, this.connection).ExecuteScalar());
            this.Close();
            return result;
        }

        public string EndMonthOf(object leave_item)
        {
            string result;
            result = k.Safe(((leave_item) as DataGridItem).Cells[Class_db_leaves_Static.TCCI_END_DATE].Text, k.safe_hint_type.HYPHENATED_ALPHANUM);
            return result;
        }

        public Queue ExpireAfterDays(int n)
        {
            Queue result;
            MySqlDataReader dr;
            Queue member_id_q;
            member_id_q = new Queue();
            this.Open();
            dr = new MySqlCommand("select member_id from leave_of_absence where end_date = (CURDATE() + INTERVAL " + n.ToString() + " DAY)", this.connection).ExecuteReader();
            while (dr.Read())
            {
                member_id_q.Enqueue(dr["member_id"]);
            }
            dr.Close();
            this.Close();
            result = member_id_q;
            return result;
        }

        public void Grant(string member_id, string relative_start_month, string relative_end_month, string kind_of_leave_code, string num_obligated_shifts, string note)
        {
            this.Open();
            new MySqlCommand(db_trail.Saved("insert into leave_of_absence" + " set member_id = " + member_id + " , kind_of_leave_code = " + kind_of_leave_code + " , start_date = DATE_ADD(DATE_FORMAT(CURDATE(),\"%Y-%m-01\"),INTERVAL " + relative_start_month + " MONTH)" + " , end_date = LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_end_month + " MONTH))" + " , num_obliged_shifts = " + num_obligated_shifts + " , note = \"" + note + "\""), this.connection).ExecuteNonQuery();
            this.Close();
        }

        public string IdOf(object leave_item)
        {
            string result;
            result = k.Safe(((leave_item) as DataGridItem).Cells[Class_db_leaves_Static.TCCI_ID].Text, k.safe_hint_type.NUM);
            return result;
        }

        public string KindOf(object leave_item)
        {
            string result;
            result = k.Safe(((leave_item) as DataGridItem).Cells[Class_db_leaves_Static.TCCI_KIND_OF_LEAVE].Text, k.safe_hint_type.ALPHA);
            return result;
        }

        public string KindOfLeaveCodeOf(string id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select kind_of_leave_code from leave_of_absence where id = " + id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public string MemberIdOf(string id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select member_id from leave_of_absence where id = " + id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public string NoteOf(string id)
        {
            string result;
            this.Open();
            result = new MySqlCommand("select note from leave_of_absence where id = " + id, this.connection).ExecuteScalar().ToString();
            this.Close();
            return result;
        }

        public string NoteOfTcc(object leave_item)
        {
            string result;
            if (((leave_item) as DataGridItem).Cells[Class_db_leaves_Static.TCCI_NOTE].Text == "&nbsp;")
            {
                result = k.EMPTY;
            }
            else
            {
                result = k.Safe(((leave_item) as DataGridItem).Cells[Class_db_leaves_Static.TCCI_NOTE].Text, k.safe_hint_type.PUNCTUATED);
            }
            return result;
        }

        public uint NumObligedShiftsOf(string id)
        {
            uint result;
            this.Open();
            result = uint.Parse(new MySqlCommand("select num_obliged_shifts from leave_of_absence where id = " + id, this.connection).ExecuteScalar().ToString());
            this.Close();
            return result;
        }

        public string NumObligedShiftsOfTcc(object leave_item)
        {
            string result;
            result = k.Safe(((leave_item) as DataGridItem).Cells[Class_db_leaves_Static.TCCI_NUM_SHIFTS].Text, k.safe_hint_type.NUM);
            return result;
        }

        public DateTime StartDateOf(string id)
        {
            DateTime result;
            this.Open();
            result = (DateTime)(new MySqlCommand("select start_date from leave_of_absence where id = " + id, this.connection).ExecuteScalar());
            this.Close();
            return result;
        }

        public string StartMonthOf(object leave_item)
        {
            string result;
            result = k.Safe(((leave_item) as DataGridItem).Cells[Class_db_leaves_Static.TCCI_START_DATE].Text, k.safe_hint_type.HYPHENATED_ALPHANUM);
            return result;
        }

        public uint TcciOfId()
        {
            uint result;
            result = Class_db_leaves_Static.TCCI_ID;
            return result;
        }

    } // end TClass_db_leaves

}