// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_biz_user;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Web.UI.WebControls;

namespace UserControl_coverage_assistant
  {
  public partial class TWebUserControl_coverage_assistant: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_SELECT_FOR_QUICKMESSAGE = 0;
      public const int TCI_NAME = 1;
      public const int TCI_AGENCY = 2;
      public const int TCI_RELEASED_CERT_LEVEL = 3;
      public const int TCI_RELEASED_DRIVER = 4;
      public const int TCI_EMAIL_ADDRESS = 5;
      public const int TCI_PHONE_NUM = 6;
      public const int TCI_EMAIL_TARGET = 7;
      public const int TCI_SMS_TARGET = 8;
      public const int TCI_SWAPORTUNITIES = 9;
      }

    private struct p_type
      {
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_sort_order_ascending;
      public TClass_biz_members biz_members;
      public TClass_biz_schedule_assignments biz_schedule_assignments;
      public TClass_biz_user biz_user;
      public string distribution_list_email;
      public string distribution_list_sms;
      public uint num_schedule_assignments;
      public object summary;
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
        Literal_conventional_spec.Text = k.EMPTY
        + p.biz_schedule_assignments.NominalDayOf(p.summary).ToString("MMMM, ddd/dd") + k.SPACE
        + p.biz_schedule_assignments.ShiftNameOf(p.summary) + k.COMMA_SPACE
        + p.biz_schedule_assignments.PostDesignatorOf(p.summary) + p.biz_schedule_assignments.PostCardinalityOf(p.summary);
        Literal_comment.Text = p.biz_schedule_assignments.CommentOf(p.summary);
        //
        Literal_author_target.Text = (RadioButtonList_quick_message_mode.SelectedValue == "email" ? p.user_target_email : p.user_target_sms);
        var user_member_phone_num = k.FormatAsNanpPhoneNum(p.biz_members.PhoneNumOf(p.user_member_id));
        var user_member_first_name = p.biz_members.FirstNameOfMemberId(p.user_member_id);
        var be_user_member_own_assignment = (p.user_member_id == p.biz_schedule_assignments.MemberIdOf(p.summary));
        TextBox_quick_message_subject.Text = (be_user_member_own_assignment ? "Swap or c" : "C") + "overage needed";
        TextBox_quick_message_body.Text = k.EMPTY
        + "Hi," + k.NEW_LINE
        + k.NEW_LINE
        + (be_user_member_own_assignment ? "I'm" : "We're") + " looking to " + (be_user_member_own_assignment ? "swap or " : k.EMPTY) + "get coverage for the following duty:" + k.NEW_LINE
        + k.NEW_LINE
        + "   " + Literal_conventional_spec.Text + (Literal_comment.Text.Length > 0 ? " {" + Literal_comment.Text + "}" : k.EMPTY) + k.NEW_LINE
        + k.NEW_LINE
        + "It looks like you told OSCAR you might be available then." + k.NEW_LINE
        + k.NEW_LINE
        + (user_member_phone_num.Length > 0 ? "My phone number is " + user_member_phone_num + ".  " : k.EMPTY) + "Can you help me?" + k.NEW_LINE
        + k.NEW_LINE
        + "-- " + (user_member_first_name.Length > 1 ? user_member_first_name[0] + user_member_first_name.Substring(1).ToLower() : user_member_first_name);
        Panel_best_practices.Visible = be_user_member_own_assignment;
        if (!p.be_interactive)
          {
          DataGrid_control.AllowSorting = false;
          }
        Bind();
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
//#warning Revise the binder-related instance_id to this control appropriately.
//        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_coverage_assistant")
//          {
//#warning Revise the ClientID path to this control appropriately.
//          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_coverage_assistant");
//          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_coverage_assistant")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_coverage_assistant");
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
        p.be_interactive = (Session["mode:report"] == null);
        p.be_sort_order_ascending = true;
        p.distribution_list_email = k.EMPTY;
        p.distribution_list_sms = k.EMPTY;
        p.sort_order = "be_same_agency desc, object_medical_release_level.pecking_order desc";
        p.user_member_id = p.biz_members.IdOfUserId(user_id:p.biz_user.IdNum());
        //
        p.user_target_email = p.biz_members.EmailAddressOf(member_id:p.user_member_id);
        p.user_target_sms = k.EMPTY; //p.biz_members.SmsTargetOf(member_id:p.user_member_id);
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
      this.PreRender += this.TWebUserControl_coverage_assistant_PreRender;
      //this.Load += this.Page_Load;
      }

    private void TWebUserControl_coverage_assistant_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_coverage_assistant Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      if (new ArrayList {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        var hyper_link_email_address = (e.Item.Cells[Static.TCI_EMAIL_ADDRESS].FindControl("HyperLink_email_address") as HyperLink);
        hyper_link_email_address.NavigateUrl = "mailto:" + k.Safe(hyper_link_email_address.Text,k.safe_hint_type.EMAIL_ADDRESS);
        //
        var hyper_link_phone_num = (e.Item.Cells[Static.TCI_PHONE_NUM].FindControl("HyperLink_phone_num") as HyperLink);
        hyper_link_phone_num.Text = k.FormatAsNanpPhoneNum(k.Safe(hyper_link_phone_num.Text,k.safe_hint_type.PHONE_NUM));
        hyper_link_phone_num.NavigateUrl = "tel:" + hyper_link_phone_num.Text;
        //
        var literal_swaportunities = (e.Item.Cells[Static.TCI_SWAPORTUNITIES].FindControl("Literal_swaportunities") as Literal);
        literal_swaportunities.Text = literal_swaportunities.Text.Replace(k.COMMA,k.NEW_LINE);
        //
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
      p.biz_schedule_assignments.BindPotentialHelpersBaseDataList(p.sort_order,p.be_sort_order_ascending,DataGrid_control,p.biz_schedule_assignments.IdOf(p.summary));
      p.be_datagrid_empty = (p.num_schedule_assignments == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_potential_helpers.Text = p.num_schedule_assignments.ToString();
      p.num_schedule_assignments = 0;
      //
      BuildDistributionListAndRegisterPostBackControls();
      }
    
    internal void Set(object summary)
      {
      p.summary = summary;
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
          + p.biz_user.Roles()[0] + k.SPACE
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

    } // end TWebUserControl_coverage_assistant

  }