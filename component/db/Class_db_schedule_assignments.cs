// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_schedule_assignments
  {
  public class TClass_db_schedule_assignments: TClass_db
    {
    private TClass_db_trail db_trail = null;

    public TClass_db_schedule_assignments() : base()
      {
      db_trail = new TClass_db_trail();
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(IFNULL(nominal_day,'-'),'|',IFNULL(shift_id,'-'),'|',IFNULL(post_id,'-'),'|',IFNULL(post_cardinality,'-'),'|',IFNULL(position_id,'-'),'|',IFNULL(member_id,'-'),'|',IFNULL(be_selected,'-'),'|',IFNULL(comment,'-'))";
      this.Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from schedule_assignment"
        + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
        + " order by spec",
        this.connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      this.Close();
      return ((target) as ListControl).Items.Count > 0;
      }

    public void BindDirectToListControl(object target)
      {
      this.Open();
      ((target) as ListControl).Items.Clear();
      var dr = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(IFNULL(nominal_day,'-'),'|',IFNULL(shift_id,'-'),'|',IFNULL(post_id,'-'),'|',IFNULL(post_cardinality,'-'),'|',IFNULL(position_id,'-'),'|',IFNULL(member_id,'-'),'|',IFNULL(be_selected,'-'),'|',IFNULL(comment,'-')) USING utf8) as spec"
        + " FROM schedule_assignment"
        + " order by spec",
        this.connection
        )
        .ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      this.Close();
      }

    public bool Delete(string id)
      {
      bool result;
      result = true;
      this.Open();
      try
        {
        new MySqlCommand(db_trail.Saved("delete from schedule_assignment where id = \"" + id + "\""), this.connection).ExecuteNonQuery();
        }
      catch(System.Exception e)
        {
        if (e.Message.StartsWith("Cannot delete or update a parent row: a foreign key constraint fails", true, null))
          {
          result = false;
          }
        else
          {
          throw e;
          }
        }
      this.Close();
      return result;
      }

    public bool Get
      (
      string id,
      out DateTime nominal_day,
      out string shift_id,
      out string post_id,
      out string post_cardinality,
      out string position_id,
      out string member_id,
      out bool be_selected,
      out string comment
      )
      {
      bool result;
      MySqlDataReader dr;
      //
      nominal_day = DateTime.MinValue;
      shift_id = k.EMPTY;
      post_id = k.EMPTY;
      post_cardinality = k.EMPTY;
      position_id = k.EMPTY;
      member_id = k.EMPTY;
      be_selected = false;
      comment = k.EMPTY;
      result = false;
      //
      this.Open();
      dr = new MySqlCommand("select * from schedule_assignment where CAST(id AS CHAR) = \"" + id + "\"", this.connection).ExecuteReader();
      if (dr.Read())
        {
        nominal_day = DateTime.Parse(dr["nominal_day"].ToString());
        shift_id = dr["shift_id"].ToString();
        post_id = dr["post_id"].ToString();
        post_cardinality = dr["post_cardinality"].ToString();
        position_id = dr["position_id"].ToString();
        member_id = dr["member_id"].ToString();
        be_selected = (dr["be_selected"].ToString() == "1");
        comment = dr["comment"].ToString();
        result = true;
        }
      dr.Close();
      this.Close();
      return result;
      }

    internal void Initialize()
      {
      var relative_month = 1;
      var relative_month_string = relative_month.ToString();
      Open();
      var transaction = connection.BeginTransaction();
      try
        {
        //
        // Load new availabilities from avail_sheet.
        //
        var sql = k.EMPTY;
        var next_month_abbreviation = DateTime.Now.AddMonths(relative_month).ToString("MMM");
        var i = new k.subtype<int>(0,31);
        for (; i.val < i.LAST; i.val++)
          {
          sql += k.EMPTY
          + " insert ignore into schedule_assignment (nominal_day,shift_id,post_id,member_id)"
          + " select str_to_date(concat('2011-02-','" + (i.val + 1).ToString("d2") + "'),'%Y-%m-%d') as nominal_day"
          + " , (select id from shift where name = 'DAY') as shift_id"
          + " , (select id from agency where oscar_classic_enumerator = coord_agency) as post_id"
          + " , odnmid as member_id"
          + " from avail_sheet"
          + " where month = '" + next_month_abbreviation + "'"
          +   " and d" + (i.val + 1).ToString() + " = 'AVAILABLE'"
          + ";"
          + " insert ignore into schedule_assignment (nominal_day,shift_id,post_id,member_id)"
          + " select str_to_date(concat('2011-02-','" + (i.val + 1).ToString("d2") + "'),'%Y-%m-%d') as nominal_day"
          + " , (select id from shift where name = 'NIGHT') as shift_id"
          + " , (select id from agency where oscar_classic_enumerator = coord_agency) as post_id"
          + " , odnmid as member_id"
          + " from avail_sheet"
          + " where month = '" + next_month_abbreviation + "'"
          +   " and n" + (i.val + 1).ToString() + " = 'AVAILABLE'"
          + ";";
          }
        //
        // Determine shift popularities temporary table
        //
        sql += k.EMPTY
        + " create temporary table shift_popularity"
        + " select nominal_day"
        + " , shift_id"
        + " , sum(medical_release_code_description_map.pecking_order >= 20) as num_released_members_available"
        + " , sum(medical_release_code_description_map.pecking_order >= 30) as num_als_members_available"
        + " , sum(be_driver_qualified) as num_driver_members_available"
        + " from schedule_assignment"
        +   " join member on (member.id=schedule_assignment.member_id)"
        +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
        + " group by nominal_day,shift_id"
        + " order by num_released_members_available desc,num_driver_members_available desc,num_als_members_available desc";
        //
        new MySqlCommand(db_trail.Saved(sql),connection,transaction).ExecuteNonQuery();
        //
        // Determine member flexibilities
        //
        var member_flexibility_dr = new MySqlCommand
          (
          "select member.id as member_id"
          + " , ("
          +     " count(*)"
          +     " -"
          +     " IFNULL(if((leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month_string + " MONTH))" + " and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month_string + " MONTH))),num_obliged_shifts,num_shifts) + num_extras,0)"
          +   " )"
          +   " as num_excess_avails"
          + " from schedule_assignment"
          +   " join member on (member.id=schedule_assignment.member_id)"
          + "   join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
          +   " join avail_sheet on (avail_sheet.odnmid=member.id)"
          +   " join enrollment_history on" 
          +     " (" 
          +       " enrollment_history.member_id=member.id" 
          +     " and" 
          +       " (" 
          +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month_string + " MONTH))" 
          +       " and" 
          +         " (" 
          +           " (enrollment_history.end_date is null)" 
          +         " or" 
          +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month_string + " MONTH)))" 
          +         " )" 
          +       " )" 
          +     " )" 
          +   " join enrollment_level on (enrollment_level.code=enrollment_history.level_code)" 
          +   " left join leave_of_absence on" 
          +     " (" 
          +       " leave_of_absence.member_id=member.id" 
          +     " and " 
          +       " (" 
          +         " (leave_of_absence.start_date is null)" 
          +       " or" 
          +         " (" 
          +           " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month_string + " MONTH))" 
          +         " and" 
          +           " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month_string + " MONTH)))" 
          +         " )" 
          +       " )" 
          +     " )" 
          + " where avail_sheet.month = '" + next_month_abbreviation + "'"
          +   " and medical_release_code_description_map.pecking_order >= 20"
          + " group by member.id"
          +   " having num_excess_avails > 0"
          + " order by num_excess_avails desc",
          connection,
          transaction
          )
          .ExecuteReader();
        var member_id_q = new Queue();
        var num_excess_avails_q = new Queue();
        while (member_flexibility_dr.Read())
          {
          member_id_q.Enqueue(member_flexibility_dr["member_id"].ToString());
          num_excess_avails_q.Enqueue(member_flexibility_dr["num_excess_avails"].ToString());
          }
        member_flexibility_dr.Close();
        //
        // Unselect avails from most flexible members that fall on most popular shifts
        //
        var unselectables = k.EMPTY;
        while (member_id_q.Count > 0)
          {
          var unselectables_dr = new MySqlCommand
            (
            " select schedule_assignment.id as id"
            + " from schedule_assignment"
            +   " join shift_popularity on (shift_popularity.nominal_day=schedule_assignment.nominal_day and shift_popularity.shift_id=schedule_assignment.shift_id)"
            +   " join shift on (shift.id=schedule_assignment.shift_id)"
            + " where member_id = '" + member_id_q.Dequeue() + "'"
            + " order by num_released_members_available desc, schedule_assignment.nominal_day desc, shift.start desc"
            + " limit " + num_excess_avails_q.Dequeue(),
            connection,
            transaction
            )
            .ExecuteReader();
          while (unselectables_dr.Read())
            {
            unselectables += unselectables_dr["id"].ToString() + k.COMMA;
            }
          unselectables_dr.Close();
          }
        new MySqlCommand
          (
          db_trail.Saved
            (
            "update schedule_assignment set be_selected = FALSE where be_new and id in (" + unselectables.Trim(new char[] {Convert.ToChar(k.COMMA)}) + ")"
            + ";"
            + " update schedule_assignment set be_new = FALSE"
            + ";"
            + " drop temporary table shift_popularity"
            ),
          connection,
          transaction
          )
          .ExecuteNonQuery();
        //
        transaction.Commit();
        }
      catch (Exception e)
        {
        transaction.Rollback();
        throw e;
        }
      Close();
      }

    public void Set
      (
      string id,
      DateTime nominal_day,
      string shift_id,
      string post_id,
      string post_cardinality,
      string position_id,
      string member_id,
      bool be_selected,
      string comment
      )
      {
      string childless_field_assignments_clause = k.EMPTY
      + "nominal_day = '" + nominal_day.ToString("yyyy-MM-dd") + "'"
      + " , shift_id = NULLIF('" + shift_id + "','')"
      + " , post_id = NULLIF('" + post_id + "','')"
      + " , post_cardinality = NULLIF('" + post_cardinality + "','')"
      + " , position_id = NULLIF('" + position_id + "','')"
      + " , member_id = NULLIF('" + member_id + "','')"
      + " , be_selected = NULLIF('" + be_selected.ToString() + "','')"
      + " , comment = NULLIF('" + comment + "','')"
      + k.EMPTY;
      this.Open();
      new MySqlCommand
        (
        db_trail.Saved
          (
          "insert schedule_assignment"
          + " set id = NULLIF('" + id + "','')"
          + " , " + childless_field_assignments_clause
          + " on duplicate key update "
          + childless_field_assignments_clause
          ),
          this.connection
        )
        .ExecuteNonQuery();
      this.Close();
      }

    } // end TClass_db_schedule_assignments

  }
