// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~kicrudhelped~item.ascx.cs~template

using AjaxControlToolkit;
using Class_biz_agencies;
using Class_biz_driver_skill_ratings;
using Class_biz_eval_statuses;
using Class_biz_evals;
using Class_biz_members;
using Class_biz_notifications;
using Class_biz_patient_encounters;
using Class_biz_role_member_map;
using Class_biz_schedule_assignments;
using Class_biz_shifts;
using Class_biz_skill_ratings;
using Class_biz_vehicles;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_eval
  {
  public partial class TWebUserControl_eval: ki_web_ui.usercontrol_class
    {
    public class UserControl_eval_Static
      {
      public const int TCI_OPEN = 0;
      public const int TCI_ID = 1;
      public const int TCI_CHIEF_COMPLAINT = 2;
      public const int TCI_AGE = 3;
      public const int TCI_LEVEL = 4;
      public const int TCI_LEADER = 5;
      //
      public const int TCI_DRIVER_SKILL_ID = 0;
      public const int TCI_DRIVER_SKILL_DESCRIPTION = 1;
      public const int TCI_DRIVER_SKILL_PERFORMED_NEEDS_RATING = 2;
      public const int TCI_DRIVER_SKILL_RATING_ID = 3;
      public const int TCI_DRIVER_SKILL_RATING_SKILL_RATING_ID = 4;
      public const int TCI_DRIVER_SKILL_RATING = 5;
      }

    private struct p_type
      {
      public bool be_evaluatee_driver_qualified;
      public bool be_evaluatee_released;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_locked_by_aic;
      public bool be_locked_by_third_initially;
      public bool be_ok_to_config_evals;
      public bool be_user_evaluatee;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_driver_skill_ratings biz_driver_skill_ratings;
      public TClass_biz_evals biz_evals;
      public TClass_biz_eval_statuses biz_eval_statuses;
      public TClass_biz_members biz_members;
      public TClass_biz_notifications biz_notifications;
      public TClass_biz_patient_encounters biz_patient_encounters;
      public TClass_biz_role_member_map biz_role_member_map;
      public TClass_biz_schedule_assignments biz_schedule_assignments;
      public TClass_biz_shifts biz_shifts;
      public TClass_biz_skill_ratings biz_skill_ratings;
      public TClass_biz_vehicles biz_vehicles;
      public TClass_msg_protected.patient_encounter_detail msg_protected_patient_encounter_detail;
      public string most_likely_aic_member_id;
      public k.int_nonnegative num_patient_encounters;
      public presentation_mode_enum presentation_mode;
      public ListItem[] proto_driver_skill_rating_list_item_array;
      public object summary;
      public string user_member_id;
      }

    private p_type p;

    private void Clear()
      {
      TextBox_id.Text = k.EMPTY;
      DropDownList_id.Visible = false;
      DropDownList_evaluatee.ClearSelection();
      UserControl_drop_down_date_nominal_day.Clear();
      DropDownList_shift.ClearSelection();
      DropDownList_post.ClearSelection();
      DropDownList_post_cardinality.ClearSelection();
      DropDownList_vehicle.ClearSelection();
      DropDownList_aic.ClearSelection();
      TextBox_alt_aic_reason.Text = k.EMPTY;
      UserControl_drop_down_time_of_day_in.Clear();
      UserControl_drop_down_time_of_day_out.Clear();
      TextBox_discussions.Text = k.EMPTY;
      RadioButtonList_be_aic_ok_with_third_progress.ClearSelection();
      RadioButtonList_be_aic_ok_with_third_release.ClearSelection();
      RadioButtonList_be_third_ok_with_progress.ClearSelection();
      RadioButtonList_be_third_ok_with_release.ClearSelection();
      TextBox_comments_on_driving.Text = k.EMPTY;
      TextBox_miles_driven_routine.Text = k.EMPTY;
      TextBox_miles_driven_emergency.Text = k.EMPTY;
      TextBox_road_conditions.Text = k.EMPTY;
      RadioButtonList_be_aic_ok_with_third_being_driver.ClearSelection();
      RadioButtonList_be_third_ok_with_being_driver.ClearSelection();
      TextBox_third_rebuttal.Text = k.EMPTY;
      Literal_match_index.Text = k.EMPTY;
      Literal_num_matches.Text = k.EMPTY;
      Panel_match_numbers.Visible = false;
      LinkButton_go_to_match_prior.Visible = false;
      LinkButton_go_to_match_next.Visible = false;
      LinkButton_go_to_match_last.Visible = false;
      LinkButton_go_to_match_first.Visible = false;
      SetDependentFieldAblements(false);
      Button_basic_info_save.Enabled = false;
      Button_interaction_info_save.Enabled = false;
      LinkButton_add_a_patient_encounter.Enabled = false;
      Button_patient_care_summary_save.Enabled = false;
      Button_driving_summary_save.Enabled = false;
      Button_lock_and_submit.Enabled = false;
      }

    private void InjectPersistentClientSideScript()
      {
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.EL);
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.KGS_TO_LBS);
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.LBS_TO_KGS);
      // EstablishClientSideFunction
      //   (
      //   'RecalculateDependentValues()',
      //   k.EMPTY
      //   + 'El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value ='
      //   +  ' El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_lbs.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value ='
      //   +  ' El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_kgs.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
      //   +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
      //   +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value ='
      //   +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value - El("' + TextBox_franchise_in_lbs.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value ='
      //   +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value - El("' + TextBox_franchise_in_kgs.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
      //   +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
      //   +  ' El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_percent_gain_or_loss.clientid + '").value ='
      //   +  ' Math.round(El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_net_invoiced_in_lbs.clientid + '").value*100*100)/100;'
      //   + k.NEW_LINE
      //   + 'El("' + TextBox_monetary_gain_or_loss.clientid + '").value ='
      //   +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value*El("' + TextBox_unit_price_in_cents_per_pound.clientid + '").value;'
      //   );
      // //
      // TextBox_bales.attributes.Add('onkeyup','RecalculateDependentValues();');
      // TextBox_gross_landed_weight_in_pounds.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_gross_landed_weight_in_kgs.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_landed_or_ciq_tare.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_landed_or_ciq_tare.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_landed_or_ciq_tare_in_kgs.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_landed_or_ciq_tare.clientid + '").value = KgsToLbs(El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_net_landed_in_pounds.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_net_landed_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_net_landed_in_pounds.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      // TextBox_net_landed_in_kgs.attributes.Add
      //   (
      //   'onkeyup',
      //   'El("' + TextBox_net_landed_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_net_landed_in_kgs.clientid + '").value);'
      //   + ' RecalculateDependentValues();'
      //   );
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (p.presentation_mode == presentation_mode_enum.FULL_FUNCTION)
          {
          TableRow_record_navigation_controls.Visible = true;
          LinkButton_new_record.Visible = p.be_ok_to_config_evals;
          LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
          LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
          LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
          LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
          }
        SetDataEntryMode();
        p.biz_members.BindEvaluateesDirectToListControl(DropDownList_evaluatee);
        UserControl_drop_down_date_nominal_day.maxyear = (DateTime.Now.Year + 1).ToString();
        UserControl_drop_down_date_nominal_day.minyear = (DateTime.Now.Year - 1).ToString();
        p.biz_shifts.BindDirectToListControlByPeckingOrder(DropDownList_shift);
        p.biz_agencies.BindEvalPostDirectToListControl(DropDownList_post);
        var dummy_string = k.EMPTY;
        var max_post_cardinality = k.EMPTY;
        p.biz_schedule_assignments.GetAgencyFootprintInfo
          (
          agency_filter:k.EMPTY,
          relative_month:new k.subtype<int>(0,0),
          nominal_day_filter:k.EMPTY,
          posts:out dummy_string,
          max_post_cardinality:out max_post_cardinality
          );
        p.biz_schedule_assignments.BindPostCardinalityListControl
          (
          max_post_cardinality:max_post_cardinality,
          target:DropDownList_post_cardinality,
          designator:k.EMPTY
          );
        DropDownList_post_cardinality.Items.Insert(0,new ListItem("-- Crew --",k.EMPTY));
        p.biz_vehicles.BindActiveKindAndNameDirectToListControl(DropDownList_vehicle);
        p.biz_eval_statuses.BindDirectToListControl(DropDownList_status,"(unsaved)");
        p.biz_members.BindEvaluatorsDirectToListControl(DropDownList_aic);
        UserControl_drop_down_time_of_day_in.minute_intervals = 15;
        UserControl_drop_down_time_of_day_out.minute_intervals = 15;
        //
        if (p.presentation_mode == presentation_mode_enum.EVALUATEE_INIT)
          {
          p.be_evaluatee_released = p.biz_members.BeReleased(p.user_member_id);
          p.be_evaluatee_driver_qualified = p.biz_members.BeDriverQualifiedOfId(p.user_member_id);
          //
          TableRow_record_navigation_controls.Visible = false;
          DropDownList_evaluatee.SelectedValue = p.user_member_id;
          DropDownList_evaluatee.Enabled = false;
          SetDependentFieldAblements(true);
          //
          // Preselect the most likely values...
          //
          var most_likely_nominal_day = k.EMPTY;
          var most_likely_shift_id = k.EMPTY;
          var most_likely_post_id = k.EMPTY;
          var most_likely_post_cardinality = k.EMPTY;
          var most_likely_time_in = k.EMPTY;
          var most_likely_time_out = k.EMPTY;
          var most_likely_aic_member_id = k.EMPTY;
          p.biz_schedule_assignments.GetMostLikelyForNewEval
            (
            client_timezone_offset:(Double)(Session["client_timezone_offset"]),
            user_member_id:p.user_member_id,
            most_likely_nominal_day:out most_likely_nominal_day,
            most_likely_shift_id:out most_likely_shift_id,
            most_likely_post_id:out most_likely_post_id,
            most_likely_post_cardinality:out most_likely_post_cardinality,
            most_likely_time_in:out most_likely_time_in,
            most_likely_time_out:out most_likely_time_out,
            most_likely_aic_member_id:out most_likely_aic_member_id
            );
          DateTime most_likely_nominal_day_datetime;
          if (DateTime.TryParse(most_likely_nominal_day,out most_likely_nominal_day_datetime))
            {
            UserControl_drop_down_date_nominal_day.selectedvalue = most_likely_nominal_day_datetime;
            }
          DropDownList_shift.SelectedValue = most_likely_shift_id;
          DropDownList_post.SelectedValue = most_likely_post_id;
          DropDownList_post_cardinality.SelectedValue = most_likely_post_cardinality;
          UserControl_drop_down_time_of_day_in.selectedvalue = most_likely_time_in;
          UserControl_drop_down_time_of_day_out.selectedvalue = most_likely_time_out;
          //
          p.most_likely_aic_member_id = most_likely_aic_member_id;
          DropDownList_aic.SelectedValue = p.most_likely_aic_member_id;
          }
        else if (p.presentation_mode == presentation_mode_enum.EVALUATOR_INIT)
          {
          TableRow_record_navigation_controls.Visible = false;
          DropDownList_aic.SelectedValue = p.user_member_id;
          DropDownList_aic.Enabled = false;
          SetDependentFieldAblements(true);
          }
        else if ((new ArrayList {presentation_mode_enum.EVALUATEE_WORK,presentation_mode_enum.EVALUATOR_WORK}).Contains(p.presentation_mode))
          {
          PresentRecord(p.biz_evals.IdOf(p.summary));
          Panel_basic_items.Enabled = false;
          Panel_patient_encounters.Visible = true;
          Panel_patient_care_summary.Visible = true;
          Panel_driving_summary.Visible = true;
          }
        else if (p.presentation_mode == presentation_mode_enum.EVALUATEE_RESPOND)
          {
          PresentRecord(p.biz_evals.IdOf(p.summary));
          Panel_basic_items.Enabled = false;
          Panel_patient_encounters.Visible = true;
          Panel_patient_care_summary.Visible = true;
          Panel_driving_summary.Visible = true;
          Panel_third_rebuttal.Visible = true;
          TableRow_defaults_to_concur.Visible = p.be_user_evaluatee;
          Literal_aplication_name.Text = ConfigurationManager.AppSettings["application_name"];
          }
        else if (p.presentation_mode == presentation_mode_enum.REVIEW_ONLY)
          {
          PresentRecord(p.biz_evals.IdOf(p.summary));
          //
          Button_basic_info_save.Visible = false;
          Panel_basic_items.Enabled = false;
          //
          Button_interaction_info_save.Visible = false;
          Panel_interaction_items.Enabled = false;
          //
          LinkButton_add_a_patient_encounter.Visible = false;
          Panel_patient_encounters.Enabled = false;
          //
          Button_patient_care_summary_save.Visible = false;
          Panel_patient_care_summary.Enabled = false;
          //
          Button_driving_summary_save.Visible = false;
          Panel_driving_summary.Enabled = false;
          //
          Panel_third_rebuttal.Enabled = false;
          //
          Button_lock_and_submit.Visible = false;
          }
        //
        if (new ArrayList() {presentation_mode_enum.EVALUATEE_INIT,presentation_mode_enum.EVALUATEE_WORK,presentation_mode_enum.EVALUATOR_INIT,presentation_mode_enum.EVALUATOR_WORK}.Contains(p.presentation_mode))
          {
          RequireConfirmation
            (
            c:Button_lock_and_submit,
            prompt:k.EMPTY
            + "You should only LOCK AND SUBMIT this eval if this shift is over and you have no more modifications to make." + k.NEW_LINE
            + k.NEW_LINE
            + "Are you sure you want to LOCK AND SUBMIT this eval?"
            );
          }
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      ToolkitScriptManager.GetCurrent(Page).RegisterPostBackControl(LinkButton_add_a_patient_encounter);
      ToolkitScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_lock_and_submit);
      }

    private bool PresentRecord(string id)
      {
      Literal_match_index.Text = DropDownList_id.SelectedIndex.ToString();
      bool result;
      string third_member_id;
      DateTime nominal_day;
      string shift_id;
      string post_id;
      string post_cardinality;
      string vehicle_id;
      string aic_member_id;
      string alt_aic_reason;
      DateTime time_in;
      DateTime time_out;
      string discussions;
      k.int_sign_range aic_ok_with_third_progress_null_false_true_condition;
      k.int_sign_range aic_ok_with_third_release_null_false_true_condition;
      k.int_sign_range third_ok_with_progress_null_false_true_condition;
      k.int_sign_range third_ok_with_release_null_false_true_condition;
      string comments_on_driving;
      string miles_driven_routine;
      string miles_driven_emergency;
      string road_conditions;
      k.int_sign_range aic_ok_with_third_being_driver_null_false_true_condition;
      k.int_sign_range third_ok_with_being_driver_null_false_true_condition;
      string status_id;
      bool be_locked_by_third_initially;
      bool be_locked_by_aic;
      string third_rebuttal;
      result = false;
      if
        (
        p.biz_evals.Get
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
          )
        )
        {
        TextBox_id.Text = id;
        TextBox_id.Enabled = false;
        DropDownList_evaluatee.SelectedValue = third_member_id;
        UserControl_drop_down_date_nominal_day.selectedvalue = nominal_day;
        DropDownList_shift.SelectedValue = shift_id;
        DropDownList_post.SelectedValue = post_id;
        DropDownList_post_cardinality.SelectedValue = post_cardinality;
        DropDownList_vehicle.SelectedValue = vehicle_id;
        DropDownList_status.SelectedValue = status_id;
        DropDownList_aic.SelectedValue = aic_member_id;
        TextBox_alt_aic_reason.Text = alt_aic_reason;
        UserControl_drop_down_time_of_day_in.selectedvalue = time_in.ToString("HH:mm");
        UserControl_drop_down_time_of_day_out.selectedvalue = time_out.ToString("HH:mm");
        TextBox_discussions.Text = discussions;
        RadioButtonList_be_aic_ok_with_third_progress.SelectedValue = k.NoneNoYesOf(aic_ok_with_third_progress_null_false_true_condition,k.EMPTY);
        RadioButtonList_be_aic_ok_with_third_release.SelectedValue = k.NoneNoYesOf(aic_ok_with_third_release_null_false_true_condition,k.EMPTY);
        RadioButtonList_be_third_ok_with_progress.SelectedValue = k.NoneNoYesOf(third_ok_with_progress_null_false_true_condition,k.EMPTY);
        RadioButtonList_be_third_ok_with_release.SelectedValue = k.NoneNoYesOf(third_ok_with_release_null_false_true_condition,k.EMPTY);
        TextBox_comments_on_driving.Text = comments_on_driving;
        TextBox_miles_driven_routine.Text = miles_driven_routine;
        TextBox_miles_driven_emergency.Text = miles_driven_emergency;
        TextBox_road_conditions.Text = road_conditions;
        RadioButtonList_be_aic_ok_with_third_being_driver.SelectedValue = k.NoneNoYesOf(aic_ok_with_third_being_driver_null_false_true_condition,k.EMPTY);
        RadioButtonList_be_third_ok_with_being_driver.SelectedValue = k.NoneNoYesOf(third_ok_with_being_driver_null_false_true_condition,k.EMPTY);
        DropDownList_status.SelectedValue = status_id;
        p.be_locked_by_third_initially = be_locked_by_third_initially;
        p.be_locked_by_aic = be_locked_by_aic;
        TextBox_third_rebuttal.Text = third_rebuttal;
        //
        p.num_patient_encounters.val = 0;
        p.biz_patient_encounters.BindBaseDataList
          (
          target:DataGrid_control,
          eval_id_filter:id
          );
        TableRow_none.Visible = (p.num_patient_encounters.val == 0);
        DataGrid_control.Visible = (p.num_patient_encounters.val > 0);
        //
        ManageDriverSkillRatingsDataGrid();
        //
        Button_lookup.Enabled = false;
        Label_lookup_arrow.Enabled = false;
        Label_lookup_hint.Enabled = false;
        LinkButton_reset.Enabled = true;
        SetDependentFieldAblements(true);
        ManageVisibilities();
        result = true;
        }
      return result;
      }

    internal void Set
      (
      string id,
      string user_member_id,
      bool be_user_evaluatee
      )
      {
      if (id.Length > 0)
        {
        p.summary = p.biz_evals.Summary(id);
        p.be_locked_by_aic = p.biz_evals.BeLockedByAicOf(p.summary);
        p.be_locked_by_third_initially = p.biz_evals.BeLockedByThirdInitiallyOf(p.summary);
        }
      else
        {
        p.summary = null;
        p.be_locked_by_aic = false;
        p.be_locked_by_third_initially = false;
        }
      p.user_member_id = user_member_id;
      p.be_user_evaluatee = be_user_evaluatee;
      //
      p.presentation_mode = p.biz_evals.PresentationModeOfStatus(p.user_member_id,p.be_user_evaluatee,p.summary);
      }

    private void ManageDriverSkillRatingsDataGrid()
      {
      var proto_driver_skill_rating_list_item_collection = new ListItemCollection();
      var for_evaluatee_both_evaluator_condition = new k.int_sign_range(0);
      if (p.presentation_mode == presentation_mode_enum.EVALUATEE_WORK)
        {
        p.biz_skill_ratings.BindListItemCollectionForEvaluatee(target: proto_driver_skill_rating_list_item_collection);
        }
      else if (p.presentation_mode == presentation_mode_enum.EVALUATOR_WORK)
        {
        p.biz_skill_ratings.BindListItemCollectionForEvaluator(target: proto_driver_skill_rating_list_item_collection);
        DataGrid_driver_skill.Columns[UserControl_eval_Static.TCI_DRIVER_SKILL_PERFORMED_NEEDS_RATING].Visible = true;
        }
      else
        {
        p.biz_skill_ratings.BindListItemCollectionUnlimited(target: proto_driver_skill_rating_list_item_collection);
        }
      p.proto_driver_skill_rating_list_item_array = new ListItem[proto_driver_skill_rating_list_item_collection.Count];
      proto_driver_skill_rating_list_item_collection.CopyTo(p.proto_driver_skill_rating_list_item_array, 0);
      p.biz_driver_skill_ratings.BindBaseDataList
        (
        target: DataGrid_driver_skill,
        eval_id: p.biz_evals.IdOf(p.summary)
        );
      }

    private void SetDataEntryMode()
      {
      Clear();
      TextBox_id.Text = "*";
      TextBox_id.Enabled = false;
      Button_lookup.Enabled = false;
      Label_lookup_arrow.Enabled = false;
      Label_lookup_hint.Enabled = false;
      LinkButton_reset.Enabled = true;
      LinkButton_new_record.Enabled = false;
      SetDependentFieldAblements(p.be_ok_to_config_evals);
      Button_basic_info_save.Enabled = p.be_ok_to_config_evals;
      Button_interaction_info_save.Enabled = p.be_ok_to_config_evals;
      LinkButton_add_a_patient_encounter.Enabled = p.be_ok_to_config_evals;
      Button_patient_care_summary_save.Enabled = p.be_ok_to_config_evals;
      Button_driving_summary_save.Enabled = p.be_ok_to_config_evals;
      TextBox_id.Focus();
      }

    private void SetLookupMode()
      {
      Clear();
      TextBox_id.Enabled = true;
      Button_lookup.Enabled = true;
      Label_lookup_arrow.Enabled = true;
      Label_lookup_hint.Enabled = true;
      LinkButton_reset.Enabled = false;
      LinkButton_new_record.Enabled = true;
      TextBox_id.Focus();
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack;
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_driver_skill_ratings = new TClass_biz_driver_skill_ratings();
        p.biz_evals = new TClass_biz_evals();
        p.biz_eval_statuses = new TClass_biz_eval_statuses();
        p.biz_members = new TClass_biz_members();
        p.biz_notifications = new TClass_biz_notifications();
        p.biz_patient_encounters = new TClass_biz_patient_encounters();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        p.biz_shifts = new TClass_biz_shifts();
        p.biz_skill_ratings = new TClass_biz_skill_ratings();
        p.biz_vehicles = new TClass_biz_vehicles();
        //
        p.be_evaluatee_driver_qualified = false;
        p.be_evaluatee_released = false;
        p.be_interactive = (Session["mode:report"] == null);
        p.be_locked_by_aic = false;
        p.be_locked_by_third_initially = false;
        p.be_ok_to_config_evals = false;
        p.be_user_evaluatee = true;
        p.msg_protected_patient_encounter_detail = new TClass_msg_protected.patient_encounter_detail();
        p.most_likely_aic_member_id = k.EMPTY;
        p.num_patient_encounters = new k.int_nonnegative();
        p.presentation_mode = presentation_mode_enum.NONE;
        p.summary = null;
        p.user_member_id = k.EMPTY;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      //this.Load += this.Page_Load;
      this.PreRender += this.TWebUserControl_eval_PreRender;
      }

    private void TWebUserControl_eval_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_eval Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      UserControl_drop_down_date_nominal_day.Fresh();
      return this;
      }

    protected void Button_save_Click(object sender, System.EventArgs e)
      {
      if (Page.IsValid)
        {
        DropDownList_status.SelectedIndex = DropDownList_status.Items.IndexOf(DropDownList_status.Items.FindByText("NEEDS_BOTH_LOCKS"));
        SaveRecord();
        p.summary = p.biz_evals.SummaryOfUnique
          (
          third_member_id:k.Safe(DropDownList_evaluatee.SelectedValue,k.safe_hint_type.NUM),
          aic_member_id:k.Safe(DropDownList_aic.SelectedValue,k.safe_hint_type.NUM),
          nominal_day:UserControl_drop_down_date_nominal_day.selectedvalue,
          time_in:k.Safe(UserControl_drop_down_time_of_day_in.selectedvalue,k.safe_hint_type.DATE_TIME)
          );
        //
        var msg = new TClass_msg_protected.eval_detail();
        msg.id = p.biz_evals.IdOf(p.summary);
        msg.user_member_id = p.user_member_id;
        msg.be_user_evaluatee = p.be_user_evaluatee;
        MessageBack(msg,"protected","eval_detail");
        //
        p.presentation_mode = (p.be_user_evaluatee ? presentation_mode_enum.EVALUATEE_WORK : presentation_mode_enum.EVALUATOR_WORK);
        ManageDriverSkillRatingsDataGrid();
        SetDependentFieldAblements(ablement:true);
        ManageVisibilities();
        //
        }
      else
        {
        ValidationAlert(true);
        }
      }

    private void SaveRecord()
      {
      var time_in = DateTime.Parse(k.Safe(UserControl_drop_down_time_of_day_in.selectedvalue, k.safe_hint_type.DATE_TIME));
      var time_out = DateTime.Parse(k.Safe(UserControl_drop_down_time_of_day_out.selectedvalue, k.safe_hint_type.DATE_TIME));
      //
      p.biz_evals.Set
        (
        k.Safe(TextBox_id.Text, k.safe_hint_type.NUM),
        k.Safe(DropDownList_evaluatee.SelectedValue, k.safe_hint_type.NUM).Trim(),
        UserControl_drop_down_date_nominal_day.selectedvalue,
        k.Safe(DropDownList_shift.SelectedValue, k.safe_hint_type.NUM).Trim(),
        k.Safe(DropDownList_post.SelectedValue, k.safe_hint_type.NUM).Trim(),
        k.Safe(DropDownList_post_cardinality.SelectedValue, k.safe_hint_type.ALPHA).Trim(),
        k.Safe(DropDownList_vehicle.SelectedValue, k.safe_hint_type.NUM).Trim(),
        k.Safe(DropDownList_aic.SelectedValue, k.safe_hint_type.NUM).Trim(),
        k.Safe(TextBox_alt_aic_reason.Text, k.safe_hint_type.PUNCTUATED).Trim(),
        time_in,
        time_out,
        k.Safe(TextBox_discussions.Text, k.safe_hint_type.MEMO).Trim(),
        k.IntsignrangeOfOptionalBoolean((RadioButtonList_be_aic_ok_with_third_progress.SelectedValue.Length > 0 ? k.BooleanOfYesNo(RadioButtonList_be_aic_ok_with_third_progress.SelectedValue).ToString() : k.EMPTY)),
        k.IntsignrangeOfOptionalBoolean((RadioButtonList_be_aic_ok_with_third_release.SelectedValue.Length > 0 ? k.BooleanOfYesNo(RadioButtonList_be_aic_ok_with_third_release.SelectedValue).ToString() : k.EMPTY)),
        k.IntsignrangeOfOptionalBoolean((RadioButtonList_be_third_ok_with_progress.SelectedValue.Length > 0 ? k.BooleanOfYesNo(RadioButtonList_be_third_ok_with_progress.SelectedValue).ToString() : k.EMPTY)),
        k.IntsignrangeOfOptionalBoolean((RadioButtonList_be_third_ok_with_release.SelectedValue.Length > 0 ? k.BooleanOfYesNo(RadioButtonList_be_third_ok_with_release.SelectedValue).ToString() : k.EMPTY)),
        k.Safe(TextBox_comments_on_driving.Text, k.safe_hint_type.MEMO).Trim(),
        k.Safe(TextBox_miles_driven_routine.Text, k.safe_hint_type.REAL_NUM).Trim(),
        k.Safe(TextBox_miles_driven_emergency.Text, k.safe_hint_type.REAL_NUM).Trim(),
        k.Safe(TextBox_road_conditions.Text, k.safe_hint_type.PUNCTUATED).Trim(),
        k.IntsignrangeOfOptionalBoolean((RadioButtonList_be_aic_ok_with_third_being_driver.SelectedValue.Length > 0 ? k.BooleanOfYesNo(RadioButtonList_be_aic_ok_with_third_being_driver.SelectedValue).ToString() : k.EMPTY)),
        k.IntsignrangeOfOptionalBoolean((RadioButtonList_be_third_ok_with_being_driver.SelectedValue.Length > 0 ? k.BooleanOfYesNo(RadioButtonList_be_third_ok_with_being_driver.SelectedValue).ToString() : k.EMPTY)),
        k.Safe(DropDownList_status.SelectedValue,k.safe_hint_type.NUM),
        p.be_locked_by_third_initially,
        p.be_locked_by_aic,
        k.Safe(TextBox_third_rebuttal.Text, k.safe_hint_type.MEMO)
        );
      TableCellCollection tcc;
      var driver_skill_rating_id = k.EMPTY;
      var skill_rating_id = k.EMPTY;
      for (var i = new k.subtype<int>(0,DataGrid_driver_skill.Items.Count); i.val < i.LAST; i.val++)
        {
        tcc = DataGrid_driver_skill.Items[i.val].Cells;
        skill_rating_id = k.Safe((tcc[UserControl_eval_Static.TCI_DRIVER_SKILL_RATING].Controls[0] as DropDownList).SelectedValue,k.safe_hint_type.NUM);
        driver_skill_rating_id = k.Safe(tcc[UserControl_eval_Static.TCI_DRIVER_SKILL_RATING_ID].Text,k.safe_hint_type.NUM);
        if (skill_rating_id.Length > 0)
          {
          p.biz_driver_skill_ratings.Set
            (
            id:driver_skill_rating_id,
            driver_skill_id:k.Safe(tcc[UserControl_eval_Static.TCI_DRIVER_SKILL_ID].Text,k.safe_hint_type.NUM),
            skill_rating_id:skill_rating_id,
            eval_id:p.biz_evals.IdOf(p.summary)
            );
          }
        else
          {
          p.biz_driver_skill_ratings.Delete(id:driver_skill_rating_id);
          }
        }
      }

    protected void DropDownList_id_SelectedIndexChanged(object sender, System.EventArgs e)
      {
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
      }

    protected void LinkButton_go_to_match_first_Click(object sender, System.EventArgs e)
      {
      DropDownList_id.SelectedIndex = 1;
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
      }

    protected void LinkButton_go_to_match_prior_Click(object sender, System.EventArgs e)
      {
      DropDownList_id.SelectedIndex = Math.Max(1, (DropDownList_id.SelectedIndex - 1));
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
      }

    protected void LinkButton_go_to_match_next_Click(object sender, System.EventArgs e)
      {
      DropDownList_id.SelectedIndex = Math.Min((DropDownList_id.SelectedIndex + 1), (DropDownList_id.Items.Count - 1));
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
      }

    protected void LinkButton_go_to_match_last_Click(object sender, System.EventArgs e)
      {
      DropDownList_id.SelectedIndex = DropDownList_id.Items.Count - 1;
      PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
      }

    protected void Button_delete_Click(object sender, System.EventArgs e)
      {
      if (p.biz_evals.Delete(k.Safe(TextBox_id.Text, k.safe_hint_type.NUM)))
        {
        SetLookupMode();
        }
      else
        {
        Alert(k.alert_cause_type.APPDATA,k.alert_state_type.FAILURE, "dependency", " Cannot delete this record because another record depends on it.", true);
        }
      }

    protected void LinkButton_new_record_Click(object sender, System.EventArgs e)
      {
      SetDataEntryMode();
      }

    protected void LinkButton_reset_Click(object sender, System.EventArgs e)
      {
      SetLookupMode();
      }

    private void ManageVisibilities()
      {
      var be_in_any_work_or_review_mode =
        (
        new ArrayList
          {
          presentation_mode_enum.EVALUATEE_WORK,
          presentation_mode_enum.EVALUATOR_WORK,
          presentation_mode_enum.EVALUATEE_RESPOND,
          presentation_mode_enum.REVIEW_ONLY,
          presentation_mode_enum.FULL_FUNCTION
          }
        )
        .Contains(p.presentation_mode);
      //
      Panel_patient_encounters.Visible = be_in_any_work_or_review_mode && !p.be_evaluatee_released;
      Panel_patient_care_summary.Visible = be_in_any_work_or_review_mode && !p.be_evaluatee_released;
      Panel_driving_summary.Visible = be_in_any_work_or_review_mode && !p.be_evaluatee_driver_qualified;
      Panel_third_rebuttal.Visible = (new ArrayList() {"NEEDS_EVALUATEE_REBUTTAL","ARCHIVED"}).Contains(p.biz_evals.StatusDescriptionOf(p.summary));
      //
      DataGrid_control.Columns[UserControl_eval_Static.TCI_OPEN].Visible = new ArrayList {presentation_mode_enum.EVALUATEE_WORK,presentation_mode_enum.EVALUATOR_WORK}.Contains(p.presentation_mode);
      }

    private void SetDependentFieldAblements(bool ablement)
      {
      if (p.presentation_mode == presentation_mode_enum.EVALUATEE_INIT)
        {
        DropDownList_evaluatee.Enabled = false;
        UserControl_drop_down_date_nominal_day.enabled = ablement;
        DropDownList_shift.Enabled = ablement;
        UserControl_drop_down_time_of_day_in.enabled = ablement;
        CustomValidator_eval_uniqueness.Enabled = ablement;
        UserControl_drop_down_time_of_day_out.enabled = ablement;
        DropDownList_post.Enabled = ablement;
        DropDownList_post_cardinality.Enabled = ablement;
        DropDownList_vehicle.Enabled = ablement;
        Button_basic_info_save.Enabled = ablement;
        //
        DropDownList_aic.Enabled = ablement;
        TextBox_alt_aic_reason.Enabled = ablement && (DropDownList_aic.SelectedValue != p.most_likely_aic_member_id);
        TextBox_discussions.Enabled = ablement;
        Button_interaction_info_save.Enabled = ablement;
        //
        LinkButton_add_a_patient_encounter.Enabled = false;
        //
        RadioButtonList_be_aic_ok_with_third_progress.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_progress.Enabled = false;
        RadioButtonList_be_aic_ok_with_third_release.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_release.Enabled = false;
        RadioButtonList_be_third_ok_with_progress.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_progress.Enabled = false;
        RadioButtonList_be_third_ok_with_release.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_release.Enabled = false;
        Button_patient_care_summary_save.Enabled = false;
        //
        TextBox_comments_on_driving.Enabled = false;
        TextBox_miles_driven_routine.Enabled = false;
        TextBox_miles_driven_emergency.Enabled = false;
        TextBox_road_conditions.Enabled = false;
        RadioButtonList_be_aic_ok_with_third_being_driver.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_being_driver.Enabled = false;
        RadioButtonList_be_third_ok_with_being_driver.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_being_driver.Enabled = false;
        Button_driving_summary_save.Enabled = false;
        //
        Button_lock_and_submit.Enabled = false;
        }
      else if (p.presentation_mode == presentation_mode_enum.EVALUATOR_INIT)
        {
        DropDownList_evaluatee.Enabled = ablement;
        UserControl_drop_down_date_nominal_day.enabled = ablement;
        DropDownList_shift.Enabled = ablement;
        UserControl_drop_down_time_of_day_in.enabled = ablement;
        CustomValidator_eval_uniqueness.Enabled = ablement;
        UserControl_drop_down_time_of_day_out.enabled = ablement;
        DropDownList_post.Enabled = ablement;
        DropDownList_post_cardinality.Enabled = ablement;
        DropDownList_vehicle.Enabled = ablement;
        Button_basic_info_save.Enabled = ablement;
        //
        DropDownList_aic.Enabled = false;
        TextBox_alt_aic_reason.Enabled = false;
        TextBox_discussions.Enabled = ablement;
        Button_interaction_info_save.Enabled = ablement;
        //
        LinkButton_add_a_patient_encounter.Enabled = false;
        //
        RadioButtonList_be_aic_ok_with_third_progress.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_progress.Enabled = false;
        RadioButtonList_be_aic_ok_with_third_release.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_release.Enabled = false;
        RadioButtonList_be_third_ok_with_progress.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_progress.Enabled = false;
        RadioButtonList_be_third_ok_with_release.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_release.Enabled = false;
        Button_patient_care_summary_save.Enabled = false;
        //
        TextBox_comments_on_driving.Enabled = false;
        TextBox_miles_driven_routine.Enabled = false;
        TextBox_miles_driven_emergency.Enabled = false;
        TextBox_road_conditions.Enabled = false;
        RadioButtonList_be_aic_ok_with_third_being_driver.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_being_driver.Enabled = false;
        RadioButtonList_be_third_ok_with_being_driver.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_being_driver.Enabled = false;
        Button_driving_summary_save.Enabled = false;
        //
        Button_lock_and_submit.Enabled = false;
        }
      else if (p.presentation_mode == presentation_mode_enum.EVALUATEE_WORK)
        {
        DropDownList_evaluatee.Enabled = false;
        UserControl_drop_down_date_nominal_day.enabled = false;
        DropDownList_shift.Enabled = false;
        UserControl_drop_down_time_of_day_in.enabled = false;
        CustomValidator_eval_uniqueness.Enabled = false;
        UserControl_drop_down_time_of_day_out.enabled = ablement;
        DropDownList_post.Enabled = ablement;
        DropDownList_post_cardinality.Enabled = ablement;
        DropDownList_vehicle.Enabled = ablement;
        Button_basic_info_save.Enabled = ablement;
        //
        DropDownList_aic.Enabled = ablement;
        TextBox_alt_aic_reason.Enabled = ablement && (DropDownList_aic.SelectedValue != p.most_likely_aic_member_id);
        TextBox_discussions.Enabled = ablement;
        Button_interaction_info_save.Enabled = ablement;
        //
        LinkButton_add_a_patient_encounter.Enabled = ablement;
        //
        RadioButtonList_be_aic_ok_with_third_progress.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_progress.Enabled = false;
        RadioButtonList_be_aic_ok_with_third_release.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_release.Enabled = false;
        RadioButtonList_be_third_ok_with_progress.Enabled = ablement;
        RequiredFieldValidator_be_third_ok_with_progress.Enabled = ablement && !p.be_evaluatee_released;
        RadioButtonList_be_third_ok_with_release.Enabled = ablement;
        RequiredFieldValidator_be_third_ok_with_release.Enabled = ablement && !p.be_evaluatee_released;
        Button_patient_care_summary_save.Enabled = ablement;
        //
        TextBox_comments_on_driving.Enabled = ablement;
        TextBox_miles_driven_routine.Enabled = ablement;
        TextBox_miles_driven_emergency.Enabled = ablement;
        TextBox_road_conditions.Enabled = ablement;
        RadioButtonList_be_aic_ok_with_third_being_driver.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_being_driver.Enabled = false;
        RadioButtonList_be_third_ok_with_being_driver.Enabled = ablement;
        RequiredFieldValidator_be_third_ok_with_being_driver.Enabled = ablement && !p.be_evaluatee_driver_qualified;
        Button_driving_summary_save.Enabled = ablement;
        //
        Button_lock_and_submit.Enabled = true;
        }
      else if (p.presentation_mode == presentation_mode_enum.EVALUATOR_WORK)
        {
        DropDownList_evaluatee.Enabled = false;
        UserControl_drop_down_date_nominal_day.enabled = false;
        DropDownList_shift.Enabled = false;
        UserControl_drop_down_time_of_day_in.enabled = false;
        CustomValidator_eval_uniqueness.Enabled = false;
        UserControl_drop_down_time_of_day_out.enabled = ablement;
        DropDownList_post.Enabled = ablement;
        DropDownList_post_cardinality.Enabled = ablement;
        DropDownList_vehicle.Enabled = ablement;
        Button_basic_info_save.Enabled = ablement;
        //
        DropDownList_aic.Enabled = false;
        TextBox_alt_aic_reason.Enabled = false;
        TextBox_discussions.Enabled = ablement;
        Button_interaction_info_save.Enabled = ablement;
        //
        LinkButton_add_a_patient_encounter.Enabled = ablement;
        //
        RadioButtonList_be_aic_ok_with_third_progress.Enabled = ablement;
        RequiredFieldValidator_be_aic_ok_with_third_progress.Enabled = ablement && !p.be_evaluatee_released;
        RadioButtonList_be_aic_ok_with_third_release.Enabled = ablement;
        RequiredFieldValidator_be_aic_ok_with_third_release.Enabled = ablement && !p.be_evaluatee_released;
        RadioButtonList_be_third_ok_with_progress.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_progress.Enabled = false;
        RadioButtonList_be_third_ok_with_release.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_release.Enabled = false;
        Button_patient_care_summary_save.Enabled = ablement;
        //
        TextBox_comments_on_driving.Enabled = ablement;
        TextBox_miles_driven_routine.Enabled = ablement;
        TextBox_miles_driven_emergency.Enabled = ablement;
        TextBox_road_conditions.Enabled = ablement;
        RadioButtonList_be_aic_ok_with_third_being_driver.Enabled = ablement;
        RequiredFieldValidator_be_aic_ok_with_third_being_driver.Enabled = ablement && !p.be_evaluatee_driver_qualified;
        RadioButtonList_be_third_ok_with_being_driver.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_being_driver.Enabled = false;
        Button_driving_summary_save.Enabled = ablement;
        //
        Button_lock_and_submit.Enabled = true;
        }
      else if (p.presentation_mode == presentation_mode_enum.EVALUATEE_RESPOND)
        {
        DropDownList_evaluatee.Enabled = false;
        UserControl_drop_down_date_nominal_day.enabled = false;
        DropDownList_shift.Enabled = false;
        UserControl_drop_down_time_of_day_in.enabled = false;
        CustomValidator_eval_uniqueness.Enabled = false;
        UserControl_drop_down_time_of_day_out.enabled = false;
        DropDownList_post.Enabled = false;
        DropDownList_post_cardinality.Enabled = false;
        DropDownList_vehicle.Enabled = false;
        Button_basic_info_save.Enabled = false;
        //
        DropDownList_aic.Enabled = false;
        TextBox_alt_aic_reason.Enabled = false;
        TextBox_discussions.Enabled = false;
        Button_interaction_info_save.Enabled = false;
        //
        LinkButton_add_a_patient_encounter.Enabled = false;
        //
        RadioButtonList_be_aic_ok_with_third_progress.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_progress.Enabled = false;
        RadioButtonList_be_aic_ok_with_third_release.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_release.Enabled = false;
        RadioButtonList_be_third_ok_with_progress.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_progress.Enabled = false;
        RadioButtonList_be_third_ok_with_release.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_release.Enabled = false;
        Button_patient_care_summary_save.Enabled = false;
        //
        TextBox_comments_on_driving.Enabled = false;
        TextBox_miles_driven_routine.Enabled = false;
        TextBox_miles_driven_emergency.Enabled = false;
        TextBox_road_conditions.Enabled = false;
        RadioButtonList_be_aic_ok_with_third_being_driver.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_being_driver.Enabled = false;
        RadioButtonList_be_third_ok_with_being_driver.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_being_driver.Enabled = false;
        Button_driving_summary_save.Enabled = false;
        //
        TextBox_third_rebuttal.Enabled = true;
        //
        Button_lock_and_submit.Enabled = true;
        }
      else if (p.presentation_mode == presentation_mode_enum.REVIEW_ONLY)
        {
        DropDownList_evaluatee.Enabled = false;
        UserControl_drop_down_date_nominal_day.enabled = false;
        DropDownList_shift.Enabled = false;
        UserControl_drop_down_time_of_day_in.enabled = false;
        UserControl_drop_down_time_of_day_out.enabled = false;
        DropDownList_post.Enabled = false;
        DropDownList_post_cardinality.Enabled = false;
        DropDownList_vehicle.Enabled = false;
        Button_basic_info_save.Enabled = false;
        //
        DropDownList_aic.Enabled = false;
        TextBox_alt_aic_reason.Enabled = false;
        TextBox_discussions.Enabled = false;
        Button_interaction_info_save.Enabled = false;
        //
        LinkButton_add_a_patient_encounter.Enabled = false;
        //
        RadioButtonList_be_aic_ok_with_third_progress.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_progress.Enabled = false;
        RadioButtonList_be_aic_ok_with_third_release.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_release.Enabled = false;
        RadioButtonList_be_third_ok_with_progress.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_progress.Enabled = false;
        RadioButtonList_be_third_ok_with_release.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_release.Enabled = false;
        Button_patient_care_summary_save.Enabled = false;
        //
        TextBox_comments_on_driving.Enabled = false;
        TextBox_miles_driven_routine.Enabled = false;
        TextBox_miles_driven_emergency.Enabled = false;
        TextBox_road_conditions.Enabled = false;
        RadioButtonList_be_aic_ok_with_third_being_driver.Enabled = false;
        RequiredFieldValidator_be_aic_ok_with_third_being_driver.Enabled = false;
        RadioButtonList_be_third_ok_with_being_driver.Enabled = false;
        RequiredFieldValidator_be_third_ok_with_being_driver.Enabled = false;
        Button_driving_summary_save.Enabled = false;
        //
        Button_lock_and_submit.Enabled = false;
        }
      }

    protected void Button_lookup_Click(object sender, System.EventArgs e)
      {
      uint num_matches;
      string saved_id;
      saved_id = k.Safe(TextBox_id.Text,k.safe_hint_type.PUNCTUATED);
      Clear();
      if (!PresentRecord(saved_id))
        {
        TextBox_id.Text = saved_id;
        p.biz_evals.Bind(saved_id, DropDownList_id);
        num_matches = (uint)(DropDownList_id.Items.Count);
        if (num_matches > 0)
          {
          DropDownList_id.Visible = true;
          if (num_matches == 1)
            {
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
            }
          else
            {
            Literal_match_index.Text = "0";
            Literal_num_matches.Text = num_matches.ToString();
            Panel_match_numbers.Visible = true;
            LinkButton_go_to_match_prior.Visible = true;
            LinkButton_go_to_match_next.Visible = true;
            LinkButton_go_to_match_last.Visible = true;
            LinkButton_go_to_match_first.Visible = true;
            DropDownList_id.Items.Insert(0, new ListItem("-- Select --", k.EMPTY));
            }
          }
        }
      }

    protected void DropDownList_aic_SelectedIndexChanged(object sender, EventArgs e)
      {
      var be_reason_required = (DropDownList_aic.SelectedValue != p.most_likely_aic_member_id);
      Label_alt_aic_reason.Enabled = be_reason_required;
      TextBox_alt_aic_reason.Text = k.EMPTY;
      TextBox_alt_aic_reason.Enabled = be_reason_required;
      RequiredFieldValidator_alt_aic_reason.Enabled = be_reason_required;
      }

    protected void Button_lock_and_submit_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {
        p.be_locked_by_third_initially = p.be_locked_by_third_initially || p.be_user_evaluatee;
        p.be_locked_by_aic = p.be_locked_by_aic || !p.be_user_evaluatee;
        //
        var status_after_lock_and_submit = k.EMPTY;
        if (p.be_locked_by_third_initially)
          {
          status_after_lock_and_submit = p.biz_evals.StatusAfterLockAndSubmit
            (
            presentation_mode:p.presentation_mode,
            summary:p.summary
            );
          }
        else
          {
          status_after_lock_and_submit = "NEEDS_EVALUATEE_REBUTTAL";
          }
        DropDownList_status.SelectedIndex = DropDownList_status.Items.IndexOf(DropDownList_status.Items.FindByText(status_after_lock_and_submit));
        if (status_after_lock_and_submit == "ARCHIVED")
          {
          var third_rebuttal = k.Safe(TextBox_third_rebuttal.Text,k.safe_hint_type.MEMO);
          TextBox_third_rebuttal.Text = (third_rebuttal.Length > 0 ? third_rebuttal : "Concur");
          }
        SaveRecord();
        if ((status_after_lock_and_submit == "NEEDS_BOTH_LOCKS") && (p.presentation_mode == presentation_mode_enum.EVALUATEE_WORK))
          {
          p.biz_notifications.IssueForEvalNeedsAicInput
            (
            eval_id:p.biz_evals.IdOf(p.summary),
            nominal_day:p.biz_evals.NominalDayOf(p.summary),
            shift_name:p.biz_evals.ShiftNameOf(p.summary),
            post_designator:p.biz_evals.PostDesignatorOf(p.summary),
            post_cardinality:p.biz_evals.PostCardinalityOf(p.summary),
            vehicle_name:p.biz_evals.VehicleNameOf(p.summary),
            evaluatee_name:p.biz_evals.EvaluateeNameOf(p.summary),
            evaluatee_member_id:p.biz_evals.EvaluateeMemberIdOf(p.summary),
            evaluator_member_id:p.biz_evals.EvaluatorMemberIdOf(p.summary)
            );
          }
        else if ((status_after_lock_and_submit == "NEEDS_BOTH_LOCKS") || (status_after_lock_and_submit == "NEEDS_EVALUATEE_REBUTTAL"))
          {
          p.biz_notifications.IssueForEvalNeedsEvaluateeRebuttal
            (
            eval_id:p.biz_evals.IdOf(p.summary),
            nominal_day:p.biz_evals.NominalDayOf(p.summary),
            shift_name:p.biz_evals.ShiftNameOf(p.summary),
            post_designator:p.biz_evals.PostDesignatorOf(p.summary),
            post_cardinality:p.biz_evals.PostCardinalityOf(p.summary),
            vehicle_name:p.biz_evals.VehicleNameOf(p.summary),
            evaluator_name:p.biz_evals.EvaluatorNameOf(p.summary),
            evaluatee_member_id:p.biz_evals.EvaluateeMemberIdOf(p.summary)
            );
          }
        else
          {
          //p.biz_notifications.IssueForEvalArchived
          //  (
          //  eval_id:p.biz_evals.IdOf(p.summary),
          //  nominal_day:p.biz_evals.NominalDayOf(p.summary),
          //  shift_name:p.biz_evals.ShiftNameOf(p.summary),
          //  post_designator:p.biz_evals.PostDesignatorOf(p.summary),
          //  post_cardinality:p.biz_evals.PostCardinalityOf(p.summary),
          //  vehicle_name:p.biz_evals.VehicleNameOf(p.summary),
          //  evaluatee_name:p.biz_evals.EvaluateeNameOf(p.summary),
          //  evaluatee_member_id:p.biz_evals.EvaluateeMemberIdOf(p.summary),
          //  evaluator_name:p.biz_evals.EvaluatorNameOf(p.summary),
          //  evaluator_member_id:p.biz_evals.EvaluatorMemberIdOf(p.summary)
          //  );
          var working_directory = Server.MapPath("scratch");
          p.biz_evals.Send
            (
            id:p.biz_evals.IdOf(p.summary),
            evaluatee_member_id:p.biz_evals.EvaluateeMemberIdOf(p.summary),
            working_directory:working_directory
            );
          }
        BackTrack();
        }
      }

    protected void LinkButton_add_a_patient_encounter_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {
        SaveRecord();
        BuildMessageDropCrumbAndTransfer
          (
          eval_id:p.biz_evals.IdOf(p.summary),
          target_id:k.EMPTY
          );
        }
      }

    private void BuildMessageDropCrumbAndTransfer
      (
      string eval_id,
      string target_id
      )
      {
      if (target_id.Length == 0)
        {
        p.msg_protected_patient_encounter_detail.presentation_mode = (p.presentation_mode == presentation_mode_enum.EVALUATEE_WORK ? presentation_mode_enum.EVALUATEE_INIT : presentation_mode_enum.EVALUATOR_INIT);
        }
      else
        {
        p.msg_protected_patient_encounter_detail.presentation_mode = (p.presentation_mode == presentation_mode_enum.EVALUATEE_WORK ? presentation_mode_enum.EVALUATEE_WORK : presentation_mode_enum.EVALUATOR_WORK);
        }
      p.msg_protected_patient_encounter_detail.eval_id = eval_id;
      p.msg_protected_patient_encounter_detail.eval_spec = k.EMPTY
      + UserControl_drop_down_date_nominal_day.selectedvalue.ToString("yyyy-MM-dd") + k.SPACE + p.biz_shifts.NameOf(k.Safe(DropDownList_shift.SelectedValue,k.safe_hint_type.NUM))
      + k.SPACE_HYPHENS_SPACE
      + DropDownList_post.SelectedItem.Text + DropDownList_post_cardinality.SelectedItem.Text
      + k.SPACE_HYPHENS_SPACE
      + k.Safe(DropDownList_vehicle.SelectedItem.Text, k.safe_hint_type.NUM)
      + k.SPACE_HYPHENS_SPACE
      + k.Safe(DropDownList_aic.SelectedItem.Text, k.safe_hint_type.HUMAN_NAME_CSV);
      p.msg_protected_patient_encounter_detail.id = target_id;
      MessageDropCrumbAndTransferTo
        (
        msg: p.msg_protected_patient_encounter_detail,
        folder_name: "protected",
        aspx_name: "patient_encounter_detail"
        );
      }

    protected void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      LinkButton link_button;
      if (new ArrayList {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        if (p.be_interactive)
          {
          link_button = ((e.Item.Cells[UserControl_eval_Static.TCI_OPEN].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[UserControl_eval_Static.TCI_ID].EnableViewState = true;
          }
        else
          {
          e.Item.Cells[UserControl_eval_Static.TCI_OPEN].Visible = false;
          }
        p.num_patient_encounters.val++;
        }
      }

    protected void DataGrid_control_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      if (new ArrayList {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        BuildMessageDropCrumbAndTransfer
          (
          eval_id:p.biz_evals.IdOf(p.summary),
          target_id:k.Safe(e.Item.Cells[UserControl_eval_Static.TCI_ID].Text,k.safe_hint_type.NUM)
          );
        }
      }

    protected void DropDownList_shift_SelectedIndexChanged(object sender, EventArgs e)
      {
      var dummy_string = k.EMPTY;
      var shift_end = DateTime.MinValue;
      var shift_start = DateTime.MinValue;
      p.biz_shifts.Get
        (
        id:k.Safe(DropDownList_shift.SelectedValue,k.safe_hint_type.NUM),
        start:out shift_start,
        end:out shift_end,
        name:out dummy_string,
        pecking_order:out dummy_string
        );
      UserControl_drop_down_time_of_day_in.selectedvalue = shift_start.ToString("HH:mm");
      UserControl_drop_down_time_of_day_out.selectedvalue = shift_end.ToString("HH:mm");
      }

    protected void CustomValidator_driver_skills_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = true;
      //
      TableCellCollection tcc;
      for (var i = new k.subtype<int>(0,DataGrid_driver_skill.Items.Count); (i.val < i.LAST) && args.IsValid; i.val++)
        {
        tcc = DataGrid_driver_skill.Items[i.val].Cells;
        args.IsValid =
          ((tcc[UserControl_eval_Static.TCI_DRIVER_SKILL_PERFORMED_NEEDS_RATING].Text != "?")
        ||
          (k.Safe((tcc[UserControl_eval_Static.TCI_DRIVER_SKILL_RATING].Controls[0] as DropDownList).SelectedValue,k.safe_hint_type.NUM).Length > 0));
        }
      }

    protected void DataGrid_driver_skill_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      if (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        var skill_rating_id = k.Safe(e.Item.Cells[UserControl_eval_Static.TCI_DRIVER_SKILL_RATING_SKILL_RATING_ID].Text,k.safe_hint_type.NUM);
        var skill_rating_drop_down_list = ((e.Item.Cells[UserControl_eval_Static.TCI_DRIVER_SKILL_RATING].Controls[0]) as DropDownList);
//        if (skill_rating_id != k.EMPTY)
//          {
          foreach (ListItem list_item in p.proto_driver_skill_rating_list_item_array)
            {
            skill_rating_drop_down_list.Items.Add(new ListItem(list_item.Text,list_item.Value));
            skill_rating_drop_down_list.Items[skill_rating_drop_down_list.Items.Count - 1].Selected = (list_item.Value == skill_rating_id);
            }
//          }
        }
      }

    protected void DropDownList_evaluatee_SelectedIndexChanged(object sender, EventArgs e)
      {
      var evaluatee_member_id = k.Safe(DropDownList_evaluatee.SelectedValue,k.safe_hint_type.NUM);
      p.be_evaluatee_released = p.biz_members.BeReleased(evaluatee_member_id);
      p.be_evaluatee_driver_qualified = p.biz_members.BeDriverQualifiedOfId(evaluatee_member_id);
      }

    protected void CustomValidator_time_in_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = (UserControl_drop_down_time_of_day_in.selectedvalue.Length > 0);
      }

    protected void CustomValidator_time_out_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = (UserControl_drop_down_time_of_day_out.selectedvalue.Length > 0);
      }

    protected void CustomValidator_eval_uniqueness_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid =
        (
          null == p.biz_evals.SummaryOfUnique
            (
            third_member_id:k.Safe(DropDownList_evaluatee.SelectedValue,k.safe_hint_type.NUM),
            aic_member_id:k.Safe(DropDownList_aic.SelectedValue,k.safe_hint_type.NUM),
            nominal_day:UserControl_drop_down_date_nominal_day.selectedvalue,
            time_in:k.Safe(UserControl_drop_down_time_of_day_in.selectedvalue,k.safe_hint_type.DATE_TIME)
            )
        );
      }

    } // end TWebUserControl_eval

  }
