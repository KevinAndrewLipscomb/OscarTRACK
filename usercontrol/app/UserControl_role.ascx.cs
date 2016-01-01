using Class_biz_members;
using Class_biz_role_member_map;
using Class_biz_roles;
using Class_biz_tiers;
using Class_biz_user;
using kix;
using System;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_role
  {

  public partial class TWebUserControl_role: ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public bool be_gridview_empty;
      public bool be_loaded;
      public bool be_ok_to_config_roles;
      public bool be_scope_cross_agency;
      public bool be_sort_order_ascending;
      public TClass_biz_members biz_members;
      public TClass_biz_role_member_map biz_role_member_map;
      public TClass_biz_roles biz_roles;
      public TClass_biz_tiers biz_tiers;
      public TClass_biz_user biz_user;
      public string distribution_list;
      public uint num_gridview_rows;
      public string role_name;
      public string sort_order;
      public string[] user_role_string_array;
      }

    private p_type p;

    private void Clear()
      {
      TextBox_name.Text = k.EMPTY;
      DropDownList_name.Visible = false;
      DropDownList_tier.ClearSelection();
      TextBox_pecking_order.Text = k.EMPTY;
      TextBox_soft_hyphenation_text.Text = k.EMPTY;
      CheckBox_be_occasional.Checked = false;
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
        p.biz_tiers.BindListControl(DropDownList_tier, k.EMPTY, false, "Unselected");
        if (Session["mode:report"] == null)
          {
          Label_author_email_address.Text = p.biz_user.EmailAddress();
          if (p.be_ok_to_config_roles)
            {
            LinkButton_new_record.Visible = true;
            TableRow_pecking_order.Visible = true;
            TableRow_soft_hyphenation_text.Visible = true;
            TableRow_be_occasional.Visible = true;
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
        Lookup(p.user_role_string_array[0]);
        p.be_loaded = true;
        }
      }

    private bool PresentRecord(string name)
      {
      Literal_match_index.Text = DropDownList_name.SelectedIndex.ToString();
      bool result;
      string tier_id;
      string soft_hyphenation_text;
      string pecking_order;
      bool be_occasional;
      result = false;
      if (p.biz_roles.Get(name,out tier_id,out soft_hyphenation_text,out pecking_order,out be_occasional))
        {
        TextBox_name.Text = name;
        p.role_name = name;
        DropDownList_tier.SelectedValue = tier_id;
        TextBox_pecking_order.Text = pecking_order;
        TextBox_soft_hyphenation_text.Text = soft_hyphenation_text;
        CheckBox_be_occasional.Checked = be_occasional;
        TextBox_name.Enabled = false;
        Button_lookup.Enabled = false;
        Label_lookup_arrow.Enabled = false;
        Label_lookup_hint.Enabled = false;
        LinkButton_reset.Enabled = true;
        SetDependentFieldAblements(p.be_ok_to_config_roles);
        Button_submit.Visible = p.be_ok_to_config_roles;
        Button_delete.Visible = p.be_ok_to_config_roles;
        p.be_scope_cross_agency = (name != "Squad Check Signer");
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
      LinkButton_new_record.Enabled = p.be_ok_to_config_roles;
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
        //p.be_loaded = IsPostBack && ((Session["M_UserControl_config_UserControl_roles_and_matrices_binder_PlaceHolder_content"] as string) == "UserControl_role");
        //
        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
        // had it loaded already.
        //
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_config_roles_and_matrices_binder_role")
          {
          p.be_loaded &= ((Session["M_UserControl_config_UserControl_roles_and_matrices_binder_PlaceHolder_content"] as string) == "UserControl_role");
          }
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_members = new TClass_biz_members();
        p.biz_role_member_map = new TClass_biz_role_member_map();
        p.biz_roles = new TClass_biz_roles();
        p.biz_tiers = new TClass_biz_tiers();
        p.biz_user = new TClass_biz_user();
        //
        p.be_gridview_empty = true;
        p.be_ok_to_config_roles = k.Has((string[])(Session["privilege_array"]), "config-roles-and-matrices");
        p.be_scope_cross_agency = true;
        p.be_sort_order_ascending = true;
        p.distribution_list = k.EMPTY;
        p.num_gridview_rows = 0;
        p.role_name = k.EMPTY;
        p.sort_order = "member_name%";
        p.user_role_string_array = p.biz_user.Roles();
        }
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
      PreRender += TWebUserControl_role_PreRender;
      }

    private void TWebUserControl_role_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_role Fresh()
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
      e.Row.Cells[Class_db_role_member_map.Units.Class_db_role_member_map.ROLE_HOLDER_EMAIL_ADDRESS_CI].Visible = false;
      }

    private void GridView_holders_RowDataBound(object sender, GridViewRowEventArgs e)
      {
      if ((e.Row.RowType == DataControlRowType.DataRow) && (e.Row.Cells[Class_db_role_member_map.Units.Class_db_role_member_map.ROLE_HOLDER_EMAIL_ADDRESS_CI].Text != "&nbsp;"))
        {
        p.distribution_list = p.distribution_list + e.Row.Cells[Class_db_role_member_map.Units.Class_db_role_member_map.ROLE_HOLDER_EMAIL_ADDRESS_CI].Text + k.COMMA_SPACE;
        p.num_gridview_rows = p.num_gridview_rows + 1;
        }
      }

    protected void Button_send_Click(object sender, EventArgs e)
      {
      k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], Label_distribution_list.Text, TextBox_quick_message_subject.Text, "-- From " + p.user_role_string_array[0] + k.SPACE + p.biz_members.FirstNameOfMemberId(Session["member_id"].ToString()) + k.SPACE + p.biz_members.LastNameOfMemberId(Session["member_id"].ToString()) + " (" + p.biz_user.EmailAddress() + ") [via " + ConfigurationManager.AppSettings["application_name"] + "]" + k.NEW_LINE + k.NEW_LINE + TextBox_quick_message_body.Text, false, k.EMPTY, p.biz_user.EmailAddress(), p.biz_user.EmailAddress());
      TextBox_quick_message_subject.Text = k.EMPTY;
      TextBox_quick_message_body.Text = k.EMPTY;
      Alert(k.alert_cause_type.LOGIC, k.alert_state_type.NORMAL, "messagsnt", "Message sent", true);
      }

    protected void Button_submit_Click(object sender, EventArgs e)
      {
      if (Page.IsValid)
        {
        p.biz_roles.Set
          (
          k.Safe(TextBox_name.Text, k.safe_hint_type.HUMAN_NAME).Trim(),
          k.Safe(DropDownList_tier.SelectedValue, k.safe_hint_type.NUM).Trim(),
          k.Safe(TextBox_soft_hyphenation_text.Text, k.safe_hint_type.PUNCTUATED).Trim(),
          k.Safe(TextBox_pecking_order.Text, k.safe_hint_type.NUM).Trim(),
          CheckBox_be_occasional.Checked
          );
        Alert(k.alert_cause_type.USER, k.alert_state_type.SUCCESS, "recsaved", "Record saved.", true);
        SetLookupMode();
        }
      else
        {
        ValidationAlert(true);
        }
      }

    protected void DropDownList_name_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.role_name = k.Safe(DropDownList_name.SelectedValue, k.safe_hint_type.MAKE_MODEL);
      PresentRecord(p.role_name);
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
      if (p.biz_roles.Delete(k.Safe(TextBox_name.Text, k.safe_hint_type.HUMAN_NAME)))
        {
        SetLookupMode();
        }
      else
        {
        Alert(k.alert_cause_type.APPDATA, k.alert_state_type.FAILURE, "dependency", " Cannot delete this record because another record depends on it.", true);
        }
      }

    protected void LinkButton_new_record_Click(object sender, EventArgs e)
      {
      Clear();
      TextBox_name.Enabled = p.be_ok_to_config_roles;
      Button_lookup.Enabled = false;
      Label_lookup_arrow.Enabled = false;
      Label_lookup_hint.Enabled = false;
      LinkButton_reset.Enabled = true;
      LinkButton_new_record.Enabled = false;
      SetDependentFieldAblements(p.be_ok_to_config_roles);
      Button_submit.Visible = p.be_ok_to_config_roles;
      Button_delete.Visible = false;
      Focus(TextBox_name, true);
      }

    protected void LinkButton_reset_Click(object sender, EventArgs e)
      {
      SetLookupMode();
      }

    private void SetDependentFieldAblements(bool ablement)
      {
      DropDownList_tier.Enabled = ablement;
      TextBox_pecking_order.Enabled = ablement;
      TextBox_soft_hyphenation_text.Enabled = ablement;
      CheckBox_be_occasional.Enabled = ablement;
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
        p.biz_roles.Bind(saved_name, DropDownList_name);
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
        p.role_name = initial_selection;
        DropDownList_name.Items.FindByText(p.role_name).Selected = true;
        PresentRecord(p.role_name);
        }
      }

    private void BindHolders()
      {
      var be_role_held_by_user = (Array.IndexOf(p.user_role_string_array,p.role_name) > -1);
      var int_tier_of_user_highest_role = int.Parse(p.biz_roles.TierOfName(p.user_role_string_array[0]));
      var be_specified_role_in_superior_tier_to_user = (int.Parse(p.biz_roles.TierOfName(p.role_name)) < int_tier_of_user_highest_role);
      var agency_filter = k.EMPTY;
      p.be_scope_cross_agency = ((be_role_held_by_user && p.be_scope_cross_agency) || be_specified_role_in_superior_tier_to_user || (int_tier_of_user_highest_role < 2));
      if (p.be_scope_cross_agency)
        {
        RadioButtonList_scope.SelectedValue = "cross-agency";
        }
      else
        {
        agency_filter = p.biz_members.AgencyIdOfId(p.biz_members.IdOfUserId(p.biz_user.IdNum()));
        RadioButtonList_scope.SelectedValue = "your-agency-only";
        }
      RadioButtonList_scope.Visible = !be_specified_role_in_superior_tier_to_user;
      RadioButtonList_scope.Enabled = be_role_held_by_user || (int_tier_of_user_highest_role < 2);
      p.biz_role_member_map.BindHolders
        (
        role_name:p.role_name,
        target:GridView_holders,
        sort_order:p.sort_order,
        be_sort_order_ascending:p.be_sort_order_ascending,
        agency_filter:agency_filter
        );
      p.be_gridview_empty = (p.num_gridview_rows == 0);
      Table_holders.Visible = true;
      TableRow_none.Visible = p.be_gridview_empty;
      GridView_holders.Visible = !p.be_gridview_empty;
      Label_distribution_list.Text = (p.distribution_list + k.SPACE).TrimEnd(new char[] {Convert.ToChar(k.COMMA), Convert.ToChar(k.SPACE)});
      Label_num_rows.Text = p.num_gridview_rows.ToString();
      var be_user_authorized_to_send_quickmessages =
        (
          (
            (
              k.Has((string[])(Session["privilege_array"]), "send-quickmessages")
            &&
              !be_specified_role_in_superior_tier_to_user
            )
          ||
            be_role_held_by_user
          )
        &&
          !p.be_gridview_empty
        );
      Table_quick_message.Visible = be_user_authorized_to_send_quickmessages;
      // Clear aggregation vars for next bind, if any.
      p.distribution_list = k.EMPTY;
      p.num_gridview_rows = 0;
      }

    protected void RadioButtonList_scope_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.be_scope_cross_agency = (k.Safe(RadioButtonList_scope.SelectedValue,k.safe_hint_type.HYPHENATED_ALPHA) == "cross-agency");
      BindHolders();
      }
    } // end TWebUserControl_role

  }
