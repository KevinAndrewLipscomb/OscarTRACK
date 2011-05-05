using appcommon;
using Class_biz_availabilities;
using Class_biz_leaves;
using Class_biz_members;
using Class_biz_schedule_assignments;
using kix;
using System;
using System.Collections;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_member_schedule_detail
  {

  public struct p_type
    {
    public ArrayList arraylist_revised_day_avail;
    public ArrayList arraylist_revised_night_avail;
    public ArrayList arraylist_selected_day_avail;
    public ArrayList arraylist_selected_night_avail;
    public ArrayList arraylist_unselected_day_avail;
    public ArrayList arraylist_unselected_night_avail;
    public bool be_any_revisions;
    public bool be_datagrid_empty;
    public bool be_interactive;
    public bool be_loaded;
    public bool be_virgin_watchbill;
    public TClass_biz_availabilities biz_availabilities;
    public TClass_biz_leaves biz_leaves;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public DateTime start_of_earliest_unselected;
    public DateTime end_of_latest_unselected;
    public string member_agency_id;
    public object member_summary;
    public k.subtype<int> num;
    public uint num_datagrid_rows;
    public  k.subtype<int> relative_month;
    }

  public partial class TWebUserControl_member_schedule_detail: ki_web_ui.usercontrol_class
    {
    public class UserControl_member_schedule_detail_Static
      {
      public const int TCI_SCHEDULE_ASSIGNMENT_ID = 0;
      public const int TCI_NOMINAL_DAY = 1;
      public const int TCI_SHIFT_NAME = 2;
      public const int TCI_POST_DESIGNATOR = 3;
      public const int TCI_POST_CARDINALITY = 4;
      public const int TCI_COMMENT = 5;
      public const int TCI_COMMENT_EDIT_UPDATE_CANCEL = 6;
      public const int TCI_BE_SELECTED = 7;
      public const int TCI_ON_DUTY = 8;
      public const int TCI_OFF_DUTY = 9;
      public const int TCI_TIME_OFF = 10;
      public const int TCI_SHIFT_POPULATION_FROM_AGENCY = 11;
      public const int TCI_SHIFT_POPULATION_CITYWIDE = 12;
      public const int TCI_SWAP_EARLIER = 13;
      public const int TCI_SWAP_LATER = 14;
      public const int TCI_OTHERS_AVAILABLE = 15;
      public const int TCI_FORCE_OFF = 16;
      public const int TCI_FORCE_ON = 17;
      public const int TCI_BE_NOTIFICATION_PENDING = 18;
      public const int TCI_REVISED = 19;
      public const int TCI_LAST_REVISER = 20;
      }

    private p_type p;

    private void InjectPersistentClientSideScript()
      {
      EstablishClientSideFunction(k.client_side_function_enumeral_type.EL);
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        var month_of_interest = DateTime.Now.AddMonths(p.relative_month.val);
        Literal_name.Text = p.biz_members.FirstNameOf(p.member_summary) + k.SPACE + p.biz_members.LastNameOf(p.member_summary);
        Literal_name_2.Text = Literal_name.Text;
        Literal_month.Text = month_of_interest.ToString("MMMM").ToUpper();
        //
        Literal_agency.Text = p.biz_members.AgencyOf(p.member_summary);
        Literal_membership_status.Text = p.biz_members.EnrollmentOf(p.member_summary);
        //
        var this_month_description = k.EMPTY;
        var next_month_description = k.EMPTY;
        p.biz_leaves.DescribeThisAndNextMonthForMember(p.biz_members.IdOf(p.member_summary),out this_month_description,out next_month_description,appcommon_Static.NOT_APPLICABLE_INDICATION_HTML);
        Literal_leave.Text = (p.relative_month.val == 0 ? this_month_description : next_month_description);
        //
        Literal_released_cert_level.Text = p.biz_members.MedicalReleaseLevelOf(p.member_summary);
        Literal_be_driver.Text = k.YesNoOf(p.biz_members.BeDriverQualifiedOf(p.member_summary));
        HyperLink_phone_num.Text = k.FormatAsNanpPhoneNum(p.biz_members.PhoneNumOf(p.biz_members.IdOf(p.member_summary)));
        HyperLink_phone_num.NavigateUrl = "tel:" + HyperLink_phone_num.Text;
        HyperLink_phone_num.Enabled = p.be_interactive;
        HyperLink_email_address.Text = p.biz_members.EmailAddressOf(p.biz_members.IdOf(p.member_summary));
        HyperLink_email_address.NavigateUrl = "mailto:" + HyperLink_email_address.Text;
        HyperLink_email_address.Enabled = p.be_interactive;
        //
        Literal_num_extra.Text = p.biz_availabilities.NumExtraForMemberForMonth(p.biz_members.IdOf(p.member_summary),p.relative_month).val.ToString();
        var comment = p.biz_availabilities.SpecialRequestCommentsForMemberForMonth(p.biz_members.IdOf(p.member_summary),p.relative_month);
        if (comment != k.EMPTY)
          {
          Label_special_request_comment.Text = comment;
          Label_special_request_comment.Font.Italic = true;
          }
        //
        HtmlTableCell_button_done.Visible = p.be_interactive;
        //
        Button_mark_tbr.Visible = p.be_interactive && !p.biz_members.BeReleased(p.biz_members.IdOf(p.member_summary));
        HtmlTableCell_scheduler_actions.Visible = Button_mark_tbr.Visible;
        //
        HtmlTableRow_instruction_for_calendars.Visible = p.be_interactive;
        Calendar_day.VisibleDate = month_of_interest;
        Calendar_night.VisibleDate = month_of_interest;
        //
        Bind();
        //
        InjectPersistentClientSideScript();
        p.be_loaded = true;
        }
      if (p.be_interactive)
        {
        ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_done);
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_member_schedule_detail.p"] != null)
        {
        p = (p_type)(Session["UserControl_member_schedule_detail.p"]);
        p.be_loaded = IsPostBack;
        }
      else
        {
        p.biz_availabilities = new TClass_biz_availabilities();
        p.biz_leaves = new TClass_biz_leaves();
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        //
        p.arraylist_revised_day_avail = new ArrayList();
        p.arraylist_revised_night_avail = new ArrayList();
        p.arraylist_selected_day_avail = new ArrayList();
        p.arraylist_selected_night_avail = new ArrayList();
        p.arraylist_unselected_day_avail = new ArrayList();
        p.arraylist_unselected_night_avail = new ArrayList();
        p.be_any_revisions = false;
        p.be_interactive = (Session["mode:report"] == null);
        p.be_virgin_watchbill = true;
        p.member_agency_id = k.EMPTY;
        p.member_summary = null;
        p.num = new k.subtype<int>(0,62);
        p.num_datagrid_rows = 0;
        //
        p.be_loaded = false;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      DataGrid_control.CancelCommand += new DataGridCommandEventHandler(DataGrid_control_CancelCommand);
      DataGrid_control.EditCommand += new DataGridCommandEventHandler(DataGrid_control_EditCommand);
      DataGrid_control.UpdateCommand += new DataGridCommandEventHandler(DataGrid_control_UpdateCommand);
      PreRender += TWebUserControl_member_schedule_detail_PreRender;
      }

    private void TWebUserControl_member_schedule_detail_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_member_schedule_detail.p", p);
      }

    public TWebUserControl_member_schedule_detail Fresh()
      {
      Session.Remove("UserControl_member_schedule_detail.p");
      return this;
      }

    protected void Button_done_Click(object sender, System.EventArgs e)
      {
      BackTrack();
      }

    protected void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      var be_any_kind_of_item = (new ArrayList(new object[] {ListItemType.AlternatingItem, ListItemType.Item, ListItemType.EditItem, ListItemType.SelectedItem}).Contains(e.Item.ItemType));
      if (be_any_kind_of_item)
        {
        var nominal_day = DateTime.Parse(e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_NOMINAL_DAY].Text);
        e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_NOMINAL_DAY].Text = p.biz_schedule_assignments.MonthlessRenditionOfNominalDay(nominal_day);
        //
        var be_selected = (e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_BE_SELECTED].Text == "1");
        if (be_selected)
          {
          e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_NOMINAL_DAY].CssClass = "selected_for_duty";
          e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SHIFT_NAME].CssClass = "selected_for_duty";
          e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_TIME_OFF].Font.Bold = true;
          e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SHIFT_POPULATION_FROM_AGENCY].Font.Bold = true;
          e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SHIFT_POPULATION_CITYWIDE].Font.Bold = true;
          //
          if (e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SHIFT_NAME].Text == "DAY")
            {
            p.arraylist_selected_day_avail.Add(nominal_day);
            }
          else if (e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SHIFT_NAME].Text == "NIGHT")
            {
            p.arraylist_selected_night_avail.Add(nominal_day);
            }
          }
        else
          {
          e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_NOMINAL_DAY].CssClass = "unselected_availability";
          e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SHIFT_NAME].CssClass = "unselected_availability";
          e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_TIME_OFF].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SHIFT_POPULATION_FROM_AGENCY].ForeColor = Color.Gray;
          e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SHIFT_POPULATION_CITYWIDE].ForeColor = Color.Gray;
          (e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SWAP_EARLIER].Controls[0] as LinkButton).Text = k.EMPTY;
          (e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SWAP_LATER].Controls[0] as LinkButton).Text = k.EMPTY;
          //
          if (e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SHIFT_NAME].Text == "DAY")
            {
            p.arraylist_unselected_day_avail.Add(nominal_day);
            }
          else if (e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SHIFT_NAME].Text == "NIGHT")
            {
            p.arraylist_unselected_night_avail.Add(nominal_day);
            }
          }
        //
        if (!be_selected || (DateTime.Parse(e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_ON_DUTY].Text) < p.start_of_earliest_unselected))
          {
          (e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SWAP_EARLIER].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        if (!be_selected || (DateTime.Parse(e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_OFF_DUTY].Text) > p.end_of_latest_unselected))
          {
          (e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SWAP_LATER].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        //
        if (be_selected)
          {
          (e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_FORCE_ON].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        else
          {
          (e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_FORCE_OFF].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        //
        if (!p.be_interactive && !p.be_virgin_watchbill && (e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_BE_NOTIFICATION_PENDING].Text == "1"))
          {
          ((e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_REVISED].Controls[0]) as Label).Visible = true;
          if (e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SHIFT_NAME].Text == "DAY")
            {
            p.arraylist_revised_day_avail.Add(nominal_day);
            }
          else if (e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SHIFT_NAME].Text == "NIGHT")
            {
            p.arraylist_revised_night_avail.Add(nominal_day);
            }
          p.be_any_revisions = true;
          }
        //
        p.num_datagrid_rows++;
        }
      if (p.be_interactive && be_any_kind_of_item)
        {
        LinkButton link_button;
        var comment_edit_update_cancel_controls = e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_COMMENT_EDIT_UPDATE_CANCEL].Controls;
        if (comment_edit_update_cancel_controls.Count == 1)
          {
          link_button = (comment_edit_update_cancel_controls[0] as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          link_button.ToolTip = "Edit comment";
          }
        else
          {
          link_button = (comment_edit_update_cancel_controls[0] as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          link_button.ToolTip = "Save edit";
          // Skip comment_edit_update_cancel_controls[1].  It's a literal spacer.
          link_button = (comment_edit_update_cancel_controls[2] as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          link_button.ToolTip = "Cancel edit";
          //
          ((e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_COMMENT].Controls[0]) as TextBox).Columns = 9;
          ((e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_COMMENT].Controls[0]) as TextBox).MaxLength = 9;
          ((e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_COMMENT].Controls[0]) as TextBox).Attributes.Add
            ("onkeydown","if (event.keyCode == 13) El('" + e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_COMMENT_EDIT_UPDATE_CANCEL].Controls[0].ClientID + "').click();");
          ((e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_COMMENT].Controls[0]) as TextBox).Focus();
          }
        link_button = ((e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SWAP_EARLIER].Controls[0]) as LinkButton);
        link_button.Text = k.ExpandTildePath(link_button.Text);
        link_button.ToolTip = "Swap with earlier availability";
        link_button = ((e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SWAP_LATER].Controls[0]) as LinkButton);
        link_button.Text = k.ExpandTildePath(link_button.Text);
        link_button.ToolTip = "Swap with later availability";
        link_button = ((e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_FORCE_OFF].Controls[0]) as LinkButton);
        link_button.Text = k.ExpandTildePath(link_button.Text);
        link_button.ToolTip = "Force off";
        link_button = ((e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_FORCE_ON].Controls[0]) as LinkButton);
        link_button.Text = k.ExpandTildePath(link_button.Text);
        link_button.ToolTip = "Force on";
        //
        //
        // Remove all cell controls from viewstate except for the one at TCI_ID.
        //
        foreach (TableCell cell in e.Item.Cells)
          {
          cell.EnableViewState = false;
          }
        e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SCHEDULE_ASSIGNMENT_ID].EnableViewState = true;
        }
      }

    protected void DataGrid_control_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      if (e.CommandName == "Earlier")
        {
        p.biz_schedule_assignments.SwapSelectedForMemberNextEarlierUnselected(k.Safe(e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM));
        }
      else if (e.CommandName == "Later")
        {
        p.biz_schedule_assignments.SwapSelectedForMemberNextLaterUnselected(k.Safe(e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM));
        }
      else if (e.CommandName == "ForceOn")
        {
        p.biz_schedule_assignments.ForceSelection(k.Safe(e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),true);
        }
      else if (e.CommandName == "ForceOff")
        {
        p.biz_schedule_assignments.ForceSelection(k.Safe(e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),false);
        }
      Bind();
      }

    private void DataGrid_control_UpdateCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      p.biz_schedule_assignments.SetComment
        (
        k.Safe(e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),
        k.Safe(((e.Item.Cells[UserControl_member_schedule_detail_Static.TCI_COMMENT].Controls[0]) as TextBox).Text,k.safe_hint_type.PUNCTUATED)
        );
      DataGrid_control.EditItemIndex =  -1;
      Bind();
      }

    private void DataGrid_control_CancelCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      DataGrid_control.EditItemIndex =  -1;
      Bind();
      }

    private void DataGrid_control_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      DataGrid_control.EditItemIndex = e.Item.ItemIndex;
      Bind();
      }

    protected void CalendarSelectionChanged
      (
      Calendar the_calendar,
      string shift_name
      )
      {
      if ((the_calendar.SelectedDate.Month == DateTime.Now.AddMonths(p.relative_month.val).Month))
        {
        p.biz_schedule_assignments.ForceAvail(p.biz_members.IdOf(p.member_summary),the_calendar.SelectedDate,shift_name,p.member_agency_id);
        }
      Bind();
      }

    protected void Calendar_day_SelectionChanged(object sender, System.EventArgs e)
      {
      CalendarSelectionChanged(Calendar_day,"DAY");
      }

    protected void Calendar_night_SelectionChanged(object sender, System.EventArgs e)
      {
      CalendarSelectionChanged(Calendar_night,"NIGHT");
      }

    private void Bind()
      {
      p.arraylist_selected_day_avail.Clear();
      p.arraylist_selected_night_avail.Clear();
      p.arraylist_unselected_day_avail.Clear();
      p.arraylist_unselected_night_avail.Clear();
      p.biz_schedule_assignments.GetInfoAboutMemberInMonth(p.biz_members.IdOf(p.member_summary),p.relative_month,ref p.num,out p.start_of_earliest_unselected,out p.end_of_latest_unselected);
      DataGrid_control.Columns[UserControl_member_schedule_detail_Static.TCI_COMMENT_EDIT_UPDATE_CANCEL].Visible = p.be_interactive;
      DataGrid_control.Columns[UserControl_member_schedule_detail_Static.TCI_COMMENT_EDIT_UPDATE_CANCEL].Visible = p.be_interactive;
      DataGrid_control.Columns[UserControl_member_schedule_detail_Static.TCI_TIME_OFF].Visible = p.be_interactive;
      DataGrid_control.Columns[UserControl_member_schedule_detail_Static.TCI_SHIFT_POPULATION_FROM_AGENCY].Visible = p.be_interactive;
      DataGrid_control.Columns[UserControl_member_schedule_detail_Static.TCI_SHIFT_POPULATION_CITYWIDE].Visible = p.be_interactive;
      DataGrid_control.Columns[UserControl_member_schedule_detail_Static.TCI_SWAP_EARLIER].Visible = p.be_interactive;
      DataGrid_control.Columns[UserControl_member_schedule_detail_Static.TCI_SWAP_LATER].Visible = p.be_interactive;
      DataGrid_control.Columns[UserControl_member_schedule_detail_Static.TCI_OTHERS_AVAILABLE].Visible = p.be_interactive;
      DataGrid_control.Columns[UserControl_member_schedule_detail_Static.TCI_FORCE_OFF].Visible = p.be_interactive;
      DataGrid_control.Columns[UserControl_member_schedule_detail_Static.TCI_FORCE_ON].Visible = p.be_interactive;
      DataGrid_control.Columns[UserControl_member_schedule_detail_Static.TCI_REVISED].Visible = !p.be_interactive && !p.be_virgin_watchbill;
      p.biz_schedule_assignments.BindMemberScheduleDetailBaseDataList(p.biz_members.IdOf(p.member_summary),p.relative_month,p.member_agency_id,DataGrid_control);
      p.be_datagrid_empty = (p.num_datagrid_rows == 0);
      HtmlTableRow_data.Visible = !p.be_datagrid_empty;
      HtmlTableRow_none.Visible = p.be_datagrid_empty;
      Label_revision_explanation.Visible = p.be_any_revisions;
      DataGrid_control.Columns[UserControl_member_schedule_detail_Static.TCI_LAST_REVISER].Visible = (p.be_interactive || p.be_any_revisions);
      HtmlTableRow_key_revised.Visible = p.be_any_revisions;
      p.num_datagrid_rows = 0;
      }

    protected void CalendarDayRender
      (
      ArrayList arraylist_revised_avail,
      ArrayList arraylist_selected_avail,
      ArrayList arraylist_unselected_avail,
      DayRenderEventArgs e
      )
      {
      e.Day.IsSelectable = false;
      var be_revised_avail = arraylist_revised_avail.Contains(e.Day.Date);
      var be_selected_avail = arraylist_selected_avail.Contains(e.Day.Date);
      var be_unselected_avail = arraylist_unselected_avail.Contains(e.Day.Date);
      if ((p.be_interactive) && (e.Day.Date.Month == DateTime.Now.AddMonths(p.relative_month.val).Month) && (!be_selected_avail) && (!be_unselected_avail))
        {
        e.Day.IsSelectable = true;
        e.Cell.ForeColor = Color.Blue;
        }
      if (!p.be_interactive && be_revised_avail)
        {
        e.Cell.CssClass = "revised";
        }
      if (be_selected_avail)
        {
        //
        // I'd like to just set the CssClass here as above, but when I tried, the backcolor (background-color) seemed to get overriden by the default styling on the overall calendar control.
        //
        e.Cell.ForeColor = Color.White;
        e.Cell.BackColor = Color.Green;
        e.Cell.Font.Bold = true;
        }
      else if (be_unselected_avail)
        {
        //
        // I'd like to just set the CssClass here as above, but when I tried, the backcolor (background-color) seemed to get overriden by the default styling on the overall calendar control.
        //
        e.Cell.ForeColor = Color.Gray;
        e.Cell.BackColor = Color.PaleGreen;
        e.Cell.Font.Bold = false;
        }
      }

    protected void Calendar_day_DayRender(object sender, DayRenderEventArgs e)
      {
      CalendarDayRender(p.arraylist_revised_day_avail,p.arraylist_selected_day_avail,p.arraylist_unselected_day_avail,e);
      }

    protected void Calendar_night_DayRender(object sender, DayRenderEventArgs e)
      {
      CalendarDayRender(p.arraylist_revised_night_avail,p.arraylist_selected_night_avail,p.arraylist_unselected_night_avail,e);
      }

    internal void SetFilter
      (
      string member_agency_id,
      k.subtype<int> relative_month,
      string member_id,
      bool be_virgin_watchbill
      )
      {
      p.member_agency_id = member_agency_id;
      p.relative_month = relative_month;
      p.member_summary = p.biz_members.Summary(member_id);
      p.be_virgin_watchbill = be_virgin_watchbill;
      Bind();
      }
    internal void SetFilter
      (
      string member_agency_id,
      k.subtype<int> relative_month,
      string member_id
      )
      {
      SetFilter(member_agency_id,relative_month,member_id,true);
      }

    internal void SetInteractivity(bool be_interactive)
      {
      p.be_interactive = be_interactive;
      }

    protected void Button_mark_tbr_Click(object sender, EventArgs e)
      {
      p.biz_schedule_assignments.MarkMemberToBeReleased(p.biz_members.IdOf(p.member_summary),p.relative_month);
      Bind();
      }

    }

  }
