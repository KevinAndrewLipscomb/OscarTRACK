// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_biz_notifications;
using Class_db_evals;
using Class_db_members;
using kix;
using System;
using System.Collections;
using System.Configuration;

namespace Class_biz_evals
  {

  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    EVALUATEE_INIT,
    EVALUATOR_INIT,
    EVALUATEE_WORK,
    EVALUATOR_WORK,
    EVALUATEE_RESPOND,
    REVIEW_ONLY
    };

  public class TClass_biz_evals
    {

    private readonly TClass_biz_notifications biz_notifications = null;
    private readonly TClass_db_evals db_evals = null;
    private readonly TClass_db_members db_members = null;

    public TClass_biz_evals() : base()
      {
      biz_notifications = new TClass_biz_notifications();
      db_evals = new TClass_db_evals();
      db_members = new TClass_db_members();
      }

    public bool BeLockedByAicOf(object summary)
      {
      return db_evals.BeLockedByAicOf(summary);
      }

    public bool BeLockedByThirdInitiallyOf(object summary)
      {
      return db_evals.BeLockedByThirdInitiallyOf(summary);
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_evals.Bind(partial_spec, target);
      }

    public void BindBaseDataList
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
      db_evals.BindBaseDataList(sort_order,be_sort_order_ascending,target,third_member_id_filter,aic_member_id_filter,inprocess_all_archived_condition,evaluation_tier,third_section_filter);
      }

    public void BindDirectToListControl(object target)
      {
      db_evals.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_evals.Delete(id);
      }

    internal string EvaluateeMemberIdOf(object summary)
      {
      return db_evals.EvaluateeMemberIdOf(summary);
      }

    internal string EvaluateeNameOf(object summary)
      {
      return db_evals.EvaluateeNameOf(summary);
      }

    internal string EvaluatorMemberIdOf(object summary)
      {
      return db_evals.EvaluatorMemberIdOf(summary);
      }

    internal string EvaluatorNameOf(object summary)
      {
      return db_evals.EvaluatorNameOf(summary);
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
      return db_evals.Get
        (
        id,
        out third_member_id,
        out nominal_day,
        out shift_id,
        out post_id,
        out post_cardinality,
        out vehicle_id,
        out aic_member_id,
        out alt_aic_reason,
        out time_in,
        out time_out,
        out discussions,
        out aic_ok_with_third_progress_null_false_true_condition,
        out aic_ok_with_third_release_null_false_true_condition,
        out third_ok_with_progress_null_false_true_condition,
        out third_ok_with_release_null_false_true_condition,
        out comments_on_driving,
        out miles_driven_routine,
        out miles_driven_emergency,
        out road_conditions,
        out aic_ok_with_third_being_driver_null_false_true_condition,
        out third_ok_with_being_driver_null_false_true_condition,
        out status_id,
        out be_locked_by_third_initially,
        out be_locked_by_aic,
        out third_rebuttal
        );
      }

    internal string IdOf(object summary)
      {
      return db_evals.IdOf(summary);
      }

    internal void ManageStalled(string working_directory)
      {
      var eval_id = k.EMPTY;
      Queue eval_stalled_id_q;
      int eval_stalled_id_q_count;
      var num_days = new k.int_positive();
      var status_after_lock_and_submit = k.EMPTY;
      object summary;
      //--
      //
      // Auto-advance evals stalled > 2 days
      //
      //--
      num_days.val = int.Parse(ConfigurationManager.AppSettings["min_num_daily_scans_to_wait_before_auto_advancing_an_eval"]);
      //
      // by evaluatee
      //
      eval_stalled_id_q = db_evals.StalledIdQueue
        (
        num_days:num_days,
        be_stalled_by_evaluatee:true
        );
      eval_stalled_id_q_count = eval_stalled_id_q.Count;
      for (var i = new k.subtype<int>(0,eval_stalled_id_q_count); i.val < eval_stalled_id_q_count; i.val++)
        {
        eval_id = eval_stalled_id_q.Dequeue() as string;
        summary = Summary(eval_id);
        status_after_lock_and_submit = StatusAfterLockAndSubmit(presentation_mode_enum.EVALUATEE_WORK,summary);
        db_evals.AutoAdvance
          (
          id:eval_id,
          status_description:status_after_lock_and_submit,
          be_on_behalf_of_evaluatee:true
          );
        if (status_after_lock_and_submit != "ARCHIVED")
          {
          biz_notifications.IssueForEvalNeedsAicInput
            (
            eval_id:IdOf(summary),
            nominal_day:NominalDayOf(summary),
            shift_name:ShiftNameOf(summary),
            post_designator:PostDesignatorOf(summary),
            post_cardinality:PostCardinalityOf(summary),
            vehicle_name:VehicleNameOf(summary),
            evaluatee_name:EvaluateeNameOf(summary),
            evaluatee_member_id:EvaluateeMemberIdOf(summary),
            evaluator_member_id:EvaluatorMemberIdOf(summary)
            );
          }
        else
          {
          Send
            (
            id:IdOf(summary),
            evaluatee_member_id:EvaluateeMemberIdOf(summary),
            working_directory:working_directory
            );
          }
        }
      //
      // by evaluator
      //
      eval_stalled_id_q = db_evals.StalledIdQueue
        (
        num_days:num_days,
        be_stalled_by_evaluatee:false
        );
      eval_stalled_id_q_count = eval_stalled_id_q.Count;
      for (var i = new k.subtype<int>(0,eval_stalled_id_q_count); i.val < eval_stalled_id_q_count; i.val++)
        {
        eval_id = eval_stalled_id_q.Dequeue() as string;
        summary = Summary(eval_id);
        db_evals.AutoAdvance
          (
          id:eval_id,
          status_description:StatusAfterLockAndSubmit(presentation_mode_enum.EVALUATOR_WORK,summary),
          be_on_behalf_of_evaluatee:false
          );
        biz_notifications.IssueForEvalNeedsEvaluateeRebuttal
          (
          eval_id:IdOf(summary),
          nominal_day:NominalDayOf(summary),
          shift_name:ShiftNameOf(summary),
          post_designator:PostDesignatorOf(summary),
          post_cardinality:PostCardinalityOf(summary),
          vehicle_name:VehicleNameOf(summary),
          evaluator_name:EvaluatorNameOf(summary),
          evaluatee_member_id:EvaluateeMemberIdOf(summary)
          );
        }
      //--
      //
      // Nag for evals stalled > 1 days
      //
      //--
      num_days.val = 1;
      //
      // by evaluatee
      //
      eval_stalled_id_q = db_evals.StalledIdQueue
        (
        num_days:num_days,
        be_stalled_by_evaluatee:true
        );
      eval_stalled_id_q_count = eval_stalled_id_q.Count;
      for (var i = new k.subtype<int>(0,eval_stalled_id_q_count); i.val < eval_stalled_id_q_count; i.val++)
        {
        biz_notifications.IssueForEvalStalled
          (
          eval_id:eval_stalled_id_q.Dequeue() as string,
          be_stalled_by_evaluatee:true
          );
        }
      //
      // by evaluator
      //
      eval_stalled_id_q = db_evals.StalledIdQueue
        (
        num_days:num_days,
        be_stalled_by_evaluatee:false
        );
      eval_stalled_id_q_count = eval_stalled_id_q.Count;
      for (var i = new k.subtype<int>(0,eval_stalled_id_q_count); i.val < eval_stalled_id_q_count; i.val++)
        {
        biz_notifications.IssueForEvalStalled
          (
          eval_id:eval_stalled_id_q.Dequeue() as string,
          be_stalled_by_evaluatee:false
          );
        }
      }

    internal DateTime NominalDayOf(object summary)
      {
      return db_evals.NominalDayOf(summary);
      }

    internal string PostCardinalityOf(object summary)
      {
      return db_evals.PostCardinalityOf(summary);
      }

    internal string PostDesignatorOf(object summary)
      {
      return db_evals.PostDesignatorOf(summary);
      }

    internal presentation_mode_enum PresentationModeOfStatus
      (
      string user_member_id,
      bool be_user_evaluatee,
      object summary
      )
      {
      var presentation_mode_of_status = presentation_mode_enum.REVIEW_ONLY;
      if (summary == null)
        {
        presentation_mode_of_status = (be_user_evaluatee ? presentation_mode_enum.EVALUATEE_INIT : presentation_mode_enum.EVALUATOR_INIT);
        }
      else
        {
        if (new ArrayList() {db_evals.EvaluateeMemberIdOf(summary),db_evals.EvaluatorMemberIdOf(summary)}.Contains(user_member_id))
          {
          var status = db_evals.StatusDescriptionOf(summary);
          if (status == "NEEDS_BOTH_LOCKS")
            {
            if (be_user_evaluatee)
              {
              presentation_mode_of_status = (db_evals.BeLockedByThirdInitiallyOf(summary) ? presentation_mode_enum.REVIEW_ONLY : presentation_mode_enum.EVALUATEE_WORK);
              }
            else
              {
              presentation_mode_of_status = (db_evals.BeLockedByAicOf(summary) ? presentation_mode_enum.REVIEW_ONLY : presentation_mode_enum.EVALUATOR_WORK);
              }
            }
          else if ((status == "NEEDS_EVALUATEE_REBUTTAL") && be_user_evaluatee)
            {
            presentation_mode_of_status = presentation_mode_enum.EVALUATEE_RESPOND;
            }
          }
        }
      return presentation_mode_of_status;
      }

    internal void Send
      (
      string id,
      string evaluatee_member_id,
      string working_directory
      )
      {
      var stdout = k.EMPTY;
      var stderr = k.EMPTY;
      k.RunCommandIteratedOverArguments
        (
        "c:\\cygwin\\bin\\wget",
        new ArrayList()
          {
          "--output-document=/dev/null --no-check-certificate"
          + " --post-data"
          +   "=eval_id=" + id
          +   "&target_agency_id=" + db_members.SectionOfId(evaluatee_member_id)
                // Caution:  This is a non-standard use of the section attribute.  This reflects EMS HQ's current practice of using section to indicate which squad an evaluatee intends to join in the future.
          + k.SPACE
          + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_commanded_eval.aspx\""
          },
        working_directory,
        out stdout,
        out stderr
        );
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
      k.int_sign_range aic_ok_with_third_progress_null_false_true_of_condition,
      k.int_sign_range aic_ok_with_third_release_null_false_true_of_condition,
      k.int_sign_range third_ok_with_progress_null_false_true_of_condition,
      k.int_sign_range third_ok_with_release_null_false_true_of_condition,
      string comments_on_driving,
      string miles_driven_routine,
      string miles_driven_emergency,
      string road_conditions,
      k.int_sign_range aic_ok_with_third_being_driver_null_false_true_of_condition,
      k.int_sign_range third_ok_with_being_driver_null_false_true_of_condition,
      string status_id,
      bool be_locked_by_third_initially,
      bool be_locked_by_aic,
      string third_rebuttal
      )
      {
      db_evals.Set
        (
        id,
        third_member_id,
        nominal_day,
        shift_id,
        post_id,
        post_cardinality,
        vehicle_id,
        aic_member_id,
        alt_aic_reason,
        time_in,
        time_out,
        discussions,
        aic_ok_with_third_progress_null_false_true_of_condition,
        aic_ok_with_third_release_null_false_true_of_condition,
        third_ok_with_progress_null_false_true_of_condition,
        third_ok_with_release_null_false_true_of_condition,
        comments_on_driving,
        miles_driven_routine,
        miles_driven_emergency,
        road_conditions,
        aic_ok_with_third_being_driver_null_false_true_of_condition,
        third_ok_with_being_driver_null_false_true_of_condition,
        status_id,
        be_locked_by_third_initially,
        be_locked_by_aic,
        third_rebuttal
        );
      }

    internal string ShiftNameOf(object summary)
      {
      return db_evals.ShiftNameOf(summary);
      }

    internal string StatusAfterLockAndSubmit
      (
      presentation_mode_enum presentation_mode,
      object summary
      )
      {
      var status_after_lock_and_submit = k.EMPTY;
      if (presentation_mode == presentation_mode_enum.EVALUATEE_WORK)
        {
        status_after_lock_and_submit = (db_evals.BeLockedByAicOf(summary) ? "ARCHIVED" : "NEEDS_BOTH_LOCKS");
        }
      else if (presentation_mode == presentation_mode_enum.EVALUATOR_WORK)
        {
        status_after_lock_and_submit = (db_evals.BeLockedByThirdInitiallyOf(summary) ? "NEEDS_EVALUATEE_REBUTTAL" : "NEEDS_BOTH_LOCKS");
        }
      else if (presentation_mode == presentation_mode_enum.EVALUATEE_RESPOND)
        {
        status_after_lock_and_submit = "ARCHIVED";
        }
      return status_after_lock_and_submit;
      }

    internal string StatusDescriptionOf(object summary)
      {
      return db_evals.StatusDescriptionOf(summary);
      }

    internal object Summary(string id)
      {
      return db_evals.Summary(id);
      }

    internal object SummaryOfUnique(string third_member_id, string aic_member_id, DateTime nominal_day, string time_in)
      {
      return db_evals.SummaryOfUnique(third_member_id,aic_member_id,nominal_day,time_in);
      }

    internal string VehicleNameOf(object summary)
      {
      return db_evals.VehicleNameOf(summary);
      }

    } // end TClass_biz_evals

  }
