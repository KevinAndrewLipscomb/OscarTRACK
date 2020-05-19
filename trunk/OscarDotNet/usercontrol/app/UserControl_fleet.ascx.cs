// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_agencies;
using Class_biz_indicator_shiftwise_vehicles_up_and_current;
using Class_biz_members;
using Class_biz_user;
using Class_biz_vehicle_kinds;
using Class_biz_vehicle_quarters;
using Class_biz_vehicles;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_fleet
  {
  public partial class TWebUserControl_fleet: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_SELECT = 0;
      public const int TCI_ID = 1;
      public const int TCI_NAME = 2;
      public const int TCI_DEPLOYMENT_GUIDANCE = 3;
      public const int TCI_GRIPESHEET = 4;
      public const int TCI_NUM_GRIPES = 5;
      public const int TCI_STATUS = 6;
      public const int TCI_STATUS_UP = 7;
      public const int TCI_STATUS_DOWN = 8;
      public const int TCI_DOWN_DURATION = 9;
      public const int TCI_APPEND_NOTE = 10;
      public const int TCI_QUARTERS = 11;
      public const int TCI_MODEL_YEAR = 12;
      public const int TCI_CHASSIS_MAKE = 13;
      public const int TCI_CHASSIS_MODEL = 14;
      public const int TCI_BE_FOUR_OR_ALL_WHEEL_DRIVE = 15;
      public const int TCI_CUSTOM_MAKE = 16;
      public const int TCI_CUSTOM_MODEL = 17;
      public const int TCI_FUEL = 18;
      public const int TCI_AGENCY = 19;
      public const int TCI_KIND = 20;
      public const int TCI_CAN_RECEIVE_LEGACY_COT_FASTENER = 21;
      public const int TCI_RECENT_MILEAGE = 22;
      public const int TCI_MILES_FROM_PM = 23;
      public const int TCI_DMV_INSPECTION_DUE = 24;
      public const int TCI_BUMPER_NUMBER = 25;
      public const int TCI_TAG = 26;
      public const int TCI_VIN = 27;
      public const int TCI_BE_TARGET_PM_MILEAGE_MEANINGFUL = 28;
      public const int TCI_BE_DMV_INSPECTION_DUE_MEANINGFUL = 29;
      }

    private struct p_type
      {
      public string agency_filter;
      public k.int_negative alternative_pm_alert_threshold;
      public bool be_datagrid_empty;
      public bool be_four_or_all_wheel_drive_filter;
      public bool be_interactive;
      public bool be_interest_dynamic;
      public bool be_loaded;
      public bool be_mode_report_pub_fleet_status;
      public bool be_sort_order_ascending;
      public bool be_ok_to_config_vehicles;
      public bool be_ok_to_append_vehicle_down_notes;
      public bool be_ok_to_see_all_squads;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_indicator_shiftwise_vehicles_up_and_current biz_indicator_shiftwise_vehicles_up_and_current;
      public TClass_biz_members biz_members;
      public TClass_biz_user biz_user;
      public TClass_biz_vehicle_quarters biz_vehicle_quarters;
      public TClass_biz_vehicle_kinds biz_vehicle_kinds;
      public TClass_biz_vehicles biz_vehicles;
      public bool can_receive_legacy_cot_fastener_filter;
      public int miles_from_pm_alarm_threshold;
      public int miles_from_pm_alert_threshold;
      public uint num_usable;
      public uint num_vehicles;
      public k.int_nonnegative num_vehicles_up_and_current;
      public string quarters_filter;
      public string sort_order;
      public string vehicle_kind_filter;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

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
        if (p.be_interactive)
          {
          LinkButton_add_vehicle.Visible = p.be_ok_to_config_vehicles;
          }
        else
          {
          DropDownList_agency_filter.Enabled = false;
          DropDownList_quarters_filter.Enabled = false;
          DropDownList_vehicle_kind_filter.Enabled = false;
          CheckBox_be_four_or_all_wheel_drive_filter.Enabled = false;
          TableRow_interest.Visible = false;
          DataGrid_control.AllowSorting = false;
          }
        p.biz_vehicle_quarters.BindDirectToListControlMedium(DropDownList_quarters_filter,p.quarters_filter,true);
        p.biz_vehicle_kinds.BindListControl(DropDownList_vehicle_kind_filter,p.vehicle_kind_filter,true);
        CheckBox_be_four_or_all_wheel_drive_filter.Checked = p.be_four_or_all_wheel_drive_filter;
        CheckBox_can_receive_legacy_cot_fastener_filter.Checked = p.can_receive_legacy_cot_fastener_filter;
        p.biz_agencies.BindListControlShort(DropDownList_agency_filter,p.agency_filter,true);
        RadioButtonList_interest.SelectedIndex = (p.be_interest_dynamic ? 0 : 1);
        Bind();
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      if (Session["mode:report"] == null)
        {
        ScriptManager.GetCurrent(Page).RegisterPostBackControl(LinkButton_add_vehicle);
        }
      }

    protected override void OnInit(EventArgs e)
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
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_fleet")
          {
          p.be_loaded &= ((Session["M_PlaceHolder_content"] as string) == "UserControl_fleet");
          }
        }
      else
        {
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_indicator_shiftwise_vehicles_up_and_current = new TClass_biz_indicator_shiftwise_vehicles_up_and_current();
        p.biz_members = new TClass_biz_members();
        p.biz_user = new TClass_biz_user();
        p.biz_vehicle_quarters = new TClass_biz_vehicle_quarters();
        p.biz_vehicles = new TClass_biz_vehicles();
        p.biz_vehicle_kinds = new TClass_biz_vehicle_kinds();
        //
        p.alternative_pm_alert_threshold = new k.int_negative(int.Parse(ConfigurationManager.AppSettings["alternative_pm_alert_threshold"]));
        p.be_four_or_all_wheel_drive_filter = false;
        p.be_mode_report_pub_fleet_status = (Session["mode:report/pub-fleet-status"] != null);
        p.be_ok_to_config_vehicles = k.Has((string[])(Session["privilege_array"]), "config-vehicles");
        p.be_ok_to_append_vehicle_down_notes = k.Has((string[])(Session["privilege_array"]), "append-vehicle-down-note");
        p.be_ok_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
        p.be_interest_dynamic = true;
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.can_receive_legacy_cot_fastener_filter = false;
        p.miles_from_pm_alarm_threshold = int.Parse(ConfigurationManager.AppSettings["miles_from_pm_alarm_threshold"]);
        p.miles_from_pm_alert_threshold = int.Parse(ConfigurationManager.AppSettings["miles_from_pm_alert_threshold"]);
        p.num_vehicles_up_and_current = new k.int_nonnegative();
        p.quarters_filter = k.EMPTY;
        p.sort_order = "vehicle_name%";
        p.vehicle_kind_filter = k.EMPTY;
        //
        p.agency_filter = k.EMPTY;
        p.be_interactive = ((Session["mode:report"] == null) && !p.be_mode_report_pub_fleet_status);
        if (!(p.be_interactive && p.biz_vehicles.BeOkToDefaultAgencyFilterToAll(p.be_ok_to_see_all_squads,p.biz_user.Roles())) && (Session["member_id"] != null))
          {
          p.agency_filter = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
          }
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
      PreRender += TWebUserControl_fleet_PreRender;
      }

    private void TWebUserControl_fleet_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_fleet Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      if (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        SessionSet("vehicle_summary",p.biz_vehicles.Summary(k.Safe(e.Item.Cells[Static.TCI_ID].Text,k.safe_hint_type.NUM)));
        if (e.CommandName == "Select")
          {
          DropCrumbAndTransferTo("vehicle_detail.aspx");
          }
        else if (e.CommandName == "GripeSheet")
          {
          DropCrumbAndTransferTo("gripe_sheet.aspx");
          }
        else if (e.CommandName == "MarkDown")
          {
          DropCrumbAndTransferTo("mark_vehicle_down.aspx");
          }
        else if (e.CommandName == "MarkUp")
          {
          DropCrumbAndTransferTo("mark_vehicle_up.aspx");
          }
        else if (e.CommandName == "AppendNote")
          {
          DropCrumbAndTransferTo("append_vehicle_down_note.aspx");
          }
        else if (e.CommandName == "ChangeQuarters")
          {
          DropCrumbAndTransferTo("change_vehicle_quarters.aspx");
          }
        else if (e.CommandName == "UpdateMileage")
          {
          DropCrumbAndTransferTo("update_vehicle_mileage.aspx");
          }
        }
      }

    private void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      if ((new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}).Contains(e.Item.ItemType))
        {
        LinkButton link_button;
        //
        p.num_vehicles++;
        var be_up_and_current = true;
        //
        link_button = ((e.Item.Cells[Static.TCI_GRIPESHEET].Controls[0]) as LinkButton);
        link_button.Text = "<small>" + link_button.Text + "<sub>:" + e.Item.Cells[Static.TCI_NUM_GRIPES].Text + "</sub></small>";
        //
        if (e.Item.Cells[Static.TCI_STATUS].Text == "UP")
          {
          p.num_usable++;
          ((e.Item.Cells[Static.TCI_STATUS_DOWN].Controls[0]) as LinkButton).Visible = false;
          e.Item.Cells[Static.TCI_STATUS_DOWN].BackColor = Color.White;
          ((e.Item.Cells[Static.TCI_APPEND_NOTE].Controls[0]) as LinkButton).Visible = false;
          e.Item.Cells[Static.TCI_APPEND_NOTE].BackColor = Color.White;
          }
        else
          {
          ((e.Item.Cells[Static.TCI_STATUS_UP].Controls[0]) as LinkButton).Visible = false;
          e.Item.Cells[Static.TCI_STATUS_UP].BackColor = Color.White;
          be_up_and_current = false;
          var down_duration = e.Item.Cells[Static.TCI_DOWN_DURATION].Text;
          ((e.Item.Cells[Static.TCI_STATUS_DOWN].Controls[0]) as LinkButton).Text += (down_duration == "0" ? k.EMPTY : "<small> " + down_duration + "d</small>");
          LabelizeAndSetTextForeColor
            (
            table_cell:e.Item.Cells[Static.TCI_DEPLOYMENT_GUIDANCE],
            fore_color:Color.LightGray
            );
          }
        if (e.Item.Cells[Static.TCI_AGENCY].Text.StartsWith("R") || e.Item.Cells[Static.TCI_AGENCY].Text == "MRT")
          {
          var miles_from_pm_text = e.Item.Cells[Static.TCI_MILES_FROM_PM].Text;
          var be_target_pm_mileage_meaningful = (e.Item.Cells[Static.TCI_BE_TARGET_PM_MILEAGE_MEANINGFUL].Text == "1");
          if (k.Safe(miles_from_pm_text,k.safe_hint_type.NUM).Length > 0)
            {
            if ((miles_from_pm_text != "0") && !miles_from_pm_text.StartsWith("-"))
              {
              e.Item.Cells[Static.TCI_MILES_FROM_PM].Text = "+" + e.Item.Cells[Static.TCI_MILES_FROM_PM].Text;
              }
            var miles_from_pm = int.Parse(miles_from_pm_text);
            if (miles_from_pm >= (be_target_pm_mileage_meaningful ? p.miles_from_pm_alert_threshold : p.alternative_pm_alert_threshold.val))
              {
              e.Item.Cells[Static.TCI_RECENT_MILEAGE].BackColor = Color.LightYellow;
              e.Item.Cells[Static.TCI_MILES_FROM_PM].BackColor = Color.LightYellow;
              }
            if (miles_from_pm >= p.miles_from_pm_alarm_threshold)
              {
              e.Item.Cells[Static.TCI_RECENT_MILEAGE].BackColor = Color.LightPink;
              e.Item.Cells[Static.TCI_RECENT_MILEAGE].ForeColor = Color.Blue;
              e.Item.Cells[Static.TCI_MILES_FROM_PM].BackColor = Color.LightPink;
              be_up_and_current = false;
              }
            }
          else if (be_target_pm_mileage_meaningful)
            {
            e.Item.Cells[Static.TCI_RECENT_MILEAGE].BackColor = Color.LightPink;
            e.Item.Cells[Static.TCI_RECENT_MILEAGE].ForeColor = Color.Blue;
            e.Item.Cells[Static.TCI_MILES_FROM_PM].BackColor = Color.LightPink;
            be_up_and_current = false;
            }
          var dmv_inspection_due_text = k.Safe(e.Item.Cells[Static.TCI_DMV_INSPECTION_DUE].Text,k.safe_hint_type.HYPHENATED_NUM);
          if (dmv_inspection_due_text.Length > 0)
            {
            var dmv_inspection_due_date = DateTime.Parse(dmv_inspection_due_text);
            var dmv_inspection_due_month = dmv_inspection_due_date.Year.ToString() + k.HYPHEN + dmv_inspection_due_date.Month.ToString("D2");
            e.Item.Cells[Static.TCI_DMV_INSPECTION_DUE].Text = dmv_inspection_due_month;
            if (DateTime.Today.ToString("yyyy-MM-dd").CompareTo(dmv_inspection_due_month + "-01") >= 0)
              {
              e.Item.Cells[Static.TCI_DMV_INSPECTION_DUE].BackColor = Color.LightYellow;
              }
            if (DateTime.Today >= dmv_inspection_due_date)
              {
              e.Item.Cells[Static.TCI_DMV_INSPECTION_DUE].BackColor = Color.LightPink;
              be_up_and_current = false;
              }
            }
          else if (e.Item.Cells[Static.TCI_BE_DMV_INSPECTION_DUE_MEANINGFUL].Text == "1")
            {
            e.Item.Cells[Static.TCI_DMV_INSPECTION_DUE].BackColor = Color.LightPink;
            be_up_and_current = false;
            }
          }
        else
          {
          e.Item.Cells[Static.TCI_RECENT_MILEAGE].Text = k.NO_BREAK_SPACE;
          e.Item.Cells[Static.TCI_MILES_FROM_PM].Text = k.NO_BREAK_SPACE;
          e.Item.Cells[Static.TCI_DMV_INSPECTION_DUE].Text = k.NO_BREAK_SPACE;
          }

        if (p.be_interactive)
          {
          link_button = ((e.Item.Cells[Static.TCI_SELECT].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          link_button.ToolTip = "Detail";
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          link_button = ((e.Item.Cells[Static.TCI_GRIPESHEET].Controls[0]) as LinkButton);
          link_button.ToolTip = "Manage GripeSheet";
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          link_button = ((e.Item.Cells[Static.TCI_STATUS_UP].Controls[0]) as LinkButton);
          link_button.ToolTip = "Mark DOWN";
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          link_button = ((e.Item.Cells[Static.TCI_STATUS_DOWN].Controls[0]) as LinkButton);
          link_button.ToolTip = "Mark UP";
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          link_button = ((e.Item.Cells[Static.TCI_APPEND_NOTE].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          link_button.ToolTip = "Append note";
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          link_button = ((e.Item.Cells[Static.TCI_QUARTERS].Controls[0]) as LinkButton);
          link_button.ToolTip = "Relocate";
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          //
          if (e.Item.Cells[Static.TCI_RECENT_MILEAGE].Text != k.NO_BREAK_SPACE)
            {
            link_button = ((e.Item.Cells[Static.TCI_RECENT_MILEAGE].Controls[0]) as LinkButton);
            link_button.ToolTip = "Update";
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
            }
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[Static.TCI_ID].EnableViewState = true;
          //
          }
        else
          {
          ((e.Item.Cells[Static.TCI_GRIPESHEET].Controls[0]) as LinkButton).Enabled = false;
          ((e.Item.Cells[Static.TCI_STATUS_UP].Controls[0]) as LinkButton).Enabled = false;
          ((e.Item.Cells[Static.TCI_STATUS_DOWN].Controls[0]) as LinkButton).Enabled = false;
          ((e.Item.Cells[Static.TCI_APPEND_NOTE].Controls[0]) as LinkButton).Enabled = false;
          ((e.Item.Cells[Static.TCI_QUARTERS].Controls[0]) as LinkButton).Enabled = false;
          if (e.Item.Cells[Static.TCI_RECENT_MILEAGE].Text != k.NO_BREAK_SPACE)
            {
            ((e.Item.Cells[Static.TCI_RECENT_MILEAGE].Controls[0]) as LinkButton).Enabled = false;
            }
          }
        if (be_up_and_current)
          {
          p.num_vehicles_up_and_current.val++;
          }
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
      DataGrid_control.Columns[Static.TCI_SELECT].Visible = (p.be_interactive);
      DataGrid_control.Columns[Static.TCI_DEPLOYMENT_GUIDANCE].Visible = (p.be_interest_dynamic);
      DataGrid_control.Columns[Static.TCI_GRIPESHEET].Visible = (p.be_interest_dynamic);
      DataGrid_control.Columns[Static.TCI_STATUS_UP].Visible = (p.be_interest_dynamic);
      DataGrid_control.Columns[Static.TCI_STATUS_DOWN].Visible = (p.be_interest_dynamic);
      DataGrid_control.Columns[Static.TCI_APPEND_NOTE].Visible = (p.be_interest_dynamic) && p.be_ok_to_append_vehicle_down_notes;
      DataGrid_control.Columns[Static.TCI_QUARTERS].Visible = (p.be_interest_dynamic);
      DataGrid_control.Columns[Static.TCI_RECENT_MILEAGE].Visible = (p.be_interest_dynamic && !p.be_mode_report_pub_fleet_status);
      DataGrid_control.Columns[Static.TCI_MILES_FROM_PM].Visible = (p.be_interest_dynamic && !p.be_mode_report_pub_fleet_status);
      DataGrid_control.Columns[Static.TCI_DMV_INSPECTION_DUE].Visible = (p.be_interest_dynamic && !p.be_mode_report_pub_fleet_status);
      DataGrid_control.Columns[Static.TCI_MODEL_YEAR].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[Static.TCI_CHASSIS_MAKE].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[Static.TCI_CHASSIS_MODEL].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[Static.TCI_BE_FOUR_OR_ALL_WHEEL_DRIVE].Visible = (!p.be_interest_dynamic) && !p.be_four_or_all_wheel_drive_filter;
      DataGrid_control.Columns[Static.TCI_CUSTOM_MAKE].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[Static.TCI_CUSTOM_MODEL].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[Static.TCI_FUEL].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[Static.TCI_KIND].Visible = (p.vehicle_kind_filter.Length == 0);
      DataGrid_control.Columns[Static.TCI_CAN_RECEIVE_LEGACY_COT_FASTENER].Visible =
        (
          !p.be_interest_dynamic
        &&
          (
            (p.vehicle_kind_filter.Length == 0)
          ||
            (p.biz_vehicle_kinds.DescriptionOf(p.vehicle_kind_filter) == "Ambulance")
          )
        );
      DataGrid_control.Columns[Static.TCI_AGENCY].Visible = (p.agency_filter.Length == 0);
      DataGrid_control.Columns[Static.TCI_BUMPER_NUMBER].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[Static.TCI_TAG].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[Static.TCI_VIN].Visible = (!p.be_interest_dynamic);
      p.biz_vehicles.BindBaseDataList
        (
        sort_order:p.sort_order,
        be_sort_order_ascending:p.be_sort_order_ascending,
        target:DataGrid_control,
        agency_filter:p.agency_filter,
        vehicle_kind_filter:p.vehicle_kind_filter,
        be_four_or_all_wheel_drive_filter:p.be_four_or_all_wheel_drive_filter,
        quarters_filter:p.quarters_filter,
        can_receive_legacy_cot_fastener_filter:p.can_receive_legacy_cot_fastener_filter
        );
      p.be_datagrid_empty = (p.num_vehicles == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      TableRow_data.Visible = !p.be_datagrid_empty;
      Literal_num_rows.Text = p.num_vehicles.ToString();
      Literal_num_usable.Text = p.num_usable.ToString();
      //
      var num_ambulances_up_citywide = new k.int_nonnegative();
      var fraction_of_ambulances_up_citywide = new k.decimal_nonnegative();
      var condition = new k.subtype<int>(-1,1);
      condition.val = p.biz_vehicles.AmbulanceFleetCondition(num_ambulances_up_citywide,fraction_of_ambulances_up_citywide);
      Literal_num_ambulances_usable_citywide.Text = num_ambulances_up_citywide.val.ToString();
      Literal_percent_ambulances_usable_citywide.Text = fraction_of_ambulances_up_citywide.val.ToString("P0");
      Table_ambulances_citywide.BgColor = k.EMPTY;
      //
      if (condition.val == 0)
        {
        Table_ambulances_citywide.BgColor = Color.Yellow.Name;
        }
      if (condition.val == -1)
        {
        Table_ambulances_citywide.BgColor = Color.Red.Name;
        Table_ambulances_citywide.Style.Value = "color:white";
        }
      //
      if (TableRow_none.Visible = !(p.num_vehicles > 0))
        {
        Literal_percent_usable.Text = "-";
        }
      else
        {
        var decimal_num_vehicles = Convert.ToDecimal(p.num_vehicles);
        Literal_percent_usable.Text = (decimal.Divide(Convert.ToDecimal(p.num_usable), decimal_num_vehicles)).ToString("P0");
        if (!p.be_interactive)
          {
          p.biz_indicator_shiftwise_vehicles_up_and_current.Log(p.agency_filter,decimal.Divide(Convert.ToDecimal(p.num_vehicles_up_and_current.val), decimal_num_vehicles));
          }
        }
      //
      Panel_dynamic_best_practices.Visible = p.be_interest_dynamic;
      //
      p.num_usable = 0;
      p.num_vehicles = 0;
      }

    protected void DropDownList_agency_filter_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.agency_filter = k.Safe(DropDownList_agency_filter.SelectedValue, k.safe_hint_type.NUM);
      Bind();
      }

    protected void DropDownList_vehicle_kind_filter_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.vehicle_kind_filter = k.Safe(DropDownList_vehicle_kind_filter.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    protected void RadioButtonList_interest_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.be_interest_dynamic = (k.Safe(RadioButtonList_interest.SelectedValue,k.safe_hint_type.ALPHA) == "Dynamic");
      Bind();
      }

    protected void DropDownList_quarters_filter_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.quarters_filter = k.Safe(DropDownList_quarters_filter.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    protected void LinkButton_add_vehicle_Click(object sender, EventArgs e)
      {
      DropCrumbAndTransferTo("add_vehicle.aspx");
      }

    protected void CheckBox_be_four_or_all_wheel_drive_filter_CheckedChanged(object sender, EventArgs e)
      {
      p.be_four_or_all_wheel_drive_filter = CheckBox_be_four_or_all_wheel_drive_filter.Checked;
      Bind();
      }

    protected void CheckBox_can_receive_legacy_cot_fastener_filter_CheckedChanged(object sender, EventArgs e)
      {
      p.can_receive_legacy_cot_fastener_filter = CheckBox_can_receive_legacy_cot_fastener_filter.Checked;
      Bind();
      }

    internal void SetP(string agency_short_designator)
      {
      p.agency_filter = p.biz_agencies.IdOfShortDesignator(agency_short_designator);
      }

    } // end TWebUserControl_fleet

  }