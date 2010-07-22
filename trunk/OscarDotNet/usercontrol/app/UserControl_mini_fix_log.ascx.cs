// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_agencies;
using Class_biz_members;
using Class_biz_mini_fix_requests;
using Class_biz_user;
using Class_biz_vehicles;
using kix;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections;

namespace UserControl_mini_fix_log
  {
  public partial class TWebUserControl_mini_fix_log: ki_web_ui.usercontrol_class
    {
    public class UserControl_mini_fix_log_Static
      {
      public const int TCI_INCLUDE = 0;
      public const int TCI_DELETE = 1;
      public const int TCI_ID = 2;
      public const int TCI_DESCRIPTION = 3;
      public const int TCI_APPEND = 4;
      }

    private struct p_type
      {
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_ok_to_config_mini_fix_requests;
      public bool be_sort_order_ascending;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_members biz_members;
      public TClass_biz_mini_fix_requests biz_mini_fix_requests;
      public TClass_biz_user biz_user;
      public TClass_biz_vehicles biz_vehicles;
      public uint num_mini_fix_requests;
      public string sort_order;
      public Hashtable mini_fix_inclusion_hashtable;
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
        Literal_vehicle_name.Text = p.biz_vehicles.NameOf(Session["vehicle_summary"]);
        if (p.be_interactive)
          {
          if (p.be_ok_to_config_mini_fix_requests)
            {
            CheckBox_be_work_order_mode.Visible = true;
            Literal_work_order_coordinator_title.Text = p.biz_user.Roles()[0];
            var member_id = p.biz_members.IdOfUserId(p.biz_user.IdNum());
            Literal_work_order_coordinator_name.Text = p.biz_members.FirstNameOfMemberId(member_id) + k.SPACE + p.biz_members.LastNameOfMemberId(member_id);
            var vehicle_summary = Session["vehicle_summary"];
            Literal_agency_long_designator.Text = p.biz_agencies.LongDesignatorOf(p.biz_vehicles.AgencyIdOfId(p.biz_vehicles.IdOf(vehicle_summary)));
            Literal_work_order_coordinator_phone_num.Text = k.FormatAsNanpPhoneNum(p.biz_members.PhoneNumOf(member_id));
            Literal_work_order_coordinator_email_address.Text = p.biz_user.EmailAddress();
            Literal_kind.Text = p.biz_vehicles.KindOf(vehicle_summary);
            Literal_vehicle_name_2.Text = p.biz_vehicles.NameOf(vehicle_summary);
            Literal_bumper_number.Text = p.biz_vehicles.BumperNumberOf(vehicle_summary);
            Literal_model_year.Text = p.biz_vehicles.ModelYearOf(vehicle_summary);
            Literal_chassis_make.Text = p.biz_vehicles.ChassisMakeOf(vehicle_summary);
            Literal_chassis_model.Text = p.biz_vehicles.ChassisModelOf(vehicle_summary);
            Literal_custom_make.Text = p.biz_vehicles.CustomMakeOf(vehicle_summary);
            Literal_custom_model.Text = p.biz_vehicles.CustomModelOf(vehicle_summary);
            Literal_vin.Text = p.biz_vehicles.VinOf(vehicle_summary);
            Literal_fuel.Text = p.biz_vehicles.FuelOf(vehicle_summary);
            Literal_tag.Text = p.biz_vehicles.TagOf(vehicle_summary);
            Literal_be_four_or_all_wheel_drive.Text = k.YesNoOf(p.biz_vehicles.BeFourOrAllWheelDriveOf(vehicle_summary));
            Literal_recent_mileage_update_time.Text = p.biz_vehicles.RecentMileageUpdateTimeOf(vehicle_summary);
            Literal_recent_mileage_update_time_2.Text = p.biz_vehicles.RecentMileageUpdateTimeOf(vehicle_summary);
            Literal_recent_mileage.Text = p.biz_vehicles.RecentMileageOf(vehicle_summary);
            Literal_miles_from_pm.Text = p.biz_vehicles.MilesFromPmOf(vehicle_summary);
            Literal_dmv_inspection_due.Text = p.biz_vehicles.DmvInspectionDueOf(vehicle_summary).Substring(0,7);
            }
          }
        else
          {
          DataGrid_control.AllowSorting = false;
          }
        p.mini_fix_inclusion_hashtable.Clear();
        Bind();
        ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_new);
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_mini_fix_log.p"] != null)
        {
        p = (p_type)(Session["UserControl_mini_fix_log.p"]);
        p.be_loaded = IsPostBack;
        }
      else
        {
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_members = new TClass_biz_members();
        p.biz_mini_fix_requests = new TClass_biz_mini_fix_requests();
        p.biz_user = new TClass_biz_user();
        p.biz_vehicles = new TClass_biz_vehicles();
        p.be_interactive = !(Session["mode:report"] != null);
        p.be_loaded = false;
        p.be_ok_to_config_mini_fix_requests = k.Has((string[])(Session["privilege_array"]), "config-mini-fix-requests");
        p.be_sort_order_ascending = true;
        p.mini_fix_inclusion_hashtable = new Hashtable();
        p.sort_order = "id%";
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
      this.PreRender += this.TWebUserControl_mini_fix_log_PreRender;
      //this.Load += this.Page_Load;
      }

    private void TWebUserControl_mini_fix_log_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_mini_fix_log.p", p);
      }

    public TWebUserControl_mini_fix_log Fresh()
      {
      Session.Remove("UserControl_mini_fix_log.p");
      return this;
      }

    private void DataGrid_control_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      if (new ArrayList(new object[] {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}).Contains(e.Item.ItemType))
        {
        var id = k.Safe(e.Item.Cells[UserControl_mini_fix_log_Static.TCI_ID].Text,k.safe_hint_type.NUM);
        //
        if (e.CommandName == "Append")
          {
          SessionSet("mode:goto","/mini_fix_request/" + id);
          DropCrumbAndTransferTo("mini_fix_request.aspx");
          }
        else if (e.CommandName == "Delete")
          {
          p.biz_mini_fix_requests.Delete(id);
          Bind();
          }
        else if (e.CommandName == "ToggleInclusion")
          {
          var new_value = !((bool)(p.mini_fix_inclusion_hashtable[id]));
          (e.Item.Cells[UserControl_mini_fix_log_Static.TCI_INCLUDE].Controls[0] as LinkButton).Text = (new_value ? "YES" : "no");
          p.mini_fix_inclusion_hashtable[id] = new_value;
          Bind();
          }
        }
      }

    private void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      LinkButton link_button;
      if (p.be_interactive)
        {
        if (new ArrayList(new object[] {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}).Contains(e.Item.ItemType))
          {
          var id = k.Safe(e.Item.Cells[UserControl_mini_fix_log_Static.TCI_ID].Text,k.safe_hint_type.NUM);
          if (p.mini_fix_inclusion_hashtable.ContainsKey(id))
            {
            (e.Item.Cells[UserControl_mini_fix_log_Static.TCI_INCLUDE].Controls[0] as LinkButton).Text = (((bool)(p.mini_fix_inclusion_hashtable[id])) ? "YES" : "no");
            }
          else
            {
            p.mini_fix_inclusion_hashtable.Add(id,true);
            }
          if (CheckBox_be_work_order_mode.Checked && !(bool)(p.mini_fix_inclusion_hashtable[id]))
            {
            e.Item.Visible = false;
            }
          else
            {
            link_button = ((e.Item.Cells[UserControl_mini_fix_log_Static.TCI_DELETE].Controls[0]) as LinkButton);
            link_button.Text = k.ExpandTildePath(link_button.Text);
            link_button.ToolTip = "Delete";
            RequireConfirmation(link_button,"Are you sure you want to delete this record?");
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
            //
            link_button = ((e.Item.Cells[UserControl_mini_fix_log_Static.TCI_APPEND].Controls[0]) as LinkButton);
            link_button.Text = k.ExpandTildePath(link_button.Text);
            link_button.ToolTip = "Append note";
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
            //
            e.Item.Cells[UserControl_mini_fix_log_Static.TCI_DESCRIPTION].Text = e.Item.Cells[UserControl_mini_fix_log_Static.TCI_DESCRIPTION].Text.Replace(k.NEW_LINE,"<br>");
            //
            // Remove all cell controls from viewstate except for the ones at TCI_ID (and for this control only, TCI_INCLUDE).
            //
            foreach (TableCell cell in e.Item.Cells)
              {
              cell.EnableViewState = false;
              }
            e.Item.Cells[UserControl_mini_fix_log_Static.TCI_ID].EnableViewState = true;
            //
            p.num_mini_fix_requests++;
            }
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
      DataGrid_control.Columns[UserControl_mini_fix_log_Static.TCI_INCLUDE].Visible = (p.be_interactive && !CheckBox_be_work_order_mode.Checked && p.be_ok_to_config_mini_fix_requests);
      DataGrid_control.Columns[UserControl_mini_fix_log_Static.TCI_DELETE].Visible = (p.be_interactive && !CheckBox_be_work_order_mode.Checked && p.be_ok_to_config_mini_fix_requests);
      DataGrid_control.Columns[UserControl_mini_fix_log_Static.TCI_APPEND].Visible = (p.be_interactive && !CheckBox_be_work_order_mode.Checked);
      p.biz_mini_fix_requests.BindLog(p.biz_vehicles.IdOf(Session["vehicle_summary"]),p.sort_order, p.be_sort_order_ascending, DataGrid_control);
      p.be_datagrid_empty = (p.num_mini_fix_requests == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_requests.Text = p.num_mini_fix_requests.ToString();
      p.num_mini_fix_requests = 0;
      }

    protected void Button_new_Click(object sender, EventArgs e)
      {
      DropCrumbAndTransferTo("mini_fix_request.aspx");
      }

    protected void CheckBox_be_work_order_mode_CheckedChanged(object sender, EventArgs e)
      {
      Literal_generation_timestamp.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
      Panel_generation_timestamp.Visible = CheckBox_be_work_order_mode.Checked;
      TableRow_best_practices.Visible = !CheckBox_be_work_order_mode.Checked;
      TableRow_work_order_instructions.Visible = CheckBox_be_work_order_mode.Checked;
      Bind();
      Button_new.Visible = !CheckBox_be_work_order_mode.Checked;
      Panel_page_break.Visible = CheckBox_be_work_order_mode.Checked;
      }

    } // end TWebUserControl_mini_fix_log

  }