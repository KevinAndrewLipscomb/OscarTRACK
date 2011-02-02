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

    internal void BindBaseDataList
      (
      string agency_filter,
      string release_filter,
      string depth_filter,
      k.subtype<int> relative_month,
      object target,
      ref k.int_nonnegative num_members,
      ref k.decimal_nonnegative num_crew_shifts
      )
      {
      var agency_condition_clause = k.EMPTY;
      if (agency_filter != k.EMPTY)
        {
        agency_condition_clause = " and agency_id = '" + agency_filter + "'";
        }
      var release_condition_clause = k.EMPTY;
      if (release_filter == "1")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order >= 20";
        }
      else if (release_filter == "0")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order < 20";
        }
      var depth_condition_clause = k.EMPTY;
      if (depth_filter == "1")
        {
        depth_condition_clause = " and be_selected";
        }
      else if (depth_filter == "0")
        {
        depth_condition_clause = " and not be_selected";
        }
      var common_initial_field_list = k.EMPTY
      + " , num_units.from_agency as num_units_from_agency"
      + " , num_units.citywide as num_units_citywide"
      + " , schedule_assignment.id as assignment_id"
      + " , post_id"
      + " , IF(be_selected,CAST(CHAR(ASCII('a') + post_cardinality - 1) as CHAR),'') as post_cardinality"
      + " , short_designator as agency_short_designator"
      + " , member_id"
      + " , watchbill_rendition as medical_release_description"
      + " , concat(last_name,', ',first_name) as name"
      + " , IF(medical_release_code_description_map.pecking_order >= 20,IF(be_driver_qualified,'','�'),'') as be_driver_qualified"
      + " , be_selected"
      + " , IFNULL(comment,'') as comment";
      var common_from_where_clause = k.EMPTY
      + " from schedule_assignment"
      +   " join agency on (agency.id=schedule_assignment.post_id)"
      +   " join member on (member.id=schedule_assignment.member_id)"
      +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
      +   " join shift on (shift.id=schedule_assignment.shift_id)"
      +   " join num_units on (num_units.nominal_day=schedule_assignment.nominal_day and num_units.shift_id=schedule_assignment.shift_id)"
      + " where MONTH(schedule_assignment.nominal_day) = MONTH(CURDATE()) + " + relative_month.val
      +     agency_condition_clause;
      var common_initial_from_where_clause = common_from_where_clause + release_condition_clause + depth_condition_clause;
      var common_order_by_clause = k.EMPTY
      + " order by nominal_day"
      + " , post_id"
      + " , be_selected desc"
      + " , post_cardinality"
      + " , medical_release_code_description_map.pecking_order desc"
      + " , equivalent_los_start_date";
      var common_subsequent_field_list = k.EMPTY
      + " , num_units_from_agency"
      + " , num_units_citywide"
      + " , assignment_id"
      + " , post_id"
      + " , post_cardinality"
      + " , agency_short_designator"
      + " , member_id"
      + " , medical_release_description"
      + " , name"
      + " , be_driver_qualified"
      + " , be_selected"
      + " , comment";
      var common_final_fields = k.EMPTY
      // nominal_day
      // display_seq_num
      + " , d.num_units_from_agency as d_num_units_from_agency"
      + " , d.num_units_citywide as d_num_units_citywide"
      + " , d.assignment_id as d_assignment_id"
      + " , d.post_id as d_post_id"
      + " , d.post_cardinality as d_post_cardinality"
      + " , d.agency_short_designator as d_agency_short_designator"
      + " , d.member_id as d_member_id"
      + " , d.medical_release_description as d_medical_release_description"
      + " , d.name as d_name"
      + " , d.be_driver_qualified as d_be_driver_qualified"
      + " , d.be_selected as d_be_selected"
      + " , d.comment as d_comment"
      + " , n.num_units_from_agency as n_num_units_from_agency"
      + " , n.num_units_citywide as n_num_units_citywide"
      + " , n.assignment_id as n_assignment_id"
      + " , n.post_id as n_post_id"
      + " , n.post_cardinality as n_post_cardinality"
      + " , n.agency_short_designator as n_agency_short_designator"
      + " , n.member_id as n_member_id"
      + " , n.medical_release_description as n_medical_release_description"
      + " , n.name as n_name"
      + " , n.be_driver_qualified as n_be_driver_qualified"
      + " , n.be_selected as n_be_selected"
      + " , n.comment as n_comment";
      //
      Open();
      var transaction = connection.BeginTransaction();
      //
      // Since we are only using selects and temporary tables, do not save this to the db_trail.
      //
      try
        {
        new MySqlCommand
          (
          "create temporary table num_units"
          + " select nominal_day"
          + " , shift_id"
          + " , sum(member.agency_id = '" + agency_filter + "')/2 as from_agency"
          + " , count(*)/2 as citywide"
          + " from schedule_assignment"
          +   " join member on (member.id=schedule_assignment.member_id)"
          +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
          + " where medical_release_code_description_map.pecking_order >= 20"
          +   " and be_selected"
          +   " and MONTH(nominal_day) = MONTH(CURDATE()) + " + relative_month.val
          + " group by nominal_day,shift_id"
          + ";"
          //
          // Generate the list of DAY schedule assignments for this month in the desired order.
          //
          + " drop temporary table if exists this_month_day_schedule_assignment"
          + ";"
          + " create temporary table this_month_day_schedule_assignment"
          + " select schedule_assignment.nominal_day as nominal_day"
          + common_initial_field_list
          + common_initial_from_where_clause
          +   " and shift.name = 'DAY'"
          + common_order_by_clause
          + ";"
          //
          // Generate the list of NIGHT schedule assignments for this month in the desired order.
          //
          + " drop temporary table if exists this_month_night_schedule_assignment"
          + ";"
          + " create temporary table this_month_night_schedule_assignment"
          + " select schedule_assignment.nominal_day as nominal_day"
          + common_initial_field_list
          + common_initial_from_where_clause
          +   " and shift.name = 'NIGHT'"
          + common_order_by_clause
          + ";"
          //
          // Set up special subqueries that use user variables to calculate and assign display sequence numbers to each day and night assignment, respectively, such that the display sequence numbers reset to 1 each time the nominal_day changes.  The display
          // sequence numbers are thus used as the common attribute that allows an otherwise unassociated pair of day and night assignments to be displayed side by side for each particular nominal_day.
          //
          + " drop temporary table if exists this_month_day_schedule_assignment_with_dsn"
          + ";"
          + " create temporary table this_month_day_schedule_assignment_with_dsn"
          + " select IF(nominal_day <> @d_nominal_day,@d_display_seq_num := 1,@d_display_seq_num := @d_display_seq_num + 1) as display_seq_num"
          + " , @d_nominal_day := nominal_day as nominal_day"
          + common_subsequent_field_list
          + " from (select @d_nominal_day := '0000-00-00', @d_display_seq_num := 0) dummy, this_month_day_schedule_assignment"
          + ";"
          + " drop temporary table if exists this_month_night_schedule_assignment_with_dsn"
          + ";"
          + " create temporary table this_month_night_schedule_assignment_with_dsn"
          + " select IF(nominal_day <> @n_nominal_day,@n_display_seq_num := 1,@n_display_seq_num := @n_display_seq_num + 1) as display_seq_num"
          + " , @n_nominal_day := nominal_day as nominal_day"
          + common_subsequent_field_list
          + " from (select @n_nominal_day := '0000-00-00', @n_display_seq_num := 0) dummy, this_month_night_schedule_assignment"
          + ";"
          + " drop temporary table if exists this_month_schedule_assignment"
          + ";"
          //
          // The following CREATE, ALTER, and INSERT statements accomplish a FULL OUTER JOIN hinged on nominal_day and display_seq_num.  (MySQL 5.5 does not directly support FULL OUTER JOINs.)
          //
          + " CREATE temporary table this_month_schedule_assignment"
          + " select d.nominal_day , d.display_seq_num" + common_final_fields
          + " from this_month_day_schedule_assignment_with_dsn as d"
          +   " left join this_month_night_schedule_assignment_with_dsn as n"
          +     " using (nominal_day,display_seq_num)"
          + ";"
          + " ALTER table this_month_schedule_assignment add primary key (nominal_day,display_seq_num)"
          + " , modify d_num_units_from_agency FLOAT NULL"
          + " , modify d_num_units_citywide FLOAT NULL"
          + " , modify d_assignment_id BIGINT UNSIGNED NULL"
          + " , modify d_post_id BIGINT UNSIGNED NULL"
          + " , modify d_post_cardinality CHAR NULL"
          + " , modify d_agency_short_designator VARCHAR(3) NULL"
          + " , modify d_medical_release_description VARCHAR(31) NULL"
          + " , modify d_name VARCHAR(64) NULL"
          + " , modify d_be_selected TINYINT NULL"
          + " , modify d_be_driver_qualified CHAR NULL"
          + " , modify d_comment VARCHAR(511) NULL"
          + ";"
          + " INSERT ignore this_month_schedule_assignment"
          + " select n.nominal_day , n.display_seq_num" + common_final_fields
          + " from this_month_day_schedule_assignment_with_dsn as d"
          +   " right join this_month_night_schedule_assignment_with_dsn as n"
          +     " using (nominal_day,display_seq_num)",
          connection,
          transaction
          )
          .ExecuteNonQuery();
        (target as BaseDataList).DataSource = new MySqlCommand("select * from this_month_schedule_assignment",connection,transaction).ExecuteReader();
        (target as BaseDataList).DataBind();
        ((target as BaseDataList).DataSource as MySqlDataReader).Close();
        //
        var dr = new MySqlCommand
          (
          "select count(distinct member_id) as num_members"
          + " , sum(be_selected)/2 as num_crew_shifts"
          + common_from_where_clause,
          connection,
          transaction
          )
          .ExecuteReader();
        dr.Read();
        (num_members = new k.int_nonnegative()).val = int.Parse(dr["num_members"].ToString());
        num_crew_shifts = new k.decimal_nonnegative();
        object num_crew_shifts_obj;
        if ((num_crew_shifts_obj = dr["num_crew_shifts"]) != DBNull.Value)
          {
          (num_crew_shifts = new k.decimal_nonnegative()).val = decimal.Parse(num_crew_shifts_obj.ToString());
          }
        dr.Close();
        //
        new MySqlCommand
          (
          "drop temporary table num_units,this_month_day_schedule_assignment,this_month_night_schedule_assignment,this_month_day_schedule_assignment_with_dsn,this_month_night_schedule_assignment_with_dsn,this_month_schedule_assignment",
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
      //
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

    internal void BindTimeOffAlertBaseDataList
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month,
      object target
      )
      {
      var agency_condition_clause = k.EMPTY;
      if (agency_filter != k.EMPTY)
        {
        agency_condition_clause = " and agency_id = '" + agency_filter + "'";
        }
      var release_condition_clause = k.EMPTY;
      if (release_filter == "1")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order >= 20";
        }
      else if (release_filter == "0")
        {
        release_condition_clause = " and medical_release_code_description_map.pecking_order < 20";
        }
      Open();
      var transaction = connection.BeginTransaction();
      try
        {
        //
        // Since we are only using selects and temporary tables, do not save this to the db_trail.
        //
        new MySqlCommand
          (
          "create temporary table assignment_start_and_end_datetimes_sorted_by_member_id"
          + " select member_id"
          + " , schedule_assignment.id as schedule_assignment_id"
          + " , DATE_FORMAT(ADDTIME(nominal_day,start),'%Y-%m-%d %H:%i') as on_duty"
          + " , DATE_FORMAT(IF(start<end,ADDTIME(nominal_day,end),ADDTIME(ADDTIME(nominal_day,end),'24:00:00')),'%Y-%m-%d %H:%i') as off_duty"
          + " FROM schedule_assignment"
          +   " join shift on (shift.id=schedule_assignment.shift_id)"
          +   " join member on (member.id=schedule_assignment.member_id)"
          +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
          + " where member_id is not null"
          +   " and MONTH(nominal_day) = MONTH(CURDATE()) + " + relative_month.val
          +   " and be_selected"
          +   agency_condition_clause
          +   release_condition_clause
          + " order by member_id,nominal_day,start",
          connection,
          transaction
          )
          .ExecuteNonQuery();
        new MySqlCommand
          (
          "create temporary table times_off"
          + " select @on_duty := on_duty as on_duty"
          + " , IF(member_id = @member_id,TIMESTAMPDIFF(HOUR,@off_duty,@on_duty),NULL) as time_off"
          + " , IF(member_id = @member_id,@saved_schedule_assignment_id,NULL) as first_schedule_assignment_id"
          + " , @off_duty := off_duty as off_duty"
          + " , @member_id := member_id as member_id"
          + " , @saved_schedule_assignment_id := schedule_assignment_id as second_schedule_assignment_id"
          + " from (select @on_duty := '', @off_duty := '', @member_id := '', @saved_schedule_assignment_id := '') as dummy,assignment_start_and_end_datetimes_sorted_by_member_id",
          connection,
          transaction
          )
          .ExecuteNonQuery();
        (target as BaseDataList).DataSource = new MySqlCommand
          (
          "select concat(first_name,' ',last_name) as name"
          + " , times_off.member_id as member_id"
          + " , first_schedule_assignment.nominal_day as first_nominal_day"
          + " , first_shift.name as first_shift_name"
          + " , first_schedule_assignment_id"
          + " , time_off"
          + " , second_schedule_assignment.nominal_day as second_nominal_day"
          + " , second_shift.name as second_shift_name"
          + " , second_schedule_assignment_id"
          + " from times_off"
          +   " join member on (member.id=times_off.member_id)"
          +   " join schedule_assignment as first_schedule_assignment on (first_schedule_assignment.id=times_off.first_schedule_assignment_id)"
          +   " join schedule_assignment as second_schedule_assignment on (second_schedule_assignment.id=times_off.second_schedule_assignment_id)"
          +   " join shift as first_shift on (first_shift.id=first_schedule_assignment.shift_id)"
          +   " join shift as second_shift on (second_shift.id=second_schedule_assignment.shift_id)"
          + " where time_off < 36"
          + " order by time_off,second_schedule_assignment.nominal_day,second_shift.start",
          connection,
          transaction
          )
          .ExecuteReader();
        (target as BaseDataList).DataBind();
        ((target as BaseDataList).DataSource as MySqlDataReader).Close();
        new MySqlCommand("drop temporary table assignment_start_and_end_datetimes_sorted_by_member_id,times_off",connection,transaction).ExecuteNonQuery();
        transaction.Commit();
        }
      catch (Exception e)
        {
        transaction.Rollback();
        throw e;
        }
      Close();
      //
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

    internal void Update(string relative_month)
      {
      var convenient_datetime = DateTime.Now.AddMonths(int.Parse(relative_month));
      var month_abbreviation = convenient_datetime.ToString("MMM");
      var month_yyyy_mm = convenient_datetime.ToString("yyyy-MM");
      string trimables;
      Open();
      var transaction = connection.BeginTransaction();
      try
        {
        //
        // Load new availabilities from avail_sheet.
        //
        var sql = k.EMPTY;
        var i = new k.subtype<int>(0,31);
        for (; i.val < i.LAST; i.val++)
          {
          sql += k.EMPTY
          + " insert ignore into schedule_assignment (nominal_day,shift_id,post_id,member_id)"
          + " select str_to_date(concat('" + month_yyyy_mm + "-','" + (i.val + 1).ToString("d2") + "'),'%Y-%m-%d') as nominal_day"
          + " , (select id from shift where name = 'DAY') as shift_id"
          + " , (select id from agency where oscar_classic_enumerator = coord_agency) as post_id"
          + " , odnmid as member_id"
          + " from avail_sheet"
          + " where month = '" + month_abbreviation + "'"
          +   " and d" + (i.val + 1).ToString() + " = 'AVAILABLE'"
          + ";"
          + " insert ignore into schedule_assignment (nominal_day,shift_id,post_id,member_id)"
          + " select str_to_date(concat('" + month_yyyy_mm + "-','" + (i.val + 1).ToString("d2") + "'),'%Y-%m-%d') as nominal_day"
          + " , (select id from shift where name = 'NIGHT') as shift_id"
          + " , (select id from agency where oscar_classic_enumerator = coord_agency) as post_id"
          + " , odnmid as member_id"
          + " from avail_sheet"
          + " where month = '" + month_abbreviation + "'"
          +   " and n" + (i.val + 1).ToString() + " = 'AVAILABLE'"
          + ";";
          }
        new MySqlCommand(db_trail.Saved(sql),connection,transaction).ExecuteNonQuery();
        //
        // Determine initial shift popularities.  Do not save operations on temporary table to the db_trail.
        //
        new MySqlCommand
          (
          " create temporary table shift_popularity"
          + " select nominal_day"
          + " , shift_id"
          + " , sum(medical_release_code_description_map.pecking_order >= 20) as num_released_members_available"
          + " , sum(medical_release_code_description_map.pecking_order >= 30) as num_als_members_available"
          + " , sum(be_driver_qualified) as num_driver_members_available"
          + " from schedule_assignment"
          +   " join member on (member.id=schedule_assignment.member_id)"
          +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
          + " where MONTH(nominal_day) = MONTH(CURDATE()) + " + relative_month
          + " group by nominal_day,shift_id"
          + ";"
          + " alter table shift_popularity add primary key (nominal_day,shift_id)"
          + " , add key (num_released_members_available desc)",
          connection,
          transaction
          )
          .ExecuteNonQuery();
        //----
        //
        // RELEASED MEMBERS
        //
        //----
        //--
        //
        // Factor in member flexibilities and shift popularities.
        //
        //--
        //
        // Determine released member flexibilities.
        //
        var dr = new MySqlCommand
          (
          "select member.id as member_id"
          + " , ("
          +     " count(*)"  // num avails submitted
          +     " -"
          +     " IFNULL"  // num duties supposed to run
          +       " ("
          +         " if"
          +           " ("
          +             " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)) and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))),"  // on leave
          +             " num_obliged_shifts,"  // then num duties specified in terms of leave
          +             " IFNULL"  // else
          +               " ("
          +                 " num_shifts"  // if applicable, num standard obliged duties
          +                 " ,"
          +                 " count(*))"  // else (like for Atypical members) num avails submitted
          +           " )"
          +         " +"  // plus
          +           " IFNULL(num_extras,0)"  // num extras member indicated they wanted to run, if any
          +       " ,"
          +         " 0"
          +       " )"
          +   " )"
          +   " as num_excess_avails"
          + " from schedule_assignment"
          +   " join member on (member.id=schedule_assignment.member_id)"
          + "   join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
          +   " join avail_sheet on (avail_sheet.odnmid=member.id and MONTH(avail_sheet.expiration)=MONTH(schedule_assignment.nominal_day))"
          +   " join enrollment_history on" 
          +     " (" 
          +       " enrollment_history.member_id=member.id" 
          +     " and" 
          +       " (" 
          +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
          +       " and" 
          +         " (" 
          +           " (enrollment_history.end_date is null)" 
          +         " or" 
          +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
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
          +           " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
          +         " and" 
          +           " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
          +         " )" 
          +       " )" 
          +     " )" 
          + " where MONTH(nominal_day) = MONTH(CURDATE()) + " + relative_month
          +   " and medical_release_code_description_map.pecking_order >= 20"
          + " group by member.id"
          +   " having num_excess_avails > 0"
          + " order by num_excess_avails desc",
          connection,
          transaction
          )
          .ExecuteReader();
        var member_id_q = new Queue();
        var quantity_of_interest_q = new Queue();
        while (dr.Read())
          {
          member_id_q.Enqueue(dr["member_id"].ToString());
          quantity_of_interest_q.Enqueue(dr["num_excess_avails"].ToString());
          }
        dr.Close();
        //
        // Trim assignments in excess of obligations from most flexible released members that fall on most popular shifts.
        //
        trimables = k.EMPTY;
        while (member_id_q.Count > 0)
          {
          dr = new MySqlCommand
            (
            " select schedule_assignment.id as id"
            + " from schedule_assignment"
            +   " join shift_popularity on (shift_popularity.nominal_day=schedule_assignment.nominal_day and shift_popularity.shift_id=schedule_assignment.shift_id)"
            +   " join shift on (shift.id=schedule_assignment.shift_id)"
            + " where member_id = '" + member_id_q.Dequeue() + "'"
            + " order by num_released_members_available desc, schedule_assignment.nominal_day desc, shift.start desc"
            + " limit " + quantity_of_interest_q.Dequeue(),
            connection,
            transaction
            )
            .ExecuteReader();
          while (dr.Read())
            {
            trimables += dr["id"].ToString() + k.COMMA;
            }
          dr.Close();
          }
        if (trimables != k.EMPTY)
          {
          new MySqlCommand(db_trail.Saved("update schedule_assignment set be_selected = FALSE where be_new and (id in (" + trimables.Trim(new char[] {Convert.ToChar(k.COMMA)}) + "))"),connection,transaction).ExecuteNonQuery();
          }
        //--
        //
        // Factor in need.
        //
        //--
        var swappables = k.EMPTY;
        var done = false;
        while (!done)
          {
          //
          // Determine shift wealth (how many released members are assigned to each shift).
          //
          new MySqlCommand
            (
            "create temporary table shift_population"
            + " select nominal_day"
            + " , shift_id"
            + " , count(*) as num_released_members_assigned"
            + " from schedule_assignment"
            +   " join member on (member.id=schedule_assignment.member_id)"
            +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
            + " where medical_release_code_description_map.pecking_order >= 20"
            +   " and be_selected"
            +   " and MONTH(nominal_day) = MONTH(CURDATE()) + " + relative_month
            + " group by nominal_day,shift_id"
            + ";"
            + " create temporary table member_assignment_vs_shift_population"
            + " SELECT member_id"
            + " , schedule_assignment.id as schedule_assignment_id"
            + " , be_selected"
            + " , num_released_members_assigned"
            + " FROM shift_population"
            +   " join schedule_assignment on (schedule_assignment.nominal_day=shift_population.nominal_day and schedule_assignment.shift_id=shift_population.shift_id)"
            +   " join member on (member.id=schedule_assignment.member_id)"
            +   " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
            + " where pecking_order >= 20"
            + ";"
            + " create temporary table least_needed"
            + " select member_id,schedule_assignment_id,num_released_members_assigned"
            + " from"
            +   " ("
            +   " SELECT IF(member_id <> @hi_saved_member_id,@hi_rank := 1,@hi_rank := @hi_rank + 1) as rank"
            +   " , @hi_saved_member_id := member_id as member_id"
            +   " , schedule_assignment_id"
            +   " , num_released_members_assigned"
            +   " FROM (select @hi_saved_member_id := '', @hi_rank := 0) as dummy, member_assignment_vs_shift_population"
            +   " where be_selected"
            +   " order by member_id,num_released_members_assigned desc"
            +   " ) as high_duty_populations"
            + " where rank = 1"
            + ";"
            + " create temporary table most_needed"
            + " select member_id,schedule_assignment_id,num_released_members_assigned"
            + " from"
            +   " ("
            +   " SELECT IF(member_id <> @lo_saved_member_id,@lo_rank := 1,@lo_rank := @lo_rank + 1) as rank"
            +   " , @lo_saved_member_id := member_id as member_id"
            +   " , schedule_assignment_id"
            +   " , num_released_members_assigned"
            +   " FROM (select @lo_saved_member_id := '', @lo_rank := 0) as dummy, member_assignment_vs_shift_population"
            +   " where not be_selected"
            +   " order by member_id,num_released_members_assigned asc"
            +   " ) as low_duty_populations"
            + " where rank = 1",
            connection,
            transaction
            )
            .ExecuteNonQuery();
          dr = new MySqlCommand
            (
            "select least_needed.schedule_assignment_id as least_needed_assignment_id"
            + " , most_needed.schedule_assignment_id as most_needed_assignment_id"
            + " from least_needed join most_needed using (member_id)"
            + " where least_needed.num_released_members_assigned - most_needed.num_released_members_assigned > 1"
            + " limit 1",
            connection,
            transaction
            )
            .ExecuteReader();
          if (dr.Read())
            {
            swappables = dr["least_needed_assignment_id"].ToString() + k.COMMA + dr["most_needed_assignment_id"].ToString();
            }
          else
            {
            done = true;
            }
          dr.Close();
          if (!done)
            {
            new MySqlCommand(db_trail.Saved("update schedule_assignment set be_selected = not be_selected where be_new and (id in (" + swappables + "))"),connection,transaction).ExecuteNonQuery();
            }
          new MySqlCommand("drop temporary table shift_population,member_assignment_vs_shift_population,least_needed,most_needed",connection,transaction).ExecuteNonQuery();
          }
        //----
        //
        // NON-RELEASED MEMBERS
        //
        //----
        //
        // Determine flexibilities versus minimum intended assignments for thirds.
        //
        dr = new MySqlCommand
          (
          "select member.id as member_id"
          + " , ("
          +     " count(*)"
          +     " -"
          +     " IFNULL(if((leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" + " and (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))),num_obliged_shifts,IF(medical_release_code = 9,2,num_shifts)),0)"
          +   " )"
          +   " as num_excess_avails"
          + " from schedule_assignment"
          +   " join member on (member.id=schedule_assignment.member_id)"
          + "   join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
          +   " join avail_sheet on (avail_sheet.odnmid=member.id and MONTH(avail_sheet.expiration)=MONTH(schedule_assignment.nominal_day))"
          +   " join enrollment_history on" 
          +     " (" 
          +       " enrollment_history.member_id=member.id" 
          +     " and" 
          +       " (" 
          +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
          +       " and" 
          +         " (" 
          +           " (enrollment_history.end_date is null)" 
          +         " or" 
          +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
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
          +           " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
          +         " and" 
          +           " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
          +         " )" 
          +       " )" 
          +     " )" 
          + " where MONTH(nominal_day) = MONTH(CURDATE()) + " + relative_month
          +   " and medical_release_code_description_map.pecking_order < 20"
          + " group by member.id"
          +   " having num_excess_avails > 0"
          + " order by num_excess_avails desc",
          connection,
          transaction
          )
          .ExecuteReader();
        member_id_q.Clear();
        quantity_of_interest_q.Clear();
        while (dr.Read())
          {
          member_id_q.Enqueue(dr["member_id"].ToString());
          quantity_of_interest_q.Enqueue(dr["num_excess_avails"].ToString());
          }
        dr.Close();
        //
        // Trim assignments in excess of obligations from most flexible third members that fall on most popular shifts.
        //
        trimables = k.EMPTY;
        while (member_id_q.Count > 0)
          {
          dr = new MySqlCommand
            (
            " select schedule_assignment.id as id"
            + " from schedule_assignment"
            +   " join shift_popularity on (shift_popularity.nominal_day=schedule_assignment.nominal_day and shift_popularity.shift_id=schedule_assignment.shift_id)"
            +   " join shift on (shift.id=schedule_assignment.shift_id)"
            + " where member_id = '" + member_id_q.Dequeue() + "'"
            + " order by num_released_members_available desc, schedule_assignment.nominal_day desc, shift.start desc"
            + " limit " + quantity_of_interest_q.Dequeue(),
            connection,
            transaction
            )
            .ExecuteReader();
          while (dr.Read())
            {
            trimables += dr["id"].ToString() + k.COMMA;
            }
          dr.Close();
          }
        if (trimables != k.EMPTY)
          {
          new MySqlCommand(db_trail.Saved("update schedule_assignment set be_selected = FALSE where be_new and (id in (" + trimables.Trim(new char[] {Convert.ToChar(k.COMMA)}) + "))"),connection,transaction).ExecuteNonQuery();
          }
        //
        // Determine which Trainees want how many extra assignments.  EMT Interns are not allowed to run extras.
        //
        dr = new MySqlCommand
          (
          "select member.id as member_id"
          + " , num_extras"
          + " from schedule_assignment"
          +   " join member on (member.id=schedule_assignment.member_id)"
          + "   join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
          +   " join avail_sheet on (avail_sheet.odnmid=member.id and MONTH(avail_sheet.expiration)=MONTH(schedule_assignment.nominal_day))"
          +   " join enrollment_history on" 
          +     " (" 
          +       " enrollment_history.member_id=member.id" 
          +     " and" 
          +       " (" 
          +         " (enrollment_history.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
          +       " and" 
          +         " (" 
          +           " (enrollment_history.end_date is null)" 
          +         " or" 
          +           " (enrollment_history.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
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
          +           " (leave_of_absence.start_date <= DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH))" 
          +         " and" 
          +           " (leave_of_absence.end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL " + relative_month + " MONTH)))" 
          +         " )" 
          +       " )" 
          +     " )" 
          + " where MONTH(nominal_day) = MONTH(CURDATE()) + " + relative_month
          +   " and medical_release_code = 2"
          + " group by member.id"
          +   " having num_extras > 0"
          + " order by num_extras",
          connection,
          transaction
          )
          .ExecuteReader();
        member_id_q.Clear();
        quantity_of_interest_q.Clear();
        while (dr.Read())
          {
          member_id_q.Enqueue(dr["member_id"].ToString());
          quantity_of_interest_q.Enqueue(dr["num_extras"].ToString());
          }
        dr.Close();
        //
        // Give extra assignments to interested thirds where possible
        //
        var member_id = k.EMPTY;
        var num_extras = 0;
        while (member_id_q.Count > 0)
          {
          member_id = member_id_q.Dequeue().ToString();
          num_extras = int.Parse(quantity_of_interest_q.Dequeue().ToString());
          var selectable_id_obj = new MySqlCommand
            (
            "select id"
            + " from schedule_assignment as x"
            +   " join"
            +     " ("
            +     " SELECT nominal_day"
            +      " , shift_id"
            +      " , (sum(medical_release_code_description_map.pecking_order >= 20)/2 - sum(medical_release_code_description_map.pecking_order < 20))"
            +        " as num_openings"
            +     " FROM schedule_assignment"
            +       " join member on (member.id=schedule_assignment.member_id)"
            +       " join medical_release_code_description_map on (medical_release_code_description_map.code=member.medical_release_code)"
            +     " where be_selected"
            +       " and MONTH(nominal_day) = MONTH(CURDATE()) + " + relative_month
            +     " group by nominal_day,shift_id"
            +       " having (sum(medical_release_code_description_map.pecking_order >= 20)/2 - sum(medical_release_code_description_map.pecking_order < 20)) > 0"
            +     " )"
            +     " as y on (y.nominal_day=x.nominal_day and y.shift_id=x.shift_id)"
            + " where x.member_id = '" + member_id + "'"
            +   " and not x.be_selected"
            + " order by y.num_openings desc"
            + " limit 1",
            connection,
            transaction
            )
            .ExecuteScalar();
          if (selectable_id_obj != null)
            {
            new MySqlCommand("update schedule_assignment set be_selected = TRUE where be_new and id = '" + selectable_id_obj.ToString() + "'",connection,transaction).ExecuteNonQuery();
            if (num_extras > 1)
              {
              member_id_q.Enqueue(member_id);
              quantity_of_interest_q.Enqueue(num_extras - 1);
              }
            }
          }
        //
        // Mark all current assignments hands off for this routine, and clean up.
        //
        new MySqlCommand
          (
          "update schedule_assignment set be_new = FALSE"
          + ";"
          + " drop temporary table shift_popularity",
          connection,
          transaction
          )
          .ExecuteNonQuery();
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
