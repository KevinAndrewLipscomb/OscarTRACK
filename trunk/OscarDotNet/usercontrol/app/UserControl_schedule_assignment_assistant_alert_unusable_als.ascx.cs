using Class_biz_agencies;
using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_schedule_assignment_assistant_alert_unusable_als
  {

  public struct p_type
    {
    public string agency_filter;
    public bool be_interactive;
    public bool be_loaded;
    public bool be_user_privileged_to_see_all_squads;
    public bool be_unusable_als_alert_datagrid_empty;
    public TClass_biz_agencies biz_agencies;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public TClass_msg_protected.investigate_unusable_als_alert msg_protected_investigate_unusable_als_alert;
    public uint num_unusable_als_alert_datagrid_rows;
    public k.subtype<int> relative_month;
    public string release_filter;
    }

  public partial class TWebUserControl_schedule_assignment_assistant_alert_unusable_als: ki_web_ui.usercontrol_class
    {

    public class UserControl_schedule_assignment_assistant_alert_unusable_als_Static
      {
      public const int TCI_UNUSABLE_ALS_ALERT_NAME = 0;
      public const int TCI_UNUSABLE_ALS_ALERT_MEMBER_ID = 1;
      public const int TCI_UNUSABLE_ALS_ALERT_FIRST_NOMINAL_DAY = 2;
      public const int TCI_UNUSABLE_ALS_ALERT_FIRST_SHIFT_NAME = 3;
      public const int TCI_UNUSABLE_ALS_ALERT_FIRST_SCHEDULE_ASSIGNMENT_ID = 4;
      public const int TCI_UNUSABLE_ALS_ALERT_UNUSABLE_ALS = 5;
      public const int TCI_UNUSABLE_ALS_ALERT_SECOND_NOMINAL_DAY = 6;
      public const int TCI_UNUSABLE_ALS_ALERT_SECOND_SHIFT_NAME = 7;
      public const int TCI_UNUSABLE_ALS_ALERT_SECOND_SCHEDULE_ASSIGNMENT_ID = 8;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.biz_agencies.BindListControlShort(DropDownList_agency_filter);
        DropDownList_agency_filter.SelectedValue = p.agency_filter;
        DropDownList_release_filter.SelectedValue = p.release_filter;
        RadioButtonList_which_month.SelectedValue = p.relative_month.val.ToString();
        RadioButtonList_which_month.Enabled = p.biz_schedule_assignments.BeOkToWorkOnNextMonth();
        //
        p.biz_schedule_assignments.Update(p.relative_month.val.ToString());
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
      if (Session["UserControl_schedule_assignment_assistant_alert_unusable_als.p"] != null)
        {
        p = (p_type)(Session["UserControl_schedule_assignment_assistant_alert_unusable_als.p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_schedule_binder_UserControl_schedule_assignment_assistant_binder_UserControl_schedule_assignment_assistant_alert_binder_PlaceHolder_content"] as string) == "UserControl_schedule_assignment_assistant_alert_unusable_als");
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        //
        p.be_interactive = !(Session["mode:report"] != null);
        p.be_user_privileged_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
        if (p.be_user_privileged_to_see_all_squads)
          {
          p.agency_filter = k.EMPTY;
          }
        else
          {
          p.agency_filter = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
          }
        p.msg_protected_investigate_unusable_als_alert = new TClass_msg_protected.investigate_unusable_als_alert();
        p.num_unusable_als_alert_datagrid_rows = 0;
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
      PreRender += TWebUserControl_schedule_assignment_assistant_alert_unusable_als_PreRender;
      }

    private void TWebUserControl_schedule_assignment_assistant_alert_unusable_als_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_schedule_assignment_assistant_alert_unusable_als.p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_alert_unusable_als Fresh()
      {
      Session.Remove("UserControl_schedule_assignment_assistant_alert_unusable_als.p");
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

    protected void Button_refresh_Click(object sender, System.EventArgs e)
      {
      Bind();
      }

    protected void DropDownList_agency_filter_SelectedIndexChanged(object sender, System.EventArgs e)
      {
      p.agency_filter = k.Safe(DropDownList_agency_filter.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    protected void DropDownList_release_filter_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.release_filter = k.Safe(DropDownList_release_filter.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    protected void RadioButtonList_which_month_SelectedIndexChanged(object sender, System.EventArgs e)
      {
      p.relative_month.val = int.Parse(k.Safe(RadioButtonList_which_month.SelectedValue,k.safe_hint_type.NUM));
      p.biz_schedule_assignments.Update(p.relative_month.val.ToString());
      Bind();
      }

    private void Bind()
      {
      //p.biz_schedule_assignments.BindUnusableAlsAlertBaseDataList(p.agency_filter,p.release_filter,p.relative_month,W);
      p.be_unusable_als_alert_datagrid_empty = (p.num_unusable_als_alert_datagrid_rows == 0);
      TableRow_unusable_als_alert_none.Visible = p.be_unusable_als_alert_datagrid_empty;
      W.Visible = !p.be_unusable_als_alert_datagrid_empty;
      p.num_unusable_als_alert_datagrid_rows = 0;
      }

    protected void W_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      LinkButton link_button;
      var be_any_kind_of_item = (new ArrayList(new object[] {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}).Contains(e.Item.ItemType));
      if (be_any_kind_of_item)
        {
        e.Item.Cells[UserControl_schedule_assignment_assistant_alert_unusable_als_Static.TCI_UNUSABLE_ALS_ALERT_FIRST_NOMINAL_DAY].Text = p.biz_schedule_assignments.MonthlessRenditionOfNominalDayShiftName
          (DateTime.Parse(e.Item.Cells[UserControl_schedule_assignment_assistant_alert_unusable_als_Static.TCI_UNUSABLE_ALS_ALERT_FIRST_NOMINAL_DAY].Text),e.Item.Cells[UserControl_schedule_assignment_assistant_alert_unusable_als_Static.TCI_UNUSABLE_ALS_ALERT_FIRST_SHIFT_NAME].Text);
        e.Item.Cells[UserControl_schedule_assignment_assistant_alert_unusable_als_Static.TCI_UNUSABLE_ALS_ALERT_SECOND_NOMINAL_DAY].Text = p.biz_schedule_assignments.MonthlessRenditionOfNominalDayShiftName
          (DateTime.Parse(e.Item.Cells[UserControl_schedule_assignment_assistant_alert_unusable_als_Static.TCI_UNUSABLE_ALS_ALERT_SECOND_NOMINAL_DAY].Text),e.Item.Cells[UserControl_schedule_assignment_assistant_alert_unusable_als_Static.TCI_UNUSABLE_ALS_ALERT_SECOND_SHIFT_NAME].Text);
        //
        p.num_unusable_als_alert_datagrid_rows++;
        }
      if (p.be_interactive)
        {
        if (be_any_kind_of_item)
          {
          link_button = ((e.Item.Cells[UserControl_schedule_assignment_assistant_alert_unusable_als_Static.TCI_UNUSABLE_ALS_ALERT_NAME].Controls[0]) as LinkButton);
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
          e.Item.Cells[UserControl_schedule_assignment_assistant_alert_unusable_als_Static.TCI_UNUSABLE_ALS_ALERT_MEMBER_ID].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_assignment_assistant_alert_unusable_als_Static.TCI_UNUSABLE_ALS_ALERT_FIRST_SCHEDULE_ASSIGNMENT_ID].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_assignment_assistant_alert_unusable_als_Static.TCI_UNUSABLE_ALS_ALERT_UNUSABLE_ALS].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_assignment_assistant_alert_unusable_als_Static.TCI_UNUSABLE_ALS_ALERT_SECOND_SCHEDULE_ASSIGNMENT_ID].EnableViewState = true;
          }
        }
      }

    protected void W_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      p.msg_protected_investigate_unusable_als_alert.member_id = k.Safe(e.Item.Cells[UserControl_schedule_assignment_assistant_alert_unusable_als_Static.TCI_UNUSABLE_ALS_ALERT_MEMBER_ID].Text,k.safe_hint_type.NUM);
      p.msg_protected_investigate_unusable_als_alert.relative_month = p.relative_month;
      p.msg_protected_investigate_unusable_als_alert.scheduler_agency_id = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
      MessageDropCrumbAndTransferTo(p.msg_protected_investigate_unusable_als_alert,"protected","investigate_unusable_als_alert");
      }

    }

  }
