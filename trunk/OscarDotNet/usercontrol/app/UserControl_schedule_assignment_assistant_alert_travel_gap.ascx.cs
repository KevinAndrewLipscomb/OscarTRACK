using AjaxControlToolkit;
using Class_biz_members;
using Class_biz_privileges;
using Class_biz_schedule_assignments;
using Class_biz_user;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Web.UI.WebControls;

namespace UserControl_schedule_assignment_assistant_alert_travel_gap
  {

  public struct p_type
    {
    public string agency_filter;
    public bool be_for_muster;
    public bool be_interactive;
    public bool be_lineup;
    public bool be_loaded;
    public bool be_ok_to_edit_schedule_for_selected_special_agency;
    public bool be_travel_gap_alert_datagrid_empty;
    public bool be_user_privileged_to_see_all_squads;
    public TClass_biz_members biz_members;
    public TClass_biz_privileges biz_privileges;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public TClass_biz_user biz_user;
    public TClass_msg_protected.overview msg_protected_overview;
    public uint num_travel_gap_alert_datagrid_rows;
    public string own_agency;
    public k.subtype<int> relative_month;
    public string release_filter;
    }

  public partial class TWebUserControl_schedule_assignment_assistant_alert_travel_gap: ki_web_ui.usercontrol_class
    {

    public class UserControl_schedule_assignment_assistant_alert_travel_gap_Static
      {
      //
      // Place invisible columns first so column-spanning will be more straightforward.
      //
      public const int TCI_MEMBER_ID = 0;
      public const int TCI_AGENCY_ID = 1;
      public const int TCI_GAP_DAY = 2;
      public const int TCI_GAP_TIME = 3;
      public const int TCI_SPACER_1 = 4;
      public const int TCI_NAME = 5;
      public const int TCI_MEMBER_AGENCY_DESIGNATOR = 6;
      public const int TCI_SPACER_2 = 7;
      public const int TCI_POST_FROM = 8;
      public const int TCI_COMMENT_FROM = 9;
      public const int TCI_SPACER_3 = 10;
      public const int TCI_POST_TO = 11;
      public const int TCI_COMMENT_TO = 12;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        TableRow_guidance.Visible = p.be_interactive;
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
      var instance_id = InstanceId();
      if (Session[instance_id + ".p"] != null)
        {
        p = (p_type)(Session[instance_id + ".p"]);
        p.be_loaded = IsPostBack;  // This test is sufficient if this control is being used statically on its page.
        //
        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
        // had it loaded already.
        //
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_S_G_schedule_assignment_assistant_alert_binder_schedule_assignment_assistant_alert_travel_gap")
          {
          p.be_loaded &= ((Session["M_S_G_UserControl_schedule_assignment_assistant_alert_binder_PlaceHolder_content"] as string) == "UserControl_schedule_assignment_assistant_alert_travel_gap");
          }
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
        p.be_lineup = (Session["mode:report/commanded-lineup"] != null);
        p.be_user_privileged_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
        p.msg_protected_overview = new TClass_msg_protected.overview();
        p.num_travel_gap_alert_datagrid_rows = 0;
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
      PreRender += TWebUserControl_schedule_assignment_assistant_alert_travel_gap_PreRender;
      }

    private void TWebUserControl_schedule_assignment_assistant_alert_travel_gap_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_alert_travel_gap Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    internal void SetBeForMuster(bool be_for_muster)
      {
      p.be_for_muster = be_for_muster;
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
      p.be_ok_to_edit_schedule_for_selected_special_agency = p.biz_privileges.HasForSpecialAgency(member_id:p.biz_members.IdOfUserId(p.biz_user.IdNum()),privilege_name:"edit-schedule",agency_id:p.agency_filter);
      Bind();
      }

    internal void SetInteractivity(bool be_interactive)
      {
      p.be_interactive = be_interactive;
      }

    private void Bind()
      {
      var be_suppressed = true;
      var dummy_string = k.EMPTY;
      var own_agency = p.biz_members.AgencyIdOfId(Session["member_id"].ToString());
      var post_footprint = k.EMPTY;
      p.biz_schedule_assignments.GetAgencyFootprintInfo
        (
        agency_filter:p.agency_filter,
        relative_month:p.relative_month,
        nominal_day_filter:k.EMPTY,
        posts:out post_footprint,
        max_post_cardinality:out dummy_string
        );
      if (p.be_user_privileged_to_see_all_squads)
        {
        be_suppressed = false;
        p.biz_schedule_assignments.BindTravelGapAlertBaseDataList(p.agency_filter,p.release_filter,p.relative_month,W,post_footprint,p.be_lineup,p.be_for_muster);
        }
      else if
        (
          (k.Has(Session["privilege_array"] as string[],"edit-schedule") && (p.agency_filter == own_agency || p.agency_filter == k.EMPTY))
        ||
          p.be_ok_to_edit_schedule_for_selected_special_agency
        )
        {
        be_suppressed = false;
        p.biz_schedule_assignments.BindTravelGapAlertBaseDataList
          (
          agency_filter:(p.agency_filter.Length > 0 ? p.agency_filter : own_agency),
          release_filter:p.release_filter,relative_month:p.relative_month,
          target:W,
          post_footprint:post_footprint,
          be_lineup:p.be_lineup,
          be_for_muster:p.be_for_muster
          );
        }
      Panel_supressed.Visible = be_suppressed;
      Table_data.Visible = !be_suppressed;
      p.be_travel_gap_alert_datagrid_empty = (p.num_travel_gap_alert_datagrid_rows == 0);
      TableRow_none.Visible = p.be_travel_gap_alert_datagrid_empty;
      W.Visible = !p.be_travel_gap_alert_datagrid_empty;
      p.num_travel_gap_alert_datagrid_rows = 0;
      }

    protected void W_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      LinkButton link_button;
      var be_any_kind_of_item = (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType));
      if (e.Item.ItemType == ListItemType.Header)
        {
        //
        // Since indices will be pointing to moving targets, establish links to objects instead, and manipulate objects.  This is only straightforward if invisible columns are placed first.
        //
        var gap_day_cell = e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_GAP_DAY];
        var gap_time_cell = e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_GAP_TIME];
        var post_from_cell = e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_POST_FROM];
        var comment_from_cell = e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_COMMENT_FROM];
        var post_to_cell = e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_POST_TO];
        var comment_to_cell = e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_COMMENT_TO];
        gap_day_cell.ColumnSpan = 2;
        e.Item.Cells.Remove(gap_time_cell);
        post_from_cell.ColumnSpan = 2;
        e.Item.Cells.Remove(comment_from_cell);
        post_to_cell.ColumnSpan = 2;
        e.Item.Cells.Remove(comment_to_cell);
        }
      else if (be_any_kind_of_item)
        {
        e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_GAP_DAY].Text = p.biz_schedule_assignments.MonthlessRenditionOfNominalDayShiftName
          (DateTime.Parse(e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_GAP_DAY].Text),"DAY")
          .Replace(" DAY",k.EMPTY);
        //
        var member_agency_id = k.Safe(e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_AGENCY_ID].Text,k.safe_hint_type.NUM);
        if (member_agency_id != k.EMPTY)
          {
          ((e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_MEMBER_AGENCY_DESIGNATOR].Controls[0]) as Label).Text =
            (member_agency_id == p.agency_filter ? k.EMPTY : "<" + member_agency_id + "&nbsp;&nbsp;");
          }
        //
        p.num_travel_gap_alert_datagrid_rows++;
        }
      if (p.be_interactive)
        {
        if (be_any_kind_of_item)
          {
          var be_ok_to_enable_controls = 
            (
              p.be_user_privileged_to_see_all_squads
            ||
              (k.Has(Session["privilege_array"] as string[],"edit-schedule") && (e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_AGENCY_ID].Text == p.own_agency))
            ||
              p.be_ok_to_edit_schedule_for_selected_special_agency
            );
          link_button = ((e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_POST_FROM].Controls[0]) as LinkButton);
          link_button.Enabled = be_ok_to_enable_controls;
          ToolkitScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          //
          link_button = ((e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_POST_TO].Controls[0]) as LinkButton);
          link_button.Enabled = be_ok_to_enable_controls;
          ToolkitScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          //
          // Remove all cell controls from viewstate except for the ones at TCI_POST_{FROM|TO}.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_POST_FROM].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_POST_TO].EnableViewState = true;
          }
        }
      }

    protected void W_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      var day_num = k.Safe(e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_GAP_DAY].Text,k.safe_hint_type.NUM);
      var offset = new k.subtype<int>(-1,0);
      if(
          (e.CommandName == "PostTo")
        ||
          (DateTime.Parse(k.Safe(e.Item.Cells[UserControl_schedule_assignment_assistant_alert_travel_gap_Static.TCI_GAP_TIME].Text,k.safe_hint_type.DATE_TIME)).ToString("HH").CompareTo("06") >= 0)
        ||
          (day_num == "01")
        )
        {
        offset.val = 0;
        }
      p.msg_protected_overview.target = "/schedule/assignment-assistant/proposal/" + (int.Parse(day_num) + offset.val).ToString();
      MessageDropCrumbAndTransferTo
        (
        msg:p.msg_protected_overview,
        folder_name:"protected",
        aspx_name:"overview"
        );
      }

    }

  }
