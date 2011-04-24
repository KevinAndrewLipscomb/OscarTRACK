// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_agencies;
using Class_biz_gripes;
using Class_biz_members;
using Class_biz_user;
using Class_biz_vehicles;
using kix;
using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

namespace UserControl_gripe_sheet
  {
  public partial class TWebUserControl_gripe_sheet: ki_web_ui.usercontrol_class
    {
    public class UserControl_gripe_sheet_Static
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
      public bool be_ok_to_config_gripes;
      public bool be_sort_order_ascending;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_members biz_members;
      public TClass_biz_gripes biz_gripes;
      public TClass_biz_user biz_user;
      public TClass_biz_vehicles biz_vehicles;
      public Hashtable gripe_inclusion_hashtable;
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

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        var member_id = p.biz_members.IdOfUserId(p.user_id);
        Literal_vehicle_name.Text = p.biz_vehicles.NameOf((p.vehicle_summary));
        Literal_work_order_coordinator_title.Text = p.work_order_coordinator_title;
        Literal_work_order_coordinator_name.Text = p.biz_members.FirstNameOfMemberId(member_id) + k.SPACE + p.biz_members.LastNameOfMemberId(member_id);
        Literal_agency_long_designator.Text = p.biz_agencies.LongDesignatorOf(p.biz_vehicles.AgencyIdOfId(p.biz_vehicles.IdOf(p.vehicle_summary)));
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
        Literal_dmv_inspection_due.Text = p.biz_vehicles.DmvInspectionDueOf(p.vehicle_summary).Substring(0,7);
        CheckBox_be_work_order_mode.Visible = p.be_interactive && p.be_ok_to_config_gripes;
        CheckBox_be_work_order_mode.Checked = !p.be_interactive;
        DataGrid_control.AllowSorting = p.be_interactive;
        SetWorkOrderMode(!p.be_interactive);
        Button_send.Visible = p.be_interactive;
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
        }
      InjectPersistentClientSideScript();
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[Parent.ClientID + ".UserControl_gripe_sheet.p"] != null)
        {
        p = (p_type)(Session[Parent.ClientID + ".UserControl_gripe_sheet.p"]);
        p.be_loaded = IsPostBack;
        }
      else
        {
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_members = new TClass_biz_members();
        p.biz_gripes = new TClass_biz_gripes();
        p.biz_user = new TClass_biz_user();
        p.biz_vehicles = new TClass_biz_vehicles();
        p.be_interactive = true;
        p.be_loaded = false;
        p.be_ok_to_config_gripes = k.Has((string[])(Session["privilege_array"]), "config-gripes");
        p.be_sort_order_ascending = true;
        p.gripe_inclusion_hashtable = new Hashtable();
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
      this.PreRender += this.TWebUserControl_gripe_sheet_PreRender;
      //this.Load += this.Page_Load;
      }

    private void TWebUserControl_gripe_sheet_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(Parent.ClientID + ".UserControl_gripe_sheet.p", p);
      }

    public TWebUserControl_gripe_sheet Fresh()
      {
      Session.Remove(Parent.ClientID + ".UserControl_gripe_sheet.p");
      return this;
      }

    private void DataGrid_control_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      if (new ArrayList(new object[] {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}).Contains(e.Item.ItemType))
        {
        var id = k.Safe(e.Item.Cells[UserControl_gripe_sheet_Static.TCI_ID].Text,k.safe_hint_type.NUM);
        //
        if (e.CommandName == "Append")
          {
          SessionSet("mode:goto","/gripe/" + id);
          DropCrumbAndTransferTo("gripe.aspx");
          }
        else if (e.CommandName == "Delete")
          {
          p.biz_gripes.Delete(id);
          Bind();
          }
        else if (e.CommandName == "ToggleInclusion")
          {
          var new_value = !((bool)(p.gripe_inclusion_hashtable[id]));
          (e.Item.Cells[UserControl_gripe_sheet_Static.TCI_INCLUDE].Controls[0] as LinkButton).Text = (new_value ? "YES" : "no");
          p.gripe_inclusion_hashtable[id] = new_value;
          Bind();
          }
        }
      }

    private void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      LinkButton link_button;
      if (new ArrayList(new object[] {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}).Contains(e.Item.ItemType))
        {
        var id = k.Safe(e.Item.Cells[UserControl_gripe_sheet_Static.TCI_ID].Text,k.safe_hint_type.NUM);
        if (p.gripe_inclusion_hashtable.ContainsKey(id))
          {
          (e.Item.Cells[UserControl_gripe_sheet_Static.TCI_INCLUDE].Controls[0] as LinkButton).Text = (((bool)(p.gripe_inclusion_hashtable[id])) ? "YES" : "no");
          }
        else
          {
          p.gripe_inclusion_hashtable.Add(id,true);
          }
        var be_ok_to_display = (!CheckBox_be_work_order_mode.Checked || (bool)(p.gripe_inclusion_hashtable[id]));
        if (p.be_interactive)
          {
          if (be_ok_to_display)
            {
            link_button = ((e.Item.Cells[UserControl_gripe_sheet_Static.TCI_DELETE].Controls[0]) as LinkButton);
            link_button.Text = k.ExpandTildePath(link_button.Text);
            link_button.ToolTip = "Delete";
            RequireConfirmation(link_button,"Are you sure you want to delete this record?");
            //
            link_button = ((e.Item.Cells[UserControl_gripe_sheet_Static.TCI_APPEND].Controls[0]) as LinkButton);
            link_button.Text = k.ExpandTildePath(link_button.Text);
            link_button.ToolTip = "Append note";
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
            }
          }
        e.Item.Cells[UserControl_gripe_sheet_Static.TCI_DESCRIPTION].Text = e.Item.Cells[UserControl_gripe_sheet_Static.TCI_DESCRIPTION].Text.Replace(k.NEW_LINE,"<br>");
        e.Item.Visible = be_ok_to_display;
        p.num_gripes++;
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
      DataGrid_control.Columns[UserControl_gripe_sheet_Static.TCI_INCLUDE].Visible = (p.be_interactive && !CheckBox_be_work_order_mode.Checked && p.be_ok_to_config_gripes);
      DataGrid_control.Columns[UserControl_gripe_sheet_Static.TCI_DELETE].Visible = (p.be_interactive && !CheckBox_be_work_order_mode.Checked && p.be_ok_to_config_gripes);
      DataGrid_control.Columns[UserControl_gripe_sheet_Static.TCI_APPEND].Visible = (p.be_interactive && !CheckBox_be_work_order_mode.Checked);
      p.biz_gripes.BindLog(p.biz_vehicles.IdOf((p.vehicle_summary)),p.sort_order, p.be_sort_order_ascending, DataGrid_control);
      p.be_datagrid_empty = (p.num_gripes == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_requests.Text = p.num_gripes.ToString();
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
      string serialized_gripe_inclusion_hashtable
      )
      {
      p.user_id = user_id;
      p.vehicle_summary = vehicle_summary;
      p.work_order_coordinator_title = work_order_coordinator_title;
      if (serialized_gripe_inclusion_hashtable.Length > 0)
        {
        p.gripe_inclusion_hashtable = (new JavaScriptSerializer()).Deserialize<Hashtable>(serialized_gripe_inclusion_hashtable);
        p.be_interactive = false;
        Bind();
        }
      }
    internal void SetFilter
      (
      string user_id,
      object vehicle_summary,
      string work_order_coordinator_title
      )
      {
      SetFilter(user_id,vehicle_summary,work_order_coordinator_title,k.EMPTY);
      }

    private void SetWorkOrderMode(bool value)
      {
      Literal_generation_timestamp.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
      Panel_generation_timestamp.Visible = value;
      TableRow_best_practices.Visible = !value;
      TableRow_work_order_instructions.Visible = value;
      Bind();
      Button_new.Visible = !value;
      Panel_page_break.Visible = value;
      }

    protected void Button_send_Click(object sender, EventArgs e)
      {
      var working_directory = Server.MapPath("scratch");
      p.biz_gripes.SendWorkOrderToCityGarage
        (
        p.biz_vehicles.IdOf(p.vehicle_summary),
        p.user_id,
        Server.UrlEncode(p.work_order_coordinator_title),
        Server.UrlEncode((new JavaScriptSerializer()).Serialize(p.gripe_inclusion_hashtable)),
        working_directory
        );
      Alert(k.alert_cause_type.USER,k.alert_state_type.SUCCESS,"msgsent","Message sent.",true);
      Button_send.Enabled = false;
      }

    } // end TWebUserControl_gripe_sheet

  }