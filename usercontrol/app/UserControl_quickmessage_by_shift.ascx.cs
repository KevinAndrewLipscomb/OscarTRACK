// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using AjaxControlToolkit;
using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_biz_user;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_quickmessage_by_shift
  {
  public partial class TWebUserControl_quickmessage_by_shift: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_SELECT_FOR_QUICKMESSAGE = 0;
      public const int TCI_POST_DESIGNATOR = 1;
      public const int TCI_POST_CARDINALITY = 2;
      public const int TCI_MEDICAL_RELEASE_DESCRIPTION = 3;
      public const int TCI_NAME = 4;
      public const int TCI_BE_DRIVER_QUALIFIED = 5;
      public const int TCI_MEMBER_AGENCY_ID = 6;
      public const int TCI_BE_SELECTED = 7;
      public const int TCI_COMMENT = 8;
      public const int TCI_BE_CHALLENGE = 9;
      public const int TCI_BE_GREENHORNS = 10;
      public const int TCI_EMAIL_TARGET = 11;
      public const int TCI_SMS_TARGET = 12;
      }

    private struct p_type
      {
      public string agency_filter;
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_sort_order_ascending;
      public TClass_biz_members biz_members;
      public TClass_biz_schedule_assignments biz_schedule_assignments;
      public TClass_biz_user biz_user;
      public string depth_filter;
      public string distribution_list_email;
      public string distribution_list_sms;
      public string nominal_day_filter;
      public uint num_schedule_assignments;
      public k.subtype<int> relative_month;
      public string release_filter;
      public string saved_unit_spec;
      public string shift_name;
      public string sort_order;
      public string user_member_id;
      public string user_target_email;
      public string user_target_sms;
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
        var target_month = DateTime.Today.AddMonths(p.relative_month.val);
        Literal_shift_spec.Text = new DateTime
          (
          year:target_month.Year,
          month:target_month.Month,
          day:int.Parse(p.nominal_day_filter)
          )
          .ToString("MMMM, ddd/dd")  + k.SPACE + p.shift_name;
        //
        Literal_author_target.Text = (RadioButtonList_quick_message_mode.SelectedValue == "email" ? p.user_target_email : p.user_target_sms);
        var user_member_phone_num = k.FormatAsNanpPhoneNum(p.biz_members.PhoneNumOf(p.user_member_id));
        var user_member_first_name = p.biz_members.FirstNameOfMemberId(p.user_member_id);
        if (!p.be_interactive)
          {
          DataGrid_control.AllowSorting = false;
          }
        Bind();
        //
        TextBox_quick_message_subject.Text = Literal_shift_spec.Text;
        //
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
      ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_cancel);
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
//#warning Revise the binder-related instance_id to this control appropriately.
//        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_quickmessage_by_shift")
//          {
//#warning Revise the ClientID path to this control appropriately.
//          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_quickmessage_by_shift");
//          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_quickmessage_by_shift")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_quickmessage_by_shift");
//        }
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        p.biz_user = new TClass_biz_user();
        //
        p.agency_filter = k.EMPTY;
        p.be_interactive = (Session["mode:report"] == null);
        p.be_sort_order_ascending = true;
        p.depth_filter = k.EMPTY;
        p.distribution_list_email = k.EMPTY;
        p.distribution_list_sms = k.EMPTY;
        p.nominal_day_filter = k.EMPTY;
        p.relative_month = new k.subtype<int>(0,1);
        p.release_filter = k.EMPTY;
        p.saved_unit_spec = k.EMPTY;
        p.shift_name = k.EMPTY;
        p.sort_order = "be_same_agency desc, object_medical_release_level.pecking_order desc";
        p.user_member_id = p.biz_members.IdOfUserId(user_id:p.biz_user.IdNum());
        //
        p.user_target_email = p.biz_members.EmailAddressOf(member_id:p.user_member_id);
        p.user_target_sms = p.biz_members.SmsTargetOf(member_id:p.user_member_id);
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_control.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(DataGrid_control_ItemDataBound);
      DataGrid_control.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(DataGrid_control_SortCommand);
      PreRender += TWebUserControl_quickmessage_by_shift_PreRender;
      }

    private void TWebUserControl_quickmessage_by_shift_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_quickmessage_by_shift Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      var be_any_kind_of_item = (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType));
      if (be_any_kind_of_item)
        {
        var current_unit_spec = e.Item.Cells[Static.TCI_POST_DESIGNATOR].Text + "--" + e.Item.Cells[Static.TCI_POST_CARDINALITY].Text;
        if (current_unit_spec != p.saved_unit_spec)
          {
          e.Item.Style.Add("border-top","thin solid silver");
          }
        if (e.Item.Cells[Static.TCI_BE_SELECTED].Text == "1")
          {
          e.Item.Cells[Static.TCI_MEDICAL_RELEASE_DESCRIPTION].Font.Bold = true;
          e.Item.Cells[Static.TCI_NAME].Font.Bold = true;
          //
          if (e.Item.Cells[Static.TCI_BE_GREENHORNS].Text == "1")
            {
            e.Item.BackColor = Color.PaleGreen;
            }
          if (e.Item.Cells[Static.TCI_BE_CHALLENGE].Text == "1")
            {
            e.Item.BackColor = Color.Yellow;
            }
          }
        else
          {
          e.Item.Cells[Static.TCI_POST_DESIGNATOR].Text = k.EMPTY;
          e.Item.Cells[Static.TCI_POST_CARDINALITY].Text = k.EMPTY;
          }
        e.Item.Cells[Static.TCI_BE_CHALLENGE].Visible = false;
        e.Item.Cells[Static.TCI_BE_GREENHORNS].Visible = false;
        //
        e.Item.Cells[Static.TCI_MEDICAL_RELEASE_DESCRIPTION].Font.Italic = (new ArrayList() {"P","I","C"}).Contains(e.Item.Cells[Static.TCI_MEDICAL_RELEASE_DESCRIPTION].Text);
        //
        var member_agency_id = k.Safe(e.Item.Cells[Static.TCI_MEMBER_AGENCY_ID].Text,k.safe_hint_type.NUM);
        e.Item.Cells[Static.TCI_MEMBER_AGENCY_ID].Text = (member_agency_id == p.agency_filter ? k.EMPTY : "<" + member_agency_id);
        //
        e.Item.Cells[Static.TCI_COMMENT].Text = e.Item.Cells[Static.TCI_COMMENT].Text.Substring(0,Math.Min(e.Item.Cells[Static.TCI_COMMENT].Text.Length,15));
        //
        p.saved_unit_spec = current_unit_spec;
        p.num_schedule_assignments++;
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
      p.biz_schedule_assignments.BindBaseDataListByShiftForQuickMessage
        (
        agency_filter:p.agency_filter,
        relative_month:p.relative_month,
        shift_name:p.shift_name,
        nominal_day_filter:p.nominal_day_filter,
        depth_filter:p.depth_filter,
        target:DataGrid_control,
        release_filter:p.release_filter
        );
      p.be_datagrid_empty = (p.num_schedule_assignments == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_members.Text = p.num_schedule_assignments.ToString();
      p.num_schedule_assignments = 0;
      //
      BuildDistributionListAndRegisterPostBackControls();
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
      p.distribution_list_email = k.EMPTY;
      p.distribution_list_sms = k.EMPTY;
      TableCellCollection tcc;
      for (var i = new k.subtype<int>(0, DataGrid_control.Items.Count); i.val < i.LAST; i.val++)
        {
        tcc = DataGrid_control.Items[i.val].Cells;
        if ((tcc[Static.TCI_SELECT_FOR_QUICKMESSAGE].FindControl("CheckBox_selected") as CheckBox).Checked)
          {
          p.distribution_list_email += (tcc[Static.TCI_EMAIL_TARGET].Text + k.COMMA_SPACE).Replace("&nbsp;,",k.EMPTY);
          p.distribution_list_sms += (tcc[Static.TCI_SMS_TARGET].Text + k.COMMA_SPACE).Replace("&nbsp;,",k.EMPTY);
          }
        //
        // Calls to ScriptManager.GetCurrent(Page).RegisterPostBackControl() from DataGrid_control_ItemDataBound go here.
        //
        }
      Label_distribution_list.Text = (RadioButtonList_quick_message_mode.SelectedValue == "email" ? p.distribution_list_email : p.distribution_list_sms).TrimEnd(new char[] {Convert.ToChar(k.COMMA),Convert.ToChar(k.SPACE)});
      }

    protected void Button_send_Click(object sender, EventArgs e)
      {
      var be_email_mode = (RadioButtonList_quick_message_mode.SelectedValue == "email");
      var distribution_list = (be_email_mode ? p.distribution_list_email : p.distribution_list_sms);
      if (distribution_list.Length > 0)
        {
        var attribution = k.EMPTY;
        if (be_email_mode)
          {
          attribution += "-- From "
          + p.biz_user.FullTitle() + k.SPACE
          + p.biz_members.FirstNameOfMemberId(Session["member_id"].ToString()) + k.SPACE + p.biz_members.LastNameOfMemberId(Session["member_id"].ToString())
          + " (" + p.biz_user.EmailAddress() + ")"
          + " [via " + ConfigurationManager.AppSettings["application_name"] + "]" + k.NEW_LINE
          + k.NEW_LINE;
          }
        k.SmtpMailSend
          (
          from:ConfigurationManager.AppSettings["sender_email_address"],
          to:distribution_list,
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
      if (RadioButtonList_quick_message_mode.SelectedValue == "email")
        {
        Literal_quick_message_kind_email.Visible = true;
        Literal_quick_message_kind_sms.Visible = false;
        Literal_author_target.Text = p.user_target_email;
        RadioButtonList_reply_to.SelectedValue = "email";
        TableRow_subject.Visible = true;
        TextBox_quick_message_body.Columns = 72;
        TextBox_quick_message_body.Rows = 18;
        Label_distribution_list.Text = p.distribution_list_email;
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
        Label_distribution_list.Text = p.distribution_list_sms;
        }
      BuildDistributionListAndRegisterPostBackControls();
      }

    internal void Set
      (
      string agency_filter,
      string release_filter,
      string depth_filter,
      k.subtype<int> relative_month,
      string nominal_day_filter,
      string shift_name
      )
      {
      p.agency_filter = agency_filter;
      p.release_filter = release_filter;
      p.depth_filter = depth_filter;
      p.relative_month = relative_month;
      p.nominal_day_filter = nominal_day_filter;
      p.shift_name = shift_name;
      Bind();
      }

    protected void Button_cancel_Click(object sender, EventArgs e)
      {
      BackTrack();
      }

    } // end TWebUserControl_quickmessage_by_shift

  }