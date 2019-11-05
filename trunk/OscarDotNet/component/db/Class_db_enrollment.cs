using Class_db;
using Class_db_agencies;
using Class_db_members;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Class_db_enrollment
{

    public class TClass_db_enrollment: TClass_db
    {
        private TClass_db_agencies db_agencies = null;
        private TClass_db_trail db_trail = null;
        //Constructor  Create()
        public TClass_db_enrollment() : base()
        {
            // TODO: Add any constructor code here
            db_agencies = new TClass_db_agencies();
            db_trail = new TClass_db_trail();
        }

        internal bool BeCoreOpsCommitted(string enrollment_level_code)
          {
          Open();
          var be_core_ops_committed = "1" == new MySqlCommand
            (
            "select core_ops_commitment_level.name <> 'None'"
            + " from enrollment_level"
            +   " join core_ops_commitment_level on (core_ops_commitment_level.code=enrollment_level.core_ops_commitment_level_code)"
            + " where enrollment_level.code = '" + enrollment_level_code + "'",
            connection
            )
            .ExecuteScalar().ToString();
          Close();
          return be_core_ops_committed;
          }

    public void BindDeparturesEffectiveToday(object target)
      {
      Open();
      ((target) as DataGrid).DataSource = new MySqlCommand
        (
        "SELECT CONCAT(agency.long_designator,' ',former_level.description,' member ',first_name,' ',last_name,' (CAD# ',cad_num,', ',medical_release_code_description_map.description,') has transitioned to the *',current_level.description,'* status effective today.') as departure"
        + " FROM enrollment_history as current"
        +   " join enrollment_history as former on (former.member_id=current.member_id and former.end_date=current.start_date)"
        +   " join enrollment_level as current_level on (current_level.code=current.level_code)"
        +   " join enrollment_level as former_level on (former_level.code=former.level_code)"
        +   " join member on (member.id=current.member_id)"
        +   " join agency on (agency.id=member.agency_id)"
        +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        + " where current.start_date = CURDATE()"
        +   " and current.end_date is null"
        +   " and current_level.pecking_order >= 100",
        connection
        )
        .ExecuteReader();
      ((target) as DataGrid).DataBind();
      Close();
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
      Open();
      ((target) as RadioButtonList).Items.Clear();
      var dr = new MySqlCommand
        (
        "SELECT DISTINCT valid_next_level_code"
        + " , description"
        + " , elaboration"
        + " FROM enrollment_transition"
        +   " join enrollment_level on (enrollment_level.code=enrollment_transition.valid_next_level_code)"
        + " where current_level_code ="
        +     " ("
        +     " select level_code"
        +     " from enrollment_history"
        +     " where member_id = '" + member_id + "'"
        +     " order by start_date desc, end_date limit 1"
        +     " )"
        +   " and"
        +     " ("
        +       " (required_historical_level_code is null)"
        +     " or"
        +       " ("
        +       " required_historical_level_code in"
        +         " ("
        +         " select DISTINCT level_code"
        +         " from enrollment_history"
        +         " where member_id = '" + member_id + "'"
        +         " )"
        +       " )"
        +     " )"
        +   " and"
        +     " ("
        +       " (disallowed_historical_level_code is null)"
        +     " or"
        +       " ("
        +       " disallowed_historical_level_code not in"
        +         " ("
        +         " select DISTINCT level_code"
        +         " from enrollment_history"
        +         " where member_id = '" + member_id + "'"
        +         " )"
        +       " )"
        +     " )"
        +   " and"
        +     " authorized_tier_id >= '" + tier_id + "'"
        + " order by pecking_order",
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as RadioButtonList).Items.Add
          (
          item:new ListItem
            (
            text:"<b>" + dr["description"].ToString() + "</b>"
              + (dr["elaboration"].ToString().Length > 0 ? "<table><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><small><i>" + dr["elaboration"].ToString() + "</i></small></td></tr></table>" : k.EMPTY),
            value:dr["valid_next_level_code"].ToString()
            )
          );
        }
      dr.Close();
      Close();
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

        public void CurrentDescriptionAndEffectiveDateForMember
          (
          string member_id,
          out string description,
          out DateTime effective_date
          )
          {
          Open();
          var dr =
            (
            new MySqlCommand
              (
              "select description"
              + " , IF(IFNULL(start_date,'0000-00-00') = '0000-00-00','0001-01-01',start_date) as start_date"
              + " from enrollment_history"
              +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)"
              + " where member_id = '" + member_id + "'"
              + " order by start_date desc, id desc"
              + " limit 1",
              connection
              )
              .ExecuteReader()
            );
          dr.Read();
          description = dr["description"].ToString();
          effective_date = DateTime.Parse(dr["start_date"].ToString());
          Close();
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
            new MySqlCommand
              (
              "START TRANSACTION"
              + ";"
              + " insert into enrollment_history (member_id,level_code,start_date,end_date)"
              + " SELECT member_id,(select code from enrollment_level where description = 'Life'),IF(date_add(equivalent_los_start_date,interval 10 year) > start_date,date_add(equivalent_los_start_date,interval 10 year),start_date),NULL"
              + " FROM enrollment_history"
              +   " join member on (member.id=enrollment_history.member_id)"
              + " where level_code = (select code from enrollment_level where description = 'Regular')"
              +   " and end_date is null"
              +   " and equivalent_los_start_date <= date_sub(curdate(),interval 10 year)"
              +   " and enrollment_history.id <= " + watermark
              + ";"
              + " update enrollment_history"
              +   " join member on (member.id=enrollment_history.member_id)"
              + " set end_date = IF(date_add(equivalent_los_start_date,interval 10 year) > start_date,date_add(equivalent_los_start_date,interval 10 year),start_date)"
              + " where level_code = (select code from enrollment_level where description = 'Regular')"
              +   " and end_date is null"
              +   " and equivalent_los_start_date <= date_sub(curdate(),interval 10 year)"
              +   " and enrollment_history.id <= " + watermark
              + ";"
              + " insert into enrollment_history (member_id,level_code,start_date,end_date)"
              + " SELECT member_id,(select code from enrollment_level where description = 'Senior'),IF(date_add(equivalent_los_start_date,interval 20 year) > start_date,date_add(equivalent_los_start_date,interval 20 year),start_date),NULL"
              + " FROM enrollment_history"
              +   " join member on (member.id=enrollment_history.member_id)"
              + " where level_code = (select code from enrollment_level where description = 'Life')"
              +   " and end_date is null"
              +   " and equivalent_los_start_date <= date_sub(curdate(),interval 20 year)"
              +   " and enrollment_history.id <= " + watermark
              + ";"
              + " update enrollment_history"
              +   " join member on (member.id=enrollment_history.member_id)"
              + " set end_date = IF(date_add(equivalent_los_start_date,interval 20 year) > start_date,date_add(equivalent_los_start_date,interval 20 year),start_date)"
              + " where level_code = (select code from enrollment_level where description = 'Life')"
              +   " and end_date is null"
              +   " and equivalent_los_start_date <= date_sub(curdate(),interval 20 year)"
              +   " and enrollment_history.id <= " + watermark
              + ";"
              + " insert into enrollment_history (member_id,level_code,start_date,end_date)"
              + " SELECT member_id,(select code from enrollment_level where description = 'Tenured BLS'),IF(date_add(equivalent_los_start_date,interval 30 year) > start_date,date_add(equivalent_los_start_date,interval 30 year),start_date),NULL"
              + " FROM enrollment_history"
              +   " join member on (member.id=enrollment_history.member_id)"
              +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
              + " where level_code = (select code from enrollment_level where description = 'Senior')"
              +   " and pecking_order < (select pecking_order from medical_release_code_description_map where description = 'EMT-CT')"
              +   " and end_date is null"
              +   " and equivalent_los_start_date <= date_sub(curdate(),interval 30 year)"
              +   " and enrollment_history.id <= " + watermark
              + ";"
              + " insert into enrollment_history (member_id,level_code,start_date,end_date)"
              + " SELECT member_id,(select code from enrollment_level where description = 'Tenured ALS'),IF(date_add(equivalent_los_start_date,interval 30 year) > start_date,date_add(equivalent_los_start_date,interval 30 year),start_date),NULL"
              + " FROM enrollment_history"
              +   " join member on (member.id=enrollment_history.member_id)"
              +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
              + " where level_code = (select code from enrollment_level where description = 'Senior')"
              +   " and pecking_order >= (select pecking_order from medical_release_code_description_map where description = 'EMT-CT')"
              +   " and end_date is null"
              +   " and equivalent_los_start_date <= date_sub(curdate(),interval 30 year)"
              +   " and enrollment_history.id <= " + watermark
              + ";"
              + " update enrollment_history"
              +   " join member on (member.id=enrollment_history.member_id)"
              + " set end_date = IF(date_add(equivalent_los_start_date,interval 30 year) > start_date,date_add(equivalent_los_start_date,interval 30 year),start_date)"
              + " where level_code = (select code from enrollment_level where description = 'Senior')"
              +   " and end_date is null"
              +   " and equivalent_los_start_date <= date_sub(curdate(),interval 30 year)"
              +   " and enrollment_history.id <= " + watermark
              + ";"
              + " COMMIT",
              connection
              )
              .ExecuteNonQuery();
            this.Close();
            result = watermark;
            return result;
        }

    internal Queue<string> NearlyPromotableMembers()
      {
      var member_id_q = new Queue<string>();
      MySqlDataReader dr;
      Open();
      //
      // Regular members approaching Life status
      //
      dr = new MySqlCommand
        (
        "select member_id"
        + " FROM enrollment_history"
        +   " join member on (member.id=enrollment_history.member_id)"
        + " where level_code = (select code from enrollment_level where description = 'Regular')"
        +   " and end_date is null"
        +   " and equivalent_los_start_date = date_sub(curdate(),interval 119 month)", // one month shy of 10 years
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        member_id_q.Enqueue(dr["member_id"].ToString());
        }
      dr.Close();
      //
      // Life members approaching Senior status
      //
      dr = new MySqlCommand
        (
        "select member_id"
        + " FROM enrollment_history"
        +   " join member on (member.id=enrollment_history.member_id)"
        + " where level_code = (select code from enrollment_level where description = 'Life')"
        +   " and end_date is null"
        +   " and equivalent_los_start_date = date_sub(curdate(),interval 239 month)", // one month shy of 20 years
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        member_id_q.Enqueue(dr["member_id"].ToString());
        }
      dr.Close();
      //
      // Senior members approaching Tenured status
      //
      dr = new MySqlCommand
        (
        "select member_id"
        + " FROM enrollment_history"
        +   " join member on (member.id=enrollment_history.member_id)"
        + " where level_code = (select code from enrollment_level where description = 'Senior')"
        +   " and end_date is null"
        +   " and equivalent_los_start_date = date_sub(curdate(),interval 359 month)", // one month shy of 30 years
        connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        member_id_q.Enqueue(dr["member_id"].ToString());
        }
      dr.Close();
      //
      Close();
      return member_id_q;
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
          var member_id_q = new Queue();
          Open();
          var dr = new MySqlCommand
            (
            "select member_id"
            + " from enrollment_history"
            +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)"
            + " where id > " + watermark
            +   " and description in ('Life','Senior','Tenured BLS','Tenured ALS')"
            +   " and end_date is null",
            connection
            )
            .ExecuteReader();
          while (dr.Read())
            {
            member_id_q.Enqueue(dr["member_id"]);
            }
          dr.Close();
          Close();
          return member_id_q;
          }

        public bool SetLevel(string new_level_code, DateTime effective_date, string note, string member_id, object summary)
          {
          return SetLevel(new_level_code,effective_date,note,member_id,summary,k.EMPTY);
          }
        public bool SetLevel(string new_level_code, DateTime effective_date, string note, string member_id, object summary, string target_agency_id)
        {
            uint current_level_code;
            MySqlDataReader dr;
            DateTime latest_start_date;
            MySqlTransaction transaction;
            var result = false;
            var effective_date_string = effective_date.ToString("yyyy-MM-dd");
            Open();
            transaction = connection.BeginTransaction();
            try {
                // No matter what, we need to know the latest start date of the member's enrollment history because we must make sure the new
                // status does not take effect prior.  We might also need to know the current level.  Just retrieve both values.
                dr = new MySqlCommand
                  (
                  "select DATE_FORMAT(start_date,'%Y-%m-%d') as start_date"
                  + " , level_code"
                  + " from enrollment_history"
                  + " where member_id = '" + member_id + "'"
                  +   " and end_date is null"
                  + " limit 1",
                  connection,
                  transaction
                  )
                  .ExecuteReader();
                dr.Read();
                var start_date_string = dr["start_date"].ToString();
                latest_start_date = (start_date_string == "0000-00-00" ? effective_date : DateTime.Parse(start_date_string));
                current_level_code = uint.Parse(dr["level_code"].ToString());
                dr.Close();
                if (effective_date >= latest_start_date)
                {
                    if ((new ArrayList(new uint[] {1, 2, 3, 4, 5, 6, 7, 8, 9, 18, 23, 24, 25, 28}).Contains(uint.Parse(new_level_code))) && (DBNull.Value == new MySqlCommand("select equivalent_los_start_date from member where id = \"" + member_id + "\"", connection, transaction).ExecuteScalar()))
                    {
                        // This member's new status counts toward length-of-service, and the member has never had such a status before.
                        new MySqlCommand(db_trail.Saved("update member set equivalent_los_start_date = \"" + effective_date_string + "\" where id = \"" + member_id + "\""), connection, transaction).ExecuteNonQuery();
                    }
                    else if (new ArrayList(new uint[] {10, 11, 12, 13, 14, 15, 16, 22}).Contains(current_level_code))
                    {
                        // The member has been spending time in a status that does not count toward length-of-service, so advance the member's
                        // equivalent_los_start_date.
                        new MySqlCommand(db_trail.Saved("update member" + " set equivalent_los_start_date =" + " ADDDATE(equivalent_los_start_date,DATEDIFF(\"" + effective_date_string + "\",\"" + latest_start_date.ToString("yyyy-MM-dd") + "\"))" + " where id = \"" + member_id + "\""), connection, transaction).ExecuteNonQuery();
                    }
                    new MySqlCommand(db_trail.Saved("update enrollment_history" + " set end_date = \"" + effective_date_string + "\"" + " where member_id = " + member_id + " and end_date is null"), connection, transaction).ExecuteNonQuery();
                    new MySqlCommand(db_trail.Saved("insert enrollment_history" + " set member_id = " + member_id + " , level_code = " + new_level_code + " , start_date = \"" + effective_date_string + "\"" + " , note = \"" + note + "\""), connection, transaction).ExecuteNonQuery();
                    var ok_so_far = true;
                    var be_member_squad_affiliation_weak = (new ArrayList(new uint[] {11,12,14,15,16,20,22}).Contains(current_level_code));
                    if (be_member_squad_affiliation_weak && !(new_level_code == "13"))
                      {
                      //
                      // A transfer is being completed.
                      //
                      ok_so_far = (target_agency_id != k.EMPTY);
                      new MySqlCommand(db_trail.Saved("update member set agency_id = '" + target_agency_id + "' where id = '" + member_id + "'"), connection, transaction).ExecuteNonQuery();
                      }
                    if ((new ArrayList(new string[] {"11","12","13","14","15","16","20","22"}).Contains(new_level_code)))
                      {
                      //
                      // A transfer or past status is being initiated.  Curtail any existing leave and cancel any future ones.  
                      //
                      new MySqlCommand(db_trail.Saved("delete from leave_of_absence where member_id = '" + member_id + "' and start_date >= '" + effective_date.ToString("yyyy-MM-dd") + "'"),connection,transaction).ExecuteNonQuery();
                      new MySqlCommand
                        (
                        db_trail.Saved
                          (
                          "update leave_of_absence"
                          + " set end_date = LAST_DAY(DATE_SUB('" + effective_date.ToString("yyyy-MM-dd") + "',INTERVAL 1 MONTH))"
                          +   " , note = LEFT(CONCAT(note,'  [Curtailed by " + ConfigurationManager.AppSettings["application_name"] + " due to movement into a Transfer or Past status.]'),127)"
                          + " where member_id = '" + member_id + "' and end_date >= '" + effective_date.ToString("yyyy-MM-dd") + "'"
                          ),
                        connection,
                        transaction
                        )
                        .ExecuteNonQuery();
                      }
                    if (ok_so_far)
                      {
                      transaction.Commit();
                      (summary as member_summary).enrollment = DescriptionOf(new_level_code);
                      if (be_member_squad_affiliation_weak)
                        {
                        (summary as member_summary).agency = db_agencies.ShortDesignatorOf(target_agency_id);
                        }
                      result = true;
                      }
                }
            }
            catch {
                transaction.Rollback();
            }
            Close();
            return result;
        }

    } // end TClass_db_enrollment

}
