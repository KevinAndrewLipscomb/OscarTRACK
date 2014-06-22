using Class_biz_members;
using Class_biz_privileges;
using Class_biz_schedule_assignments;
using Class_biz_user;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_schedule_assignment_assistant_alert_time_on
  {

  public struct p_type
    {
    public string agency_filter;
    public bool be_interactive;
    public bool be_loaded;
    public bool be_ok_to_edit_schedule_for_special_agency;
    public bool be_time_on_alert_datagrid_empty;
    public bool be_user_privileged_to_see_all_squads;
    public TClass_biz_members biz_members;
    public TClass_biz_privileges biz_privileges;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public TClass_biz_user biz_user;
    public TClass_msg_protected.member_schedule_detail msg_protected_member_schedule_detail;
    public uint num_time_on_alert_datagrid_rows;
    public string own_agency;
    public k.subtype<int> relative_month;
    public string release_filter;
    }

  public partial class TWebUserControl_schedule_assignment_assistant_alert_time_on: ki_web_ui.usercontrol_class
    {

    public class UserControl_schedule_assignment_assistant_alert_time_on_Static
      {
      public const int TCI_NOMINAL_DAY = 0;
      public const int TCI_SHIFT_NAME = 1;
      public const int TCI_NAME = 2;
      public const int TCI_MEMBER_ID = 3;
      public const int TCI_AGENCY_ID = 4;
      public const int TCI_TIME_ON = 5;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        //
        Bind();
        //
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
        p.be_loaded = IsPostBack && ((Session["M_S_G_UserControl_schedule_assignment_assistant_alert_binder_PlaceHolder_content"] as string) == "UserControl_schedule_assignment_assistant_alert_time_on");
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_members = new TClass_biz_members();
        p.biz_privileges = new TClass_biz_privileges();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        p.biz_user = new TClass_biz_user();
        //
        p.agency_filter = k.EMPTY;
        p.be_interactive = !(Session["mode:report"] != null);
        p.be_user_privileged_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
        p.msg_protected_member_schedule_detail = new TClass_msg_protected.member_schedule_detail();
        p.num_time_on_alert_datagrid_rows = 0;
        p.own_agency = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
        p.relative_month = new k.subtype<int>(0,1);
        p.release_filter = k.EMPTY;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_schedule_assignment_assistant_alert_time_on_PreRender;
      }

    private void TWebUserControl_schedule_assignment_assistant_alert_time_on_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_alert_time_on Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    internal void SetFilter
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month
      )
      {
      p.agency_filter = agency_filter;
      p.release_filter = release_filter;
      p.relative_month = relative_month;
      p.be_ok_to_edit_schedule_for_special_agency = p.biz_privileges.HasForSpecialAgency(member_id:p.biz_members.IdOfUserId(p.biz_user.IdNum()),privilege_name:"edit-schedule",agency_id:p.agency_filter);
      Bind();
      }

    private void Bind()
      {
      var be_suppressed = true;
      var own_agency = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
      if (p.be_user_privileged_to_see_all_squads)
        {
        be_suppressed = false;
        p.biz_schedule_assignments.BindTimeOnAlertBaseDataList(p.agency_filter,p.release_filter,p.relative_month,W);
        }
      else if
        (
          (k.Has(Session["privilege_array"] as string[],"edit-schedule") && (p.agency_filter == own_agency || p.agency_filter == k.EMPTY))
        ||
          p.be_ok_to_edit_schedule_for_special_agency
        )
        {
        be_suppressed = false;
        p.biz_schedule_assignments.BindTimeOnAlertBaseDataList
          (
          agency_filter:(p.agency_filter.Length > 0 ? p.agency_filter : own_agency),
          release_filter:p.release_filter,
          relative_month:p.relative_month,
          target:W
          );
        }
      Panel_supressed.Visible = be_suppressed;
      Table_data.Visible = !be_suppressed;
      p.be_time_on_alert_datagrid_empty = (p.num_time_on_alert_datagrid_rows == 0);
      TableRow_none.Visible = p.be_time_on_alert_datagrid_empty;
      W.Visible = !p.be_time_on_alert_datagrid_empty;
      p.num_time_on_alert_datagrid_rows = 0;
      }

    protected void W_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      LinkButton link_button;
      var be_any_kind_of_item = (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType));
      if (be_any_kind_of_item)
        {
        e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_on_Static.TCI_NOMINAL_DAY].Text = p.biz_schedule_assignments.MonthlessRenditionOfNominalDayShiftName
          (DateTime.Parse(e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_on_Static.TCI_NOMINAL_DAY].Text),e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_on_Static.TCI_SHIFT_NAME].Text);
        //
        p.num_time_on_alert_datagrid_rows++;
        }
      if (p.be_interactive)
        {
        if (be_any_kind_of_item)
          {
          link_button = ((e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_on_Static.TCI_NAME].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          link_button.Enabled =
            (
              p.be_user_privileged_to_see_all_squads
            ||
              (k.Has(Session["privilege_array"] as string[],"edit-schedule") && (e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_on_Static.TCI_AGENCY_ID].Text == p.own_agency))
            ||
              p.be_ok_to_edit_schedule_for_special_agency
            );
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_on_Static.TCI_MEMBER_ID].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_on_Static.TCI_AGENCY_ID].EnableViewState = true;
          }
        }
      }

    protected void W_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      p.msg_protected_member_schedule_detail.member_id = k.Safe(e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_on_Static.TCI_MEMBER_ID].Text,k.safe_hint_type.NUM);
      p.msg_protected_member_schedule_detail.relative_month = p.relative_month;
      p.msg_protected_member_schedule_detail.member_agency_id = k.Safe(e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_on_Static.TCI_AGENCY_ID].Text,k.safe_hint_type.NUM);
      MessageDropCrumbAndTransferTo(p.msg_protected_member_schedule_detail,"protected","member_schedule_detail");
      }

    }

  }
