// Derived from KiAspdotnetFramework/component/db/Class~db~template~kicrudhelped~items.cs~template

using Class_db;
using Class_db_trail;
using kix;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Web.UI.WebControls;
using UserControl_drop_down_date;

namespace Class_db_evals
  {

  public class eval_summary
    {
    public string id;
    public DateTime nominal_day;
    public string shift_id;
    public string shift_name;
    public string post_id;
    public string post_designator;
    public string post_cardinality;
    public string vehicle_id;
    public string vehicle_name;
    public string aic_member_id;
    public string aic_member_name;
    public string third_member_id;
    public string third_member_name;
    }

  public class TClass_db_evals: TClass_db
    {
    private readonly TClass_db_trail db_trail = null;

    public TClass_db_evals() : base()
      {
      db_trail = new TClass_db_trail();
      }

    internal void AutoAdvance
      (
      string id,
      string status_description,
      bool be_on_behalf_of_evaluatee
      )
      {
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "update eval set status_id = (select id from eval_status where description = '" + status_description + "')"
        + (be_on_behalf_of_evaluatee ? (status_description == "NEEDS_BOTH_LOCKS" ? " , be_locked_by_third_initially = TRUE" : k.EMPTY) : " , be_locked_by_aic = TRUE")
        + " where id = '" + id + "'",
        connection
        );
      my_sql_command.ExecuteNonQuery();
      Close();
      }

    internal bool BeLockedByAicOf(object summary)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select be_locked_by_aic from eval where id = '" + (summary as eval_summary).id + "'",connection);
      var be_locked_by_aic_of = "1" == my_sql_command.ExecuteScalar().ToString();
      Close();
      return be_locked_by_aic_of;
      }

    internal bool BeLockedByThirdInitiallyOf(object summary)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select be_locked_by_third_initially from eval where id = '" + (summary as eval_summary).id + "'",connection);
      var be_locked_by_third_initially_of = "1" == my_sql_command.ExecuteScalar().ToString();
      Close();
      return be_locked_by_third_initially_of;
      }

    public bool Bind(string partial_spec, object target)
      {
      var concat_clause = "concat(id)";
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "select id"
        + " , CONVERT(" + concat_clause + " USING utf8) as spec"
        + " from eval"
        + " where " + concat_clause + " like '%" + partial_spec.ToUpper() + "%'"
        + " order by spec",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      return ((target) as ListControl).Items.Count > 0;
      }

    internal void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string third_member_id_filter,
      string aic_member_id_filter,
      k.int_sign_range inprocess_all_archived_condition,
      k.int_positive evaluation_tier,
      string third_section_filter = k.EMPTY
      )
      {
      sort_order = sort_order.Replace("%",(be_sort_order_ascending ? " asc" : " desc"));
      var filter = " where 1=1 ";
      if (third_member_id_filter.Length > 0)
        {
        filter += " and third_member_id = '" + third_member_id_filter + "'" + k.SPACE;
        }
      if (aic_member_id_filter.Length > 0)
        {
        if (evaluation_tier.val > 2) // user is a regular member
          {
          filter += " and aic_member_id = '" + aic_member_id_filter + "'" + k.SPACE;
          }
        else if (evaluation_tier.val == 2) // user is a Squad Training Officer and should be allowed to see all evals whose evaluator is a member of user's squad
          {
          filter += " and aic_member_agency.id = aic_member.agency_id" + k.SPACE;
          }
        // else user is a Department BLS ID Coordinator and should be allowed to see all evals in the system
        }
      if (inprocess_all_archived_condition.val != 0)
        {
        filter += " and eval_status.description " + (inprocess_all_archived_condition.val == -1 ? "<>" : "=") + " 'ARCHIVED'" + k.SPACE;
        }
      if (third_section_filter.Length > 0)
        {
        filter += " and third_member.section_num = '" + third_section_filter + "'" + k.SPACE;
        }
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select eval.id as id"
        + " , DATE_FORMAT(nominal_day,'%a %Y-%m-%d') as nominal_day"
        + " , shift.id as shift_id"
        + " , shift.name as shift_name"
        + " , post.short_designator as post_designator"
        + " , CHAR(ASCII('a') + post_cardinality - 1 using ascii) as post_cardinality"
        + " , vehicle.id as vehicle_id"
        + " , vehicle.name as vehicle_name"
        + " , third_member.id as third_member_id"
        + " , CONCAT(third_member.first_name,' ',third_member.last_name,' <',third_member.section_num) as third_member_name"
        + " , aic_member.id as aic_member_id"
        + " , CONCAT(aic_member.first_name,' ',aic_member.last_name) as aic_member_name"
        + " , eval_status.description as status"
        + " from eval"
        +   " join shift on (shift.id=eval.shift_id)"
        +   " join agency post on (post.id=eval.post_id)"
        +   " join vehicle on (vehicle.id=eval.vehicle_id)"
        +   " join member third_member on (third_member.id=eval.third_member_id)"
        +   " join member aic_member on (aic_member.id=eval.aic_member_id)"
        +   " join eval_status on (eval_status.id=eval.status_id)"
        +   " join agency aic_member_agency on (aic_member_agency.id=aic_member.agency_id)"
        + filter
        + " order by " + sort_order,
        connection
        );
      (target as BaseDataList).DataSource = my_sql_command.ExecuteReader();
      (target as BaseDataList).DataBind();
      Close();
      }

    public void BindDirectToListControl(object target)
      {
      Open();
      ((target) as ListControl).Items.Clear();
      using var my_sql_command = new MySqlCommand
        (
        "SELECT id"
        + " , CONVERT(concat(id) USING utf8) as spec"
        + " FROM eval"
        + " order by spec",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        ((target) as ListControl).Items.Add(new ListItem(dr["spec"].ToString(), dr["id"].ToString()));
        }
      dr.Close();
      Close();
      }

    public bool Delete(string id)
      {
      var result = true;
      Open();
      try
        {
        using var my_sql_command = new MySqlCommand(db_trail.Saved("delete from eval where id = \"" + id + "\""), connection);
        my_sql_command.ExecuteNonQuery();
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
      Close();
      return result;
      }

    internal string EvaluateeMemberIdOf(object summary)
      {
      return (summary as eval_summary).third_member_id;
      }

    internal string EvaluateeNameOf(object summary)
      {
      return (summary as eval_summary).third_member_name;
      }

    internal string EvaluatorMemberIdOf(object summary)
      {
      return (summary as eval_summary).aic_member_id;
      }

    internal string EvaluatorNameOf(object summary)
      {
      return (summary as eval_summary).aic_member_name;
      }

    public bool Get
      (
      string id,
      out string third_member_id,
      out DateTime nominal_day,
      out string shift_id,
      out string post_id,
      out string post_cardinality,
      out string vehicle_id,
      out string aic_member_id,
      out string alt_aic_reason,
      out DateTime time_in,
      out DateTime time_out,
      out string discussions,
      out k.int_sign_range aic_ok_with_third_progress_null_false_true_condition,
      out k.int_sign_range aic_ok_with_third_release_null_false_true_condition,
      out k.int_sign_range third_ok_with_progress_null_false_true_condition,
      out k.int_sign_range third_ok_with_release_null_false_true_condition,
      out string comments_on_driving,
      out string miles_driven_routine,
      out string miles_driven_emergency,
      out string road_conditions,
      out k.int_sign_range aic_ok_with_third_being_driver_null_false_true_condition,
      out k.int_sign_range third_ok_with_being_driver_null_false_true_condition,
      out string status_id,
      out bool be_locked_by_third_initially,
      out bool be_locked_by_aic,
      out string third_rebuttal
      )
      {
      third_member_id = k.EMPTY;
      nominal_day = DateTime.MinValue;
      shift_id = k.EMPTY;
      post_id = k.EMPTY;
      post_cardinality = k.EMPTY;
      vehicle_id = k.EMPTY;
      aic_member_id = k.EMPTY;
      alt_aic_reason = k.EMPTY;
      time_in = DateTime.MinValue;
      time_out = DateTime.MinValue;
      discussions = k.EMPTY;
      aic_ok_with_third_progress_null_false_true_condition = k.IntsignrangeOfOptionalBoolean(k.EMPTY);
      aic_ok_with_third_release_null_false_true_condition = k.IntsignrangeOfOptionalBoolean(k.EMPTY);
      third_ok_with_progress_null_false_true_condition = k.IntsignrangeOfOptionalBoolean(k.EMPTY);
      third_ok_with_release_null_false_true_condition = k.IntsignrangeOfOptionalBoolean(k.EMPTY);
      comments_on_driving = k.EMPTY;
      miles_driven_routine = k.EMPTY;
      miles_driven_emergency = k.EMPTY;
      road_conditions = k.EMPTY;
      aic_ok_with_third_being_driver_null_false_true_condition = k.IntsignrangeOfOptionalBoolean(k.EMPTY);
      third_ok_with_being_driver_null_false_true_condition = k.IntsignrangeOfOptionalBoolean(k.EMPTY);
      status_id = k.EMPTY;
      be_locked_by_third_initially = true;
      be_locked_by_aic = true;
      third_rebuttal = k.EMPTY;
      var result = false;
      //
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select third_member_id"
        + " , nominal_day"
        + " , shift_id"
        + " , post_id"
        + " , CHAR(ASCII('a') + post_cardinality - 1 using ascii) as post_cardinality"
        + " , vehicle_id"
        + " , aic_member_id"
        + " , alt_aic_reason"
        + " , time_in"
        + " , time_out"
        + " , discussions"
        + " , be_aic_ok_with_third_progress"
        + " , be_aic_ok_with_third_release"
        + " , be_third_ok_with_progress"
        + " , be_third_ok_with_release"
        + " , comments_on_driving"
        + " , miles_driven_routine"
        + " , miles_driven_emergency"
        + " , road_conditions"
        + " , be_aic_ok_with_third_being_driver"
        + " , be_third_ok_with_being_driver"
        + " , status_id"
        + " , be_locked_by_third_initially"
        + " , be_locked_by_aic"
        + " , third_rebuttal"
        + " from eval"
        + " where CAST(id AS CHAR) = '" + id + "'",
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        third_member_id = dr["third_member_id"].ToString();
        nominal_day = DateTime.Parse(dr["nominal_day"].ToString());
        shift_id = dr["shift_id"].ToString();
        post_id = dr["post_id"].ToString();
        post_cardinality = dr["post_cardinality"].ToString();
        vehicle_id = dr["vehicle_id"].ToString();
        aic_member_id = dr["aic_member_id"].ToString();
        alt_aic_reason = dr["alt_aic_reason"].ToString();
        time_in = DateTime.Parse(dr["time_in"].ToString());
        time_out = DateTime.Parse(dr["time_out"].ToString());
        discussions = dr["discussions"].ToString();
        aic_ok_with_third_progress_null_false_true_condition = k.IntsignrangeOfOptionalBoolean(dr["be_aic_ok_with_third_progress"].ToString());
        aic_ok_with_third_release_null_false_true_condition = k.IntsignrangeOfOptionalBoolean(dr["be_aic_ok_with_third_release"].ToString());
        third_ok_with_progress_null_false_true_condition = k.IntsignrangeOfOptionalBoolean(dr["be_third_ok_with_progress"].ToString());
        third_ok_with_release_null_false_true_condition = k.IntsignrangeOfOptionalBoolean(dr["be_third_ok_with_release"].ToString());
        comments_on_driving = dr["comments_on_driving"].ToString();
        miles_driven_routine = dr["miles_driven_routine"].ToString();
        miles_driven_emergency = dr["miles_driven_emergency"].ToString();
        road_conditions = dr["road_conditions"].ToString();
        aic_ok_with_third_being_driver_null_false_true_condition = k.IntsignrangeOfOptionalBoolean(dr["be_aic_ok_with_third_being_driver"].ToString());
        third_ok_with_being_driver_null_false_true_condition = k.IntsignrangeOfOptionalBoolean(dr["be_third_ok_with_being_driver"].ToString());
        status_id = dr["status_id"].ToString();
        be_locked_by_third_initially = (dr["be_locked_by_third_initially"].ToString() == "1");
        be_locked_by_aic = (dr["be_locked_by_aic"].ToString() == "1");
        third_rebuttal = dr["third_rebuttal"].ToString();
        result = true;
        }
      dr.Close();
      Close();
      return result;
      }

    public string IdOf(object summary)
      {
      return (summary as eval_summary).id;
      }

    internal DateTime NominalDayOf(object summary)
      {
      return (summary as eval_summary).nominal_day;
      }

    internal string PostCardinalityOf(object summary)
      {
      return (summary as eval_summary).post_cardinality;
      }

    internal string PostDesignatorOf(object summary)
      {
      return (summary as eval_summary).post_designator;
      }

    public void Set
      (
      string id,
      string third_member_id,
      DateTime nominal_day,
      string shift_id,
      string post_id,
      string post_cardinality,
      string vehicle_id,
      string aic_member_id,
      string alt_aic_reason,
      DateTime time_in,
      DateTime time_out,
      string discussions,
      k.int_sign_range aic_ok_with_third_progress_null_false_true_condition,
      k.int_sign_range aic_ok_with_third_release_null_false_true_condition,
      k.int_sign_range third_ok_with_progress_null_false_true_condition,
      k.int_sign_range third_ok_with_release_null_false_true_condition,
      string comments_on_driving,
      string miles_driven_routine,
      string miles_driven_emergency,
      string road_conditions,
      k.int_sign_range aic_ok_with_third_being_driver_null_false_true_condition,
      k.int_sign_range third_ok_with_being_driver_null_false_true_condition,
      string status_id,
      bool be_locked_by_third_initially,
      bool be_locked_by_aic,
      string third_rebuttal
      )
      {
      var childless_field_assignments_clause = k.EMPTY
      + "third_member_id = NULLIF('" + third_member_id + "','')"
      + " , nominal_day = '" + nominal_day.ToString("yyyy-MM-dd") + "'"
      + " , shift_id = NULLIF('" + shift_id + "','')"
      + " , post_id = NULLIF('" + post_id + "','')"
      + " , post_cardinality = NULLIF(ASCII('" + post_cardinality + "') - ASCII('a') + 1,'')"
      + " , vehicle_id = NULLIF('" + vehicle_id + "','')"
      + " , aic_member_id = NULLIF('" + aic_member_id + "','')"
      + " , alt_aic_reason = NULLIF('" + alt_aic_reason + "','')"
      + " , time_in = NULLIF('" + time_in.ToString("HH:mm") + "','')"
      + " , time_out = NULLIF('" + time_out.ToString("HH:mm") + "','')"
      + " , discussions = NULLIF('" + discussions + "','')"
      + " , be_aic_ok_with_third_progress = " + k.NoneFalseTrueOf(aic_ok_with_third_progress_null_false_true_condition,"NULL")
      + " , be_aic_ok_with_third_release = " + k.NoneFalseTrueOf(aic_ok_with_third_release_null_false_true_condition,"NULL")
      + " , be_third_ok_with_progress = " + k.NoneFalseTrueOf(third_ok_with_progress_null_false_true_condition,"NULL")
      + " , be_third_ok_with_release = " + k.NoneFalseTrueOf(third_ok_with_release_null_false_true_condition,"NULL")
      + " , comments_on_driving = NULLIF('" + comments_on_driving + "','')"
      + " , miles_driven_routine = NULLIF('" + miles_driven_routine + "','')"
      + " , miles_driven_emergency = NULLIF('" + miles_driven_emergency + "','')"
      + " , road_conditions = NULLIF('" + road_conditions + "','')"
      + " , be_aic_ok_with_third_being_driver = " + k.NoneFalseTrueOf(aic_ok_with_third_being_driver_null_false_true_condition,"NULL")
      + " , be_third_ok_with_being_driver = " + k.NoneFalseTrueOf(third_ok_with_being_driver_null_false_true_condition,"NULL")
      + " , status_id = NULLIF('" + status_id + "','')"
      + " , be_locked_by_third_initially = " + be_locked_by_third_initially.ToString()
      + " , be_locked_by_aic = " + be_locked_by_aic.ToString()
      + " , third_rebuttal = NULLIF('" + third_rebuttal + "','')"
      + k.EMPTY;
      db_trail.MimicTraditionalInsertOnDuplicateKeyUpdate
        (
        target_table_name:"eval",
        key_field_name:"id",
        key_field_value:id,
        childless_field_assignments_clause:childless_field_assignments_clause,
        additional_match_condition:" or"
        + " (third_member_id = '" + third_member_id + "' and aic_member_id = '" + aic_member_id + "' and nominal_day = '" + nominal_day.ToString("yyyy-MM-dd") + "' and time_in = '" + time_in.ToString("HH:mm") + "')"
        );
      }

    private object SummaryBase(string condition_clause)
      {
      eval_summary the_summary_base = null;
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select eval.id as id"
        + " , nominal_day"
        + " , shift.id as shift_id"
        + " , shift.name as shift_name"
        + " , agency.short_designator as post_designator"
        + " , CHAR(ASCII('a') + post_cardinality - 1 using ascii) as post_cardinality"
        + " , agency.id as post_id"
        + " , vehicle.id as vehicle_id"
        + " , vehicle.name as vehicle_name"
        + " , aic_member.id as aic_member_id"
        + " , CONCAT(aic_member.first_name,' ',aic_member.last_name) as aic_member_name"
        + " , third_member.id as third_member_id"
        + " , CONCAT(third_member.first_name,' ',third_member.last_name) as third_member_name"
        + " from eval"
        +   " join shift on (shift.id=eval.shift_id)"
        +   " join agency on (agency.id=eval.post_id)"
        +   " join vehicle on (vehicle.id=eval.vehicle_id)"
        +   " join member aic_member on (aic_member.id=eval.aic_member_id)"
        +   " join member third_member on (third_member.id=eval.third_member_id)"
        + " where " + condition_clause,
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      if (dr.Read())
        {
        the_summary_base = new eval_summary()
          {
          id = dr["id"].ToString(),
          nominal_day = DateTime.Parse(dr["nominal_day"].ToString()),
          shift_id = dr["shift_id"].ToString(),
          shift_name = dr["shift_name"].ToString(),
          post_designator = dr["post_designator"].ToString(),
          post_cardinality = dr["post_cardinality"].ToString(),
          post_id = dr["post_id"].ToString(),
          vehicle_id = dr["vehicle_id"].ToString(),
          vehicle_name = dr["vehicle_name"].ToString(),
          aic_member_id = dr["aic_member_id"].ToString(),
          aic_member_name = dr["aic_member_name"].ToString(),
          third_member_id = dr["third_member_id"].ToString(),
          third_member_name = dr["third_member_name"].ToString()
          };
        }
      Close();
      return the_summary_base;
      }

    internal string ShiftNameOf(object summary)
      {
      return (summary as eval_summary).shift_name;
      }

    internal Queue StalledIdQueue
      (
      k.int_positive num_days,
      bool be_stalled_by_evaluatee
      )
      {
      var stalled_id_q = new Queue();
      var additional_condition_clause = k.EMPTY;
      if (be_stalled_by_evaluatee)
        {
        additional_condition_clause = " and ((description = 'NEEDS_BOTH_LOCKS' and not be_locked_by_third_initially) or description = 'NEEDS_EVALUATEE_REBUTTAL')";
        }
      else
        {
        additional_condition_clause = " and (description = 'NEEDS_BOTH_LOCKS' and be_locked_by_third_initially)";
        }
      Open();
      using var my_sql_command = new MySqlCommand
        (
        "select eval.id as id"
        + " from eval join eval_status on (eval_status.id=eval.status_id)"
        + " where NOW() > ADDDATE(time_last_modified ,INTERVAL " + num_days.val + " DAY)"
        +     additional_condition_clause,
        connection
        );
      var dr = my_sql_command.ExecuteReader();
      while (dr.Read())
        {
        stalled_id_q.Enqueue(dr["id"].ToString());
        }
      dr.Close();
      Close();
      return stalled_id_q;
      }

    internal string StatusDescriptionOf(object summary)
      {
      Open();
      using var my_sql_command = new MySqlCommand("select description from eval_status join eval on (eval.status_id=eval_status.id) where eval.id = '" + (summary as eval_summary).id + "'",connection);
      var status_description_of = my_sql_command.ExecuteScalar().ToString();
      Close();
      return status_description_of;
      }

    internal object Summary(string id)
      {
      return SummaryBase(condition_clause:"eval.id = '" + id + "'");
      }

    internal object SummaryOfUnique
      (
      string third_member_id,
      string aic_member_id,
      DateTime nominal_day,
      string time_in
      )
      {
      return SummaryBase
        (
        condition_clause:k.EMPTY
        + "third_member_id = '" + third_member_id + "'"
        + " and aic_member_id = '" + aic_member_id + "'"
        + " and nominal_day = '" + nominal_day.ToString("yyyy-MM-dd") + "'"
        + " and time_in like '" + time_in + ":00'"
        );
      }

    internal string VehicleNameOf(object summary)
      {
      return (summary as eval_summary).vehicle_name;
      }

    } // end TClass_db_evals

  }
