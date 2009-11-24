// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~kicrudhelped~item.ascx.cs~template

using Class_biz_agencies;
using Class_biz_chassis_models;
using Class_biz_custom_models;
using Class_biz_fuels;
using Class_biz_vehicle_kinds;
using Class_biz_vehicles;
using Class_biz_role_member_map;
using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;
using UserControl_drop_down_date;

namespace UserControl_vehicle
  {
  public partial class TWebUserControl_vehicle: ki_web_ui.usercontrol_class
    {
    private struct p_type
      {
      public bool be_loaded;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_chassis_models biz_chassis_models;
      public TClass_biz_custom_models biz_custom_models;
      public TClass_biz_fuels biz_fuels;
      public TClass_biz_vehicle_kinds biz_vehicle_kinds;
      public TClass_biz_vehicles biz_vehicles;
      public TClass_biz_role_member_map biz_role_member_map;
      public bool be_ok_to_config_vehicles;
      }

    public bool be_record_navigation_controls_visible
      {
      get
        {
        return TableRow_record_navigation_controls.Visible;
        }
      set
        {
        TableRow_record_navigation_controls.Visible = value;
        }
      }

    private p_type p;

    private void Clear()
      {
      TextBox_id.Text = k.EMPTY;
      DropDownList_id.Visible = false;
      DropDownList_agency.ClearSelection();
      TextBox_name.Text = k.EMPTY;
      DropDownList_kind.ClearSelection();
      TextBox_bumper_number.Text = k.EMPTY;
      TextBox_model_year.Text = k.EMPTY;
      DropDownList_chassis_model.ClearSelection();
      DropDownList_custom_model.ClearSelection();
      TextBox_vin.Text = k.EMPTY;
      DropDownList_fuel.ClearSelection();
      TextBox_license_plate.Text = k.EMPTY;
      TextBox_purchase_price.Text = k.EMPTY;
      TextBox_recent_mileage.Text = k.EMPTY;
      CheckBox_be_active.Checked = false;
      TextBox_target_pm_mileage.Text = k.EMPTY;
      UserControl_drop_down_date_dmv_inspection_due.Clear();
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
        p.biz_agencies.BindListControlShortDashLong(DropDownList_agency);
        DropDownList_agency.Items.Insert(0,(new ListItem("-- agency --",k.EMPTY)));
        p.biz_chassis_models.BindDirectToListControl(DropDownList_chassis_model,true);
        DropDownList_chassis_model.Items.Insert(0,(new ListItem("-- chassis model --",k.EMPTY)));
        p.biz_custom_models.BindDirectToListControl(DropDownList_custom_model,true);
        DropDownList_custom_model.Items.Insert(0,(new ListItem("-- custom model --",k.EMPTY)));
        p.biz_fuels.BindDirectToListControl(DropDownList_fuel);
        DropDownList_fuel.Items.Insert(0,(new ListItem("-- fuel --",k.EMPTY)));
        p.biz_vehicle_kinds.BindDirectToListControl(DropDownList_kind);
        DropDownList_kind.Items.Insert(0,(new ListItem("-- kind --",k.EMPTY)));
        LinkButton_new_record.Visible = p.be_ok_to_config_vehicles;
        LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
        LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
        LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
        LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
        RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
        if ((Session["mode:goto"] != null) && Session["mode:goto"].ToString().Contains("/vehicle/"))
          {
          PresentRecord(Session["mode:goto"].ToString().Substring(Session["mode:goto"].ToString().LastIndexOf("/") + 1));
          Session.Remove("mode:goto");
          }
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      }

    private bool PresentRecord(string id)
      {
      bool result;
      string agency_id;
      string name;
      string kind_id;
      string bumper_number;
      string model_year;
      string chassis_model_id;
      string custom_model_id;
      string vin;
      string fuel_id;
      string license_plate;
      string purchase_price;
      string recent_mileage;
      bool be_active;
      string target_pm_mileage;
      DateTime dmv_inspection_due;
      result = false;
      if
        (
        p.biz_vehicles.Get
          (
          id,
          out agency_id,
          out name,
          out kind_id,
          out bumper_number,
          out model_year,
          out chassis_model_id,
          out custom_model_id,
          out vin,
          out fuel_id,
          out license_plate,
          out purchase_price,
          out recent_mileage,
          out be_active,
          out target_pm_mileage,
          out dmv_inspection_due
          )
        )
        {
        TextBox_id.Text = id;
        TextBox_id.Enabled = false;
        DropDownList_agency.Text = agency_id;
        TextBox_name.Text = name;
        DropDownList_kind.SelectedValue = kind_id;
        TextBox_bumper_number.Text = bumper_number;
        TextBox_model_year.Text = model_year;
        DropDownList_chassis_model.SelectedValue = chassis_model_id;
        DropDownList_custom_model.SelectedValue = custom_model_id;
        TextBox_vin.Text = vin;
        DropDownList_fuel.SelectedValue = fuel_id;
        TextBox_license_plate.Text = license_plate;
        TextBox_purchase_price.Text = purchase_price;
        TextBox_recent_mileage.Text = recent_mileage;
        CheckBox_be_active.Checked = be_active;
        TextBox_target_pm_mileage.Text = target_pm_mileage;
        UserControl_drop_down_date_dmv_inspection_due.selectedvalue = dmv_inspection_due;
        Button_lookup.Enabled = false;
        Label_lookup_arrow.Enabled = false;
        Label_lookup_hint.Enabled = false;
        LinkButton_reset.Enabled = true;
        SetDependentFieldAblements(p.be_ok_to_config_vehicles);
        Button_submit.Enabled = p.be_ok_to_config_vehicles;
        Button_delete.Enabled = p.be_ok_to_config_vehicles;
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
      SetDependentFieldAblements(p.be_ok_to_config_vehicles);
      Button_submit.Enabled = p.be_ok_to_config_vehicles;
      Button_delete.Enabled = false;
      Focus(TextBox_id, true);
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
      Focus(TextBox_id, true);
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_vehicle.p"] != null)
        {
        p = (p_type)(Session["UserControl_vehicle.p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_config_UserControl_business_objects_binder_PlaceHolder_content"] as string) == "UserControl_vehicle");
        }
      else
        {
        p.be_loaded = false;
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_chassis_models = new TClass_biz_chassis_models();
        p.biz_custom_models = new TClass_biz_custom_models();
        p.biz_fuels = new TClass_biz_fuels();
        p.biz_vehicle_kinds = new TClass_biz_vehicle_kinds();
        p.biz_vehicles = new TClass_biz_vehicles();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        p.be_ok_to_config_vehicles = k.Has((string[])(Session["privilege_array"]), "config-vehicles");
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      //this.Load += this.Page_Load;
      this.PreRender += this.TWebUserControl_vehicle_PreRender;
      }

    private void TWebUserControl_vehicle_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_vehicle.p", p);
      }

    public TWebUserControl_vehicle Fresh()
      {
      UserControl_drop_down_date_dmv_inspection_due.Fresh();
      Session.Remove("UserControl_vehicle.p");
      return this;
      }

    protected void Button_submit_Click(object sender, System.EventArgs e)
      {
      if (Page.IsValid)
        {
        p.biz_vehicles.Set
          (
          k.Safe(TextBox_id.Text,k.safe_hint_type.NUM),
          k.Safe(DropDownList_agency.SelectedValue,k.safe_hint_type.NUM),
          k.Safe(TextBox_name.Text,k.safe_hint_type.MAKE_MODEL).Trim().ToUpper(),
          k.Safe(DropDownList_kind.SelectedValue,k.safe_hint_type.NUM),
          k.Safe(TextBox_bumper_number.Text,k.safe_hint_type.NUM),
          k.Safe(TextBox_model_year.Text,k.safe_hint_type.NUM),
          k.Safe(DropDownList_chassis_model.SelectedValue,k.safe_hint_type.NUM),
          k.Safe(DropDownList_custom_model.SelectedValue,k.safe_hint_type.NUM),
          k.Safe(TextBox_vin.Text,k.safe_hint_type.ALPHANUM).ToUpper(),
          k.Safe(DropDownList_fuel.SelectedValue,k.safe_hint_type.NUM),
          k.Safe(TextBox_license_plate.Text,k.safe_hint_type.HYPHENATED_ALPHANUM).ToUpper(),
          k.Safe(TextBox_purchase_price.Text,k.safe_hint_type.CURRENCY_USA),
          k.Safe(TextBox_recent_mileage.Text,k.safe_hint_type.NUM),
          CheckBox_be_active.Checked,
          k.Safe(TextBox_target_pm_mileage.Text,k.safe_hint_type.NUM),
          UserControl_drop_down_date_dmv_inspection_due.selectedvalue
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
      if (p.biz_vehicles.Delete(k.Safe(TextBox_id.Text, k.safe_hint_type.NUM)))
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
      DropDownList_agency.Enabled = ablement;
      TextBox_name.Enabled = ablement;
      DropDownList_kind.Enabled = ablement;
      TextBox_bumper_number.Enabled = ablement;
      TextBox_model_year.Enabled = ablement;
      DropDownList_chassis_model.Enabled = ablement;
      DropDownList_custom_model.Enabled = ablement;
      TextBox_vin.Enabled = ablement;
      DropDownList_fuel.Enabled = ablement;
      TextBox_license_plate.Enabled = ablement;
      TextBox_purchase_price.Enabled = ablement;
      TextBox_recent_mileage.Enabled = ablement;
      CheckBox_be_active.Enabled = ablement;
      TextBox_target_pm_mileage.Enabled = ablement;
      UserControl_drop_down_date_dmv_inspection_due.enabled = ablement;
      }

    protected void Button_lookup_Click(object sender, System.EventArgs e)
      {
      uint num_matches;
      string saved_id;
      saved_id = TextBox_id.Text;
      Clear();
      if (!PresentRecord(saved_id))
        {
        TextBox_id.Text = saved_id;
        p.biz_vehicles.Bind(saved_id, DropDownList_id);
        num_matches = (uint)(DropDownList_id.Items.Count);
        if (num_matches > 0)
          {
          LinkButton_go_to_match_prior.Visible = true;
          LinkButton_go_to_match_next.Visible = true;
          LinkButton_go_to_match_last.Visible = true;
          LinkButton_go_to_match_first.Visible = true;
          DropDownList_id.Visible = true;
          if (num_matches == 1)
            {
            PresentRecord(k.Safe(DropDownList_id.SelectedValue, k.safe_hint_type.NUM));
            }
          else
            {
            DropDownList_id.Items.Insert(0, new ListItem("-- Select --", k.EMPTY));
            }
          }
        }
      }

    protected void CustomValidator_model_year_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = false;
      var textbox_model_year_text = k.Safe(TextBox_model_year.Text,k.safe_hint_type.NUM);
      if (textbox_model_year_text == k.EMPTY)
        {
        args.IsValid = true;
        }
      else
        {
        const string YEAR_FORD_MODEL_T_FIRST_PRODUCED = "1908";
        var model_year = new k.subtype<string>("0000","9999");
        model_year.val = textbox_model_year_text;
        args.IsValid = ((model_year.val.CompareTo(YEAR_FORD_MODEL_T_FIRST_PRODUCED) >= 0) && (model_year.val.CompareTo((DateTime.Today.Year + 1).ToString()) <= 0));
        }
      }

    protected void CustomValidator_recent_mileage_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = p.biz_vehicles.BeNotLessMileage(k.Safe(TextBox_id.Text,k.safe_hint_type.NUM),k.Safe(TextBox_recent_mileage.Text,k.safe_hint_type.NUM));
      }

    protected void CustomValidator_target_pm_mileage_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = p.biz_vehicles.BeNotEarlierTargetPmMileage(k.Safe(TextBox_id.Text,k.safe_hint_type.NUM),k.Safe(TextBox_target_pm_mileage.Text,k.safe_hint_type.NUM));
      }

    protected void CustomValidator_dmv_inspection_due_ServerValidate(object source, ServerValidateEventArgs args)
      {
      args.IsValid = p.biz_vehicles.BeNotEarlierDmvInspectionDue(k.Safe(TextBox_id.Text,k.safe_hint_type.NUM),UserControl_drop_down_date_dmv_inspection_due.selectedvalue);
      }

    } // end TWebUserControl_vehicle

  }
