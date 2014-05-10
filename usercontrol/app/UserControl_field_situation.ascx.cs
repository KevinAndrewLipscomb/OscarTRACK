// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~kicrudhelped~item.ascx.cs~template

using Class_biz_field_situations;
using Class_biz_role_member_map;
using kix;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_field_situation
  {
  public partial class TWebUserControl_field_situation: ki_web_ui.usercontrol_class
    {
    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_field_situations biz_field_situations;
      public TClass_biz_role_member_map biz_role_member_map;
      public bool be_ok_to_config_field_situations;
      } // end p_type

    private p_type p;

    private void Clear()
      {
      TextBox_id.Text = k.EMPTY;
      DropDownList_id.Visible = false;
      TextBox_case_num.Text = k.EMPTY;
      TextBox_address.Text = k.EMPTY;
      TextBox_assignment.Text = k.EMPTY;
      TextBox_time_initialized.Text = k.EMPTY;
      TextBox_nature.Text = k.EMPTY;
      TextBox_impression_id.Text = k.EMPTY;
      TextBox_num_ambulances.Text = k.EMPTY;
      TextBox_num_zone_cars.Text = k.EMPTY;
      TextBox_num_squad_trucks.Text = k.EMPTY;
      TextBox_num_supervisors.Text = k.EMPTY;
      CheckBox_be_emtals.Checked = false;
      CheckBox_be_etby.Checked = false;
      TextBox_num_holds.Text = k.EMPTY;
      TextBox_num_hzcs.Text = k.EMPTY;
      TextBox_num_lifeguards.Text = k.EMPTY;
      TextBox_num_mci_trucks.Text = k.EMPTY;
      CheckBox_be_mrt.Checked = false;
      TextBox_num_mrtks.Text = k.EMPTY;
      CheckBox_be_pio.Checked = false;
      CheckBox_be_pu.Checked = false;
      CheckBox_be_rescue_area.Checked = false;
      TextBox_num_rbs.Text = k.EMPTY;
      CheckBox_be_sqtm.Checked = false;
      TextBox_num_tacs.Text = k.EMPTY;
      TextBox_num_bats.Text = k.EMPTY;
      TextBox_num_cars.Text = k.EMPTY;
      TextBox_num_engines.Text = k.EMPTY;
      TextBox_num_fboas.Text = k.EMPTY;
      TextBox_num_frsqs.Text = k.EMPTY;
      CheckBox_be_ftby.Checked = false;
      TextBox_num_hazs.Text = k.EMPTY;
      TextBox_num_ladders.Text = k.EMPTY;
      CheckBox_be_mirt.Checked = false;
      TextBox_num_safes.Text = k.EMPTY;
      CheckBox_be_stech.Checked = false;
      TextBox_num_sups.Text = k.EMPTY;
      TextBox_num_tankers.Text = k.EMPTY;
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
        LinkButton_new_record.Visible = p.be_ok_to_config_field_situations;
        LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
        LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
        LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
        LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
        RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      }

    private bool PresentRecord(string id)
      {
      Literal_match_index.Text = DropDownList_id.SelectedIndex.ToString();
      bool result;
      string case_num;
      string address;
      string assignment;
      DateTime time_initialized;
      string nature;
      string impression_id;
      string num_ambulances;
      string num_zone_cars;
      string num_squad_trucks;
      string num_supervisors;
      bool be_emtals;
      bool be_etby;
      string num_holds;
      string num_hzcs;
      string num_lifeguards;
      string num_mci_trucks;
      bool be_mrt;
      string num_mrtks;
      bool be_pio;
      bool be_pu;
      bool be_rescue_area;
      string num_rbs;
      bool be_sqtm;
      string num_tacs;
      string num_bats;
      string num_cars;
      string num_engines;
      string num_fboas;
      string num_frsqs;
      bool be_ftby;
      string num_hazs;
      string num_ladders;
      bool be_mirt;
      string num_safes;
      bool be_stech;
      string num_sups;
      string num_tankers;
      bool be_sart;
      result = false;
      if
        (
        p.biz_field_situations.Get
          (
          id,
          out case_num,
          out address,
          out assignment,
          out time_initialized,
          out nature,
          out impression_id,
          out num_ambulances,
          out num_zone_cars,
          out num_squad_trucks,
          out num_supervisors,
          out be_emtals,
          out be_etby,
          out num_holds,
          out num_hzcs,
          out num_lifeguards,
          out num_mci_trucks,
          out be_mrt,
          out num_mrtks,
          out be_pio,
          out be_pu,
          out be_rescue_area,
          out num_rbs,
          out be_sqtm,
          out num_tacs,
          out num_bats,
          out num_cars,
          out num_engines,
          out num_fboas,
          out num_frsqs,
          out be_ftby,
          out num_hazs,
          out num_ladders,
          out be_mirt,
          out num_safes,
          out be_stech,
          out num_sups,
          out num_tankers,
          out be_sart
          )
        )
        {
        TextBox_id.Text = id;
        TextBox_id.Enabled = false;
        TextBox_case_num.Text = case_num;
        TextBox_address.Text = address;
        TextBox_assignment.Text = assignment;
        TextBox_time_initialized.Text = time_initialized.ToString();
        TextBox_nature.Text = nature;
        TextBox_impression_id.Text = impression_id;
        TextBox_num_ambulances.Text = num_ambulances;
        TextBox_num_zone_cars.Text = num_zone_cars;
        TextBox_num_squad_trucks.Text = num_squad_trucks;
        TextBox_num_supervisors.Text = num_supervisors;
        CheckBox_be_emtals.Checked = be_emtals;
        CheckBox_be_etby.Checked = be_etby;
        TextBox_num_holds.Text = num_holds;
        TextBox_num_hzcs.Text = num_hzcs;
        TextBox_num_lifeguards.Text = num_lifeguards;
        TextBox_num_mci_trucks.Text = num_mci_trucks;
        CheckBox_be_mrt.Checked = be_mrt;
        TextBox_num_mrtks.Text = num_mrtks;
        CheckBox_be_pio.Checked = be_pio;
        CheckBox_be_pu.Checked = be_pu;
        CheckBox_be_rescue_area.Checked = be_rescue_area;
        TextBox_num_rbs.Text = num_rbs;
        CheckBox_be_sqtm.Checked = be_sqtm;
        TextBox_num_tacs.Text = num_tacs;
        TextBox_num_bats.Text = num_bats;
        TextBox_num_cars.Text = num_cars;
        TextBox_num_engines.Text = num_engines;
        TextBox_num_fboas.Text = num_fboas;
        TextBox_num_frsqs.Text = num_frsqs;
        CheckBox_be_ftby.Checked = be_ftby;
        TextBox_num_hazs.Text = num_hazs;
        TextBox_num_ladders.Text = num_ladders;
        CheckBox_be_mirt.Checked = be_mirt;
        TextBox_num_safes.Text = num_safes;
        CheckBox_be_stech.Checked = be_stech;
        TextBox_num_sups.Text = num_sups;
        TextBox_num_tankers.Text = num_tankers;
        CheckBox_be_sart.Checked = be_sart;
        Button_lookup.Enabled = false;
        Label_lookup_arrow.Enabled = false;
        Label_lookup_hint.Enabled = false;
        LinkButton_reset.Enabled = true;
        SetDependentFieldAblements(p.be_ok_to_config_field_situations);
        Button_submit.Enabled = p.be_ok_to_config_field_situations;
        Button_delete.Enabled = p.be_ok_to_config_field_situations;
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
      SetDependentFieldAblements(p.be_ok_to_config_field_situations);
      Button_submit.Enabled = p.be_ok_to_config_field_situations;
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
//        //
//        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
//        // had it loaded already.
//        //
//#warning Revise the binder-related instance_id to this control appropriately.
//        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_field_situation")
//          {
//#warning Revise the ClientID path to this control appropriately.
//          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_field_situation");
//          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_field_situation")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_field_situation");
//        }
        }
      else
        {
        p.be_loaded = false;
        p.biz_field_situations = new TClass_biz_field_situations();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        p.be_ok_to_config_field_situations = k.Has((string[])(Session["privilege_array"]), "config-field_situations");
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      //this.Load += this.Page_Load;
      this.PreRender += this.TWebUserControl_field_situation_PreRender;
      }

    private void TWebUserControl_field_situation_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_field_situation Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void Button_submit_Click(object sender, System.EventArgs e)
      {
      if (Page.IsValid)
        {
        //var time_initialized = DateTime.MinValue;
        ////
        //if (TextBox_time_initialized.Text != k.EMPTY)
        //  {
        //  time_initialized = DateTime.Parse(k.Safe(TextBox_time_initialized.Text,k.safe_hint_type.DATE_TIME));
        //  }
        //p.biz_field_situations.Set
        //  (
        //  k.Safe(TextBox_id.Text,k.safe_hint_type.NUM),
        //  k.Safe(TextBox_case_num.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_address.Text,k.safe_hint_type.MAKE_MODEL).Trim(),
        //  k.Safe(TextBox_assignment.Text,k.safe_hint_type.MAKE_MODEL).Trim(),
        //  time_initialized,
        //  k.Safe(TextBox_nature.Text,k.safe_hint_type.MAKE_MODEL).Trim(),
        //  k.Safe(TextBox_impression_id.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_num_ambulances.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_num_zone_cars.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_num_squad_trucks.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_num_supervisors.Text,k.safe_hint_type.NUM).Trim(),
        //  CheckBox_be_emtals.Checked,
        //  CheckBox_be_etby.Checked,
        //  k.Safe(TextBox_num_holds.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_num_hzcs.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_num_lifeguards.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_num_mci_trucks.Text,k.safe_hint_type.NUM).Trim(),
        //  CheckBox_be_mrt.Checked,
        //  k.Safe(TextBox_num_mrtks.Text,k.safe_hint_type.NUM).Trim(),
        //  CheckBox_be_pio.Checked,
        //  CheckBox_be_pu.Checked,
        //  CheckBox_be_rescue_area.Checked,
        //  k.Safe(TextBox_num_rbs.Text,k.safe_hint_type.NUM).Trim(),
        //  CheckBox_be_sqtm.Checked,
        //  k.Safe(TextBox_num_tacs.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_num_bats.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_num_cars.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_num_engines.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_num_fboas.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_num_frsqs.Text,k.safe_hint_type.NUM).Trim(),
        //  CheckBox_be_ftby.Checked,
        //  k.Safe(TextBox_num_hazs.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_num_ladders.Text,k.safe_hint_type.NUM).Trim(),
        //  CheckBox_be_mirt.Checked,
        //  k.Safe(TextBox_num_safes.Text,k.safe_hint_type.NUM).Trim(),
        //  CheckBox_be_stech.Checked,
        //  k.Safe(TextBox_num_sups.Text,k.safe_hint_type.NUM).Trim(),
        //  k.Safe(TextBox_num_tankers.Text,k.safe_hint_type.NUM).Trim(),
        //  CheckBox_be_sart.Checked
        //  );
        //Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "recsaved", "Record saved.", true);
        //SetLookupMode();
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
      if (p.biz_field_situations.Delete(k.Safe(TextBox_id.Text, k.safe_hint_type.NUM)))
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
      TextBox_case_num.Enabled = ablement;
      TextBox_address.Enabled = ablement;
      TextBox_assignment.Enabled = ablement;
      TextBox_time_initialized.Enabled = ablement;
      TextBox_nature.Enabled = ablement;
      TextBox_impression_id.Enabled = ablement;
      TextBox_num_ambulances.Enabled = ablement;
      TextBox_num_zone_cars.Enabled = ablement;
      TextBox_num_squad_trucks.Enabled = ablement;
      TextBox_num_supervisors.Enabled = ablement;
      CheckBox_be_emtals.Enabled = ablement;
      CheckBox_be_etby.Enabled = ablement;
      TextBox_num_holds.Enabled = ablement;
      TextBox_num_hzcs.Enabled = ablement;
      TextBox_num_lifeguards.Enabled = ablement;
      TextBox_num_mci_trucks.Enabled = ablement;
      CheckBox_be_mrt.Enabled = ablement;
      TextBox_num_mrtks.Enabled = ablement;
      CheckBox_be_pio.Enabled = ablement;
      CheckBox_be_pu.Enabled = ablement;
      CheckBox_be_rescue_area.Enabled = ablement;
      TextBox_num_rbs.Enabled = ablement;
      CheckBox_be_sqtm.Enabled = ablement;
      TextBox_num_tacs.Enabled = ablement;
      TextBox_num_bats.Enabled = ablement;
      TextBox_num_cars.Enabled = ablement;
      TextBox_num_engines.Enabled = ablement;
      TextBox_num_fboas.Enabled = ablement;
      TextBox_num_frsqs.Enabled = ablement;
      CheckBox_be_ftby.Enabled = ablement;
      TextBox_num_hazs.Enabled = ablement;
      TextBox_num_ladders.Enabled = ablement;
      CheckBox_be_mirt.Enabled = ablement;
      TextBox_num_safes.Enabled = ablement;
      CheckBox_be_stech.Enabled = ablement;
      TextBox_num_sups.Enabled = ablement;
      TextBox_num_tankers.Enabled = ablement;
      CheckBox_be_sart.Enabled = ablement;
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
        p.biz_field_situations.Bind(saved_id, DropDownList_id);
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

    } // end TWebUserControl_field_situation

  }
