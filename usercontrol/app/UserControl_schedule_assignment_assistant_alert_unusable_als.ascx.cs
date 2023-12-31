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

  public partial class TWebUserControl_schedule_assignment_assistant_alert_unusable_als: ki_web_ui.usercontrol_class
    {

    private static class Static
      {
      public const int TCI_NOMINAL_DAY = 0;
      public const int TCI_SHIFT_NAME = 1;
      public const int TCI_POST_DESIGNATOR = 2;
      }

    private struct p_type
      {
      public string agency_filter;
      public bool be_interactive;
      public bool be_loaded;
      public bool be_unusable_als_alert_datagrid_empty;
      public bool be_user_privileged_to_see_all_squads;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_members biz_members;
      public TClass_biz_schedule_assignments biz_schedule_assignments;
      public TClass_msg_protected.overview msg_protected_overview;
      public uint num_unusable_als_alert_datagrid_rows;
      public string own_agency;
      public k.subtype<int> relative_month;
      public string release_filter;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

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
        p.be_loaded = IsPostBack && ((Session["M_S_G_UserControl_schedule_assignment_assistant_alert_binder_PlaceHolder_content"] as string) == "UserControl_schedule_assignment_assistant_alert_unusable_als");
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        //
        p.agency_filter = k.EMPTY;
        p.be_interactive = !(Session["mode:report"] != null);
        p.be_user_privileged_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
        p.msg_protected_overview = new TClass_msg_protected.overview();
        p.num_unusable_als_alert_datagrid_rows = 0;
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
      PreRender += TWebUserControl_schedule_assignment_assistant_alert_unusable_als_PreRender;
      }

    private void TWebUserControl_schedule_assignment_assistant_alert_unusable_als_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_alert_unusable_als Fresh()
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
      Bind();
      }

    private void Bind()
      {
      p.biz_schedule_assignments.BindInsufficientDriversAlertBaseDataList(p.agency_filter,p.relative_month,W);
      p.be_unusable_als_alert_datagrid_empty = (p.num_unusable_als_alert_datagrid_rows == 0);
      TableRow_none.Visible = p.be_unusable_als_alert_datagrid_empty;
      W.Visible = !p.be_unusable_als_alert_datagrid_empty;
      p.num_unusable_als_alert_datagrid_rows = 0;
      }

    protected void W_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      LinkButton link_button;
      var be_any_kind_of_item = (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType));
      if (be_any_kind_of_item)
        {
        ((e.Item.Cells[Static.TCI_NOMINAL_DAY].Controls[0]) as LinkButton).Text = p.biz_schedule_assignments.MonthlessRenditionOfNominalDayShiftName
          (DateTime.Parse(((e.Item.Cells[Static.TCI_NOMINAL_DAY].Controls[0]) as LinkButton).Text),e.Item.Cells[Static.TCI_SHIFT_NAME].Text);
        //
        p.num_unusable_als_alert_datagrid_rows++;
        }
      if (p.be_interactive)
        {
        if (be_any_kind_of_item)
          {
          link_button = ((e.Item.Cells[Static.TCI_NOMINAL_DAY].Controls[0]) as LinkButton);
          link_button.Enabled = (p.be_user_privileged_to_see_all_squads || p.biz_agencies.BeAgencyResponsibleForPost(p.own_agency,p.biz_agencies.IdOfShortDesignator(e.Item.Cells[Static.TCI_POST_DESIGNATOR].Text)));
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[Static.TCI_NOMINAL_DAY].EnableViewState = true;
          }
        }
      }

    protected void W_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      p.msg_protected_overview.target = "/schedule/assignment-assistant/" + p.relative_month.val.ToString() + "/proposal/";
      MessageDropCrumbAndTransferTo(p.msg_protected_overview,"protected","overview",k.Safe(((e.Item.Cells[Static.TCI_NOMINAL_DAY].Controls[0]) as LinkButton).Text,k.safe_hint_type.NUM));
      }

    }

  }
