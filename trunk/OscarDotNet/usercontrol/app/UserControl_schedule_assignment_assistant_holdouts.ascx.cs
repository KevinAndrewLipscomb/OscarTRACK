using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_biz_user;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_schedule_assignment_assistant_holdouts
  {

  public struct p_type
    {
    public string agency_filter;
    public bool be_sort_order_ascending;
    public bool be_datagrid_empty;
    public bool be_interactive;
    public bool be_loaded;
    public bool be_post_publish_submissions_detected;
    public bool be_user_privileged_to_see_all_squads;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public TClass_biz_user biz_user;
    public string compliancy_filter;
    public string distribution_list;
    public TClass_msg_protected.member_schedule_detail msg_protected_member_schedule_detail;
    public uint num_datagrid_rows;
    public k.subtype<int> relative_month;
    public string release_filter;
    public string sort_order;
    }

  public partial class TWebUserControl_schedule_assignment_assistant_holdouts: ki_web_ui.usercontrol_class
    {

    public class UserControl_schedule_assignment_assistant_holdouts_Static
      {
      public const int TCI_NAME = 0;
      public const int TCI_MEMBER_ID = 1;
      public const int TCI_BE_RELEASED = 2;
      public const int TCI_BE_COMPLIANT = 3;
      public const int TCI_COMPLIANCY_MARK = 4;
      public const int TCI_BE_NOTIFICATION_PENDING = 5;
      public const int TCI_EMAIL_ADDRESS = 6;
      public const int TCI_PHONE_NUM = 7;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        DropDownList_compliancy.SelectedValue = p.compliancy_filter;
        Bind();
        Literal_author_email_address.Text = p.biz_user.EmailAddress();
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["M_S_G_PlaceHolder_content"] as string) == "UserControl_schedule_assignment_assistant_holdouts");
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
        p.be_interactive = !(Session["mode:report"] != null);
        p.be_user_privileged_to_see_all_squads = k.Has((Session["privilege_array"] as string[]), "see-all-squads");
        p.be_sort_order_ascending = true;
        p.compliancy_filter = "0";
        p.distribution_list = k.EMPTY;
        p.msg_protected_member_schedule_detail = new TClass_msg_protected.member_schedule_detail();
        p.num_datagrid_rows = 0;
        p.relative_month = new k.subtype<int>(0,1);
        p.release_filter = k.EMPTY;
        p.sort_order = "member.last_name,member.first_name";
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_schedule_assignment_assistant_holdouts_PreRender;
      }

    private void TWebUserControl_schedule_assignment_assistant_holdouts_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_holdouts Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    internal void SetFilter
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month,
      bool be_post_publish_submissions_detected
      )
      {
      p.agency_filter = agency_filter;
      p.release_filter = release_filter;
      p.relative_month = relative_month;
      p.be_post_publish_submissions_detected = be_post_publish_submissions_detected;
      Bind();
      }

    protected void DropDownList_compliancy_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.compliancy_filter = k.Safe(DropDownList_compliancy.SelectedValue,k.safe_hint_type.ALPHANUM);
      Bind();
      }

    private void Bind()
      {
      p.distribution_list = k.EMPTY;
      var be_suppressed = true;
      var own_agency = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
      DataGrid_control.Columns[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_BE_NOTIFICATION_PENDING].Visible =
        p.be_post_publish_submissions_detected && (new ArrayList {k.EMPTY,"1"}).Contains(p.compliancy_filter);
      if (p.be_user_privileged_to_see_all_squads)
        {
        be_suppressed = false;
        p.biz_schedule_assignments.BindSubmissionCompliancyBaseDataList(p.sort_order,p.be_sort_order_ascending,DataGrid_control,p.agency_filter,p.release_filter,p.relative_month,p.compliancy_filter);
        }
      else if (p.agency_filter == own_agency || p.agency_filter == k.EMPTY)
        {
        be_suppressed = false;
        p.biz_schedule_assignments.BindSubmissionCompliancyBaseDataList(p.sort_order,p.be_sort_order_ascending,DataGrid_control,own_agency,p.release_filter,p.relative_month,p.compliancy_filter);
        }
      Panel_supressed.Visible = be_suppressed;
      Table_data.Visible = !be_suppressed;
      p.be_datagrid_empty = (p.num_datagrid_rows == 0);
      Literal_num_members.Text = p.num_datagrid_rows.ToString();
      DataGrid_control.Visible = !be_suppressed && !p.be_datagrid_empty;
      TableRow_none.Visible = !be_suppressed && p.be_datagrid_empty;
      Table_quick_message.Visible = !be_suppressed;
      //
      p.num_datagrid_rows = 0;
      }

    protected void DataGrid_control_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      LinkButton link_button;
      var be_any_kind_of_item = (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType));
      if (be_any_kind_of_item)
        {
        e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_PHONE_NUM].Text = k.FormatAsNanpPhoneNum(e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_PHONE_NUM].Text);
        //
        var compliancy_text = e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_BE_COMPLIANT].Text;
        if (compliancy_text == "0")
          {
          var holdout_email_address_value = e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_EMAIL_ADDRESS].Text;
          if (holdout_email_address_value != "&nbsp;")
            {
            p.distribution_list += k.Safe(holdout_email_address_value,k.safe_hint_type.EMAIL_ADDRESS) + k.COMMA;
            }
          e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_NAME].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_BE_RELEASED].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_EMAIL_ADDRESS].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_PHONE_NUM].Font.Bold = true;
          e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_COMPLIANCY_MARK].FindControl("Image_noncompliant").Visible = true;
          }
        else
          {
          LabelizeAndSetTextForeColor(e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_BE_RELEASED],Color.Gray);
          LabelizeAndSetTextForeColor(e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_EMAIL_ADDRESS],Color.Gray);
          LabelizeAndSetTextForeColor(e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_PHONE_NUM],Color.Gray);
          e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_COMPLIANCY_MARK].FindControl("Image_compliant").Visible = (compliancy_text == "1");
          //
          if (p.be_post_publish_submissions_detected)
            {
            LabelizeAndSetTextForeColor(e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_BE_NOTIFICATION_PENDING],Color.DarkOrange);
            }
          }
        p.num_datagrid_rows++;
        }
      if (p.be_interactive)
        {
        if (be_any_kind_of_item)
          {
          link_button = ((e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_NAME].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          //
          // Remove all cell controls from viewstate.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_MEMBER_ID].EnableViewState = true;
          }
        }
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

    protected void Button_send_Click(object sender, System.EventArgs e)
      {
      k.SmtpMailSend
        (
        ConfigurationManager.AppSettings["sender_email_address"],
        p.distribution_list.Trim(new char[] {Convert.ToChar(k.COMMA)}),
        TextBox_quick_message_subject.Text,
         "-- From " + p.biz_user.Roles()[0] + k.SPACE + p.biz_members.FirstNameOfMemberId(Session["member_id"].ToString()) + k.SPACE + p.biz_members.LastNameOfMemberId(Session["member_id"].ToString()) + " (" + p.biz_user.EmailAddress() + ") [via " + ConfigurationManager.AppSettings["application_name"] + "]" + k.NEW_LINE + k.NEW_LINE + TextBox_quick_message_body.Text,
        false,
        k.EMPTY,
        p.biz_user.EmailAddress(),
        p.biz_user.EmailAddress()
        );
      TextBox_quick_message_subject.Text = k.EMPTY;
      TextBox_quick_message_body.Text = k.EMPTY;
      Alert(k.alert_cause_type.LOGIC, k.alert_state_type.NORMAL, "messagsnt", "Message sent", true);
      // Apparently we must call RegisterPostBackControl on all the linkbuttons again.
      Bind();
      }

    protected void DataGrid_control_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      if (new ArrayList {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}.Contains(e.Item.ItemType))
        {
        p.msg_protected_member_schedule_detail.member_id = k.Safe(e.Item.Cells[UserControl_schedule_assignment_assistant_holdouts_Static.TCI_MEMBER_ID].Text,k.safe_hint_type.NUM);
        p.msg_protected_member_schedule_detail.relative_month = p.relative_month;
        p.msg_protected_member_schedule_detail.member_agency_id = p.biz_members.AgencyIdOfId(p.msg_protected_member_schedule_detail.member_id);
        MessageDropCrumbAndTransferTo(p.msg_protected_member_schedule_detail,"protected","member_schedule_detail");
        }
      }

    }

  }
