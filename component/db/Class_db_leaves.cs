using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Class_db_leaves
{
    public static class Class_db_leaves_Static
    {
    public const int TCCI_BE_CANONICAL = 0;
    public const int TCCI_ID = 1;
    public const int TCCI_START_DATE = 2;
    public const int TCCI_END_DATE = 3;
    public const int TCCI_KIND_OF_LEAVE = 4;
    public const int TCCI_NUM_SHIFTS = 5;
    public const int TCCI_NOTE = 6;
    public const int TCCI_EDIT = 7;
    public const int TCCI_DELETE = 8;
    }

  internal class expire_after_days_rec_class
    {
    internal string member_id = k.EMPTY;
    internal string kind_of_leave = k.EMPTY;
    }

  internal class medical_expiring_this_month_rec_class
    {
    internal string id = k.EMPTY;
    internal string member_id = k.EMPTY;
    internal string start_month = k.EMPTY;
    internal string note = k.EMPTY;
    }

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

    internal Queue<medical_expiring_this_month_rec_class> MedicalExpiringThisMonthRecQ()
      {
      var medical_expiring_this_month_rec_q = new Queue<medical_expiring_this_month_rec_class>();
      Open();
      var dr = new MySqlCommand
        (
        "select id"
        + " , member_id"
        + " , PERIOD_DIFF(DATE_FORMAT(start_date,'%Y%m'),DATE_FORMAT(CURDATE(),'%Y%m')) as start_month"
        + " , note"
        + " from leave_of_absence"
        +   " join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)"
        + " where description = 'Medical'"
        +   " and end_date = LAST_DAY(CURDATE())",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        var medical_expiring_this_month_rec = new medical_expiring_this_month_rec_class();
        medical_expiring_this_month_rec.id = dr["id"].ToString();
        medical_expiring_this_month_rec.member_id = dr["member_id"].ToString();
        medical_expiring_this_month_rec.start_month = dr["start_month"].ToString();
        medical_expiring_this_month_rec.note = dr["note"].ToString();
        medical_expiring_this_month_rec_q.Enqueue(medical_expiring_this_month_rec);
        }
      dr.Close();
      Close();
      return medical_expiring_this_month_rec_q;
      }

    public void BindKindDropDownList(object target)
        {
            BindKindDropDownList(target, true);
        }

    public void BindMemberRecords
      (
      string member_id,
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      Open();
      ((target) as DataGrid).DataSource = new MySqlCommand
        (
        "select be_canonical,id,start_date,end_date,specific_end_date,kind_of_leave,num_obliged_shifts,note from"
        + " ("
        +   " ("
        +   " select TRUE as be_canonical"
        +   " , leave_of_absence.id as id"
        +   " , date_format(start_date,'%Y-%m') as start_date"
        +   " , date_format(end_date,'%Y-%m') as end_date"
        +   " , kind_of_leave_code_description_map.description as kind_of_leave"
        +   " , num_obliged_shifts"
        +   " , note"
        +   " , start_date as specific_start_date"
        +   " , end_date as specific_end_date"
        +   " from leave_of_absence"
        +     " join member on (member.id=leave_of_absence.member_id)"
        +     " join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)"
        +   " where member.id = '" + member_id + "'"
        +   " )"
        +   " UNION"
        +   " ("
        +   " select FALSE as be_canonical"
        +   " , '' as id"
        +   " , date_format(start_date,'%Y-%m-%d') as start_date"
        +   " , date_format(end_date,'%Y-%m-%d') as end_date"
        +   " , kind_of_leave_code_description_map.description as kind_of_leave"
        +   " , num_obliged_shifts"
        +   " , note"
        +   " , start_date as specific_start_date"
        +   " , end_date as specific_end_date"
        +   " from mid_cycle_leave"
        +     " join member on (member.id=mid_cycle_leave.member_id)"
        +     " join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=mid_cycle_leave.kind_of_leave_code)"
        +   " where member.id = '" + member_id + "'"
        +   " )"
        + " ) as all_leave_records"
        + " order by " + sort_order.Replace("%",(be_sort_order_ascending ? " asc" : " desc")),
        connection
        )
        .ExecuteReader();
      ((target) as DataGrid).DataBind();
      Close();
      }

    public void Change
      (
      string id,
      string new_relative_start_month,
      string new_relative_end_month,
      string new_kind_of_leave_code,
      string new_num_obligated_shifts,
      string new_note
      )
      {
      var common_new_end_date_phrase = "LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + new_relative_end_month + " MONTH))";
      var main_sql = k.EMPTY
      + " update leave_of_absence"
      + " set start_date = DATE_ADD(DATE_FORMAT(CURDATE(),'%Y-%m-01'),INTERVAL " + new_relative_start_month + " MONTH)"
      + " , end_date = " + common_new_end_date_phrase
      + " , kind_of_leave_code = '" + new_kind_of_leave_code + "'"
      + " , num_obliged_shifts = '" + new_num_obligated_shifts + "'"
      + " , note = '" + new_note + "'"
      + " where id = '" + id + "'"
      + ";";
      var manage_mid_cycle_start_sql = k.EMPTY;
      var manage_mid_cycle_end_sql = k.EMPTY;
      Open();
      //
      // Manage mid-cycle start.
      //
      if(
          (new MySqlCommand("select date_format(start_date,'%Y-%m') from leave_of_absence where id = '" + id + "'",connection).ExecuteScalar().ToString().CompareTo(DateTime.Today.ToString("yyyy-MM")) > 0)
        &&
          (new_relative_start_month == "0")
        &&
          (DateTime.Today.Day > 1)
        )
      //then
        {
        manage_mid_cycle_start_sql = k.EMPTY
        + " insert into mid_cycle_leave (member_id,kind_of_leave_code,start_date,end_date,num_obliged_shifts,note)"
        + " select member_id"
        + " , kind_of_leave_code"
        + " , CURDATE() as start_date"
        + " , end_date"
        + " , num_obliged_shifts"
        + " , note"
        + " from leave_of_absence"
        + " where id = '" + id + "'"
        + ";";
        }
      //
      // Manage mid-cycle end.
      //
      var linked_mid_cycle_leave_id_obj = new MySqlCommand("select mid_cycle_leave.id from leave_of_absence join mid_cycle_leave using (member_id,end_date) where leave_of_absence.id = '" + id + "'",connection).ExecuteScalar();
      if (linked_mid_cycle_leave_id_obj != null)
        {
        manage_mid_cycle_end_sql = k.EMPTY
        + " update mid_cycle_leave"
        + " set num_obliged_shifts = '" + new_num_obligated_shifts + "'"
        + " , end_date = " + common_new_end_date_phrase
        + " where id = '" + linked_mid_cycle_leave_id_obj.ToString() + "'"
        + ";";
        }
      //
      // Execute
      //
      new MySqlCommand
        (
        db_trail.Saved
          (
          "START TRANSACTION;"
          + manage_mid_cycle_start_sql
          + manage_mid_cycle_end_sql
          + main_sql
          + " COMMIT"
          ),
        connection
        )
        .ExecuteNonQuery();
      Close();
      }

    internal void ClearImmediately(string id)
      {
      var common_new_end_date_phrase = "DATE_ADD(CURDATE(),INTERVAL -1 DAY)";
      var main_sql = k.EMPTY
      + " update leave_of_absence"
      + " set end_date = " + common_new_end_date_phrase
      + " where id = '" + id + "'"
      + ";";
      var manage_mid_cycle_end_sql = k.EMPTY;
      Open();
      //
      // Manage mid-cycle end.
      //
      var linked_mid_cycle_leave_id_obj = new MySqlCommand("select mid_cycle_leave.id from leave_of_absence join mid_cycle_leave using (member_id,end_date) where leave_of_absence.id = '" + id + "'",connection).ExecuteScalar();
      if (linked_mid_cycle_leave_id_obj != null)
        {
        manage_mid_cycle_end_sql = k.EMPTY
        + " update mid_cycle_leave"
        + " set end_date = " + common_new_end_date_phrase
        + " where id = '" + linked_mid_cycle_leave_id_obj.ToString() + "'"
        + ";";
        }
      //
      // Execute
      //
      new MySqlCommand
        (
        db_trail.Saved
          (
          "START TRANSACTION;"
          + manage_mid_cycle_end_sql
          + main_sql
          + " COMMIT"
          ),
        connection
        )
        .ExecuteNonQuery();
      Close();
      }

    public void Delete(string id)
      {
      var mid_sql_prefix = k.EMPTY;
      Open();
      if(
          (DateTime.Today.AddDays(1).Day > 1) // today is not already the last day of the month
        &&
          (new MySqlCommand("select 1 from leave_of_absence where id = '" + id + "' and date_format(start_date,'%Y-%m') = date_format(CURDATE(),'%Y-%m')",connection).ExecuteScalar() != null)
            // the specified leave started this month
        )
      //then
        {
        //
        // This is a mid-cycle leave event.
        //
        mid_sql_prefix = "START TRANSACTION;";
        if (null == new MySqlCommand("select id from mid_cycle_leave where CURDATE() between start_date and end_date",connection).ExecuteScalar())
          {
          //
          // This was not previously a mid-cycle leave event.  We must create a new such event.
          //
          mid_sql_prefix += k.EMPTY
          + " insert into mid_cycle_leave (member_id,kind_of_leave_code,start_date,end_date,num_obliged_shifts,note)"
          + " select member_id"
          + " , kind_of_leave_code"
          + " , start_date"
          + " , ADDDATE(CURDATE(),INTERVAL -1 DAY) as end_date"
          + " , num_obliged_shifts"
          + " , note"
          + " from leave_of_absence"
          + " where id = '" + id + "'";
          }
        else
          {
          //
          // This affects an existing mid-cycle leave event.  We must update it.
          //
          mid_sql_prefix += k.EMPTY
          + " update mid_cycle_leave set end_date = ADDDATE(CURDATE(),INTERVAL -1 DAY) where CURDATE() between start_date and end_date"
          + ";"
          + " delete from mid_cycle_leave where start_date > end_date"; // Catches cases of -1 day long leaves that result from use of ADDDATE(~,-1) above.
          }
        mid_sql_prefix += ";";
        }
      new MySqlCommand(db_trail.Saved(mid_sql_prefix + " delete from leave_of_absence where id = '" + id + "'" + (mid_sql_prefix.Length > 0 ? "; COMMIT" : k.EMPTY)),connection).ExecuteNonQuery();
      Close();
      }


    public void CurtailOnEffectiveDate
          (
          string member_id,
          DateTime effective_date,
          string due_to_phrase
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
              +   " , note = CONCAT(note,'  [Curtailed by " + ConfigurationManager.AppSettings["application_name"] + " due to " + due_to_phrase + ".]')"
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
      Open();
      var this_month_description_obj = new MySqlCommand
        (
        "select CONCAT(description,IF(num_obliged_shifts = '0',' Lv',CONCAT(' rdx (',num_obliged_shifts,')'))) as description"
        + " from leave_of_absence"
        +   " join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)"
        + " where member_id = '" + member_id + "'"
        +   " and start_date <= CONCAT(DATE_FORMAT(CURDATE(),'%Y-%m-'),'01')"
        +   " and end_date >= LAST_DAY(CURDATE())",
        connection
        )
        .ExecuteScalar();
      this_month_description = (this_month_description_obj == null ? null_description : this_month_description_obj.ToString());
      var next_month_description_obj = new MySqlCommand
        (
        "select CONCAT(description,IF(num_obliged_shifts = '0',' Lv',CONCAT(' rdx (',num_obliged_shifts,')'))) as description"
        + " from leave_of_absence"
        +   " join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)"
        + " where member_id = '" + member_id + "'"
        +   " and start_date <= CONCAT(DATE_FORMAT(DATE_ADD(CURDATE(),INTERVAL 1 MONTH),'%Y-%m-'),'01')"
        +   " and end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH))",
        connection
        )
        .ExecuteScalar();
      next_month_description = (next_month_description_obj == null ? null_description : next_month_description_obj.ToString());
      Close();
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

    internal Queue<expire_after_days_rec_class> ExpireAfterDays(int n)
      {
      var expire_after_days_rec_q = new Queue<expire_after_days_rec_class>();
      Open();
      var dr = new MySqlCommand
        (
        "select member_id"
        + " , description as kind_of_leave"
        + " from leave_of_absence"
        +   " join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)"
        + " where end_date = (CURDATE() + INTERVAL " + n.ToString() + " DAY)",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        var expire_after_days_rec = new expire_after_days_rec_class();
        expire_after_days_rec.member_id = dr["member_id"].ToString();
        expire_after_days_rec.kind_of_leave = dr["kind_of_leave"].ToString();
        expire_after_days_rec_q.Enqueue(expire_after_days_rec);
        }
      dr.Close();
      Close();
      return expire_after_days_rec_q;
      }

    public void Grant
      (
      string member_id,
      string relative_start_month,
      string relative_end_month,
      string kind_of_leave_code,
      string num_obligated_shifts,
      string note
      )
      {
      var sql = k.EMPTY
      + " insert into leave_of_absence"
      + " set member_id = '" + member_id + "'"
      + " , kind_of_leave_code = '" + kind_of_leave_code + "'"
      + " , start_date = DATE_ADD(DATE_FORMAT(CURDATE(),'%Y-%m-01'),INTERVAL " + relative_start_month + " MONTH)"
      + " , end_date = LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_end_month + " MONTH))"
      + " , num_obliged_shifts = '" + num_obligated_shifts + "'"
      + " , note = '" + note + "'";
      if ((relative_start_month == "0") && (DateTime.Today.Day > 1))
        {
        sql = k.EMPTY
        + "START TRANSACTION"
        + ";"
        + sql
        + ";"
        + " insert into mid_cycle_leave"
        + " set member_id = '" + member_id + "'"
        + " , kind_of_leave_code = '" + kind_of_leave_code + "'"
        + " , start_date = CURDATE()"
        + " , end_date = LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_end_month + " MONTH))"
        + " , num_obliged_shifts = '" + num_obligated_shifts + "'"
        + " , note = '" + note + "'"
        + ";"
        + " COMMIT";
        }
      Open();
      new MySqlCommand(db_trail.Saved(sql),connection).ExecuteNonQuery();
      Close();
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