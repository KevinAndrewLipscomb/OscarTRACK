// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~kicrudhelped~item.ascx.cs~template

using Class_biz_care_skill_ratings;
using Class_biz_evals;
using Class_biz_patient_age_units;
using Class_biz_patient_encounter_levels;
using Class_biz_patient_encounters;
using Class_biz_role_member_map;
using Class_biz_skill_ratings;
using kix;
using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_patient_encounter
  {

  public partial class TWebUserControl_patient_encounter: ki_web_ui.usercontrol_class
    {

    private static class UserControl_patient_encounter_Static
      {
      public const int TCI_CARE_SKILL_ID = 0;
      public const int TCI_CARE_SKILL_DESCRIPTION = 1;
      public const int TCI_PERFORMED_NEEDS_RATING = 2;
      public const int TCI_CARE_SKILL_RATING_ID = 3;
      public const int TCI_CARE_SKILL_RATING_SKILL_RATING_ID = 4;
      public const int TCI_SKILL_RATING = 5;
      }

    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_care_skill_ratings biz_care_skill_ratings;
      public TClass_biz_patient_age_units biz_patient_age_units;
      public TClass_biz_patient_encounters biz_patient_encounters;
      public TClass_biz_patient_encounter_levels biz_patient_encounter_levels;
      public TClass_biz_role_member_map biz_role_member_map;
      public TClass_biz_skill_ratings biz_skill_ratings;
      public bool be_ok_to_config_patient_encounters;
      public string eval_id;
      public string eval_spec;
      public string guid;
      public string id;
      public string id_of_patient_age_unit_year;
      public presentation_mode_enum presentation_mode;
      public ListItem[] proto_skill_rating_list_item_array;
      }

    private p_type p;

    private void Clear()
      {
      TextBox_id.Text = k.EMPTY;
      DropDownList_id.Visible = false;
      Literal_eval_spec.Text = k.EMPTY;
      TextBox_chief_complaint.Text = k.EMPTY;
      TextBox_patient_age.Text = k.EMPTY;
      DropDownList_patient_age_unit.ClearSelection();
      DropDownList_patient_encounter_level.ClearSelection();
      Literal_match_index.Text = k.EMPTY;
      Literal_num_matches.Text = k.EMPTY;
      Panel_match_numbers.Visible = false;
      LinkButton_go_to_match_prior.Visible = false;
      LinkButton_go_to_match_next.Visible = false;
      LinkButton_go_to_match_last.Visible = false;
      LinkButton_go_to_match_first.Visible = false;
      SetDependentFieldAblements(false);
      Button_submit.Enabled = false;
      Button_delete.Enabled = false;
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
        LinkButton_new_record.Visible = p.be_ok_to_config_patient_encounters;
        LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
        LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
        LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
        LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
        //
        p.biz_patient_age_units.BindDirectToListControl(DropDownList_patient_age_unit,k.EMPTY);
        p.biz_patient_encounter_levels.BindDirectToListControl(DropDownList_patient_encounter_level);
        //
        ManageCareSkillRatingsDataGrid();
        CustomValidator_care_skills.Enabled = (p.presentation_mode == presentation_mode_enum.EVALUATOR_WORK);
        //
        RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
        //
        SetDataEntryMode();
        //
        DropDownList_patient_age_unit.SelectedValue = p.id_of_patient_age_unit_year;
        //
        if (p.id.Length > 0)
          {
          PresentRecord(p.id);
          }
        //
        Literal_eval_spec.Text = p.eval_spec;
        //
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      }

    private void ManageCareSkillRatingsDataGrid()
      {
      var proto_skill_rating_list_item_collection = new ListItemCollection();
      var for_evaluatee_both_evaluator_condition = new k.int_sign_range(0);
      if (p.presentation_mode == presentation_mode_enum.EVALUATEE_WORK)
        {
        p.biz_skill_ratings.BindListItemCollectionForEvaluatee(target: proto_skill_rating_list_item_collection);
        }
      else if (p.presentation_mode == presentation_mode_enum.EVALUATOR_WORK)
        {
        p.biz_skill_ratings.BindListItemCollectionForEvaluator(target: proto_skill_rating_list_item_collection);
        DataGrid_control.Columns[UserControl_patient_encounter_Static.TCI_PERFORMED_NEEDS_RATING].Visible = true;
        }
      else
        {
        p.biz_skill_ratings.BindListItemCollectionUnlimited(target: proto_skill_rating_list_item_collection);
        }
      p.proto_skill_rating_list_item_array = new ListItem[proto_skill_rating_list_item_collection.Count];
      proto_skill_rating_list_item_collection.CopyTo(p.proto_skill_rating_list_item_array, 0);
      p.biz_care_skill_ratings.BindBaseDataList
        (
        target: DataGrid_control,
        patient_encounter_id: p.id
        );
      }

    private bool PresentRecord(string id)
      {
      Literal_match_index.Text = DropDownList_id.SelectedIndex.ToString();
      bool result;
      string eval_id;
      string chief_complaint;
      string patient_age;
      string patient_age_unit_id;
      string patient_encounter_level_id;
      string guid;
      result = false;
      if
        (
        p.biz_patient_encounters.Get
          (
          id,
          out eval_id,
          out chief_complaint,
          out patient_age,
          out patient_age_unit_id,
          out patient_encounter_level_id,
          out guid
          )
        )
        {
        TextBox_id.Text = id;
        TextBox_id.Enabled = false;
        Literal_eval_spec.Text = eval_id;
        TextBox_chief_complaint.Text = chief_complaint;
        TextBox_patient_age.Text = patient_age;
        DropDownList_patient_age_unit.SelectedValue = patient_age_unit_id;
        DropDownList_patient_encounter_level.SelectedValue = patient_encounter_level_id;
        p.guid = guid;
        Button_lookup.Enabled = false;
        Label_lookup_arrow.Enabled = false;
        Label_lookup_hint.Enabled = false;
        LinkButton_reset.Enabled = true;
        SetDependentFieldAblements(p.be_ok_to_config_patient_encounters);
        ManageVisibilities();
        Button_delete.Enabled = p.be_ok_to_config_patient_encounters;
        result = true;
        }
      return result;
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
      SetDependentFieldAblements(p.be_ok_to_config_patient_encounters);
      Button_delete.Enabled = false;
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
        p.biz_care_skill_ratings = new TClass_biz_care_skill_ratings();
        p.biz_patient_age_units = new TClass_biz_patient_age_units();
        p.biz_patient_encounters = new TClass_biz_patient_encounters();
        p.biz_patient_encounter_levels = new TClass_biz_patient_encounter_levels();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        p.biz_skill_ratings = new TClass_biz_skill_ratings();
        //
        p.be_ok_to_config_patient_encounters = true;
        p.eval_id = k.EMPTY;
        p.eval_spec = k.EMPTY;
        p.guid = k.EMPTY;
        p.id_of_patient_age_unit_year = p.biz_patient_age_units.IdOfDescription("year");
        p.id = k.EMPTY;
        p.presentation_mode = presentation_mode_enum.NONE;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_patient_encounter_PreRender;
      }

    private void TWebUserControl_patient_encounter_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_patient_encounter Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void Button_submit_Click(object sender, System.EventArgs e)
      {
      if (Page.IsValid)
        {
        if (p.guid.Length > 0) // This condition being false has been observed, but should not occur.
          {
          SavePatientEncounter(p.id);
          Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "recsaved", "Record saved.", true);
          }
        else
          {
          Alert
            (
            cause:k.alert_cause_type.LOGIC,
            state:k.alert_state_type.FAILURE,
            key:"ASSERTFAIL",
            value:"Something's wrong.  Please reload this eval and try again."
            );
          }
        BackTrack();
        }
      else
        {
        ValidationAlert(true);
        }
      }

    private void SavePatientEncounter(string patient_encounter_id)
      {
      p.biz_patient_encounters.Set
        (
        patient_encounter_id,
        p.eval_id,
        k.Safe(TextBox_chief_complaint.Text, k.safe_hint_type.PUNCTUATED).Trim(),
        k.Safe(TextBox_patient_age.Text, k.safe_hint_type.NUM).Trim(),
        k.Safe(DropDownList_patient_age_unit.SelectedValue, k.safe_hint_type.NUM).Trim(),
        k.Safe(DropDownList_patient_encounter_level.SelectedValue, k.safe_hint_type.NUM).Trim(),
        p.guid
        );
      TableCellCollection tcc;
      var care_skill_rating_id = k.EMPTY;
      var skill_rating_id = k.EMPTY;
      for (var i = new k.subtype<int>(0,DataGrid_control.Items.Count); i.val < i.LAST; i.val++)
        {
        tcc = DataGrid_control.Items[i.val].Cells;
        skill_rating_id = k.Safe((tcc[UserControl_patient_encounter_Static.TCI_SKILL_RATING].Controls[0] as DropDownList).SelectedValue,k.safe_hint_type.NUM);
        care_skill_rating_id = k.Safe(tcc[UserControl_patient_encounter_Static.TCI_CARE_SKILL_RATING_ID].Text,k.safe_hint_type.NUM);
        if (skill_rating_id.Length > 0)
          {
          p.biz_care_skill_ratings.Set
            (
            id:care_skill_rating_id,
            care_skill_id:k.Safe(tcc[UserControl_patient_encounter_Static.TCI_CARE_SKILL_ID].Text,k.safe_hint_type.NUM),
            skill_rating_id:skill_rating_id,
            patient_encounter_id:p.id
            );
          }
        else
          {
          p.biz_care_skill_ratings.Delete(id:care_skill_rating_id);
          }
        }
      }
    private void SavePatientEncounter()
      {
      SavePatientEncounter(k.EMPTY);
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
      if (p.biz_patient_encounters.Delete(k.Safe(TextBox_id.Text, k.safe_hint_type.NUM)))
        {
        SetLookupMode();
        BackTrack();
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

    private void SetDependentFieldAblements(bool ablement)
      {
      TextBox_chief_complaint.Enabled = ablement;
      TextBox_patient_age.Enabled = ablement;
      DropDownList_patient_age_unit.Enabled = ablement;
      DropDownList_patient_encounter_level.Enabled = ablement;
      //
      if (p.presentation_mode == presentation_mode_enum.EVALUATEE_INIT)
        {
        Button_submit.Enabled = false;
        }
      else if (p.presentation_mode == presentation_mode_enum.EVALUATEE_WORK)
        {
        Button_submit.Enabled = true;
        }
      else if (p.presentation_mode == presentation_mode_enum.EVALUATOR_INIT)
        {
        Button_submit.Enabled = false;
        }
      else if (p.presentation_mode == presentation_mode_enum.EVALUATOR_WORK)
        {
        Button_submit.Enabled = true;
        }
      }

    protected void Button_lookup_Click(object sender, System.EventArgs e)
      {
      uint num_matches;
      string saved_id;
      saved_id = k.Safe(TextBox_id.Text,k.safe_hint_type.PUNCTUATED); // Leave the hint PUNCTUATED since the TextBox is being used as a partial spec lookup value that we don't want to modify.
      Clear();
      if (!PresentRecord(saved_id))
        {
        TextBox_id.Text = saved_id;
        p.biz_patient_encounters.Bind(saved_id, DropDownList_id);
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

    internal void Set
      (
      presentation_mode_enum presentation_mode,
      string eval_id,
      string eval_spec,
      string id
      )
      {
      p.presentation_mode = presentation_mode;
      p.eval_id = eval_id;
      p.eval_spec = eval_spec;
      p.id = id;
      p.guid = k.EMPTY;
      }

    protected void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      if (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        var skill_rating_id = k.Safe(e.Item.Cells[UserControl_patient_encounter_Static.TCI_CARE_SKILL_RATING_SKILL_RATING_ID].Text,k.safe_hint_type.NUM);
        var skill_rating_drop_down_list = ((e.Item.Cells[UserControl_patient_encounter_Static.TCI_SKILL_RATING].Controls[0]) as DropDownList);
//        if (skill_rating_id != k.EMPTY)
//          {
          foreach (ListItem list_item in p.proto_skill_rating_list_item_array)
            {
            skill_rating_drop_down_list.Items.Add(new ListItem(list_item.Text,list_item.Value));
            skill_rating_drop_down_list.Items[skill_rating_drop_down_list.Items.Count - 1].Selected = (list_item.Value == skill_rating_id);
            }
//          }
        }
      }

    protected void Button_save_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {
        if (p.guid.Length == 0)
          {
          p.guid = Guid.NewGuid().ToString();
          }
        SavePatientEncounter();
        p.id = p.biz_patient_encounters.IdOfUnique(p.guid);
        p.presentation_mode =
          (new ArrayList() {presentation_mode_enum.EVALUATEE_INIT,presentation_mode_enum.EVALUATEE_WORK}.Contains(p.presentation_mode) ? presentation_mode_enum.EVALUATEE_WORK : presentation_mode_enum.EVALUATOR_WORK);
        ManageCareSkillRatingsDataGrid();
        SetDependentFieldAblements(ablement:true);
        ManageVisibilities();
        }
      else
        {
        ValidationAlert(true);
        }
      }

    private void ManageVisibilities()
      {
      TableRow_care_skills.Visible =
        (
        new ArrayList
          {
          presentation_mode_enum.EVALUATEE_WORK,
          presentation_mode_enum.EVALUATOR_WORK,
          presentation_mode_enum.REVIEW_ONLY,
          presentation_mode_enum.FULL_FUNCTION
          }
        )
        .Contains(p.presentation_mode);
      }

    protected void CustomValidator_care_skills_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = true;
      //
      TableCellCollection tcc;
      for (var i = new k.subtype<int>(0,DataGrid_control.Items.Count); (i.val < i.LAST) && args.IsValid; i.val++)
        {
        tcc = DataGrid_control.Items[i.val].Cells;
        args.IsValid =
          ((tcc[UserControl_patient_encounter_Static.TCI_PERFORMED_NEEDS_RATING].Text != "?")
        ||
          (k.Safe((tcc[UserControl_patient_encounter_Static.TCI_SKILL_RATING].Controls[0] as DropDownList).SelectedValue,k.safe_hint_type.NUM).Length > 0));
        }
      }

    } // end TWebUserControl_patient_encounter

  }
