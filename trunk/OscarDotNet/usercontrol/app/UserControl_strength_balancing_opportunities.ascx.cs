// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~datagrid~sortable.ascx.cs

using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_biz_user;
using Class_msg_protected;
using kix;
using System;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_strength_balancing_opportunities
  {
  public partial class TWebUserControl_strength_balancing_opportunities: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_SELECT_FOR_QUICKMESSAGE = 0;
      public const int TCI_MEMBER_ID = 1;
      public const int TCI_MEMBER = 2;
      public const int TCI_CURRENT_ASSIGNMENT = 3;
      public const int TCI_COMMENT = 4;
      public const int TCI_EMAIL_TARGET = 5;
      public const int TCI_SMS_TARGET = 6;
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
      public string heavy_nominal_day;
      public string heavy_shift_name;
      public string light_nominal_day;
      public string light_shift_name;
      public TClass_msg_protected.member_schedule_detail msg_protected_member_schedule_detail;
      public k.int_nonnegative num_opportunities;
      public k.subtype<int> relative_month;
      public string sort_order;
      public string user_member_id;
      public string user_target_email;
      public string user_target_sms;
      }

    private p_type p;

    private void InjectPersistentClientSideScript()
      {
      }

    protected void Page_Load(object sender, EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (p.be_interactive)
          {
          Literal_author_target.Text = (RadioButtonList_quick_message_mode.SelectedValue == "email" ? p.user_target_email : p.user_target_sms);
          }
        else
          {
          DataGrid_control.AllowSorting = false;
          }
        //Bind(); // Can't bind this control right away since a call from the parent control to SetP is needed first.
        p.be_loaded = true;
        }
      InjectPersistentClientSideScript();
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
//        //
//        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
//        // had it loaded already.
//        //
//#warning Revise the binder-related instance_id to this control appropriately.
//        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_strength_balancing_opportunities")
//          {
//#warning Revise the ClientID path to this control appropriately.
//          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_strength_balancing_opportunities");
//          }
////      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_strength_balancing_opportunities")
////        {
////        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_strength_balancing_opportunities");
////        }
        }
      else
        {
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        p.biz_user = new TClass_biz_user();
        p.msg_protected_member_schedule_detail = new TClass_msg_protected.member_schedule_detail();
        //
        p.be_interactive = (Session["mode:report"] == null);
        p.be_loaded = false;
        p.be_sort_order_ascending = true;
        p.distribution_list_email = k.EMPTY;
        p.distribution_list_sms = k.EMPTY;
        p.heavy_nominal_day = k.EMPTY;
        p.heavy_shift_name = k.EMPTY;
        p.light_nominal_day = k.EMPTY;
        p.light_shift_name = k.EMPTY;
        p.num_opportunities = new k.int_nonnegative();
        p.sort_order = "member%";
        p.user_member_id = p.biz_members.IdOfUserId(user_id:p.biz_user.IdNum());
        //
        var member_id = p.biz_members.IdOfUserId(user_id:p.biz_user.IdNum());
        p.user_target_email = p.biz_members.EmailAddressOf(member_id:member_id);
        p.user_target_sms = p.biz_members.SmsTargetOf(member_id:member_id);
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
      PreRender += TWebUserControl_strength_balancing_opportunities_PreRender;
      }

    private void TWebUserControl_strength_balancing_opportunities_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_strength_balancing_opportunities Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void DataGrid_control_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      if (e.Item.ItemType.ToString().EndsWith("Item"))
        {
        p.msg_protected_member_schedule_detail.member_id = k.Safe(e.Item.Cells[Static.TCI_MEMBER_ID].Text,k.safe_hint_type.NUM);
        p.msg_protected_member_schedule_detail.relative_month = p.relative_month;
        MessageDropCrumbAndTransferTo(p.msg_protected_member_schedule_detail,"protected","member_schedule_detail");
        }
      }

    private void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      LinkButton link_button;
      if (p.be_interactive)
        {
        if (e.Item.ItemType.ToString().EndsWith("Item"))
          {
          link_button = ((e.Item.Cells[Static.TCI_MEMBER].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          //
          // Preserve viewstate for all cell controls for compatibility with QuickMessage.
          //
          p.num_opportunities.val++;
          }
        }
      else
        {
        (e.Item.Cells[Static.TCI_MEMBER_ID].Controls[0] as LinkButton).Enabled = false;
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
      p.biz_schedule_assignments.BindBalancingOpportunities
        (
        sort_order:p.sort_order,
        be_sort_order_ascending:p.be_sort_order_ascending,
        target:DataGrid_control,
        heavy_nominal_day:p.heavy_nominal_day,
        heavy_shift_name:p.heavy_shift_name,
        light_nominal_day:p.light_nominal_day,
        light_shift_name:p.light_shift_name
        );
      p.be_datagrid_empty = (p.num_opportunities.val == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      DataGrid_control.Visible = !p.be_datagrid_empty;
      Literal_num_opportunities.Text = p.num_opportunities.val.ToString();
      p.num_opportunities.val = 0;
      //
      BuildDistributionListAndRegisterPostBackControls();
      }

    internal void SetP
      (
      string heavy_nominal_day,
      string heavy_shift_name,
      string light_nominal_day,
      string light_shift_name,
      k.subtype<int> relative_month
      )
      {
      p.heavy_nominal_day = heavy_nominal_day;
      p.heavy_shift_name = heavy_shift_name;
      p.light_nominal_day = light_nominal_day;
      p.light_shift_name = light_shift_name;
      p.relative_month = relative_month;
      var month_designator = DateTime.Today.AddMonths(p.relative_month.val).ToString("MMM");
      if (p.heavy_nominal_day.Length > 0)
        {
        Literal_heavy_staffed_shift.Text = month_designator
        + k.COMMA_SPACE
        + p.biz_schedule_assignments.MonthlessRenditionOfNominalDay(DateTime.Parse(p.heavy_nominal_day))
        + k.SPACE
        + p.heavy_shift_name;
        }
      if (p.light_nominal_day.Length > 0)
        {
        Literal_light_staffed_shift.Text = month_designator
        + k.COMMA_SPACE
        + p.biz_schedule_assignments.MonthlessRenditionOfNominalDay(DateTime.Parse(p.light_nominal_day))
        + k.SPACE
        + p.light_shift_name;
        }
      if ((p.heavy_nominal_day.Length > 0) && (p.heavy_shift_name.Length > 0) && (p.light_nominal_day.Length > 0) && (p.light_shift_name.Length > 0))
        {
        Bind();
        //
        var user_member_first_name = p.biz_members.FirstNameOfMemberId(p.user_member_id);
        TextBox_quick_message_subject.Text = "Duty switch?";
        TextBox_quick_message_body.Text = k.EMPTY
        + "For " + (relative_month.val == 0 ? "this" : "next") + " month, I'd like to move you from " + p.biz_schedule_assignments.MonthlessRenditionOfNominalDay(DateTime.Parse(p.heavy_nominal_day)) + k.SPACE + p.heavy_shift_name
        + " (when we're heavily staffed) to " + p.biz_schedule_assignments.MonthlessRenditionOfNominalDay(DateTime.Parse(p.light_nominal_day)) + k.SPACE + p.light_shift_name
        + " (when we're currently short-staffed).  Would that be ok?" + k.NEW_LINE
        + k.NEW_LINE
        + "-- " + (user_member_first_name.Length > 1 ? user_member_first_name[0] + user_member_first_name.Substring(1).ToLower() : user_member_first_name);
        }
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
        ScriptManager.GetCurrent(Page).RegisterPostBackControl(((tcc[Static.TCI_MEMBER].Controls[0]) as LinkButton));
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

    } // end TWebUserControl_strength_balancing_opportunities

  }