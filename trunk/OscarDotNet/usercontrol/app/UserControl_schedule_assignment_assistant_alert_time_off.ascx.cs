using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_schedule_assignment_assistant_alert_time_off
  {

  public struct p_type
    {
    public string agency_filter;
    public bool be_interactive;
    public bool be_loaded;
    public bool be_time_off_alert_datagrid_empty;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public TClass_msg_protected.member_schedule_detail msg_protected_member_schedule_detail;
    public uint num_time_off_alert_datagrid_rows;
    public k.subtype<int> relative_month;
    public string release_filter;
    }

  public partial class TWebUserControl_schedule_assignment_assistant_alert_time_off: ki_web_ui.usercontrol_class
    {

    public class UserControl_schedule_assignment_assistant_alert_time_off_Static
      {
      public const int TCI_NAME = 0;
      public const int TCI_MEMBER_ID = 1;
      public const int TCI_FIRST_NOMINAL_DAY = 2;
      public const int TCI_FIRST_SHIFT_NAME = 3;
      public const int TCI_FIRST_SCHEDULE_ASSIGNMENT_ID = 4;
      public const int TCI_TIME_OFF = 5;
      public const int TCI_SECOND_NOMINAL_DAY = 6;
      public const int TCI_SECOND_SHIFT_NAME = 7;
      public const int TCI_SECOND_SCHEDULE_ASSIGNMENT_ID = 8;
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
      if (Session["UserControl_schedule_assignment_assistant_alert_time_off.p"] != null)
        {
        p = (p_type)(Session["UserControl_schedule_assignment_assistant_alert_time_off.p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_schedule_binder_UserControl_schedule_assignment_assistant_binder_UserControl_schedule_assignment_assistant_alert_binder_PlaceHolder_content"] as string) == "UserControl_schedule_assignment_assistant_alert_time_off");
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        //
        p.agency_filter = k.EMPTY;
        p.be_interactive = !(Session["mode:report"] != null);
        p.msg_protected_member_schedule_detail = new TClass_msg_protected.member_schedule_detail();
        p.num_time_off_alert_datagrid_rows = 0;
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
      PreRender += TWebUserControl_schedule_assignment_assistant_alert_time_off_PreRender;
      }

    private void TWebUserControl_schedule_assignment_assistant_alert_time_off_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_schedule_assignment_assistant_alert_time_off.p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_alert_time_off Fresh()
      {
      Session.Remove("UserControl_schedule_assignment_assistant_alert_time_off.p");
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
      Bind();
      }

    private void Bind()
      {
      p.biz_schedule_assignments.BindTimeOffAlertBaseDataList(p.agency_filter,p.release_filter,p.relative_month,W);
      p.be_time_off_alert_datagrid_empty = (p.num_time_off_alert_datagrid_rows == 0);
      TableRow_none.Visible = p.be_time_off_alert_datagrid_empty;
      W.Visible = !p.be_time_off_alert_datagrid_empty;
      p.num_time_off_alert_datagrid_rows = 0;
      }

    protected void W_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      LinkButton link_button;
      var be_any_kind_of_item = (new ArrayList(new object[] {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}).Contains(e.Item.ItemType));
      if (be_any_kind_of_item)
        {
        e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_off_Static.TCI_FIRST_NOMINAL_DAY].Text = p.biz_schedule_assignments.MonthlessRenditionOfNominalDayShiftName
          (DateTime.Parse(e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_off_Static.TCI_FIRST_NOMINAL_DAY].Text),e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_off_Static.TCI_FIRST_SHIFT_NAME].Text);
        e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_off_Static.TCI_SECOND_NOMINAL_DAY].Text = p.biz_schedule_assignments.MonthlessRenditionOfNominalDayShiftName
          (DateTime.Parse(e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_off_Static.TCI_SECOND_NOMINAL_DAY].Text),e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_off_Static.TCI_SECOND_SHIFT_NAME].Text);
        //
        p.num_time_off_alert_datagrid_rows++;
        }
      if (p.be_interactive)
        {
        if (be_any_kind_of_item)
          {
          link_button = ((e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_off_Static.TCI_NAME].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          //
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_off_Static.TCI_MEMBER_ID].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_off_Static.TCI_FIRST_SCHEDULE_ASSIGNMENT_ID].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_off_Static.TCI_TIME_OFF].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_off_Static.TCI_SECOND_SCHEDULE_ASSIGNMENT_ID].EnableViewState = true;
          }
        }
      }

    protected void W_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      p.msg_protected_member_schedule_detail.member_id = k.Safe(e.Item.Cells[UserControl_schedule_assignment_assistant_alert_time_off_Static.TCI_MEMBER_ID].Text,k.safe_hint_type.NUM);
      p.msg_protected_member_schedule_detail.relative_month = p.relative_month;
      p.msg_protected_member_schedule_detail.scheduler_agency_id = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
      MessageDropCrumbAndTransferTo(p.msg_protected_member_schedule_detail,"protected","member_schedule_detail");
      }

    }

  }
