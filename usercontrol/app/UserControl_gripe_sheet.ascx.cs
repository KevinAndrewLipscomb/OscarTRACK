// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_agencies;
using Class_biz_gripes;
using Class_biz_members;
using Class_biz_user;
using Class_biz_vehicle_down_natures;
using Class_biz_vehicle_usability_history;
using Class_biz_vehicles;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserControl_iva_attachment_explorer;

namespace UserControl_gripe_sheet
  {

  public partial class TWebUserControl_gripe_sheet: ki_web_ui.usercontrol_class
    {

    private static class Static
      {
      public const string GRIPE_DISCRETION_PROMPT = "You should review the list of gripes to make sure it is appropriate, and append to, or remove, any gripes, as necessary." + k.NEW_LINE
      + k.NEW_LINE
      + "Are you sure you want to submit this VIR now?";
      public const int TCI_INCLUDE = 0;
      public const int TCI_DELETE = 1;
      public const int TCI_ID = 2;
      public const int TCI_DESCRIPTION = 3;
      public const int TCI_APPEND = 4;
      public const int TCI_IVA_MEDIA = 5;
      }

    private struct p_type
      {
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_ok_to_config_gripes;
      public bool be_sort_order_ascending;
      public bool be_work_order_mode;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_members biz_members;
      public TClass_biz_gripes biz_gripes;
      public TClass_biz_user biz_user;
      public TClass_biz_vehicle_down_natures biz_vehicle_down_natures;
      public TClass_biz_vehicle_usability_history biz_vehicle_usability_history;
      public TClass_biz_vehicles biz_vehicles;
      public Hashtable gripe_inclusion_hashtable;
      public string main_reason_for_visit;
      public uint num_gripes;
      public string sort_order;
      public string user_id;
      public object vehicle_summary;
      public string work_order_coordinator_title;
      }

    private p_type p;

    private void InjectPersistentClientSideScript()
      {
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.EL);
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.KGS_TO_LBS);
      // EstablishClientSideFunction(k.client_side_function_enumeral_type.LBS_TO_KGS);
      // EstablishClientSideFunction
      // (
      // 'RecalculateDependentValues()',
      // k.EMPTY
      // + 'El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value ='
      // +  ' El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_lbs.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value ='
      // +  ' El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value - El("' + TextBox_gross_invoiced_weight_in_kgs.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
      // +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
      // +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value ='
      // +  ' El("' + TextBox_gain_or_loss_in_lbs.clientid + '").value - El("' + TextBox_franchise_in_lbs.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value ='
      // +  ' El("' + TextBox_gain_or_loss_in_kgs.clientid + '").value - El("' + TextBox_franchise_in_kgs.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_lbs.clientid + '").value ='
      // +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_actual_gain_or_loss_per_bale_in_kgs.clientid + '").value ='
      // +  ' El("' + TextBox_actual_gain_or_loss_in_kgs.clientid + '").value/El("' + TextBox_bales.clientid + '").value;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_percent_gain_or_loss.clientid + '").value ='
      // +  ' Math.round(El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value/El("' + TextBox_net_invoiced_in_lbs.clientid + '").value*100*100)/100;'
      // + k.NEW_LINE
      // + 'El("' + TextBox_monetary_gain_or_loss.clientid + '").value ='
      // +  ' El("' + TextBox_actual_gain_or_loss_in_lbs.clientid + '").value*El("' + TextBox_unit_price_in_cents_per_pound.clientid + '").value;'
      // );
      // //
      // TextBox_bales.attributes.Add('onkeyup','RecalculateDependentValues();');
      // TextBox_gross_landed_weight_in_pounds.attributes.Add
      // (
      // 'onkeyup',
      // 'El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value);'
      // + ' RecalculateDependentValues();'
      // );
      // TextBox_gross_landed_weight_in_kgs.attributes.Add
      // (
      // 'onkeyup',
      // 'El("' + TextBox_gross_landed_weight_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_gross_landed_weight_in_kgs.clientid + '").value);'
      // + ' RecalculateDependentValues();'
      // );
      // TextBox_landed_or_ciq_tare.attributes.Add
      // (
      // 'onkeyup',
      // 'El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_landed_or_ciq_tare.clientid + '").value);'
      // + ' RecalculateDependentValues();'
      // );
      // TextBox_landed_or_ciq_tare_in_kgs.attributes.Add
      // (
      // 'onkeyup',
      // 'El("' + TextBox_landed_or_ciq_tare.clientid + '").value = KgsToLbs(El("' + TextBox_landed_or_ciq_tare_in_kgs.clientid + '").value);'
      // + ' RecalculateDependentValues();'
      // );
      // TextBox_net_landed_in_pounds.attributes.Add
      // (
      // 'onkeyup',
      // 'El("' + TextBox_net_landed_in_kgs.clientid + '").value = LbsToKgs(El("' + TextBox_net_landed_in_pounds.clientid + '").value);'
      // + ' RecalculateDependentValues();'
      // );
      // TextBox_net_landed_in_kgs.attributes.Add
      // (
      // 'onkeyup',
      // 'El("' + TextBox_net_landed_in_pounds.clientid + '").value = KgsToLbs(El("' + TextBox_net_landed_in_kgs.clientid + '").value);'
      // + ' RecalculateDependentValues();'
      // );
      }

    protected void Page_Load(object sender, EventArgs e)
      {
      if (!p.be_loaded)
        {
        var member_id = p.biz_members.IdOfUserId(p.user_id);
        //
        Literal_title_gripes.Visible = !p.be_work_order_mode;
        Literal_title_vir.Visible = p.be_work_order_mode;
        Literal_vehicle_name.Text = p.biz_vehicles.NameOf((p.vehicle_summary));
        Literal_work_order_coordinator_title.Text = p.work_order_coordinator_title;
        Literal_work_order_coordinator_name.Text = p.biz_members.FirstNameOfMemberId(member_id) + k.SPACE + p.biz_members.LastNameOfMemberId(member_id);
        var agency_id = p.biz_vehicles.AgencyIdOfId(p.biz_vehicles.IdOf(p.vehicle_summary));
        Literal_agency_long_designator.Text = p.biz_agencies.LongDesignatorOf(agency_id) + (agency_id == "0" ? k.EMPTY : " Volunteer Rescue Squad");
        Literal_work_order_coordinator_phone_num.Text = k.FormatAsNanpPhoneNum(p.biz_members.PhoneNumOf(member_id));
        Literal_work_order_coordinator_email_address.Text = p.biz_members.EmailAddressOf(member_id);
        Literal_kind.Text = p.biz_vehicles.KindOf(p.vehicle_summary);
        Literal_vehicle_name_2.Text = p.biz_vehicles.NameOf(p.vehicle_summary);
        Literal_bumper_number.Text = p.biz_vehicles.BumperNumberOf(p.vehicle_summary);
        Literal_model_year.Text = p.biz_vehicles.ModelYearOf(p.vehicle_summary);
        Literal_chassis_make.Text = p.biz_vehicles.ChassisMakeOf(p.vehicle_summary);
        Literal_chassis_model.Text = p.biz_vehicles.ChassisModelOf(p.vehicle_summary);
        Literal_custom_make.Text = p.biz_vehicles.CustomMakeOf(p.vehicle_summary);
        Literal_custom_model.Text = p.biz_vehicles.CustomModelOf(p.vehicle_summary);
        Literal_vin.Text = p.biz_vehicles.VinOf(p.vehicle_summary);
        Literal_fuel.Text = p.biz_vehicles.FuelOf(p.vehicle_summary);
        Literal_tag.Text = p.biz_vehicles.TagOf(p.vehicle_summary);
        Literal_be_four_or_all_wheel_drive.Text = k.YesNoOf(p.biz_vehicles.BeFourOrAllWheelDriveOf(p.vehicle_summary));
        Literal_recent_mileage_update_time.Text = p.biz_vehicles.RecentMileageUpdateTimeOf(p.vehicle_summary);
        Literal_recent_mileage_update_time_2.Text = p.biz_vehicles.RecentMileageUpdateTimeOf(p.vehicle_summary);
        Literal_recent_mileage.Text = p.biz_vehicles.RecentMileageOf(p.vehicle_summary);
        Literal_miles_from_pm.Text = p.biz_vehicles.MilesFromPmOf(p.vehicle_summary);
        var dmv_inspection_due = p.biz_vehicles.DmvInspectionDueOf(p.vehicle_summary);
        Literal_dmv_inspection_due.Text = (dmv_inspection_due.Length >= 7 ? dmv_inspection_due.Substring(0,7) : "???");
        CheckBox_be_work_order_mode.Visible = p.be_interactive && p.be_ok_to_config_gripes;
        CheckBox_be_work_order_mode.Checked = !p.be_interactive;
        TableRow_main_reason_for_visit_interactive.Visible = p.be_interactive;
        TableRow_main_reason_for_visit_noninteractive.Visible = !p.be_interactive;
        Literal_main_reason_for_visit.Text = p.main_reason_for_visit;
        DataGrid_control.AllowSorting = p.be_interactive;
        SetWorkOrderMode(!p.be_interactive);
        Button_send_to_city_garage.Visible = p.be_interactive;
        Button_send_to_comit.Visible = p.be_interactive;
        Button_send_to_boat_shop.Visible = p.be_interactive && (p.biz_agencies.ShortDesignatorOf(agency_id) == "MRT");
        RequireConfirmation
          (
          c:Button_send_to_city_garage,
          prompt:Static.GRIPE_DISCRETION_PROMPT
          );
        RequireConfirmation
          (
          c:Button_send_to_comit,
          prompt:Static.GRIPE_DISCRETION_PROMPT
          );
        RequireConfirmation
          (
          c:Button_send_to_boat_shop,
          prompt:Static.GRIPE_DISCRETION_PROMPT
          );
        if (p.be_interactive)
          {
          p.gripe_inclusion_hashtable.Clear();
          }
        Bind();
        p.be_loaded = true;
        }
      if (p.be_interactive)
        {
        ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_new);
        ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_send_to_city_garage);
        ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_send_to_comit);
        ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_send_to_boat_shop);
        }
      InjectPersistentClientSideScript();
      }

    protected override void OnInit(EventArgs e)
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
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_members = new TClass_biz_members();
        p.biz_gripes = new TClass_biz_gripes();
        p.biz_user = new TClass_biz_user();
        p.biz_vehicle_down_natures = new TClass_biz_vehicle_down_natures();
        p.biz_vehicle_usability_history = new TClass_biz_vehicle_usability_history();
        p.biz_vehicles = new TClass_biz_vehicles();
        //
        p.be_interactive = true;
        p.be_loaded = false;
        p.be_ok_to_config_gripes = k.Has((string[])(Session["privilege_array"]), "config-gripes");
        p.be_sort_order_ascending = true;
        p.be_work_order_mode = false;
        p.gripe_inclusion_hashtable = new Hashtable();
        p.main_reason_for_visit = k.EMPTY;
        p.sort_order = "id%";
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_control.ItemDataBound += new DataGridItemEventHandler(DataGrid_control_ItemDataBound);
      DataGrid_control.SortCommand += new DataGridSortCommandEventHandler(DataGrid_control_SortCommand);
      DataGrid_control.ItemCommand += new DataGridCommandEventHandler(DataGrid_control_ItemCommand);
      PreRender += TWebUserControl_gripe_sheet_PreRender;
      }

    private void TWebUserControl_gripe_sheet_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_gripe_sheet Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      if (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        var id = k.Safe(e.Item.Cells[Static.TCI_ID].Text,k.safe_hint_type.NUM);
        //
        if (e.CommandName == "Append")
          {
          SessionSet("mode:goto","/gripe/" + id);
          DropCrumbAndTransferTo("gripe.aspx");
          }
        else if (e.CommandName == "Delete")
          {
          p.biz_gripes.Delete(id);
          //
          // Without Bind()-ing twice, the UserControl_iva_attachment_explorer for the row that just got deleted refuses to disappear, and pushes later UserControl_iva_attachment_explorer elements one row further down than
          // they should be.  I suspect UserControl_attachment_explorer is loading the wrong instance of its p object.
          //
          Bind();
          Bind();
          }
        else if (e.CommandName == "ToggleInclusion")
          {
          var new_value = !((bool)(p.gripe_inclusion_hashtable[id]));
          (e.Item.Cells[Static.TCI_INCLUDE].Controls[0] as LinkButton).Text = (new_value ? "YES" : "no");
          p.gripe_inclusion_hashtable[id] = new_value;
          Bind();
          }
        }
      }

    private void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      LinkButton link_button;
      if (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        var id = k.Safe(e.Item.Cells[Static.TCI_ID].Text,k.safe_hint_type.NUM);
        var iva_attachment_explorer = (e.Item.Cells[Static.TCI_IVA_MEDIA].FindControl("UserControl_iva_attachment_explorer") as TWebUserControl_iva_attachment_explorer);
        iva_attachment_explorer.path = HttpContext.Current.Server.MapPath(Class_biz_gripes_Static.ATTACHMENT_FOLDER_SPEC + id);
        iva_attachment_explorer.be_for_persistence = !p.be_interactive;
        //
        if (p.gripe_inclusion_hashtable.ContainsKey(id))
          {
          (e.Item.Cells[Static.TCI_INCLUDE].Controls[0] as LinkButton).Text = (((bool)(p.gripe_inclusion_hashtable[id])) ? "YES" : "no");
          }
        else
          {
          p.gripe_inclusion_hashtable.Add(id,true);
          }
        var be_ok_to_display = (!p.be_work_order_mode || (bool)(p.gripe_inclusion_hashtable[id]));
        if (p.be_interactive)
          {
          if (be_ok_to_display)
            {
            link_button = ((e.Item.Cells[Static.TCI_DELETE].Controls[0]) as LinkButton);
            link_button.Text = k.ExpandTildePath(link_button.Text);
            link_button.ToolTip = "Delete";
            RequireConfirmation(link_button,"Are you sure you want to delete this record?");
            //
            link_button = ((e.Item.Cells[Static.TCI_APPEND].Controls[0]) as LinkButton);
            link_button.Text = k.ExpandTildePath(link_button.Text);
            link_button.ToolTip = "Append note";
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
            //
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(iva_attachment_explorer);
            }
          }
        var description_cell = e.Item.Cells[Static.TCI_DESCRIPTION];
        //
        // The execution order of the following if block and the statement afterwards is critical because of line-ending issues.
        //
        description_cell.Text = description_cell.Text.Replace(k.NEW_LINE,"<br/>");
        if (p.be_work_order_mode)
          {
          description_cell.Text = Regex.Replace
            (
            input:description_cell.Text,
            pattern:" \\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}<br/>", // yyyy-MM-dd HH:mm:ss
            replacement:"<br/>"
            );
          }
        //
        e.Item.Visible = be_ok_to_display;
        p.num_gripes++;
        }
      }

    private void DataGrid_control_SortCommand(object source, DataGridSortCommandEventArgs e)
      {
      if (e.SortExpression == p.sort_order)
        {
        p.be_sort_order_ascending = !p.be_sort_order_ascending;
        }
      else
        {
        p.sort_order = k.Safe(e.SortExpression, k.safe_hint_type.KI_SORT_EXPRESSION);
        p.be_sort_order_ascending = true;
        }
      DataGrid_control.EditItemIndex =  -1;
      Bind();
      }

    private void Bind()
      {
      DataGrid_control.Columns[Static.TCI_INCLUDE].Visible = (p.be_interactive && !CheckBox_be_work_order_mode.Checked && p.be_ok_to_config_gripes);
      DataGrid_control.Columns[Static.TCI_DELETE].Visible = (p.be_interactive && !CheckBox_be_work_order_mode.Checked && p.be_ok_to_config_gripes);
      DataGrid_control.Columns[Static.TCI_APPEND].Visible = (p.be_interactive && !CheckBox_be_work_order_mode.Checked);
      p.biz_gripes.BindLog(p.biz_vehicles.IdOf((p.vehicle_summary)),p.sort_order, p.be_sort_order_ascending, DataGrid_control);
      p.be_datagrid_empty = (p.num_gripes == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      p.num_gripes = 0;
      }

    protected void Button_new_Click(object sender, EventArgs e)
      {
      DropCrumbAndTransferTo("gripe.aspx");
      }

    protected void CheckBox_be_work_order_mode_CheckedChanged(object sender, EventArgs e)
      {
      SetWorkOrderMode(CheckBox_be_work_order_mode.Checked);
      }

    internal void SetFilter
      (
      string user_id,
      object vehicle_summary,
      string work_order_coordinator_title,
      string serialized_gripe_inclusion_hashtable = k.EMPTY,
      string main_reason_for_visit = k.EMPTY
      )
      {
      p.user_id = user_id;
      p.vehicle_summary = vehicle_summary;
      p.work_order_coordinator_title = work_order_coordinator_title;
      p.main_reason_for_visit = main_reason_for_visit;
      if (serialized_gripe_inclusion_hashtable.Length > 0)
        {
        p.gripe_inclusion_hashtable = (new JavaScriptSerializer()).Deserialize<Hashtable>(serialized_gripe_inclusion_hashtable);
        p.be_interactive = false;
        Bind();
        }
      }

    private void SetWorkOrderMode(bool value)
      {
      p.be_work_order_mode = value;
      Literal_title_gripes.Visible = !value;
      Literal_title_vir.Visible = value;
      Literal_generation_timestamp.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
      Panel_generation_timestamp.Visible = value;
      TableRow_best_practices.Visible = !value;
      TableRow_work_order_instructions.Visible = value;
      Bind();
      Button_new.Visible = !value;
      Panel_page_break.Visible = value;
      }

    private void Button_send_Click(string app_setting_name)
      {
      var vehicle_id = p.biz_vehicles.IdOf(p.vehicle_summary);
      var main_reason_for_visit = k.Safe(TextBox_main_reason_for_visit.Text,k.safe_hint_type.MEMO).Trim();
      if (p.biz_vehicles.BeDown(vehicle_id))
        {
        p.biz_vehicle_usability_history.AppendDownNote
          (
          vehicle_id:vehicle_id,
          old_comment:p.biz_vehicle_usability_history.LatestDownComment(vehicle_id),
          note_to_append:main_reason_for_visit
          );
        }
      else
        {
        p.biz_vehicles.MarkDown
          (
          vehicle_id:vehicle_id,
          time_went_down:DateTime.Now,
          nature_id:p.biz_vehicle_down_natures.IdOfName("UNVALIDATED"),
          mileage:k.EMPTY,
          down_comment:main_reason_for_visit,
          summary:p.vehicle_summary
          );
        }
      var working_directory = Server.MapPath("scratch");
      p.biz_gripes.SendWorkOrder
        (
        vehicle_id:vehicle_id,
        user_id:p.user_id,
        urlencoded_work_order_coordinator_title:Server.UrlEncode(p.work_order_coordinator_title),
        urlencoded_main_reason_for_visit:Server.UrlEncode(main_reason_for_visit),
        urlencoded_serialized_gripe_inclusion_hashtable:Server.UrlEncode((new JavaScriptSerializer()).Serialize(p.gripe_inclusion_hashtable)),
        working_directory:working_directory,
        urlencoded_target:Server.UrlEncode(ConfigurationManager.AppSettings[app_setting_name])
        );
      AlertAndBackTrack
        (
        cause:k.alert_cause_type.USER,
        state:k.alert_state_type.SUCCESS,
        key:"logdnsnt",
        value:"The main reason for the visit has been entered into the DOWN note and the VIR has been sent."
        );
      }

    protected void Button_send_to_city_garage_Click(object sender, EventArgs e)
      {
      Button_send_Click("fleet_work_order_target");
      }

    protected void Button_send_to_comit_Click(object sender, EventArgs e)
      {
      Button_send_Click("comit_work_order_target");
      }

    protected void Button_send_to_boat_shop_Click(object sender, EventArgs e)
      {
      Button_send_Click("boat_shop_work_order_target");
      }

    } // end TWebUserControl_gripe_sheet

  }