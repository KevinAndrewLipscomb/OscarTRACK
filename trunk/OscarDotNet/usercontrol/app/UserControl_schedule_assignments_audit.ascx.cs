// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_biz_user;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Drawing;
using System.Text;
using System.Web.UI.WebControls;

namespace UserControl_schedule_assignments_audit
  {

  public partial class TWebUserControl_schedule_assignments_audit: ki_web_ui.usercontrol_class
    {

    private static class Static
      {
      public const int TCI_SELECT_FOR_QUICKMESSAGE = 0;
      public const int TCI_AGENCY = 1;
      public const int TCI_NAME = 2;
      public const int TCI_CAD_NUM = 3;
      public const int TCI_BE_RELEASED = 4;
      public const int TCI_MEMBERSHIP_STATUS = 5;
      public const int TCI_BE_ON_SQUAD_TRUCK_TEAM = 6;
      public const int TCI_OBLIGATION = 7;
      public const int TCI_BE_COMPLIANT = 8;
      public const int TCI_AVAILABILITIES = 9;
      public const int TCI_ASSIGNMENTS = 10;
      public const int TCI_BALANCE = 11;
      public const int TCI_AMBULANCE_HOURS = 12;
      public const int TCI_EMAIL_TARGET = 13;
      public const int TCI_SMS_TARGET = 14;
      }

    private struct p_type
      {
      public string agency_id;
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_sort_order_ascending;
      public bool be_user_privileged_to_see_all_squads;
      public TClass_biz_members biz_members;
      public TClass_biz_schedule_assignments biz_schedule_assignments;
      public TClass_biz_user biz_user;
      public bool do_limit_to_compliant;
      public bool do_limit_to_unused_availability;
      public string max_balance_hours_filter;
      public k.int_nonnegative num_members;
      public k.subtype<int> relative_month;
      public string release_filter;
      public string sort_order;
      public string user_target_email;
      public string user_target_sms;
      }

    private struct v_type
      {
      public StringBuilder distribution_list_email;
      public StringBuilder distribution_list_sms;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters
    private v_type v; // Volatile instance Variable container

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
        DataGrid_control.AllowSorting = p.be_interactive;
        RadioButtonList_relative_month.Enabled = p.biz_schedule_assignments.BeOkToAllowNextMonthAudit(p.be_interactive);
        Bind();
        if (p.be_interactive)
          {
          Literal_author_target.Text = (RadioButtonList_quick_message_mode.SelectedValue == "email" ? p.user_target_email : p.user_target_sms);
          }
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
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
        if (instance_id == "ASP.protected_overview_aspx.M_schedule_assignments_audit")
          {
          p.be_loaded &= ((Session["M_P_PlaceHolder_content"] as string) == "UserControl_schedule_assignments_audit");
          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_schedule_assignments_audit")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_schedule_assignments_audit");
//        }
        }
      else
        {
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        p.biz_user = new TClass_biz_user();
        //
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.do_limit_to_compliant = false;
        p.do_limit_to_unused_availability = false;
        p.max_balance_hours_filter = k.EMPTY;
        p.num_members = new k.int_nonnegative();
        p.relative_month = new k.subtype<int>(0,1);
        p.release_filter = k.EMPTY;
        p.sort_order = "agency, be_released desc, last_name, first_name, cad_num";
        p.be_user_privileged_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
        //
        p.agency_id = p.biz_members.BeOkToDefaultAgencyFilterToAll(p.be_user_privileged_to_see_all_squads,p.biz_user.Roles()) ? k.EMPTY : p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
        //
        if (p.be_interactive)
          {
          var member_id = p.biz_members.IdOfUserId(user_id:p.biz_user.IdNum());
          p.user_target_email = p.biz_members.EmailAddressOf(member_id:member_id);
          p.user_target_sms = p.biz_members.SmsTargetOf(member_id:member_id);
          }
        }
      v.distribution_list_email = new StringBuilder();
      v.distribution_list_sms = new StringBuilder();
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_control.ItemDataBound += new DataGridItemEventHandler(DataGrid_control_ItemDataBound);
      PreRender += TWebUserControl_schedule_assignments_audit_PreRender;
      }

    private void TWebUserControl_schedule_assignments_audit_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_schedule_assignments_audit Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      //LinkButton link_button;
      //if (p.be_interactive)
      //  {
        if (e.Item.ItemType.ToString().EndsWith("Item"))
          {
          var balance_cell = e.Item.Cells[Static.TCI_BALANCE];
          if (balance_cell.Text.StartsWith("-"))
            {
            balance_cell.BackColor = Color.Yellow;
            }
          ////
          //// PRESERVE viewstate on all columns for use with QuickMessage
          ////
          //foreach (TableCell cell in e.Item.Cells)
          //  {
          //  cell.EnableViewState = false;
          //  }
          //e.Item.Cells[Static.TCI_CAD_NUM].EnableViewState = true;
          //
          p.num_members.val++;
          }
      //  }
      //else
      //  {
      //  e.Item.Cells[Static.TCI_SELECT].Visible = false;
      //  }
      }

    //private void DataGrid_control_SortCommand(object source, System.Web.UI.WebControls.DataGridSortCommandEventArgs e)
    //  {
    //  if (e.SortExpression == p.sort_order)
    //    {
    //    p.be_sort_order_ascending = !p.be_sort_order_ascending;
    //    }
    //  else
    //    {
    //    p.sort_order = k.Safe(e.SortExpression, k.safe_hint_type.KI_SORT_EXPRESSION);
    //    p.be_sort_order_ascending = true;
    //    }
    //  DataGrid_control.EditItemIndex =  -1;
    //  Bind();
    //  }

    private void Bind()
      {
      p.biz_members.BindScheduleAssignmentsAuditBaseDataList
        (
        sort_order:p.sort_order,
        be_sort_ascending:p.be_sort_order_ascending,
        target:DataGrid_control,
        relative_month:p.relative_month,
        agency_filter:p.agency_id,
        release_filter:p.release_filter,
        do_limit_to_compliant:p.do_limit_to_compliant,
        do_limit_to_unused_availability:p.do_limit_to_unused_availability,
        max_balance_hours_filter:p.max_balance_hours_filter
        );
      p.be_datagrid_empty = (p.num_members.val == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      p.num_members.val = 0;
      //
      BuildDistributionListAndRegisterPostBackControls();
      }

    protected void RadioButtonList_relative_month_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.relative_month.val = int.Parse(k.Safe(RadioButtonList_relative_month.SelectedValue,k.safe_hint_type.NUM));
      Bind();
      }

    protected void Button_randomize_Click(object sender, EventArgs e)
      {
      p.sort_order = "RAND()";
      Bind();
      }

    protected void DropDownList_release_filter_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.release_filter = k.Safe(DropDownList_release_filter.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    protected void CheckBox_do_limit_to_compliant_CheckedChanged(object sender, EventArgs e)
      {
      p.do_limit_to_compliant = CheckBox_do_limit_to_compliant.Checked;
      CheckBox_do_limit_to_unused_availability.Enabled = p.do_limit_to_compliant;
      if (!p.do_limit_to_compliant)
        {
        CheckBox_do_limit_to_unused_availability.Checked = false;
        }
      Bind();
      }

    protected void DataGrid_control_SortCommand(object source, DataGridSortCommandEventArgs e)
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

    protected void DropDownList_max_balance_hours_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.max_balance_hours_filter = k.Safe(DropDownList_max_balance_hours.SelectedValue,k.safe_hint_type.HYPHENATED_NUM);
      Bind();
      Table_quick_message.Visible = (p.max_balance_hours_filter.Length > 0);
      }

    protected void CheckBox_do_limit_to_unused_availability_CheckedChanged(object sender, EventArgs e)
      {
      p.do_limit_to_unused_availability = CheckBox_do_limit_to_unused_availability.Checked;
      Bind();
      }

    protected void CheckBox_force_all_CheckedChanged(object sender, EventArgs e)
      {
      for (var i = new k.subtype<int>(0,DataGrid_control.Items.Count); i.val < i.LAST; i.val++)
        {
        (DataGrid_control.Items[i.val].Cells[Static.TCI_SELECT_FOR_QUICKMESSAGE].FindControl("CheckBox_selected") as CheckBox).Checked = (sender as CheckBox).Checked;
        }
      BuildDistributionListAndRegisterPostBackControls();
      }

    protected void CheckBox_selected_CheckedChanged(object sender, EventArgs e)
      {
      BuildDistributionListAndRegisterPostBackControls();
      }

    private void BuildDistributionListAndRegisterPostBackControls()
      {
      v.distribution_list_email.Clear();
      v.distribution_list_sms.Clear();
      TableCellCollection tcc;
      for (var i = new k.subtype<int>(0, DataGrid_control.Items.Count); i.val < i.LAST; i.val++)
        {
        tcc = DataGrid_control.Items[i.val].Cells;
        if ((tcc[Static.TCI_SELECT_FOR_QUICKMESSAGE].FindControl("CheckBox_selected") as CheckBox).Checked)
          {
          v.distribution_list_email.Append(tcc[Static.TCI_EMAIL_TARGET].Text + k.COMMA_SPACE).Replace("&nbsp;,",k.EMPTY);
          v.distribution_list_sms.Append(tcc[Static.TCI_SMS_TARGET].Text + k.COMMA_SPACE).Replace("&nbsp;,",k.EMPTY);
          }
        //
        // Calls to ToolkitScriptManager.GetCurrent(Page).RegisterPostBackControl() from DataGrid_control_ItemDataBound go here.
        //
        }
      Label_distribution_list.Text = (RadioButtonList_quick_message_mode.SelectedValue == "email" ? v.distribution_list_email : v.distribution_list_sms).ToString().TrimEnd(new char[] {Convert.ToChar(k.COMMA),Convert.ToChar(k.SPACE)});
      }

    protected void Button_send_Click(object sender, EventArgs e)
      {
      var be_email_mode = (RadioButtonList_quick_message_mode.SelectedValue == "email");
      if (Label_distribution_list.Text.Length > 0)
        {
        var attribution = k.EMPTY;
        if (be_email_mode)
          {
          attribution += "-- From "
          + p.biz_user.Roles()[0] + k.SPACE
          + p.biz_members.FirstNameOfMemberId(Session["member_id"].ToString()) + k.SPACE + p.biz_members.LastNameOfMemberId(Session["member_id"].ToString())
          + " (" + p.biz_user.EmailAddress() + ")"
          + " [via " + ConfigurationManager.AppSettings["application_name"] + "]" + k.NEW_LINE
          + k.NEW_LINE;
          }
        k.SmtpMailSend
          (
          from:ConfigurationManager.AppSettings["sender_email_address"],
          to:Label_distribution_list.Text,
          subject:(be_email_mode ? TextBox_quick_message_subject.Text : k.EMPTY),
          message_string:attribution + k.Safe(TextBox_quick_message_body.Text,k.safe_hint_type.MEMO),
          be_html:false,
          cc:k.EMPTY,
          bcc:k.Safe(Literal_author_target.Text,k.safe_hint_type.EMAIL_ADDRESS),
          reply_to:(RadioButtonList_reply_to.SelectedValue == "bouncer" ? ConfigurationManager.AppSettings["bouncer_email_address"] : (RadioButtonList_reply_to.SelectedValue == "email" ? p.user_target_email : p.user_target_sms))
          );
        TextBox_quick_message_subject.Text = k.EMPTY;
        TextBox_quick_message_body.Text = k.EMPTY;
        Alert
          (
          cause:k.alert_cause_type.LOGIC,
          state:k.alert_state_type.NORMAL,
          key:"messagsnt",
          value:"Message sent",
          be_using_scriptmanager:true
          );
        }
      else
        {
        Alert
          (
          cause:k.alert_cause_type.USER,
          state:k.alert_state_type.FAILURE,
          key:"noqmrecips",
          value:"Message *NOT* sent.  No recipients are selected.",
          be_using_scriptmanager:true
          );
        }
      BuildDistributionListAndRegisterPostBackControls();
      }

    protected void RadioButtonList_quick_message_mode_SelectedIndexChanged(object sender, EventArgs e)
      {
      BuildDistributionListAndRegisterPostBackControls();
      if (RadioButtonList_quick_message_mode.SelectedValue == "email")
        {
        Literal_quick_message_kind_email.Visible = true;
        Literal_quick_message_kind_sms.Visible = false;
        Literal_author_target.Text = p.user_target_email;
        RadioButtonList_reply_to.SelectedValue = "email";
        TableRow_subject.Visible = true;
        TextBox_quick_message_body.Columns = 72;
        TextBox_quick_message_body.Rows = 18;
        }
      else
        {
        Literal_quick_message_kind_email.Visible = false;
        Literal_quick_message_kind_sms.Visible = true;
        Literal_author_target.Text = p.user_target_sms;
        RadioButtonList_reply_to.SelectedValue = "phone";
        TableRow_subject.Visible = false;
        TextBox_quick_message_body.Columns = 40;
        TextBox_quick_message_body.Rows = 4;
        }
      }

    } // end TWebUserControl_schedule_assignments_audit

  }