// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~kicrudhelped~item.ascx.cs~template

using Class_biz_uniform_catalogs;
using Class_biz_role_member_map;
using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;
using UserControl_drop_down_date;

namespace UserControl_uniform_catalog
  {
  public partial class TWebUserControl_uniform_catalog: ki_web_ui.usercontrol_class
    {
    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_uniform_catalogs biz_uniform_catalogs;
      public TClass_biz_role_member_map biz_role_member_map;
      public bool be_ok_to_config_uniform_catalogs;
      public string id;
      public presentation_mode_enum presentation_mode;
      public object summary;
      }

    private p_type p;

    private void Clear()
      {
      TextBox_id.Text = k.EMPTY;
      DropDownList_id.Visible = false;
      TextBox_piece_id.Text = k.EMPTY;
      CheckBox_be_branded.Checked = false;
      CheckBox_be_size_dependent.Checked = false;
      CheckBox_be_specific_rank_dependent.Checked = false;
      CheckBox_be_extra_individualized.Checked = false;
      TextBox_rank_group_id.Text = k.EMPTY;
      TextBox_medical_release_code.Text = k.EMPTY;
      TextBox_option_category_id.Text = k.EMPTY;
      CheckBox_be_male.Checked = false;
      TextBox_vendor_id.Text = k.EMPTY;
      TextBox_model_id.Text = k.EMPTY;
      TextBox_base_color_id.Text = k.EMPTY;
      TextBox_trim_color_id.Text = k.EMPTY;
      TextBox_metal_color_id.Text = k.EMPTY;
      TextBox_instruction_to_vendor.Text = k.EMPTY;
      TextBox_elaboration.Text = k.EMPTY;
      TextBox_unit_cost.Text = k.EMPTY;
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
        LinkButton_new_record.Visible = p.be_ok_to_config_uniform_catalogs;
        LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
        LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
        LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
        LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
        RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
        if (p.presentation_mode == presentation_mode_enum.NEW)
          {
          }
        else
          {
          PresentRecord(p.id);
          }
        p.be_loaded = true;
        }
      ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_submit);
      ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_delete);
      InjectPersistentClientSideScript();
      }

    private bool PresentRecord(string id)
      {
      Literal_match_index.Text = DropDownList_id.SelectedIndex.ToString();
      bool result;
      string piece_id;
      bool be_branded;
      bool be_size_dependent;
      bool be_specific_rank_dependent;
      bool be_extra_individualized;
      string rank_group_id;
      string medical_release_code;
      string option_category_id;
      bool be_male;
      string vendor_id;
      string model_id;
      string base_color_id;
      string trim_color_id;
      string metal_color_id;
      string instruction_to_vendor;
      string elaboration;
      string unit_cost;
      result = false;
      if
        (
        p.biz_uniform_catalogs.Get
          (
          id,
          out piece_id,
          out be_branded,
          out be_size_dependent,
          out be_specific_rank_dependent,
          out be_extra_individualized,
          out rank_group_id,
          out medical_release_code,
          out option_category_id,
          out be_male,
          out vendor_id,
          out model_id,
          out base_color_id,
          out trim_color_id,
          out metal_color_id,
          out instruction_to_vendor,
          out elaboration,
          out unit_cost
          )
        )
        {
        TextBox_id.Text = id;
        TextBox_id.Enabled = false;
        TextBox_piece_id.Text = piece_id;
        CheckBox_be_branded.Checked = be_branded;
        CheckBox_be_size_dependent.Checked = be_size_dependent;
        CheckBox_be_specific_rank_dependent.Checked = be_specific_rank_dependent;
        CheckBox_be_extra_individualized.Checked = be_extra_individualized;
        TextBox_rank_group_id.Text = rank_group_id;
        TextBox_medical_release_code.Text = medical_release_code;
        TextBox_option_category_id.Text = option_category_id;
        CheckBox_be_male.Checked = be_male;
        TextBox_vendor_id.Text = vendor_id;
        TextBox_model_id.Text = model_id;
        TextBox_base_color_id.Text = base_color_id;
        TextBox_trim_color_id.Text = trim_color_id;
        TextBox_metal_color_id.Text = metal_color_id;
        TextBox_instruction_to_vendor.Text = instruction_to_vendor;
        TextBox_elaboration.Text = elaboration;
        TextBox_unit_cost.Text = unit_cost;
        Button_lookup.Enabled = false;
        Label_lookup_arrow.Enabled = false;
        Label_lookup_hint.Enabled = false;
        LinkButton_reset.Enabled = true;
        SetDependentFieldAblements(p.be_ok_to_config_uniform_catalogs);
        Button_submit.Enabled = p.be_ok_to_config_uniform_catalogs;
        Button_delete.Enabled = p.be_ok_to_config_uniform_catalogs;
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
      SetDependentFieldAblements(p.be_ok_to_config_uniform_catalogs);
      Button_submit.Enabled = p.be_ok_to_config_uniform_catalogs;
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
      var instance_id = InstanceId();
      if (Session[instance_id + ".p"] != null)
        {
        p = (p_type)(Session[instance_id + ".p"]);
        p.be_loaded = IsPostBack;  // This test is sufficient if this control is being used statically on its page.
        //
        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
        // had it loaded already.
        //
#warning Revise the binder-related instance_id to this control appropriately.
        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_uniform_catalog")
          {
#warning Revise the ClientID path to this control appropriately.
          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_uniform_catalog");
          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_uniform_catalog")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_uniform_catalog");
//        }
        }
      else
        {
        p.biz_uniform_catalogs = new TClass_biz_uniform_catalogs();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        //
        p.be_loaded = false;
        p.be_ok_to_config_uniform_catalogs = k.Has((string[])(Session["privilege_array"]), "config-uniform_catalogs");
        p.id = k.EMPTY;
        p.summary = null;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      //this.Load += this.Page_Load;
      this.PreRender += this.TWebUserControl_uniform_catalog_PreRender;
      }

    private void TWebUserControl_uniform_catalog_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_uniform_catalog Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void Button_submit_Click(object sender, System.EventArgs e)
      {
      if (Page.IsValid)
        {
        p.biz_uniform_catalogs.Set
          (
          k.Safe(TextBox_id.Text,k.safe_hint_type.NUM),
          k.Safe(TextBox_piece_id.Text,k.safe_hint_type.NUM).Trim(),
          CheckBox_be_branded.Checked,
          CheckBox_be_size_dependent.Checked,
          CheckBox_be_specific_rank_dependent.Checked,
          CheckBox_be_extra_individualized.Checked,
          k.Safe(TextBox_rank_group_id.Text,k.safe_hint_type.NUM).Trim(),
          k.Safe(TextBox_medical_release_code.Text,k.safe_hint_type.NUM).Trim(),
          k.Safe(TextBox_option_category_id.Text,k.safe_hint_type.NUM).Trim(),
          CheckBox_be_male.Checked,
          k.Safe(TextBox_vendor_id.Text,k.safe_hint_type.NUM).Trim(),
          k.Safe(TextBox_model_id.Text,k.safe_hint_type.NUM).Trim(),
          k.Safe(TextBox_base_color_id.Text,k.safe_hint_type.NUM).Trim(),
          k.Safe(TextBox_trim_color_id.Text,k.safe_hint_type.NUM).Trim(),
          k.Safe(TextBox_metal_color_id.Text,k.safe_hint_type.NUM).Trim(),
          k.Safe(TextBox_instruction_to_vendor.Text,k.safe_hint_type.MEMO).Trim(),
          k.Safe(TextBox_elaboration.Text,k.safe_hint_type.PUNCTUATED).Trim(),
          k.Safe(TextBox_unit_cost.Text,k.safe_hint_type.REAL_NUM).Trim()
          );
        Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "recsaved", "Record saved.", true);
        SetLookupMode();
        }
      else
        {
        ValidationAlert(true);
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
      if (p.biz_uniform_catalogs.Delete(k.Safe(TextBox_id.Text, k.safe_hint_type.NUM)))
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

    private void SetDependentFieldAblements(bool ablement)
      {
      TextBox_piece_id.Enabled = ablement;
      CheckBox_be_branded.Enabled = ablement;
      CheckBox_be_size_dependent.Enabled = ablement;
      CheckBox_be_specific_rank_dependent.Enabled = ablement;
      CheckBox_be_extra_individualized.Enabled = ablement;
      TextBox_rank_group_id.Enabled = ablement;
      TextBox_medical_release_code.Enabled = ablement;
      TextBox_option_category_id.Enabled = ablement;
      CheckBox_be_male.Enabled = ablement;
      TextBox_vendor_id.Enabled = ablement;
      TextBox_model_id.Enabled = ablement;
      TextBox_base_color_id.Enabled = ablement;
      TextBox_trim_color_id.Enabled = ablement;
      TextBox_metal_color_id.Enabled = ablement;
      TextBox_instruction_to_vendor.Enabled = ablement;
      TextBox_elaboration.Enabled = ablement;
      TextBox_unit_cost.Enabled = ablement;
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
        p.biz_uniform_catalogs.Bind(saved_id, DropDownList_id);
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

    internal void SetP
      (
      string id
      //string agency_id
      )
      {
      //p.agency_id = agency_id;
      //p.agency_name = p.biz_agencies.NameOf(agency_id);
      if (id.Length > 0)
        {
        p.id = id;
        p.summary = p.biz_uniform_catalogs.Summary(id);
        //p.be_ok_to_config_uniform_catalogs = p.biz_privileges.HasForAgency
        //  (
        //  member_id:p.biz_members.IdOfUserId(p.biz_user.IdNum()),
        //  privilege_name:"config-uniform_catalogs",
        //  agency_id:p.biz_uniform_catalogs.AgencyIdOf(p.summary)
        //  );
        p.presentation_mode = (p.be_ok_to_config_uniform_catalogs ? presentation_mode_enum.FULL_FUNCTION : p.presentation_mode = presentation_mode_enum.REVIEW_ONLY);
        }
      else
        {
        p.id = k.EMPTY;
        p.summary = null;
        p.presentation_mode = presentation_mode_enum.NEW;
        }
      }

    } // end TWebUserControl_uniform_catalog

  }
