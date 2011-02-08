// Derived from template~protected~nonlanding.aspx.cs~template

using Class_biz_availabilities;
using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Drawing;

namespace investigate_time_off_alert
  {
  public struct p_type
    {
    public bool be_interactive;
    public TClass_biz_availabilities biz_availabilities;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public DateTime start_of_earliest_unselected;
    public TClass_msg_protected.investigate_time_off_alert incoming;
    public DateTime end_of_latest_unselected;
    public TClass_msg_protected.confirm_paypal_donation msg_protected_confirm_paypal_donation;
    public k.subtype<int> num;
    }

  public partial class TWebForm_investigate_time_off_alert: ki_web_ui.page_class
    {
    public class TWebForm_investigate_time_off_alert_Static
      {
      public const int TCI_SCHEDULE_ASSIGNMENT_ID = 0;
      public const int TCI_NOMINAL_DAY = 1;
      public const int TCI_SHIFT_NAME = 2;
      public const int TCI_BE_SELECTED = 3;
      public const int TCI_ON_DUTY = 4;
      public const int TCI_OFF_DUTY = 5;
      public const int TCI_TIME_OFF = 6;
      public const int TCI_SHIFT_POPULATION_FROM_AGENCY = 7;
      public const int TCI_SHIFT_POPULATION_CITYWIDE = 8;
      public const int TCI_CHANGE_SELECTION_EARLIER = 9;
      public const int TCI_CHANGE_SELECTION_LATER = 10;
      }

    private p_type p;

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_investigate_time_off_alert_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - investigate_time_off_alert";
        Literal_name.Text = p.biz_members.FirstNameOfMemberId(p.incoming.member_id) + k.SPACE + p.biz_members.LastNameOfMemberId(p.incoming.member_id);
        Literal_month.Text = DateTime.Now.AddMonths(p.incoming.relative_month.val).ToString("MMMM");
        //
        var comment = p.biz_availabilities.SpecialRequestCommentsForMemberForMonth(p.incoming.member_id,p.incoming.relative_month);
        if (comment != k.EMPTY)
          {
          Label_special_request_comment.Text = comment;
          Label_special_request_comment.Font.Italic = true;
          }
        //
        Bind();
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var nature_of_visit = NatureOfVisit("investigate_time_off_alert.p");
      if (nature_of_visit == nature_of_visit_type.VISIT_INITIAL)
        {
        p.be_interactive =  !(Session["mode:report"] != null);
        p.biz_availabilities = new TClass_biz_availabilities();
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        p.incoming = Message<TClass_msg_protected.investigate_time_off_alert>("protected","investigate_time_off_alert");
        p.msg_protected_confirm_paypal_donation = new TClass_msg_protected.confirm_paypal_donation();
        p.biz_schedule_assignments.GetInfoAboutMemberInMonth(p.incoming.member_id,p.incoming.relative_month,out p.num,out p.start_of_earliest_unselected,out p.end_of_latest_unselected);
        }
      else if (nature_of_visit == nature_of_visit_type.VISIT_POSTBACK_STANDARD)
        {
        p = (p_type)(Session["investigate_time_off_alert.p"]);
        }
      }

    protected void Button_cancel_Click(object sender, System.EventArgs e)
      {
      BackTrack();
      }

    private void Bind()
      {
      p.biz_schedule_assignments.BindTimeOffAlertInvestigationBaseDataList(p.incoming.member_id,p.incoming.relative_month,p.incoming.scheduler_agency_id,DataGrid_control);
      }

    protected void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      //LinkButton link_button;
      var be_any_kind_of_item = (new ArrayList(new object[] {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}).Contains(e.Item.ItemType));
      if (be_any_kind_of_item)
        {
        e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_NOMINAL_DAY].Text = p.biz_schedule_assignments.MonthlessRenditionOfNominalDay(DateTime.Parse(e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_NOMINAL_DAY].Text));
        //
        var be_selected = (e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_BE_SELECTED].Text == "1");
        if (be_selected)
          {
          e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_NOMINAL_DAY].Font.Bold = true;
          e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_SHIFT_NAME].Font.Bold = true;
          e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_TIME_OFF].Font.Bold = true;
          e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_SHIFT_POPULATION_FROM_AGENCY].Font.Bold = true;
          e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_SHIFT_POPULATION_CITYWIDE].Font.Bold = true;
          }
        else
          {
          e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_NOMINAL_DAY].ForeColor = Color.Gray;
          e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_SHIFT_NAME].ForeColor = Color.Gray;
          e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_TIME_OFF].ForeColor = Color.Gray;
          e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_SHIFT_POPULATION_FROM_AGENCY].ForeColor = Color.Gray;
          e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_SHIFT_POPULATION_CITYWIDE].ForeColor = Color.Gray;
          (e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_CHANGE_SELECTION_EARLIER].Controls[0] as LinkButton).Text = k.EMPTY;
          (e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_CHANGE_SELECTION_LATER].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        //
        if (!be_selected || (DateTime.Parse(e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_ON_DUTY].Text) < p.start_of_earliest_unselected))
          {
          (e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_CHANGE_SELECTION_EARLIER].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        if (!be_selected || (DateTime.Parse(e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_OFF_DUTY].Text) > p.end_of_latest_unselected))
          {
          (e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_CHANGE_SELECTION_LATER].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        //
        }
      if (p.be_interactive)
        {
        if (be_any_kind_of_item)
          {
          //link_button = ((e.Item.Cells[UserControl_template_datagrid_sortable_Static.TCI_SELECT].Controls[0]) as LinkButton);
          //link_button.Text = k.ExpandTildePath(link_button.Text);
          //ScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          //
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_SCHEDULE_ASSIGNMENT_ID].EnableViewState = true;
          }
        }
      }

    protected void DataGrid_control_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      if (e.CommandName == "Earlier")
        {
        p.biz_schedule_assignments.SwapSelectedForMemberNextEarlierUnselected(k.Safe(e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM));
        }
      else if (e.CommandName == "Later")
        {
        p.biz_schedule_assignments.SwapSelectedForMemberNextLaterUnselected(k.Safe(e.Item.Cells[TWebForm_investigate_time_off_alert_Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM));
        }
      Bind();
      }

    private void TWebForm_investigate_time_off_alert_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("investigate_time_off_alert.p", p);
      }

    } // end TWebForm_investigate_time_off_alert

  }
