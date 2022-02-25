using Class_biz_members;
using Class_biz_notifications;
using Class_biz_quick_messages;
using Class_biz_role_member_map;
using Class_biz_user;
using kix;
using System;
using System.Text;
using System.Web.UI.WebControls;

namespace UserControl_notification
  {

  public partial class TWebUserControl_notification: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TCI_SELECT_FOR_QUICKMESSAGE = 0;
      public const int TCI_NAME = 1;
      public const int TCI_AGENCY = 2;
      public const int TCI_EMAIL_TARGET = 3;
      public const int TCI_SMS_TARGET = 4;
      }

    private struct p_type
      {
      public bool be_gridview_empty;
      public bool be_loaded;
      public bool be_ok_to_config_notifications;
      public bool be_scope_cross_agency;
      public bool be_sort_order_ascending;
      public TClass_biz_members biz_members;
      public TClass_biz_notifications biz_notifications;
      public TClass_biz_quick_messages biz_quick_messages;
      public TClass_biz_role_member_map biz_role_member_map;
      public TClass_biz_user biz_user;
      public uint num_gridview_rows;
      public string notification_name;
      public string sort_order;
      public string[] user_notification_string_array;
      public string user_member_id;
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

    private void BuildDistributionListAndRegisterPostBackControls()
      {
      v.distribution_list_email.Clear();
      v.distribution_list_sms.Clear();
      TableCellCollection tcc;
      for (var i = new k.subtype<int>(0, GridView_holders.Rows.Count); i.val < i.LAST; i.val++)
        {
        tcc = GridView_holders.Rows[i.val].Cells;
        if ((tcc[Static.TCI_SELECT_FOR_QUICKMESSAGE].FindControl("CheckBox_selected") as CheckBox).Checked)
          {
          v.distribution_list_email.Append(tcc[Static.TCI_EMAIL_TARGET].Text + k.COMMA_SPACE).Replace("&nbsp;,",k.EMPTY);
          v.distribution_list_sms.Append(tcc[Static.TCI_SMS_TARGET].Text + k.COMMA_SPACE).Replace("&nbsp;,",k.EMPTY);
          }
        //
        // Calls to ScriptManager.GetCurrent(Page).RegisterPostBackControl() from DataGrid_control_ItemDataBound go here.
        //
        }
      Label_distribution_list.Text = (RadioButtonList_quick_message_mode.SelectedValue == "email" ? v.distribution_list_email : v.distribution_list_sms).ToString().TrimEnd(new char[] {Convert.ToChar(k.COMMA),Convert.ToChar(k.SPACE)});
      }

    private void Clear()
      {
      TextBox_name.Text = k.EMPTY;
      DropDownList_name.Visible = false;
      Literal_match_index.Text = k.EMPTY;
      Literal_num_matches.Text = k.EMPTY;
      Panel_match_numbers.Visible = false;
      LinkButton_go_to_match_prior.Visible = false;
      LinkButton_go_to_match_next.Visible = false;
      LinkButton_go_to_match_last.Visible = false;
      LinkButton_go_to_match_first.Visible = false;
      SetDependentFieldAblements(false);
      Button_submit.Visible = false;
      Button_delete.Visible = false;
      Table_holders.Visible = false;
      Table_quick_message.Visible = false;
      }

    private void Page_Load(object sender, EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (Session["mode:report"] == null)
          {
          Literal_author_target.Text = (RadioButtonList_quick_message_mode.SelectedValue == "email" ? p.user_target_email : p.user_target_sms);
          if (p.be_ok_to_config_notifications)
            {
            Table_lookup_controls.Visible = true;
            TableData_match_controls.Visible = true;
            TableData_goto_controls.Visible = true;
            LinkButton_new_record.Visible = true;
            }
          }
        else
          {
          TextBox_quick_message_subject.Enabled = false;
          TextBox_quick_message_body.Enabled = false;
          RequiredFieldValidator_quick_message_body.Enabled = false;
          Button_send.Enabled = false;
          }
        LinkButton_go_to_match_first.Text = k.ExpandTildePath(LinkButton_go_to_match_first.Text);
        LinkButton_go_to_match_prior.Text = k.ExpandTildePath(LinkButton_go_to_match_prior.Text);
        LinkButton_go_to_match_next.Text = k.ExpandTildePath(LinkButton_go_to_match_next.Text);
        LinkButton_go_to_match_last.Text = k.ExpandTildePath(LinkButton_go_to_match_last.Text);
        RequireConfirmation(Button_delete, "Are you sure you want to delete this record?");
        Lookup(p.user_notification_string_array[0]);
        p.be_loaded = true;
        }
      }

    private bool PresentRecord(string name)
      {
      Literal_match_index.Text = DropDownList_name.SelectedIndex.ToString();
      bool result;
      result = false;
      if (p.biz_notifications.Get(name))
        {
        TextBox_name.Text = name;
        p.notification_name = name;
        TextBox_name.Enabled = false;
        Button_lookup.Enabled = false;
        Label_lookup_arrow.Enabled = false;
        Label_lookup_hint.Enabled = false;
        LinkButton_reset.Enabled = true;
        SetDependentFieldAblements(p.be_ok_to_config_notifications);
        Button_submit.Visible = p.be_ok_to_config_notifications;
        Button_delete.Visible = p.be_ok_to_config_notifications;
        p.be_scope_cross_agency = p.biz_members.HighestTierOf(id:p.user_member_id) == "1";
        BindHolders();
        result = true;
        }
      return result;
      }

    private void SetLookupMode()
      {
      Clear();
      TextBox_name.Enabled = true;
      Button_lookup.Enabled = true;
      Label_lookup_arrow.Enabled = true;
      Label_lookup_hint.Enabled = true;
      LinkButton_reset.Enabled = false;
      LinkButton_new_record.Enabled = p.be_ok_to_config_notifications;
      Focus(TextBox_name, true);
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
        //p.be_loaded = IsPostBack && ((Session["M_UserControl_config_UserControl_notifications_and_matrices_binder_PlaceHolder_content"] as string) == "UserControl_notification");
        //
        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
        // had it loaded already.
        //
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_config_roles_and_matrices_binder_notification")
          {
          p.be_loaded &= ((Session["M_UserControl_config_UserControl_roles_and_matrices_binder_PlaceHolder_content"] as string) == "UserControl_notification");
          }
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_members = new TClass_biz_members();
        p.biz_notifications = new TClass_biz_notifications();
        p.biz_quick_messages = new TClass_biz_quick_messages();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        p.biz_user = new TClass_biz_user();
        //
        p.be_gridview_empty = true;
        p.be_ok_to_config_notifications = false; // configuring notifications requires programming changes
        p.be_scope_cross_agency = true;
        p.be_sort_order_ascending = true;
        p.num_gridview_rows = 0;
        p.notification_name = k.EMPTY;
        p.sort_order = "member_name%";
        p.user_notification_string_array = p.biz_user.Notifications();
        p.user_member_id = p.biz_members.IdOfUserId(user_id:p.biz_user.IdNum());
        //
        p.user_target_email = p.biz_members.EmailAddressOf(member_id:p.user_member_id);
        p.user_target_sms = p.biz_members.SmsTargetOf(member_id:p.user_member_id);
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
      GridView_holders.Sorting += new GridViewSortEventHandler(GridView_holders_Sorting);
      GridView_holders.RowDataBound += new GridViewRowEventHandler(GridView_holders_RowDataBound);
      GridView_holders.RowCreated += new GridViewRowEventHandler(GridView_holders_RowCreated);
      PreRender += TWebUserControl_notification_PreRender;
      }

    private void TWebUserControl_notification_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_notification Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void GridView_holders_Sorting(object sender, GridViewSortEventArgs e)
      {
      if (e.SortExpression == p.sort_order)
        {
        p.be_sort_order_ascending = !p.be_sort_order_ascending;
        }
      else
        {
        p.sort_order = e.SortExpression;
        p.be_sort_order_ascending = true;
        }
      GridView_holders.EditIndex =  -1;
      BindHolders();
      }

    private void GridView_holders_RowCreated(object sender, GridViewRowEventArgs e)
      {
      e.Row.Cells[Static.TCI_EMAIL_TARGET].Visible = false;
      e.Row.Cells[Static.TCI_SMS_TARGET].Visible = false;
      }

    private void GridView_holders_RowDataBound(object sender, GridViewRowEventArgs e)
      {
      if ((e.Row.RowType == DataControlRowType.DataRow) && (e.Row.Cells[Static.TCI_EMAIL_TARGET].Text != "&nbsp;"))
        {
        p.num_gridview_rows++;
        }
      }

    protected void Button_send_Click(object sender, EventArgs e)
      {
      if (Label_distribution_list.Text.Length > 0)
        {
        p.biz_quick_messages.Send
          (
          be_email_mode:(RadioButtonList_quick_message_mode.SelectedValue == "email"),
          author_title_clause:p.biz_user.FullTitle(),
          author_first_name:p.biz_members.FirstNameOfMemberId(Session["member_id"].ToString()),
          author_last_name:p.biz_members.LastNameOfMemberId(Session["member_id"].ToString()),
          author_target_email:p.user_target_email,
          author_target_sms:p.user_target_sms,
          distribution_list:Label_distribution_list.Text,
          subject:TextBox_quick_message_subject.Text,
          body:TextBox_quick_message_body.Text,
          reply_mode:(RadioButtonList_reply_to.SelectedValue == "bouncer" ? reply_mode_enum.BOUNCER : (RadioButtonList_reply_to.SelectedValue == "phone" ? reply_mode_enum.PHONE : reply_mode_enum.EMAIL))
          );
        TextBox_quick_message_subject.Text = k.EMPTY;
        TextBox_quick_message_body.Text = k.EMPTY;
        Alert(k.alert_cause_type.LOGIC, k.alert_state_type.NORMAL, "messagsnt", "Message sent", true);
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

    protected void Button_submit_Click(object sender, EventArgs e)
      {
      //if (Page.IsValid)
      //  {
      //  p.biz_notifications.Set
      //    (
      //    k.Safe(TextBox_name.Text, k.safe_hint_type.HUMAN_NAME).Trim(),
      //    k.Safe(DropDownList_tier.SelectedValue, k.safe_hint_type.NUM).Trim(),
      //    k.Safe(TextBox_pecking_order.Text, k.safe_hint_type.NUM).Trim(),
      //    CheckBox_be_occasional.Checked
      //    );
      //  Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "recsaved", "Record saved.", true);
      //  SetLookupMode();
      //  }
      //else
      //  {
      //  ValidationAlert(true);
      //  }
      Alert(k.alert_cause_type.LOGIC, k.alert_state_type.WARNING, "noimp", "Not implemented.", true);
      }

    protected void DropDownList_name_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.notification_name = k.Safe(DropDownList_name.SelectedValue, k.safe_hint_type.PUNCTUATED);
      PresentRecord(p.notification_name);
      }

    protected void LinkButton_go_to_match_first_Click(object sender, EventArgs e)
      {
      DropDownList_name.SelectedIndex = 1;
      PresentRecord(k.Safe(DropDownList_name.SelectedValue, k.safe_hint_type.HUMAN_NAME));
      }

    protected void LinkButton_go_to_match_prior_Click(object sender, EventArgs e)
      {
      DropDownList_name.SelectedIndex = Math.Max(1, (DropDownList_name.SelectedIndex - 1));
      PresentRecord(k.Safe(DropDownList_name.SelectedValue, k.safe_hint_type.HUMAN_NAME));
      }

    protected void LinkButton_go_to_match_next_Click(object sender, EventArgs e)
      {
      DropDownList_name.SelectedIndex = Math.Min((DropDownList_name.SelectedIndex + 1), (DropDownList_name.Items.Count - 1));
      PresentRecord(k.Safe(DropDownList_name.SelectedValue, k.safe_hint_type.HUMAN_NAME));
      }

    protected void LinkButton_go_to_match_last_Click(object sender, EventArgs e)
      {
      DropDownList_name.SelectedIndex = DropDownList_name.Items.Count - 1;
      PresentRecord(k.Safe(DropDownList_name.SelectedValue, k.safe_hint_type.HUMAN_NAME));
      }

    protected void Button_delete_Click(object sender, EventArgs e)
      {
      //if (p.biz_notifications.Delete(k.Safe(TextBox_name.Text, k.safe_hint_type.HUMAN_NAME)))
      //  {
      //  SetLookupMode();
      //  }
      //else
      //  {
      //  Alert(k.alert_cause_type.APPDATA, k.alert_state_type.FAILURE, "dependency", " Cannot delete this record because another record depends on it.", true);
      //  }
      Alert(k.alert_cause_type.LOGIC, k.alert_state_type.WARNING, "noimp", "Not implemented.", true);
      }

    protected void LinkButton_new_record_Click(object sender, EventArgs e)
      {
      Clear();
      TextBox_name.Enabled = p.be_ok_to_config_notifications;
      Button_lookup.Enabled = false;
      Label_lookup_arrow.Enabled = false;
      Label_lookup_hint.Enabled = false;
      LinkButton_reset.Enabled = true;
      LinkButton_new_record.Enabled = false;
      SetDependentFieldAblements(p.be_ok_to_config_notifications);
      Button_submit.Visible = p.be_ok_to_config_notifications;
      Button_delete.Visible = false;
      Focus(TextBox_name, true);
      }

    protected void LinkButton_reset_Click(object sender, EventArgs e)
      {
      SetLookupMode();
      }

    private void SetDependentFieldAblements(bool ablement)
      {
      }

    protected void Button_lookup_Click(object sender, EventArgs e)
      {
      Lookup();
      }

    private void Lookup(string initial_selection = k.EMPTY)
      {
      uint num_matches;
      string saved_name;
      saved_name = TextBox_name.Text;
      Clear();
      if (!PresentRecord(saved_name))
        {
        TextBox_name.Text = saved_name;
        p.biz_notifications.Bind(saved_name, DropDownList_name);
        num_matches = (uint)(DropDownList_name.Items.Count);
        if (num_matches > 0)
          {
          DropDownList_name.Visible = true;
          if (num_matches == 1)
            {
            PresentRecord(k.Safe(DropDownList_name.SelectedValue, k.safe_hint_type.HUMAN_NAME));
            }
          else
            {
            Literal_match_index.Text = "0";
            Literal_num_matches.Text = num_matches.ToString();
            Panel_match_numbers.Visible = true;
            LinkButton_go_to_match_prior.Visible = true;
            LinkButton_go_to_match_next.Visible = true;
            LinkButton_go_to_match_last.Visible = true;
            LinkButton_go_to_match_first.Visible = true;
            DropDownList_name.Items.Insert(0, new ListItem("-- Select --", k.EMPTY));
            }
          }
        }
      if (initial_selection.Length > 0)
        {
        p.notification_name = initial_selection;
        DropDownList_name.Items.FindByText(p.notification_name).Selected = true;
        PresentRecord(p.notification_name);
        }
      }

    private void BindHolders()
      {
      var agency_filter = k.EMPTY;
      bool be_notification_held_by_user;
      bool be_scope_change_allowable;
      p.biz_notifications.AnalyzeForNotificationComms
        (
        user_notification_string_array: p.user_notification_string_array,
        selected_notification_name: p.notification_name,
        be_scope_cross_agency: ref p.be_scope_cross_agency,
        be_notification_held_by_user: out be_notification_held_by_user,
        be_scope_change_allowable: out be_scope_change_allowable
        );
      if (p.be_scope_cross_agency)
        {
        RadioButtonList_scope.SelectedValue = "cross-agency";
        }
      else
        {
        agency_filter = p.biz_members.AgencyIdOfId(p.biz_members.IdOfUserId(p.biz_user.IdNum()));
        RadioButtonList_scope.SelectedValue = "your-agency-only";
        }
      RadioButtonList_scope.Visible = true;
      RadioButtonList_scope.Enabled = be_scope_change_allowable;
      p.biz_role_member_map.BindNotificationHolders
        (
        notification_name: p.notification_name,
        target: GridView_holders,
        sort_order: p.sort_order,
        be_sort_order_ascending: p.be_sort_order_ascending,
        agency_filter: agency_filter
        );
      p.be_gridview_empty = (p.num_gridview_rows == 0);
      Table_holders.Visible = true;
      TableRow_none.Visible = p.be_gridview_empty;
      GridView_holders.Visible = !p.be_gridview_empty;
      Label_distribution_list.Text = ((RadioButtonList_quick_message_mode.SelectedValue == "email" ? v.distribution_list_email : v.distribution_list_sms) + k.SPACE).TrimEnd(new char[] { Convert.ToChar(k.COMMA), Convert.ToChar(k.SPACE) });
      Label_num_rows.Text = p.num_gridview_rows.ToString();
      Table_quick_message.Visible = p.biz_notifications.BeOkToAllowNotificationCommsQuickMessaging
        (
        has_user_quickmessage_priv:k.Has((string[])(Session["privilege_array"]), "send-quickmessages"),
        be_notification_held_by_user:be_notification_held_by_user,
        be_any_notification_holders:!p.be_gridview_empty
        );
      //
      // Clear aggregation vars for next bind.
      //
      v.distribution_list_email.Clear();
      v.distribution_list_sms.Clear();
      p.num_gridview_rows = 0;
      //
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

    protected void RadioButtonList_scope_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.be_scope_cross_agency = (k.Safe(RadioButtonList_scope.SelectedValue,k.safe_hint_type.HYPHENATED_ALPHA) == "cross-agency");
      BindHolders();
      }

    protected void CheckBox_force_all_CheckedChanged(object sender, EventArgs e)
      {
      for (var i = new k.subtype<int>(0,GridView_holders.Rows.Count); i.val < i.LAST; i.val++)
        {
        (GridView_holders.Rows[i.val].Cells[Static.TCI_SELECT_FOR_QUICKMESSAGE].FindControl("CheckBox_selected") as CheckBox).Checked = (sender as CheckBox).Checked;
        }
      BuildDistributionListAndRegisterPostBackControls();
      }

    protected void CheckBox_selected_CheckedChanged(object sender, EventArgs e)
      {
      BuildDistributionListAndRegisterPostBackControls();
      }

    } // end TWebUserControl_notification

  }
