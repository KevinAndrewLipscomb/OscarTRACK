using AjaxControlToolkit;
using appcommon;
using Class_biz_availabilities;
using Class_biz_leaves;
using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControl_member_schedule_detail
  {

  public partial class TWebUserControl_member_schedule_detail: ki_web_ui.usercontrol_class
    {

    private class Static
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
      public const int TCI_TIME_OFF_BEFORE = 10;
      public const int TCI_TIME_OFF_AFTER = 11;
      public const int TCI_SHIFT_POPULATION_FROM_AGENCY = 12;
      public const int TCI_SHIFT_POPULATION_CITYWIDE = 13;
      public const int TCI_SWAP_EARLIER = 14;
      public const int TCI_SWAP_LATER = 15;
      public const int TCI_OTHERS_AVAILABLE = 16;
      public const int TCI_FORCE_OFF = 17;
      public const int TCI_FORCE_ON = 18;
      public const int TCI_BE_NOTIFICATION_PENDING = 19;
      public const int TCI_REVISED = 20;
      public const int TCI_LAST_REVISER = 21;
      public const int TCI_DOOR_CODE = 22;
      public const int TCI_COVERAGE_ASSISTANT = 23;
      }

    private struct p_type
      {
      public ArrayList arraylist_revised_day_avail;
      public ArrayList arraylist_revised_night_avail;
      public ArrayList arraylist_selected_day_avail;
      public ArrayList arraylist_selected_night_avail;
      public ArrayList arraylist_unselected_day_avail;
      public ArrayList arraylist_unselected_night_avail;
      public bool be_any_revisions;
      public bool be_datagrid_empty;
      public bool be_fully_editable;
      public bool be_limited_preview;
      public bool be_loaded;
      public bool be_my_watchbill_mode;
      public bool be_partially_editable;
      public bool be_virgin_watchbill;
      public TClass_biz_availabilities biz_availabilities;
      public TClass_biz_leaves biz_leaves;
      public TClass_biz_members biz_members;
      public TClass_biz_schedule_assignments biz_schedule_assignments;
      public DateTime start_of_earliest_unselected;
      public DateTime end_of_latest_unselected;
      public string member_agency_id;
      public string member_id;
      public object member_summary;
      public k.subtype<int> num;
      public uint num_datagrid_rows;
      public  k.subtype<int> relative_month;
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
        Label_preview_warning.Visible = p.be_limited_preview;
        //
        var month_of_interest = DateTime.Now.AddMonths(p.relative_month.val);
        Literal_name.Text = p.biz_members.FirstNameOf(p.member_summary) + k.SPACE + p.biz_members.LastNameOf(p.member_summary);
        Literal_name_2.Text = Literal_name.Text;
        Literal_month.Text = month_of_interest.ToString("MMMM").ToUpper();
        LinkButton_switch_month.Visible =
          (p.be_my_watchbill_mode && !p.biz_schedule_assignments.BeFullWatchbillPublishMandatory(p.member_agency_id,new k.subtype<int>(1,1)) && p.biz_schedule_assignments.BeOkToWorkOnNextMonthAssignments());
        //
        Literal_agency.Text = p.biz_members.AgencyOf(p.member_summary);
        Literal_section.Text = p.biz_members.SectionOf(p.member_summary);
        //
        Literal_released_cert_level.Text = p.biz_members.MedicalReleaseLevelOf(p.member_summary);
        Literal_be_driver.Text = k.YesNoOf(p.biz_members.BeDriverQualifiedOf(p.member_summary));
        HyperLink_phone_num.Text = k.FormatAsNanpPhoneNum(p.biz_members.PhoneNumOf(p.biz_members.IdOf(p.member_summary)));
        HyperLink_phone_num.NavigateUrl = "tel:" + HyperLink_phone_num.Text;
        HyperLink_email_address.Text = p.biz_members.EmailAddressOf(p.biz_members.IdOf(p.member_summary));
        HyperLink_email_address.NavigateUrl = "mailto:" + HyperLink_email_address.Text;
        //
        if (p.be_fully_editable)
          {
          Panel_sensitive_submission_detail.Visible = true;
          //
          HtmlTableCell_button_done.Visible = !p.be_my_watchbill_mode;
          HtmlTableCell_scheduler_actions.Visible = !p.biz_members.BeReleased(p.biz_members.IdOf(p.member_summary));
          //
          HtmlTableRow_instruction_for_calendars.Visible = p.be_fully_editable;
          }
        //
        Calendar_day.VisibleDate = month_of_interest;
        Calendar_night.VisibleDate = month_of_interest;
        //
        Bind();
        //
        InjectPersistentClientSideScript();
        p.be_loaded = true;
        }
      if (p.be_fully_editable)
        {
        ScriptManager.GetCurrent(Page).RegisterPostBackControl(Button_done);
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
        p.be_partially_editable =
          (
            (Session["mode:report"] == null)
          &&
            (
              k.Has((Session["privilege_array"] as string[]),"edit-schedule")
            ||
              k.Has((Session["privilege_array"] as string[]),"schedule-squad-truck-team")
            )
          );
        p.be_fully_editable = p.biz_schedule_assignments.BeMemberScheduleDetailFullyEditable
          (
          be_partially_editable:p.be_partially_editable,
          relative_month:p.relative_month
          );
        p.be_limited_preview = false;
        p.be_my_watchbill_mode = InstanceId().Contains("ASP.protected_overview_aspx");
        p.be_virgin_watchbill = true;
        p.member_agency_id = k.EMPTY;
        p.member_summary = null;
        p.num = new k.subtype<int>(0,62);
        p.num_datagrid_rows = 0;
        //
        if (p.be_my_watchbill_mode)
          {
          p.member_id = Session["member_id"].ToString();
          p.member_summary = p.biz_members.Summary(p.member_id);
          p.member_agency_id = p.biz_members.AgencyIdOfId(p.member_id);
          p.relative_month = new k.subtype<int>(0,1);
          }
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
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_member_schedule_detail Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void Button_done_Click(object sender, System.EventArgs e)
      {
      BackTrack();
      }

    protected void DataGrid_control_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      LinkButton link_button;
      var be_any_kind_of_item = (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType));
      if (be_any_kind_of_item)
        {
        var nominal_day = DateTime.Parse(e.Item.Cells[Static.TCI_NOMINAL_DAY].Text);
        e.Item.Cells[Static.TCI_NOMINAL_DAY].Text = p.biz_schedule_assignments.MonthlessRenditionOfNominalDay(nominal_day);
        //
        var be_selected = (e.Item.Cells[Static.TCI_BE_SELECTED].Text == "1");
        if (be_selected)
          {
          e.Item.Cells[Static.TCI_NOMINAL_DAY].CssClass = "selected_for_duty";
          e.Item.Cells[Static.TCI_SHIFT_NAME].CssClass = "selected_for_duty";
          e.Item.Cells[Static.TCI_TIME_OFF_BEFORE].Font.Bold = true;
          e.Item.Cells[Static.TCI_TIME_OFF_AFTER].Font.Bold = true;
          e.Item.Cells[Static.TCI_SHIFT_POPULATION_FROM_AGENCY].Font.Bold = true;
          e.Item.Cells[Static.TCI_SHIFT_POPULATION_CITYWIDE].Font.Bold = true;
          //
          if (e.Item.Cells[Static.TCI_SHIFT_NAME].Text == "DAY")
            {
            p.arraylist_selected_day_avail.Add(nominal_day);
            }
          else if (e.Item.Cells[Static.TCI_SHIFT_NAME].Text == "NIGHT")
            {
            p.arraylist_selected_night_avail.Add(nominal_day);
            }
          }
        else
          {
          e.Item.Cells[Static.TCI_NOMINAL_DAY].CssClass = "unselected_availability";
          e.Item.Cells[Static.TCI_SHIFT_NAME].CssClass = "unselected_availability";
          e.Item.Cells[Static.TCI_TIME_OFF_BEFORE].ForeColor = Color.Gray;
          e.Item.Cells[Static.TCI_TIME_OFF_AFTER].ForeColor = Color.Gray;
          e.Item.Cells[Static.TCI_SHIFT_POPULATION_FROM_AGENCY].ForeColor = Color.Gray;
          e.Item.Cells[Static.TCI_SHIFT_POPULATION_CITYWIDE].ForeColor = Color.Gray;
          (e.Item.Cells[Static.TCI_SWAP_EARLIER].Controls[0] as LinkButton).Text = k.EMPTY;
          (e.Item.Cells[Static.TCI_SWAP_LATER].Controls[0] as LinkButton).Text = k.EMPTY;
          //
          if (e.Item.Cells[Static.TCI_SHIFT_NAME].Text == "DAY")
            {
            p.arraylist_unselected_day_avail.Add(nominal_day);
            }
          else if (e.Item.Cells[Static.TCI_SHIFT_NAME].Text == "NIGHT")
            {
            p.arraylist_unselected_night_avail.Add(nominal_day);
            }
          }
        //
        if (!be_selected || (DateTime.Parse(e.Item.Cells[Static.TCI_ON_DUTY].Text) < p.start_of_earliest_unselected))
          {
          (e.Item.Cells[Static.TCI_SWAP_EARLIER].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        if (!be_selected || (DateTime.Parse(e.Item.Cells[Static.TCI_OFF_DUTY].Text) > p.end_of_latest_unselected))
          {
          (e.Item.Cells[Static.TCI_SWAP_LATER].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        //
        if (be_selected)
          {
          (e.Item.Cells[Static.TCI_FORCE_ON].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        else
          {
          (e.Item.Cells[Static.TCI_FORCE_OFF].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        if (p.be_my_watchbill_mode && be_selected && (new ArrayList() {'R','Z'}.Contains(e.Item.Cells[Static.TCI_POST_DESIGNATOR].Text[0])))
          {
          link_button = ((e.Item.Cells[Static.TCI_COVERAGE_ASSISTANT].Controls[0]) as LinkButton);
          link_button.Text = k.ExpandTildePath(link_button.Text);
          link_button.ToolTip = "Coverage assistant";
          ToolkitScriptManager.GetCurrent(Page).RegisterPostBackControl(link_button);
          }
        else
          {
          (e.Item.Cells[Static.TCI_COVERAGE_ASSISTANT].Controls[0] as LinkButton).Text = k.EMPTY;
          }
        //
        if (!p.be_fully_editable && !p.be_virgin_watchbill && (e.Item.Cells[Static.TCI_BE_NOTIFICATION_PENDING].Text == "1"))
          {
          ((e.Item.Cells[Static.TCI_REVISED].Controls[0]) as Label).Visible = true;
          if (e.Item.Cells[Static.TCI_SHIFT_NAME].Text == "DAY")
            {
            p.arraylist_revised_day_avail.Add(nominal_day);
            }
          else if (e.Item.Cells[Static.TCI_SHIFT_NAME].Text == "NIGHT")
            {
            p.arraylist_revised_night_avail.Add(nominal_day);
            }
          p.be_any_revisions = true;
          }
        //
        p.num_datagrid_rows++;
        }
      if (p.be_fully_editable && be_any_kind_of_item)
        {
        var comment_edit_update_cancel_controls = e.Item.Cells[Static.TCI_COMMENT_EDIT_UPDATE_CANCEL].Controls;
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
          ((e.Item.Cells[Static.TCI_COMMENT].Controls[0]) as TextBox).Columns = 15;
          ((e.Item.Cells[Static.TCI_COMMENT].Controls[0]) as TextBox).MaxLength = 15;
          ((e.Item.Cells[Static.TCI_COMMENT].Controls[0]) as TextBox).Attributes.Add
            ("onkeydown","if (event.keyCode == 13) El('" + e.Item.Cells[Static.TCI_COMMENT_EDIT_UPDATE_CANCEL].Controls[0].ClientID + "').click();");
          ((e.Item.Cells[Static.TCI_COMMENT].Controls[0]) as TextBox).Focus();
          }
        link_button = ((e.Item.Cells[Static.TCI_SWAP_EARLIER].Controls[0]) as LinkButton);
        link_button.Text = k.ExpandTildePath(link_button.Text);
        link_button.ToolTip = "Swap with earlier availability";
        link_button = ((e.Item.Cells[Static.TCI_SWAP_LATER].Controls[0]) as LinkButton);
        link_button.Text = k.ExpandTildePath(link_button.Text);
        link_button.ToolTip = "Swap with later availability";
        link_button = ((e.Item.Cells[Static.TCI_FORCE_OFF].Controls[0]) as LinkButton);
        link_button.Text = k.ExpandTildePath(link_button.Text);
        link_button.ToolTip = "Force off";
        link_button = ((e.Item.Cells[Static.TCI_FORCE_ON].Controls[0]) as LinkButton);
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
        e.Item.Cells[Static.TCI_SCHEDULE_ASSIGNMENT_ID].EnableViewState = true;
        }
      }

    protected void DataGrid_control_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      var schedule_assignment_id = k.Safe(e.Item.Cells[Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM);
      if (e.CommandName == "CoverageAssistant")
        {
        var msg_protected_coverage_assistant = new TClass_msg_protected.coverage_assistant();
        msg_protected_coverage_assistant.summary = p.biz_schedule_assignments.Summary(schedule_assignment_id);
        MessageDropCrumbAndTransferTo
          (
          msg:msg_protected_coverage_assistant,
          folder_name:"protected",
          aspx_name:"coverage_assistant"
          );
        }
      else
        {
        if (e.CommandName == "Earlier")
          {
          p.biz_schedule_assignments.SwapSelectedForMemberNextEarlierUnselected(schedule_assignment_id);
          }
        else if (e.CommandName == "Later")
          {
          p.biz_schedule_assignments.SwapSelectedForMemberNextLaterUnselected(schedule_assignment_id);
          }
        else if (e.CommandName == "ForceOn")
          {
          p.biz_schedule_assignments.ForceSelection(schedule_assignment_id,true);
          }
        else if (e.CommandName == "ForceOff")
          {
          p.biz_schedule_assignments.ForceSelection(schedule_assignment_id,false);
          }
        Bind();
        }
      }

    private void DataGrid_control_UpdateCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
      {
      p.biz_schedule_assignments.SetComment
        (
        k.Safe(e.Item.Cells[Static.TCI_SCHEDULE_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),
        k.Safe(((e.Item.Cells[Static.TCI_COMMENT].Controls[0]) as TextBox).Text,k.safe_hint_type.PUNCTUATED)
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
      p.member_summary = p.biz_members.Summary(p.member_id,p.relative_month);
      //
      var this_month_description = k.EMPTY;
      var next_month_description = k.EMPTY;
      p.biz_leaves.DescribeThisAndNextMonthForMember(p.biz_members.IdOf(p.member_summary),out this_month_description,out next_month_description,appcommon_Static.NOT_APPLICABLE_INDICATION_HTML);
      Literal_leave.Text = (p.relative_month.val == 0 ? this_month_description : next_month_description);
      Literal_membership_status.Text = p.biz_members.EnrollmentOf(p.member_summary);
      Literal_num_extra.Text = p.biz_availabilities.NumExtraForMemberForMonth(p.biz_members.IdOf(p.member_summary),p.relative_month).val.ToString();
      var comment = p.biz_availabilities.SpecialRequestCommentsForMemberForMonth(p.biz_members.IdOf(p.member_summary),p.relative_month);
      Label_special_request_comment.Text = (comment.Length > 0 ? comment : "(none)");
      Label_special_request_comment.Font.Italic = (comment.Length > 0);
      //
      p.arraylist_selected_day_avail.Clear();
      p.arraylist_selected_night_avail.Clear();
      p.arraylist_unselected_day_avail.Clear();
      p.arraylist_unselected_night_avail.Clear();
      p.biz_schedule_assignments.GetInfoAboutMemberInMonth(p.biz_members.IdOf(p.member_summary),p.relative_month,ref p.num,out p.start_of_earliest_unselected,out p.end_of_latest_unselected);
      DataGrid_control.Columns[Static.TCI_COMMENT_EDIT_UPDATE_CANCEL].Visible = p.be_fully_editable;
      DataGrid_control.Columns[Static.TCI_TIME_OFF_BEFORE].Visible = p.be_fully_editable;
      DataGrid_control.Columns[Static.TCI_TIME_OFF_AFTER].Visible = p.be_fully_editable;
      DataGrid_control.Columns[Static.TCI_SHIFT_POPULATION_FROM_AGENCY].Visible = p.be_fully_editable;
      DataGrid_control.Columns[Static.TCI_SHIFT_POPULATION_CITYWIDE].Visible = p.be_fully_editable;
      DataGrid_control.Columns[Static.TCI_SWAP_EARLIER].Visible = p.be_fully_editable;
      DataGrid_control.Columns[Static.TCI_SWAP_LATER].Visible = p.be_fully_editable;
      DataGrid_control.Columns[Static.TCI_OTHERS_AVAILABLE].Visible = p.be_fully_editable;
      DataGrid_control.Columns[Static.TCI_FORCE_OFF].Visible = p.be_fully_editable;
      DataGrid_control.Columns[Static.TCI_FORCE_ON].Visible = p.be_fully_editable;
      DataGrid_control.Columns[Static.TCI_REVISED].Visible = !p.be_fully_editable && !p.be_virgin_watchbill;
      DataGrid_control.Columns[Static.TCI_DOOR_CODE].Visible = !p.be_fully_editable || p.be_my_watchbill_mode;
      DataGrid_control.Columns[Static.TCI_COVERAGE_ASSISTANT].Visible = p.be_my_watchbill_mode;
      p.biz_schedule_assignments.BindMemberScheduleDetailBaseDataList(p.biz_members.IdOf(p.member_summary),p.relative_month,p.member_agency_id,DataGrid_control);
      p.be_datagrid_empty = (p.num_datagrid_rows == 0);
      HtmlTableRow_data.Visible = !p.be_datagrid_empty;
      HtmlTableRow_none.Visible = p.be_datagrid_empty;
      Label_revision_explanation.Visible = p.be_any_revisions;
      DataGrid_control.Columns[Static.TCI_LAST_REVISER].Visible = (p.be_fully_editable || p.be_any_revisions);
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
      if ((p.be_partially_editable) && (e.Day.Date.Month == DateTime.Now.AddMonths(p.relative_month.val).Month) && (!be_selected_avail) && (!be_unselected_avail))
        {
        e.Day.IsSelectable = true;
        e.Cell.ForeColor = Color.Blue;
        }
      if (!p.be_fully_editable && be_revised_avail)
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
      bool be_virgin_watchbill,
      bool be_limited_preview
      )
      {
      p.member_id = member_id;
      p.member_agency_id = member_agency_id;
      p.relative_month = relative_month;
      p.be_virgin_watchbill = be_virgin_watchbill;
      p.be_limited_preview = be_limited_preview;
      p.be_partially_editable = p.biz_schedule_assignments.BeOkToEditPerExclusivityRules(Session,member_agency_id,relative_month);
      p.be_fully_editable = p.biz_schedule_assignments.BeMemberScheduleDetailFullyEditable
        (
        be_partially_editable:p.be_partially_editable,
        relative_month:p.relative_month
        );
      Bind();
      }
    internal void SetFilter(string member_agency_id,k.subtype<int> relative_month,string member_id,bool be_virgin_watchbill)
      {
      SetFilter(member_agency_id,relative_month,member_id,be_virgin_watchbill,be_limited_preview:false);
      }
    internal void SetFilter(string member_agency_id,k.subtype<int> relative_month,string member_id)
      {
      SetFilter(member_agency_id,relative_month,member_id,be_virgin_watchbill:true);
      }

    internal void SetInteractivity(bool be_interactive)
      {
      p.be_fully_editable = p.be_fully_editable && be_interactive;
      p.be_partially_editable = p.be_partially_editable && be_interactive;
      }

    protected void Button_mark_tbr_Click(object sender, EventArgs e)
      {
      p.biz_schedule_assignments.MarkMemberToBeReleased(p.biz_members.IdOf(p.member_summary),p.relative_month);
      Bind();
      }

    protected void LinkButton_switch_month_Click(object sender, EventArgs e)
      {
      p.relative_month.val = (p.relative_month.val == 0 ? 1 : 0);
      var month_of_interest = DateTime.Now.AddMonths(p.relative_month.val);
      Literal_month.Text = month_of_interest.ToString("MMMM").ToUpper();
      Calendar_day.VisibleDate = month_of_interest;
      Calendar_night.VisibleDate = month_of_interest;
      Bind();
      }

    }

  }
