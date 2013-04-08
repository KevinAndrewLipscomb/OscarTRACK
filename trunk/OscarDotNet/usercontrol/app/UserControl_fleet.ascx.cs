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
    public class UserControl_fleet_Static
      {
      public const int TCI_SELECT = 0;
      public const int TCI_ID = 1;
      public const int TCI_NAME = 2;
      public const int TCI_GRIPESHEET = 3;
      public const int TCI_NUM_GRIPES = 4;
      public const int TCI_STATUS = 5;
      public const int TCI_STATUS_UP = 6;
      public const int TCI_STATUS_DOWN = 7;
      public const int TCI_APPEND_NOTE = 8;
      public const int TCI_QUARTERS = 9;
      public const int TCI_RECENT_MILEAGE = 10;
      public const int TCI_MILES_FROM_PM = 11;
      public const int TCI_DMV_INSPECTION_DUE = 12;
      public const int TCI_MODEL_YEAR = 13;
      public const int TCI_CHASSIS_MAKE = 14;
      public const int TCI_CHASSIS_MODEL = 15;
      public const int TCI_BE_FOUR_OR_ALL_WHEEL_DRIVE = 16;
      public const int TCI_CUSTOM_MAKE = 17;
      public const int TCI_CUSTOM_MODEL = 18;
      public const int TCI_FUEL = 19;
      public const int TCI_KIND = 20;
      public const int TCI_AGENCY = 21;
      public const int TCI_BUMPER_NUMBER = 22;
      public const int TCI_TAG = 23;
      public const int TCI_VIN = 24;
      public const int TCI_BE_TARGET_PM_MILEAGE_MEANINGFUL = 25;
      public const int TCI_BE_DMV_INSPECTION_DUE_MEANINGFUL = 26;
      }

    private struct p_type
      {
      public string agency_filter;
      public bool be_four_or_all_wheel_drive_filter;
      public bool be_interactive;
      public bool be_interest_dynamic;
      public bool be_loaded;
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
      public int miles_from_pm_alarm_threshold;
      public int miles_from_pm_alert_threshold;
      public uint num_usable;
      public uint num_vehicles;
      public k.int_nonnegative num_vehicles_up_and_current;
      public string quarters_filter;
      public string sort_order;
      public string vehicle_kind_filter;
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

    protected void Page_Load(object sender, System.EventArgs e)
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
        p.biz_agencies.BindListControlShort(DropDownList_agency_filter,p.agency_filter,true);
        RadioButtonList_interest.SelectedIndex = (p.be_interest_dynamic ? 0 : 1);
        Bind();
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      ScriptManager.GetCurrent(Page).RegisterPostBackControl(LinkButton_add_vehicle);
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["M_PlaceHolder_content"] as string) == "UserControl_fleet");
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
        p.be_four_or_all_wheel_drive_filter = false;
        p.be_ok_to_config_vehicles = k.Has((string[])(Session["privilege_array"]), "config-vehicles");
        p.be_ok_to_append_vehicle_down_notes = k.Has((string[])(Session["privilege_array"]), "append-vehicle-down-note");
        p.be_ok_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
        p.be_interactive = (Session["mode:report"] == null);
        p.be_interest_dynamic = true;
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.miles_from_pm_alarm_threshold = int.Parse(ConfigurationManager.AppSettings["miles_from_pm_alarm_threshold"]);
        p.miles_from_pm_alert_threshold = int.Parse(ConfigurationManager.AppSettings["miles_from_pm_alert_threshold"]);
        p.num_vehicles_up_and_current = new k.int_nonnegative();
        p.quarters_filter = k.EMPTY;
        p.sort_order = "vehicle_name%";
        p.vehicle_kind_filter = k.EMPTY;
        //
        p.agency_filter = (p.be_interactive && p.biz_vehicles.BeOkToDefaultAgencyFilterToAll(p.be_ok_to_see_all_squads,p.biz_user.Roles()) ? k.EMPTY : p.biz_members.AgencyIdOfId(Session["member_id"].ToString()));
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      this.DataGrid_control.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid_control_ItemDataBound);
      this.DataGrid_control.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(this.DataGrid_control_SortCommand);
      this.DataGrid_control.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid_control_ItemCommand);
      this.PreRender += this.TWebUserControl_fleet_PreRender;
      //this.Load += this.Page_Load;
      }

    private void TWebUserControl_fleet_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_fleet Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      if (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        SessionSet("vehicle_summary",p.biz_vehicles.Summary(k.Safe(e.Item.Cells[UserControl_fleet_Static.TCI_ID].Text,k.safe_hint_type.NUM)));
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

    private void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      if ((new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}).Contains(e.Item.ItemType))
        {
        LinkButton link_button;
        //
        p.num_vehicles++;
        var be_up_and_current = true;
        //
        link_button = ((e.Item.Cells[UserControl_fleet_Static.TCI_GRIPESHEET].Controls[0]) as LinkButton);
        link_button.Text = "<small>" + link_button.Text + "<sub>:" + e.Item.Cells[UserControl_fleet_Static.TCI_NUM_GRIPES].Text + "</sub></small>";
        //
        if (e.Item.Cells[UserControl_fleet_Static.TCI_STATUS].Text == "UP")
          {
          p.num_usable++;
          ((e.Item.Cells[UserControl_fleet_Static.TCI_STATUS_DOWN].Controls[0]) as LinkButton).Visible = false;
          e.Item.Cells[UserControl_fleet_Static.TCI_STATUS_DOWN].BackColor = Color.White;
          ((e.Item.Cells[UserControl_fleet_Static.TCI_APPEND_NOTE].Controls[0]) as LinkButton).Visible = false;
          e.Item.Cells[UserControl_fleet_Static.TCI_APPEND_NOTE].BackColor = Color.White;
          }
        else
          {
          ((e.Item.Cells[UserControl_fleet_Static.TCI_STATUS_UP].Controls[0]) as LinkButton).Visible = false;
          e.Item.Cells[UserControl_fleet_Static.TCI_STATUS_UP].BackColor = Color.White;
          be_up_and_current = false;
          }
        var miles_from_pm_text = e.Item.Cells[UserControl_fleet_Static.TCI_MILES_FROM_PM].Text;
        if (k.Safe(miles_from_pm_text,k.safe_hint_type.NUM) != k.EMPTY)
          {
          if ((miles_from_pm_text != "0") && !miles_from_pm_text.StartsWith("-"))
            {
            e.Item.Cells[UserControl_fleet_Static.TCI_MILES_FROM_PM].Text = "+" + e.Item.Cells[UserControl_fleet_Static.TCI_MILES_FROM_PM].Text;
            }
          var miles_from_pm = int.Parse(miles_from_pm_text);
          if (miles_from_pm >= p.miles_from_pm_alert_threshold)
            {
            e.Item.Cells[UserControl_fleet_Static.TCI_RECENT_MILEAGE].BackColor = Color.Yellow;
            e.Item.Cells[UserControl_fleet_Static.TCI_MILES_FROM_PM].BackColor = Color.Yellow;
            e.Item.Cells[UserControl_fleet_Static.TCI_MILES_FROM_PM].Font.Bold = true;
            }
          if (miles_from_pm >= p.miles_from_pm_alarm_threshold)
            {
            e.Item.Cells[UserControl_fleet_Static.TCI_RECENT_MILEAGE].BackColor = Color.Red;
            e.Item.Cells[UserControl_fleet_Static.TCI_RECENT_MILEAGE].ForeColor = Color.LightBlue;
            e.Item.Cells[UserControl_fleet_Static.TCI_MILES_FROM_PM].BackColor = Color.Red;
            e.Item.Cells[UserControl_fleet_Static.TCI_MILES_FROM_PM].ForeColor = Color.White;
            e.Item.Cells[UserControl_fleet_Static.TCI_MILES_FROM_PM].Font.Bold = true;
            be_up_and_current = false;
            }
          }
        else if (e.Item.Cells[UserControl_fleet_Static.TCI_BE_TARGET_PM_MILEAGE_MEANINGFUL].Text == "1")
          {
          e.Item.Cells[UserControl_fleet_Static.TCI_RECENT_MILEAGE].BackColor = Color.Red;
          e.Item.Cells[UserControl_fleet_Static.TCI_RECENT_MILEAGE].ForeColor = Color.LightBlue;
          e.Item.Cells[UserControl_fleet_Static.TCI_MILES_FROM_PM].BackColor = Color.Red;
          e.Item.Cells[UserControl_fleet_Static.TCI_MILES_FROM_PM].ForeColor = Color.White;
          e.Item.Cells[UserControl_fleet_Static.TCI_MILES_FROM_PM].Font.Bold = true;
          be_up_and_current = false;
          }
        var dmv_inspection_due_text = k.Safe(e.Item.Cells[UserControl_fleet_Static.TCI_DMV_INSPECTION_DUE].Text,k.safe_hint_type.HYPHENATED_NUM);
        if (dmv_inspection_due_text != k.EMPTY)
          {
          var dmv_inspection_due_date = DateTime.Parse(dmv_inspection_due_text);
          var dmv_inspection_due_month = dmv_inspection_due_date.Year.ToString() + k.HYPHEN + dmv_inspection_due_date.Month.ToString("D2");
          e.Item.Cells[UserControl_fleet_Static.TCI_DMV_INSPECTION_DUE].Text = dmv_inspection_due_month;
          if (DateTime.Today.ToString("yyyy-MM-dd").CompareTo(dmv_inspection_due_month + "-01") >= 0)
            {
            e.Item.Cells[UserControl_fleet_Static.TCI_DMV_INSPECTION_DUE].Font.Bold = true;
            e.Item.Cells[UserControl_fleet_Static.TCI_DMV_INSPECTION_DUE].BackColor = Color.Yellow;
            }
          if (DateTime.Today >= dmv_inspection_due_date)
            {
            e.Item.Cells[UserControl_fleet_Static.TCI_DMV_INSPECTION_DUE].BackColor = Color.Red;
            e.Item.Cells[UserControl_fleet_Static.TCI_DMV_INSPECTION_DUE].ForeColor = Color.White;
            be_up_and_current = false;
            }
          }
        else if (e.Item.Cells[UserControl_fleet_Static.TCI_BE_DMV_INSPECTION_DUE_MEANINGFUL].Text == "1")
          {
          e.Item.Cells[UserControl_fleet_Static.TCI_DMV_INSPECTION_DUE].BackColor = Color.Red;
          e.Item.Cells[UserControl_fleet_Static.TCI_DMV_INSPECTION_DUE].ForeColor = Color.White;
          e.Item.Cells[UserControl_fleet_Static.TCI_DMV_INSPECTION_DUE].Font.Bold = true;
          be_up_and_current = false;
          }
        if (p.be_interactive)
          {
          link_button = ((e.Item.Cells[UserControl_fleet_Static.TCI_SELECT].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          link_button.ToolTip = "Detail";
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          link_button = ((e.Item.Cells[UserControl_fleet_Static.TCI_GRIPESHEET].Controls[0]) as LinkButton);
          link_button.ToolTip = "Manage GripeSheet";
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          link_button = ((e.Item.Cells[UserControl_fleet_Static.TCI_STATUS_UP].Controls[0]) as LinkButton);
          link_button.ToolTip = "Mark DOWN";
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          link_button = ((e.Item.Cells[UserControl_fleet_Static.TCI_STATUS_DOWN].Controls[0]) as LinkButton);
          link_button.ToolTip = "Mark UP";
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          link_button = ((e.Item.Cells[UserControl_fleet_Static.TCI_APPEND_NOTE].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          link_button.ToolTip = "Append note";
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          link_button = ((e.Item.Cells[UserControl_fleet_Static.TCI_QUARTERS].Controls[0]) as LinkButton);
          link_button.ToolTip = "Relocate";
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          link_button = ((e.Item.Cells[UserControl_fleet_Static.TCI_RECENT_MILEAGE].Controls[0]) as LinkButton);
          link_button.ToolTip = "Update";
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[UserControl_fleet_Static.TCI_ID].EnableViewState = true;
          //
          }
        else
          {
          ((e.Item.Cells[UserControl_fleet_Static.TCI_GRIPESHEET].Controls[0]) as LinkButton).Enabled = false;
          ((e.Item.Cells[UserControl_fleet_Static.TCI_STATUS_UP].Controls[0]) as LinkButton).Enabled = false;
          ((e.Item.Cells[UserControl_fleet_Static.TCI_STATUS_DOWN].Controls[0]) as LinkButton).Enabled = false;
          ((e.Item.Cells[UserControl_fleet_Static.TCI_APPEND_NOTE].Controls[0]) as LinkButton).Enabled = false;
          ((e.Item.Cells[UserControl_fleet_Static.TCI_QUARTERS].Controls[0]) as LinkButton).Enabled = false;
          ((e.Item.Cells[UserControl_fleet_Static.TCI_RECENT_MILEAGE].Controls[0]) as LinkButton).Enabled = false;
          }
        if (be_up_and_current)
          {
          p.num_vehicles_up_and_current.val++;
          }
        }
      }

    private void DataGrid_control_SortCommand(object source, System.Web.UI.WebControls.DataGridSortCommandEventArgs e)
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
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_SELECT].Visible = (p.be_interactive);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_GRIPESHEET].Visible = (p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_STATUS_UP].Visible = (p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_STATUS_DOWN].Visible = (p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_APPEND_NOTE].Visible = (p.be_interest_dynamic) && p.be_ok_to_append_vehicle_down_notes;
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_QUARTERS].Visible = (p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_RECENT_MILEAGE].Visible = (p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_MILES_FROM_PM].Visible = (p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_DMV_INSPECTION_DUE].Visible = (p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_MODEL_YEAR].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_CHASSIS_MAKE].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_CHASSIS_MODEL].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_BE_FOUR_OR_ALL_WHEEL_DRIVE].Visible = (!p.be_interest_dynamic) && !p.be_four_or_all_wheel_drive_filter;
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_CUSTOM_MAKE].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_CUSTOM_MODEL].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_FUEL].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_KIND].Visible = (p.vehicle_kind_filter == k.EMPTY);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_AGENCY].Visible = (p.agency_filter == k.EMPTY);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_BUMPER_NUMBER].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_TAG].Visible = (!p.be_interest_dynamic);
      DataGrid_control.Columns[UserControl_fleet_Static.TCI_VIN].Visible = (!p.be_interest_dynamic);
      p.biz_vehicles.BindBaseDataList(p.sort_order, p.be_sort_order_ascending, DataGrid_control, p.agency_filter, p.vehicle_kind_filter, p.be_four_or_all_wheel_drive_filter, p.quarters_filter);
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

    } // end TWebUserControl_fleet

  }