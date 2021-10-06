using Class_biz_agencies;
using Class_biz_medical_release_levels;
using Class_biz_members;
using Class_biz_privileges;
using Class_biz_schedule_assignments;
using Class_biz_shifts;
using Class_biz_user;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace UserControl_schedule_proposal
  {

  public partial class TWebUserControl_schedule_proposal: ki_web_ui.usercontrol_class
    {

    private static class Static
      {
      public const int TCI_NOMINAL_DAY = 0;
      public const int TCI_DISPLAY_SEQ_NUM = 1;
      public const int TCI_D_SPACER_MAJOR = 2;
      public const int TCI_D_NUM_UNITS_FROM_AGENCY = 3;
      public const int TCI_D_SLASH = 4;
      public const int TCI_D_NUM_UNITS_CITYWIDE = 5;
      public const int TCI_D_SPACER_MINOR = 6;
      public const int TCI_D_ASSIGNMENT_ID = 7;
      public const int TCI_D_POST_ID = 8;
      public const int TCI_D_AGENCY_SHORT_DESIGNATOR = 9;
      public const int TCI_D_MEMBER_ID = 10;
      public const int TCI_D_POST_DESIGNATOR = 11;
      public const int TCI_D_POST_CARDINALITY_NONINTERACTIVE = 12;
      public const int TCI_D_POST_CARDINALITY_INTERACTIVE = 13;
      public const int TCI_D_MEDICAL_RELEASE_DESCRIPTION = 14;
      public const int TCI_D_BE_MARINE_MEDIC = 15;
      public const int TCI_D_COLON = 16;
      public const int TCI_D_CAD_NUM = 17;
      public const int TCI_D_NAME_INTERACTIVE = 18;
      public const int TCI_D_NAME_NONINTERACTIVE = 19;
      public const int TCI_D_BE_DRIVER_QUALIFIED = 20;
      public const int TCI_D_MEMBER_AGENCY_ID = 21;
      public const int TCI_D_MEMBER_AGENCY_DESIGNATOR = 22;
      public const int TCI_D_BE_SELECTED = 23;
      public const int TCI_D_COMMENT = 24;
      public const int TCI_D_BE_CHALLENGE = 25;
      public const int TCI_D_BE_GREENHORNS = 26;
      public const int TCI_D_PHONE_NUM = 27;
      public const int TCI_TIMELINE_SPACER_LEFT = 28;
      public const int TCI_D0000 = 29;
      public const int TCI_D0030 = 30;
      public const int TCI_D0100 = 31;
      public const int TCI_D0130 = 32;
      public const int TCI_D0200 = 33;
      public const int TCI_D0230 = 34;
      public const int TCI_D0300 = 35;
      public const int TCI_D0330 = 36;
      public const int TCI_D0400 = 37;
      public const int TCI_D0430 = 38;
      public const int TCI_D0500 = 39;
      public const int TCI_D0530 = 40;
      public const int TCI_D0600 = 41;
      public const int TCI_D0630 = 42;
      public const int TCI_D0700 = 43;
      public const int TCI_D0730 = 44;
      public const int TCI_D0800 = 45;
      public const int TCI_D0830 = 46;
      public const int TCI_D0900 = 47;
      public const int TCI_D0930 = 48;
      public const int TCI_D1000 = 49;
      public const int TCI_D1030 = 50;
      public const int TCI_D1100 = 51;
      public const int TCI_D1130 = 52;
      public const int TCI_N0000 = 53;
      public const int TCI_N0030 = 54;
      public const int TCI_N0100 = 55;
      public const int TCI_N0130 = 56;
      public const int TCI_N0200 = 57;
      public const int TCI_N0230 = 58;
      public const int TCI_N0300 = 59;
      public const int TCI_N0330 = 60;
      public const int TCI_N0400 = 61;
      public const int TCI_N0430 = 62;
      public const int TCI_N0500 = 63;
      public const int TCI_N0530 = 64;
      public const int TCI_N0600 = 65;
      public const int TCI_N0630 = 66;
      public const int TCI_N0700 = 67;
      public const int TCI_N0730 = 68;
      public const int TCI_N0800 = 69;
      public const int TCI_N0830 = 70;
      public const int TCI_N0900 = 71;
      public const int TCI_N0930 = 72;
      public const int TCI_N1000 = 73;
      public const int TCI_N1030 = 74;
      public const int TCI_N1100 = 75;
      public const int TCI_N1130 = 76;
      public const int TCI_TIMELINE_SPACER_RIGHT = 77;
      public const int TCI_N_NUM_UNITS_FROM_AGENCY = 78;
      public const int TCI_N_SLASH = 79;
      public const int TCI_N_NUM_UNITS_CITYWIDE = 80;
      public const int TCI_N_SPACER_MINOR = 81;
      public const int TCI_N_ASSIGNMENT_ID = 82;
      public const int TCI_N_POST_ID = 83;
      public const int TCI_N_AGENCY_SHORT_DESIGNATOR = 84;
      public const int TCI_N_MEMBER_ID = 85;
      public const int TCI_N_POST_DESIGNATOR = 86;
      public const int TCI_N_POST_CARDINALITY_NONINTERACTIVE = 87;
      public const int TCI_N_POST_CARDINALITY_INTERACTIVE = 88;
      public const int TCI_N_MEDICAL_RELEASE_DESCRIPTION = 89;
      public const int TCI_N_BE_MARINE_MEDIC = 90;
      public const int TCI_N_COLON = 91;
      public const int TCI_N_CAD_NUM = 92;
      public const int TCI_N_NAME_INTERACTIVE = 93;
      public const int TCI_N_NAME_NONINTERACTIVE = 94;
      public const int TCI_N_BE_DRIVER_QUALIFIED = 95;
      public const int TCI_N_MEMBER_AGENCY_ID = 96;
      public const int TCI_N_MEMBER_AGENCY_DESIGNATOR = 97;
      public const int TCI_N_BE_SELECTED = 98;
      public const int TCI_N_COMMENT = 99;
      public const int TCI_N_BE_CHALLENGE = 100;
      public const int TCI_N_BE_GREENHORNS = 101;
      public const int TCI_N_PHONE_NUM = 102;
      //
      public const int CI_DESIGNATOR_DROPDOWNLIST = 0;
      public const int CI_DESIGNATOR_LABEL = 1;
      }

    private struct p_type
      {
      public string agency_filter;
      public bool be_archival_end_of_month_watchbill;
      public bool be_commanded_watchbill_noninteractive;
      public bool be_datagrid_empty;
      public bool be_interactive;
      public bool be_lineup;
      public bool be_loaded;
      public bool be_now_day_shift;
      public bool be_nominal_day_mode_specific;
      public bool be_ok_to_edit_post;
      public bool be_ok_to_edit_schedule_for_any_special_agency;
      public bool be_ok_to_edit_schedule_liberally;
      public bool be_ok_to_edit_schedule_tier_department_only;
      public bool be_ok_to_schedule_squad_truck_team;
      public bool be_ok_to_schedule_volunteer_field_supervisor_team;
      public bool be_ok_to_schedule_mci_team;
      public bool be_ok_to_schedule_bike_team;
      public bool be_ok_to_see_other_member_schedule_detail;
      public bool be_ok_to_send_quickmessage_by_shift;
      public bool be_squad_exclusivity_expired;
      public bool be_user_privileged_to_see_all_squads;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_medical_release_levels biz_medical_release_levels;
      public TClass_biz_members biz_members;
      public TClass_biz_privileges biz_privileges;
      public TClass_biz_schedule_assignments biz_schedule_assignments;
      public TClass_biz_shifts biz_shifts;
      public TClass_biz_user biz_user;
      public string depth_filter;
      public k.int_sign_range individual_work_timelines_mode;
      public string max_post_cardinality_actual;
      public string max_post_cardinality_effective;
      public TClass_msg_protected.member_schedule_detail msg_protected_member_schedule_detail;
      public string nominal_day_filter_active;
      public string nominal_day_filter_saved;
      public uint num_datagrid_rows;
      public string own_agency;
      public string post_footprint;
      public ListItem[] proto_post_list_item_array;
      public k.subtype<int> relative_month;
      public string release_filter;
      public string saved_d_unit_spec;
      public string saved_n_unit_spec;
      public DateTime selected_month_day_first;
      public DateTime selected_month_day_last;
      public int selected_month_num;
      public int selected_year_num;
      }

    private struct v_type
      {
      public bool be_ok_to_send_quickmessage_by_shift_in_context;
      public SortedList<string,bool> be_full_watchbill_publish_mandatory;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters
    private v_type v; // Volatile instance Variable container

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (p.be_interactive)
          {
          p.be_ok_to_edit_schedule_for_any_special_agency = p.biz_privileges.HasForAnySpecialAgency(member_id:p.biz_members.IdOfUserId(p.biz_user.IdNum()),privilege_name:"edit-schedule");
          //
          if (p.be_ok_to_edit_post && !p.be_ok_to_edit_schedule_tier_department_only)
            {
            TableRow_guidance.Visible = true;
            Literal_application_name.Text = ConfigurationManager.AppSettings["application_name"];
            }
          TableRow_log.Visible = (p.be_ok_to_edit_post || p.be_ok_to_edit_schedule_tier_department_only);
          }
        Td_nominal_day_filter.Visible = p.be_nominal_day_mode_specific;
        DropDownList_depth.SelectedValue = p.depth_filter;
        p.biz_medical_release_levels.BindBaseDataList(DataList_key);
        DropDownList_depth.Enabled = p.be_interactive;
        Panel_warning_to_save.Visible = p.be_interactive && p.be_ok_to_edit_post;
        Literal_publish_reminder.Visible = !p.biz_schedule_assignments.BeFullWatchbillPublishMandatory(p.agency_filter,p.relative_month);
        //
        Bind();
        //
        p.biz_schedule_assignments.BindPostCardinalityListControl(Convert.ToString(Convert.ToChar(Convert.ToInt16('a') + int.Parse(ConfigurationManager.AppSettings["max_num_units_per_post"]) - 1)),DropDownList_max_post_cardinality,p.max_post_cardinality_effective);
        //
        TableCell_print_lineup.Visible = p.be_interactive && p.be_ok_to_see_other_member_schedule_detail;
        //
        if (!p.be_interactive)
          {
          TableCell_print_scalable.Visible = false;
          TableCell_print_maag.Visible = false;
          TableRow_expand_station_drop_downs.Visible = false;
          TableRow_max_crews_at_a_station.Visible = false;
          //
          var report_compressed_font_family = ConfigurationManager.AppSettings["report_compressed_font_family"];
          EstablishGoogleWebFontLoader("google: { families: [" + report_compressed_font_family + "] }");
          A.Style.Add("font-family",report_compressed_font_family);
          A.Style.Add("letter-spacing","-0.05em");
          A.Style.Add("word-spacing","-0.12em");
          //
          if (p.be_lineup)
            {
            Table_filters.Visible = false;
            Table_accumulators.Visible = false;
            }
          }
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
        p.be_loaded = IsPostBack && ((Session["M_S_G_PlaceHolder_content"] as string) == "C");
        }
      else
        {
        p.be_loaded = false;
        //
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_medical_release_levels = new TClass_biz_medical_release_levels();
        p.biz_members = new TClass_biz_members();
        p.biz_privileges = new TClass_biz_privileges();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        p.biz_shifts = new TClass_biz_shifts();
        p.biz_user = new TClass_biz_user();
        //
        p.agency_filter = k.EMPTY;
        p.be_archival_end_of_month_watchbill = (Session["mode:report/archival-end-of-month-watchbill-noninteractive"] != null);
        p.be_commanded_watchbill_noninteractive = (Session["mode:report/commanded-watchbill-noninteractive"] != null);
        p.be_interactive = (Session["mode:report"] == null);
        p.be_lineup = (Session["mode:report/commanded-lineup"] != null);
        p.be_now_day_shift = p.biz_shifts.BeInDayShift(DateTime.Now.TimeOfDay.Add(new TimeSpan(hours:6,minutes:0,seconds:0)));
        p.be_nominal_day_mode_specific =  (p.be_interactive || p.be_lineup);
        p.be_ok_to_edit_schedule_tier_department_only = p.biz_schedule_assignments.BeOkToEditScheduleTierDepartmentOnly(privilege_array:Session["privilege_array"] as string[]);
        p.be_ok_to_edit_schedule_for_any_special_agency = false;
        p.be_ok_to_edit_schedule_liberally = k.Has((string[])(Session["privilege_array"]), "edit-schedule-liberally");
        p.be_ok_to_schedule_squad_truck_team = k.Has((string[])(Session["privilege_array"]),"schedule-squad-truck-team");
        p.be_ok_to_schedule_volunteer_field_supervisor_team = k.Has((string[])(Session["privilege_array"]),"schedule-volunteer-field-supervisor-team");
        p.be_ok_to_schedule_mci_team = k.Has((string[])(Session["privilege_array"]),"schedule-mci-team");
        p.be_ok_to_schedule_bike_team = k.Has((string[])(Session["privilege_array"]),"schedule-bike-team");
        p.be_ok_to_see_other_member_schedule_detail = k.Has((string[])(Session["privilege_array"]), "see-other-member-schedule-detail");
        p.be_ok_to_send_quickmessage_by_shift = k.Has((string[])(Session["privilege_array"]), "send-quickmessage-by-shift");
        p.be_squad_exclusivity_expired = false;
        p.be_user_privileged_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
        p.depth_filter = "1";
        p.max_post_cardinality_actual = k.EMPTY;
        p.max_post_cardinality_effective = k.EMPTY;
        p.msg_protected_member_schedule_detail = new TClass_msg_protected.member_schedule_detail();
        p.num_datagrid_rows = 0;
        p.own_agency = (p.be_interactive ? p.biz_members.AgencyIdOfId(Session["member_id"].ToString()) : k.EMPTY);
        p.post_footprint = k.EMPTY;
        p.relative_month = new k.subtype<int>(0,1);
        p.release_filter = k.EMPTY;
        p.saved_d_unit_spec = k.EMPTY;
        p.saved_n_unit_spec = k.EMPTY;
        //
        p.be_ok_to_edit_post = k.Has((string[])(Session["privilege_array"]), "edit-schedule") || k.Has((string[])(Session["privilege_array"]), "edit-schedule-tier-department-only");
        p.individual_work_timelines_mode = new k.int_sign_range(0);
        p.nominal_day_filter_active = (p.be_nominal_day_mode_specific ? DateTime.Today.Day.ToString() : k.EMPTY);
        p.nominal_day_filter_saved = p.nominal_day_filter_active;
        //
        MakeDateCalculations();
        }
      }

    private void MakeDateCalculations()
      {
      p.selected_month_num = DateTime.Today.AddMonths(p.relative_month.val).Month;
      p.selected_year_num = DateTime.Today.AddMonths(p.relative_month.val).Year;
      p.selected_month_day_first = new DateTime(p.selected_year_num, p.selected_month_num, 1);
      p.selected_month_day_last = new DateTime(p.selected_year_num, p.selected_month_num, DateTime.DaysInMonth(p.selected_year_num, p.selected_month_num));
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_schedule_proposal_PreRender;
      }

    private void TWebUserControl_schedule_proposal_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p",p);
      }

    public TWebUserControl_schedule_proposal Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    internal void SetFilter
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month,
      bool be_for_month_change
      )
      {
      p.agency_filter = agency_filter;
      p.release_filter = release_filter;
      if ((relative_month.val != p.relative_month.val) && p.be_nominal_day_mode_specific)
        {
        p.nominal_day_filter_active = (relative_month.val == 0 ? DateTime.Today.Day.ToString() : "1");
        p.nominal_day_filter_saved = p.nominal_day_filter_active;
        }
      p.relative_month = relative_month;
      if (be_for_month_change || p.be_archival_end_of_month_watchbill)
        {
        ManageDefaultDepth();
        }
      //
      var relative_prep_month = DateTime.Today.AddMonths(p.relative_month.val - 1);
      p.be_squad_exclusivity_expired = DateTime.Now > new DateTime
        (
        year:relative_prep_month.Year,
        month:relative_prep_month.Month,
        day:int.Parse(ConfigurationManager.AppSettings["deadline_day_for_squad_to_publish_schedule"]),
        hour:int.Parse(ConfigurationManager.AppSettings["deadline_hour_for_squad_to_publish_schedule"]),
        minute:0,
        second:0
        );
      //
      HyperLink_preview_print_scalable.Text = k.ExpandTildePath(HyperLink_preview_print_scalable.Text);
      HyperLink_preview_print_scalable.NavigateUrl = "~/protected/watchbill.aspx"
      + "?agency_id=" + p.agency_filter
      + "&release_filter=" + p.release_filter
      + "&relative_month=" + p.relative_month.val;
      //
      HyperLink_preview_print_month_at_a_glance.Text = k.ExpandTildePath(HyperLink_preview_print_month_at_a_glance.Text);
      var watchbill_maag_hashtable = new Hashtable
        {
          ["agency_id"] = p.agency_filter,
          ["relative_month"] = p.relative_month.val
        };
      HyperLink_preview_print_month_at_a_glance.NavigateUrl = "~/protected/watchbill_maag.aspx?" + ShieldedQueryStringOfHashtable(watchbill_maag_hashtable);
      //
      HyperLink_preview_print_lineup.Text = k.ExpandTildePath(HyperLink_preview_print_lineup.Text);
      HyperLink_preview_print_lineup.NavigateUrl = "~/protected/lineup.aspx";
      //
      MakeDateCalculations();
      //
      Bind();
      }
    internal void SetFilter
      (
      string agency_filter,
      string release_filter,
      k.subtype<int> relative_month
      )
      {
      SetFilter(agency_filter,release_filter,relative_month,be_for_month_change:false);
      }

    private void ManageDefaultDepth()
      {
      p.depth_filter = (p.be_archival_end_of_month_watchbill ? k.EMPTY : "1");
      if(
          HttpContext.Current.User.IsInRole("Squad Scheduler")
        &&
          (p.relative_month.val == 1)
        &&
          p.biz_schedule_assignments.BeOkToWorkOnNextMonthAvailabilities()
        &&
          !p.biz_schedule_assignments.BeOkToWorkOnNextMonthAssignments()
        )
      //then
        {
        p.depth_filter = "0";
        }
      DropDownList_depth.SelectedValue = p.depth_filter;
      }

    internal void SetInteractivity(bool be_interactive)
      {
      p.be_interactive = be_interactive;
      if (!be_interactive)
        {
        p.depth_filter = "1";
        DropDownList_depth.SelectedValue = "1";
        }
      }

    protected void DropDownList_depth_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.depth_filter = k.Safe(DropDownList_depth.SelectedValue,k.safe_hint_type.NUM);
      Bind();
      }

    private void Bind()
      {
      RadioButtonList_be_nominal_day_mode_specific.SelectedValue = (p.be_nominal_day_mode_specific ? "1" : "0" );
      RadioButtonList_be_nominal_day_mode_specific.Enabled = p.be_interactive;
      Calendar_nominal_day.VisibleDate = DateTime.Today.AddMonths(p.relative_month.val);
      if (p.be_nominal_day_mode_specific)
        {
        var nominal_day_filter_active_int = int.Parse(p.nominal_day_filter_active);
        if (nominal_day_filter_active_int > DateTime.DaysInMonth(p.selected_year_num,p.selected_month_num))
          {
          //
          // We must've crossed into a new month (with fewer days than last month) since the last invocation.
          //
          p.nominal_day_filter_active = "1";
          nominal_day_filter_active_int = 1;
          }
        var nominal_datetime_filter_active = new DateTime(p.selected_year_num,p.selected_month_num,nominal_day_filter_active_int);
        Calendar_nominal_day.SelectedDates.SelectRange(nominal_datetime_filter_active,nominal_datetime_filter_active);
        }
      else
        {
        Calendar_nominal_day.SelectedDates.SelectRange(p.selected_month_day_first,p.selected_month_day_last);
        }
      Calendar_nominal_day.Enabled = p.be_interactive;
      //
      Button_show_day_timelines.Enabled = p.individual_work_timelines_mode.val != -1;
      Button_hide_timelines.Enabled = p.individual_work_timelines_mode.val != 0;
      Button_show_night_timelines.Enabled = p.individual_work_timelines_mode.val != 1;
      //
      var be_suppressed = true;
      if(
          ((p.relative_month.val == 0) || !p.biz_schedule_assignments.BeFullWatchbillPublishMandatory(p.agency_filter,p.relative_month))
        ||
          p.be_ok_to_edit_post
        ||
          p.be_user_privileged_to_see_all_squads
        ||
          p.be_commanded_watchbill_noninteractive
        )
        {
        be_suppressed = false;
        //
        var interactive_major_font_size = FontUnit.Larger;
        var interactive_neutral_font_size = FontUnit.Empty;
        var interactive_minor_font_size = FontUnit.Smaller;
        var noninteractive_major_font_size = FontUnit.Point(16);
        var noninteractive_neutral_font_size = FontUnit.Point(11);
        var noninteractive_minor_font_size = FontUnit.Point(9);
        //
        if (p.be_interactive)
          {
          A.Font.Size = interactive_neutral_font_size;
          A.Columns[Static.TCI_NOMINAL_DAY].HeaderStyle.Font.Size = interactive_major_font_size;
          A.Columns[Static.TCI_NOMINAL_DAY].ItemStyle.Font.Size = interactive_major_font_size;
          A.Columns[Static.TCI_D_NUM_UNITS_FROM_AGENCY].ItemStyle.Font.Size = interactive_minor_font_size;
          A.Columns[Static.TCI_D_SLASH].ItemStyle.Font.Size = interactive_minor_font_size;
          A.Columns[Static.TCI_D_NUM_UNITS_CITYWIDE].ItemStyle.Font.Size = interactive_minor_font_size;
          A.Columns[Static.TCI_N_NUM_UNITS_FROM_AGENCY].ItemStyle.Font.Size = interactive_minor_font_size;
          A.Columns[Static.TCI_N_SLASH].ItemStyle.Font.Size = interactive_minor_font_size;
          A.Columns[Static.TCI_N_NUM_UNITS_CITYWIDE].ItemStyle.Font.Size = interactive_minor_font_size;
          }
        else
          {
          A.Font.Size = noninteractive_neutral_font_size;
          A.Columns[Static.TCI_NOMINAL_DAY].HeaderStyle.Font.Size = noninteractive_major_font_size;
          A.Columns[Static.TCI_NOMINAL_DAY].ItemStyle.Font.Size = noninteractive_major_font_size;
          A.Columns[Static.TCI_D_NUM_UNITS_FROM_AGENCY].ItemStyle.Font.Size = noninteractive_minor_font_size;
          A.Columns[Static.TCI_D_SLASH].ItemStyle.Font.Size = noninteractive_minor_font_size;
          A.Columns[Static.TCI_D_NUM_UNITS_CITYWIDE].ItemStyle.Font.Size = noninteractive_minor_font_size;
          A.Columns[Static.TCI_D_NAME_NONINTERACTIVE].HeaderStyle.Font.Size = noninteractive_major_font_size;
          A.Columns[Static.TCI_N_NUM_UNITS_FROM_AGENCY].ItemStyle.Font.Size = noninteractive_minor_font_size;
          A.Columns[Static.TCI_N_SLASH].ItemStyle.Font.Size = noninteractive_minor_font_size;
          A.Columns[Static.TCI_N_NUM_UNITS_CITYWIDE].ItemStyle.Font.Size = noninteractive_minor_font_size;
          A.Columns[Static.TCI_N_NAME_NONINTERACTIVE].HeaderStyle.Font.Size = noninteractive_major_font_size;
          }
        //
        A.Columns[Static.TCI_D_NUM_UNITS_FROM_AGENCY].Visible = p.be_interactive && (p.agency_filter.Length > 0) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_SLASH].Visible = p.be_interactive && (p.agency_filter.Length > 0) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_NUM_UNITS_CITYWIDE].Visible = (!p.be_lineup || p.be_now_day_shift) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_SPACER_MINOR].Visible = (!p.be_lineup || p.be_now_day_shift) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_POST_DESIGNATOR].Visible = (!p.be_lineup || p.be_now_day_shift) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_POST_CARDINALITY_NONINTERACTIVE].Visible = !p.be_interactive && (!p.be_lineup || p.be_now_day_shift) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_POST_CARDINALITY_INTERACTIVE].Visible = p.be_interactive && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_MEDICAL_RELEASE_DESCRIPTION].Visible = (!p.be_lineup || p.be_now_day_shift) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_BE_MARINE_MEDIC].Visible = (!p.be_lineup || p.be_now_day_shift) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_COLON].Visible = (!p.be_lineup || p.be_now_day_shift) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_NAME_INTERACTIVE].Visible = p.be_interactive && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_NAME_NONINTERACTIVE].Visible = !p.be_interactive && (!p.be_lineup || p.be_now_day_shift) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_BE_DRIVER_QUALIFIED].Visible = (!p.be_lineup || p.be_now_day_shift) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_MEMBER_AGENCY_DESIGNATOR].Visible = (!p.be_lineup || p.be_now_day_shift) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_COMMENT].Visible = (!p.be_lineup || p.be_now_day_shift) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_PHONE_NUM].Visible = (p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_D_CAD_NUM].Visible = (p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != 1);
        A.Columns[Static.TCI_TIMELINE_SPACER_LEFT].Visible = !(p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != 1);
        for (var i = new k.subtype<int>(Static.TCI_D0000,Static.TCI_D1130 + 1); i.val < i.LAST; i.val++)
          {
          A.Columns[i.val].Visible = (p.individual_work_timelines_mode.val == -1);
          }
        for (var i = new k.subtype<int>(Static.TCI_N0000,Static.TCI_N1130 + 1); i.val < i.LAST; i.val++)
          {
          A.Columns[i.val].Visible = (p.individual_work_timelines_mode.val == 1);
          }
        A.Columns[Static.TCI_TIMELINE_SPACER_RIGHT].Visible = !(p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_NUM_UNITS_FROM_AGENCY].Visible = p.be_interactive && (p.agency_filter.Length > 0) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_SLASH].Visible = p.be_interactive && (p.agency_filter.Length > 0) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_NUM_UNITS_CITYWIDE].Visible = !(p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_SPACER_MINOR].Visible = !(p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_POST_DESIGNATOR].Visible = !(p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_POST_CARDINALITY_NONINTERACTIVE].Visible = !p.be_interactive && !(p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_POST_CARDINALITY_INTERACTIVE].Visible = p.be_interactive && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_MEDICAL_RELEASE_DESCRIPTION].Visible = !(p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_BE_MARINE_MEDIC].Visible = !(p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_COLON].Visible = !(p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_NAME_INTERACTIVE].Visible = p.be_interactive && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_NAME_NONINTERACTIVE].Visible = !p.be_interactive && !(p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_BE_DRIVER_QUALIFIED].Visible = !(p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_MEMBER_AGENCY_DESIGNATOR].Visible = !(p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_COMMENT].Visible = !(p.be_lineup && p.be_now_day_shift) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_PHONE_NUM].Visible = (p.be_lineup && !p.be_now_day_shift) && (p.individual_work_timelines_mode.val != -1);
        A.Columns[Static.TCI_N_CAD_NUM].Visible = (p.be_lineup && !p.be_now_day_shift) && (p.individual_work_timelines_mode.val != -1);
        //
        p.biz_schedule_assignments.GetAgencyFootprintInfo(p.agency_filter,p.relative_month,p.nominal_day_filter_active,out p.post_footprint,out p.max_post_cardinality_actual);
        var proto_post_list_item_collection = new ListItemCollection();
        p.biz_agencies.BindEmsPostListItemCollectionShort
          (
          tier:(p.be_interactive ? p.biz_members.HighestTierOf(Session["member_id"].ToString()) : "1"),
          agency_filter:p.agency_filter,
          post_footprint:p.post_footprint,
          be_condensed:!CheckBox_expand_posts.Checked,
          be_user_squad_truck_team_scheduler:p.be_ok_to_schedule_squad_truck_team,
          be_user_volunteer_field_supervisor_team_scheduler:p.be_ok_to_schedule_volunteer_field_supervisor_team,
          be_user_mci_team_scheduler:p.be_ok_to_schedule_mci_team,
          be_user_bike_team_scheduler:p.be_ok_to_schedule_bike_team,
          target:proto_post_list_item_collection
          );
        p.proto_post_list_item_array = new ListItem[proto_post_list_item_collection.Count];
        proto_post_list_item_collection.CopyTo(p.proto_post_list_item_array,0);
        var max_post_cardinality_commanded = k.Safe(DropDownList_max_post_cardinality.SelectedValue,k.safe_hint_type.ALPHA);
        p.max_post_cardinality_effective = (max_post_cardinality_commanded.CompareTo(p.max_post_cardinality_actual) >= 0 ? max_post_cardinality_commanded : p.max_post_cardinality_actual);
        DropDownList_max_post_cardinality.SelectedValue = p.max_post_cardinality_effective;
        //
        var num_members = new k.int_nonnegative();
        var num_crew_shifts = new k.decimal_nonnegative();
        //
        v.be_ok_to_send_quickmessage_by_shift_in_context = p.biz_schedule_assignments.BeOkToSendQuickMessageByShift
          (
          be_interactive:p.be_interactive,
          be_ok_to_edit_post:p.be_ok_to_edit_post,
          be_ok_to_send_quickmessage_by_shift:p.be_ok_to_send_quickmessage_by_shift
          );
        v.be_full_watchbill_publish_mandatory = p.biz_agencies.BeFullWatchbillPublishMandatory(p.relative_month);
        //
        //========================
        //
        // Perform the major Bind.
        //
        p.biz_schedule_assignments.BindBaseDataList(p.agency_filter,p.release_filter,p.depth_filter,p.relative_month,p.nominal_day_filter_active,A,ref num_members,ref num_crew_shifts);
        //
        //========================
        //
        v.be_full_watchbill_publish_mandatory.Clear();
        //
        Literal_num_members.Text = num_members.val.ToString();
        Literal_num_crew_shifts.Text = num_crew_shifts.val.ToString("F1");
        ManageDayBumpLinkButtons();
        //
        if (p.be_nominal_day_mode_specific && !p.be_lineup)
          {
          Panel_ambulance_staffing_timeline_chart.Visible = true;
          Panel_timeline_mode.Visible = true;
          UserControl_ambulance_staffing_timeline_chart_control.SetP
            (
            agency_filter:p.agency_filter,
            relative_month:p.relative_month,
            nominal_day_filter:p.nominal_day_filter_active
            );
          }
        else
          {
          Panel_ambulance_staffing_timeline_chart.Visible = false;
          Panel_timeline_mode.Visible = false;
          }
        //
        if (p.be_nominal_day_mode_specific)
          {
          UserControl_schedule_assignment_log_control.Visible = true;
          UserControl_schedule_assignment_log_control.Set
            (
            relative_month:p.relative_month,
            nominal_day_filter:p.nominal_day_filter_active,
            shift_name:(p.be_lineup ? (p.be_now_day_shift ? "DAY" : "NIGHT") : k.EMPTY)
            );
          }
        else
          {
          UserControl_schedule_assignment_log_control.Visible = false;
          }
        //
        p.max_post_cardinality_actual = k.EMPTY;
        p.post_footprint = k.EMPTY;
        }
      Panel_supressed.Visible = be_suppressed;
      Table_data.Visible = !be_suppressed;
      p.be_datagrid_empty = (p.num_datagrid_rows == 0);
      TableRow_none.Visible = p.be_datagrid_empty;
      TableRow_panel_and_datagrid.Visible = !p.be_datagrid_empty;
      //
      p.num_datagrid_rows = 0;
      p.saved_d_unit_spec = k.EMPTY;
      p.saved_n_unit_spec = k.EMPTY;
      }

    private void ManageSimpleColumns
      (
      DataGridItemEventArgs e,
      bool be_selected,
      bool be_ok_to_enable_controls,
      int tci_comment,
      int tci_medical_release_description,
      int tci_be_marine_medic,
      int tci_colon,
      int tci_name_interactive,
      int tci_name_noninteractive,
      int tci_be_driver_qualified,
      int tci_be_selected,
      int tci_member_agency_id,
      int tci_member_agency_designator,
      int tci_be_challenge,
      int tci_be_greenhorns,
      int tci_num_units_citywide,
      int tci_slash,
      int tci_phone_num,
      int tci_cad_num,
      bool be_unit_spec_change
      )
      {
      //
      // Make simple columns bold to indicate selected, gray to indicate unselected.
      //
      if (be_selected)
        {
        if (p.be_interactive)
          {
          e.Item.Cells[tci_medical_release_description].Font.Bold = true;
          e.Item.Cells[tci_be_marine_medic].Font.Bold = true;
          e.Item.Cells[tci_colon].Font.Bold = true;
          e.Item.Cells[tci_name_interactive].Font.Bold = true;
          e.Item.Cells[tci_be_driver_qualified].Font.Bold = true;
          e.Item.Cells[tci_be_selected].Font.Bold = true;
          e.Item.Cells[tci_comment].Font.Bold = true;
          e.Item.Cells[tci_member_agency_designator].Font.Bold = true;
          }
        else if (p.be_lineup)
          {
          e.Item.Cells[tci_phone_num].Text = k.FormatAsNanpPhoneNum(e.Item.Cells[tci_phone_num].Text);
          }
        if ((e.Item.Cells[tci_be_greenhorns].Text == "1") && p.be_ok_to_see_other_member_schedule_detail)
          {
          e.Item.Cells[tci_comment].BackColor = Color.PaleGreen;
          e.Item.Cells[tci_medical_release_description].BackColor = Color.PaleGreen;
          e.Item.Cells[tci_be_marine_medic].BackColor = Color.PaleGreen;
          e.Item.Cells[tci_colon].BackColor = Color.PaleGreen;
          e.Item.Cells[tci_cad_num].BackColor = Color.PaleGreen;
          e.Item.Cells[tci_name_interactive].BackColor = Color.PaleGreen;
          e.Item.Cells[tci_name_noninteractive].BackColor = Color.PaleGreen;
          e.Item.Cells[tci_be_driver_qualified].BackColor = Color.PaleGreen;
          e.Item.Cells[tci_member_agency_designator].BackColor = Color.PaleGreen;
          e.Item.Cells[tci_phone_num].BackColor = Color.PaleGreen;
          }
        if (e.Item.Cells[tci_be_challenge].Text == "1")
          {
          e.Item.Cells[tci_comment].BackColor = Color.Yellow;
          e.Item.Cells[tci_medical_release_description].BackColor = Color.Yellow;
          e.Item.Cells[tci_be_marine_medic].BackColor = Color.Yellow;
          e.Item.Cells[tci_colon].BackColor = Color.Yellow;
          e.Item.Cells[tci_cad_num].BackColor = Color.Yellow;
          e.Item.Cells[tci_name_interactive].BackColor = Color.Yellow;
          e.Item.Cells[tci_name_noninteractive].BackColor = Color.Yellow;
          e.Item.Cells[tci_be_driver_qualified].BackColor = Color.Yellow;
          e.Item.Cells[tci_member_agency_designator].BackColor = Color.Yellow;
          e.Item.Cells[tci_phone_num].BackColor = Color.Yellow;
          }
        }
      else
        {
        e.Item.Cells[tci_member_agency_id].ForeColor = Color.Gray;
        e.Item.Cells[tci_medical_release_description].ForeColor = Color.Gray;
        e.Item.Cells[tci_be_marine_medic].ForeColor = Color.Gray;
        e.Item.Cells[tci_colon].ForeColor = Color.Gray;
        e.Item.Cells[tci_be_driver_qualified].ForeColor = Color.Gray;
        e.Item.Cells[tci_be_selected].ForeColor = Color.Gray;
        e.Item.Cells[tci_comment].ForeColor = Color.Gray;
        e.Item.Cells[tci_member_agency_designator].ForeColor = Color.Gray;
        }
      //
      if (e.Item.Cells[tci_num_units_citywide].Text == "&nbsp;")
        {
        e.Item.Cells[tci_slash].Text = k.EMPTY;
        }
      //
      // Make rendition adjustments according to medical release level.
      //
      if (e.Item.Cells[tci_medical_release_description].Text != "&nbsp;")
        {
        e.Item.Cells[tci_medical_release_description].Font.Italic = (new ArrayList() {"‡","¶","P","I","C"}).Contains(e.Item.Cells[tci_medical_release_description].Text);
        //
        if (new ArrayList() {"s","š","b"}.Contains(e.Item.Cells[tci_medical_release_description].Text))
          {
          e.Item.Cells[tci_medical_release_description].BackColor = Color.LightGray;
          }
        }
      else
        {
        e.Item.Cells[tci_colon].Text = k.EMPTY;
        }
      //
      // Manage display of 'merit badge' columns.
      //
      e.Item.Cells[tci_be_marine_medic].Text = (e.Item.Cells[tci_be_marine_medic].Text == "&nbsp;" ? k.EMPTY : (e.Item.Cells[tci_be_marine_medic].Text == "0" ? "&nbsp;" : "&asymp;"));
      //
      // Manage ablement of interactive name linkbutton.
      //
      if (!be_ok_to_enable_controls)
        {
        ((e.Item.Cells[tci_name_interactive].Controls[0]) as LinkButton).CommandName = ((e.Item.Cells[tci_name_interactive].Controls[0]) as LinkButton).CommandName.Replace("Select","SeeMemberDetailFor");
        }
      //
      // Manage member_agency_id.
      //
      var member_agency_id = k.Safe(e.Item.Cells[tci_member_agency_id].Text,k.safe_hint_type.NUM);
      if (member_agency_id.Length > 0)
        {
        ((e.Item.Cells[tci_member_agency_designator].Controls[0]) as Label).Text = (member_agency_id == p.agency_filter ? k.EMPTY : "<" + member_agency_id + "&nbsp;&nbsp;");
        }
      //
      // Control comment length.
      //
      e.Item.Cells[tci_comment].Text = e.Item.Cells[tci_comment].Text.Substring(0,Math.Min(e.Item.Cells[tci_comment].Text.Length,15));
      //
      if (be_unit_spec_change)
        {
        e.Item.Cells[tci_comment].Style.Add("border-top","thin solid silver");
        e.Item.Cells[tci_medical_release_description].Style.Add("border-top","thin solid silver");
        e.Item.Cells[tci_be_marine_medic].Style.Add("border-top","thin solid silver");
        e.Item.Cells[tci_colon].Style.Add("border-top","thin solid silver");
        e.Item.Cells[tci_cad_num].Style.Add("border-top","thin solid silver");
        e.Item.Cells[tci_name_interactive].Style.Add("border-top","thin solid silver");
        e.Item.Cells[tci_name_noninteractive].Style.Add("border-top","thin solid silver");
        e.Item.Cells[tci_be_driver_qualified].Style.Add("border-top","thin solid silver");
        e.Item.Cells[tci_member_agency_designator].Style.Add("border-top","thin solid silver");
        e.Item.Cells[tci_phone_num].Style.Add("border-top","thin solid silver");
        }
      }

    private void ManageComplexColumns
      (
      DataGridItemEventArgs e,
      bool be_selected,
      string post_id,
      bool be_ok_to_enable_controls,
      int tci_post_designator,
      int tci_post_cardinality_interactive,
      int tci_post_cardinality_noninteractive,
      int tci_be_challenge,
      int tci_be_greenhorns,
      bool be_unit_spec_change
      )
      {
      var post_drop_down_list = ((e.Item.Cells[tci_post_designator].Controls[Static.CI_DESIGNATOR_DROPDOWNLIST]) as DropDownList);
      var post_label = ((e.Item.Cells[tci_post_designator].Controls[Static.CI_DESIGNATOR_LABEL]) as Label);
      var post_cardinality_drop_down_list = ((e.Item.Cells[tci_post_cardinality_interactive].Controls[0]) as DropDownList);
      if (post_id.Length > 0)
        {
        foreach (ListItem list_item in p.proto_post_list_item_array)
          {
          post_drop_down_list.Items.Add(new ListItem(list_item.Text,list_item.Value));
          post_drop_down_list.Items[post_drop_down_list.Items.Count - 1].Selected = (list_item.Value == post_id);
          }
        if (be_selected)
          {
          var selected_post_list_item = new ListItem(p.biz_agencies.ShortDesignatorOf(post_id),post_id);
          if (!post_drop_down_list.Items.Contains(selected_post_list_item))
            {
            post_drop_down_list.Items.Add(selected_post_list_item);
            post_drop_down_list.Items[post_drop_down_list.Items.Count - 1].Selected = true;
            }
          if (p.be_interactive)
            {
            post_drop_down_list.Visible = true;
            post_label.Visible = false;
            p.biz_schedule_assignments.BindPostCardinalityListControl(p.max_post_cardinality_effective,post_cardinality_drop_down_list,e.Item.Cells[tci_post_cardinality_noninteractive].Text);
            //
            if (be_ok_to_enable_controls)
              {
              post_drop_down_list.Enabled = true;
              post_cardinality_drop_down_list.Enabled = true;
              }
            }
          else
            {
            post_label.Text = (p.depth_filter.Length == 0 ? "&nbsp;" : k.EMPTY) + post_drop_down_list.SelectedItem.Text;
            }
          if ((e.Item.Cells[tci_be_greenhorns].Text == "1") && p.be_ok_to_see_other_member_schedule_detail)
            {
            e.Item.Cells[tci_post_designator].BackColor = Color.PaleGreen;
            e.Item.Cells[tci_post_cardinality_interactive].BackColor = Color.PaleGreen;
            e.Item.Cells[tci_post_cardinality_noninteractive].BackColor = Color.PaleGreen;
            }
          if (e.Item.Cells[tci_be_challenge].Text == "1")
            {
            e.Item.Cells[tci_post_designator].BackColor = Color.Yellow;
            e.Item.Cells[tci_post_cardinality_interactive].BackColor = Color.Yellow;
            e.Item.Cells[tci_post_cardinality_noninteractive].BackColor = Color.Yellow;
            }
          }
        }
      if ((post_id.Length == 0) || !p.be_interactive || !be_selected)
        {
        post_drop_down_list.Visible = false;
        post_cardinality_drop_down_list.Visible = false;
        }
      if (be_unit_spec_change)
        {
        e.Item.Cells[tci_post_designator].Style.Add("border-top","thin solid silver");
        e.Item.Cells[tci_post_cardinality_interactive].Style.Add("border-top","thin solid silver");
        e.Item.Cells[tci_post_cardinality_noninteractive].Style.Add("border-top","thin solid silver");
        }
      }

    protected void A_ItemDataBound(object sender, DataGridItemEventArgs e)
      {
      var be_any_kind_of_item = (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType));
      if (e.Item.ItemType == ListItemType.Header)
        {
        e.Item.Cells[Static.TCI_NOMINAL_DAY].Text = DateTime.Now.AddMonths(p.relative_month.val).ToString("MMM").ToUpper();
        if (v.be_ok_to_send_quickmessage_by_shift_in_context)
        //then
          {
          var Label_day = new Label();
          Label_day.Font.Bold = true;
          Label_day.Text = "DAY&nbsp;&nbsp;&nbsp;";
          e.Item.Cells[Static.TCI_D_NAME_INTERACTIVE].Controls.Add(Label_day);
          var Label_night = new Label();
          Label_night.Font.Bold = true;
          Label_night.Text = "NIGHT&nbsp;&nbsp;&nbsp;";
          e.Item.Cells[Static.TCI_N_NAME_INTERACTIVE].Controls.Add(Label_night);
          if (p.be_nominal_day_mode_specific)
            {
            var LinkButton_quickmessage_day = new LinkButton();
            LinkButton_quickmessage_day.Text = k.ExpandTildePath("<IMG src='~/protected/image/mail-new3.png' alt='QuickMessage' border='0' height='16' width='16' />");
            LinkButton_quickmessage_day.ToolTip = "Write QuickMessage to members shown in DAY column";
            LinkButton_quickmessage_day.Click += LinkButton_quickmessage_day_Click;
            e.Item.Cells[Static.TCI_D_NAME_INTERACTIVE].Controls.Add(LinkButton_quickmessage_day);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(LinkButton_quickmessage_day);
            var LinkButton_quickmessage_night = new LinkButton();
            LinkButton_quickmessage_night.Text = k.ExpandTildePath("<IMG src='~/protected/image/mail-new3.png' alt='QuickMessage' border='0' height='16' width='16' />");
            LinkButton_quickmessage_night.ToolTip = "Write QuickMessage to members shown in NIGHT column";
            LinkButton_quickmessage_night.Click += LinkButton_quickmessage_night_Click;
            e.Item.Cells[Static.TCI_N_NAME_INTERACTIVE].Controls.Add(LinkButton_quickmessage_night);
            ScriptManager.GetCurrent(Page).RegisterPostBackControl(LinkButton_quickmessage_night);
            }
          }
        }
      else if (be_any_kind_of_item)
        {
        var nominal_day_datetime = DateTime.Parse(e.Item.Cells[Static.TCI_NOMINAL_DAY].Text);
        //
        // Set up bookmark.
        //
        ((e.Item.Cells[Static.TCI_D_SPACER_MAJOR].Controls[0]) as HtmlAnchor).Name = nominal_day_datetime.Day.ToString();
        //
        // Show certain columns only for first row of nominal day.
        //
        var monthless_rendition_of_nominal_day = p.biz_schedule_assignments.MonthlessRenditionOfNominalDay(nominal_day_datetime);
        if (e.Item.Cells[Static.TCI_DISPLAY_SEQ_NUM].Text == "1")
          {
          e.Item.Cells[Static.TCI_NOMINAL_DAY].Text = "<br/>" + monthless_rendition_of_nominal_day;
          e.Item.Style.Add("border-top","thick solid black");
          }
        else
          {
          e.Item.Cells[Static.TCI_NOMINAL_DAY].Text = k.EMPTY;
          e.Item.Cells[Static.TCI_D_NUM_UNITS_FROM_AGENCY].Text = k.EMPTY;
          e.Item.Cells[Static.TCI_D_SLASH].Text = k.EMPTY;
          e.Item.Cells[Static.TCI_D_NUM_UNITS_CITYWIDE].Text = k.EMPTY;
          e.Item.Cells[Static.TCI_N_NUM_UNITS_FROM_AGENCY].Text = k.EMPTY;
          e.Item.Cells[Static.TCI_N_SLASH].Text = k.EMPTY;
          e.Item.Cells[Static.TCI_N_NUM_UNITS_CITYWIDE].Text = k.EMPTY;
          }
        //
        var d_be_selected = (e.Item.Cells[Static.TCI_D_BE_SELECTED].Text == "1");
        var d_post_id = k.Safe(e.Item.Cells[Static.TCI_D_POST_ID].Text,k.safe_hint_type.NUM);
        var d_be_ok_to_enable_controls = p.biz_schedule_assignments.BeOkToEnableControls
          (
          post_id:d_post_id,
          be_interactive:p.be_interactive,
          be_ok_to_edit_post:p.be_ok_to_edit_post,
          agency_id:e.Item.Cells[Static.TCI_D_MEMBER_AGENCY_ID].Text,
          own_agency:p.own_agency,
          be_ok_to_edit_schedule_tier_department_only:p.be_ok_to_edit_schedule_tier_department_only,
          medical_release_description:e.Item.Cells[Static.TCI_D_MEDICAL_RELEASE_DESCRIPTION].Text,
          be_ok_to_edit_schedule_liberally:p.be_ok_to_edit_schedule_liberally,
          be_squad_exclusivity_expired:p.be_squad_exclusivity_expired,
          be_ok_to_schedule_squad_truck_team:p.be_ok_to_schedule_squad_truck_team,
          be_ok_to_schedule_volunteer_field_supervisor_team:p.be_ok_to_schedule_volunteer_field_supervisor_team,
          be_ok_to_schedule_mci_team:p.be_ok_to_schedule_mci_team,
          be_ok_to_schedule_bike_team:p.be_ok_to_schedule_bike_team,
          be_ok_to_edit_schedule_for_any_special_agency:p.be_ok_to_edit_schedule_for_any_special_agency,
          be_full_watchbill_publish_mandatory:v.be_full_watchbill_publish_mandatory
          );
        var n_be_selected = (e.Item.Cells[Static.TCI_N_BE_SELECTED].Text == "1");
        var n_post_id = k.Safe(e.Item.Cells[Static.TCI_N_POST_ID].Text,k.safe_hint_type.NUM);
        var n_be_ok_to_enable_controls = p.biz_schedule_assignments.BeOkToEnableControls
          (
          post_id:n_post_id,
          be_interactive:p.be_interactive,
          be_ok_to_edit_post:p.be_ok_to_edit_post,
          agency_id:e.Item.Cells[Static.TCI_N_MEMBER_AGENCY_ID].Text,
          own_agency:p.own_agency,
          be_ok_to_edit_schedule_tier_department_only:p.be_ok_to_edit_schedule_tier_department_only,
          medical_release_description:e.Item.Cells[Static.TCI_N_MEDICAL_RELEASE_DESCRIPTION].Text,
          be_ok_to_edit_schedule_liberally:p.be_ok_to_edit_schedule_liberally,
          be_squad_exclusivity_expired:p.be_squad_exclusivity_expired,
          be_ok_to_schedule_squad_truck_team:p.be_ok_to_schedule_squad_truck_team,
          be_ok_to_schedule_volunteer_field_supervisor_team:p.be_ok_to_schedule_volunteer_field_supervisor_team,
          be_ok_to_schedule_mci_team:p.be_ok_to_schedule_mci_team,
          be_ok_to_schedule_bike_team:p.be_ok_to_schedule_bike_team,
          be_ok_to_edit_schedule_for_any_special_agency:p.be_ok_to_edit_schedule_for_any_special_agency,
          be_full_watchbill_publish_mandatory:v.be_full_watchbill_publish_mandatory
          );
        //
        var current_d_unit_spec = monthless_rendition_of_nominal_day + "--" + d_post_id + "--" + e.Item.Cells[Static.TCI_D_POST_CARDINALITY_NONINTERACTIVE].Text;
        var current_n_unit_spec = monthless_rendition_of_nominal_day + "--" + n_post_id + "--" + e.Item.Cells[Static.TCI_N_POST_CARDINALITY_NONINTERACTIVE].Text;
        //
        var be_d_unit_spec_change = (current_d_unit_spec != p.saved_d_unit_spec);
        var be_n_unit_spec_change = (current_n_unit_spec != p.saved_n_unit_spec);
        //
        ManageComplexColumns
          (
          e,
          d_be_selected,
          d_post_id,
          d_be_ok_to_enable_controls,
          Static.TCI_D_POST_DESIGNATOR,
          Static.TCI_D_POST_CARDINALITY_INTERACTIVE,
          Static.TCI_D_POST_CARDINALITY_NONINTERACTIVE,
          Static.TCI_D_BE_CHALLENGE,
          Static.TCI_D_BE_GREENHORNS,
          be_d_unit_spec_change
          );
        ManageComplexColumns
          (
          e,
          n_be_selected,
          n_post_id,
          n_be_ok_to_enable_controls,
          Static.TCI_N_POST_DESIGNATOR,
          Static.TCI_N_POST_CARDINALITY_INTERACTIVE,
          Static.TCI_N_POST_CARDINALITY_NONINTERACTIVE,
          Static.TCI_N_BE_CHALLENGE,
          Static.TCI_N_BE_GREENHORNS,
          be_n_unit_spec_change
          );
        ManageSimpleColumns
          (
          e,
          d_be_selected,
          d_be_ok_to_enable_controls || p.be_ok_to_see_other_member_schedule_detail,
          Static.TCI_D_COMMENT,
          Static.TCI_D_MEDICAL_RELEASE_DESCRIPTION,
          Static.TCI_D_BE_MARINE_MEDIC,
          Static.TCI_D_COLON,
          Static.TCI_D_NAME_INTERACTIVE,
          Static.TCI_D_NAME_NONINTERACTIVE,
          Static.TCI_D_BE_DRIVER_QUALIFIED,
          Static.TCI_D_BE_SELECTED,
          Static.TCI_D_MEMBER_AGENCY_ID,
          Static.TCI_D_MEMBER_AGENCY_DESIGNATOR,
          Static.TCI_D_BE_CHALLENGE,
          Static.TCI_D_BE_GREENHORNS,
          Static.TCI_D_NUM_UNITS_CITYWIDE,
          Static.TCI_D_SLASH,
          Static.TCI_D_PHONE_NUM,
          Static.TCI_D_CAD_NUM,
          be_d_unit_spec_change
          );
        ManageSimpleColumns
          (
          e,
          n_be_selected,
          n_be_ok_to_enable_controls || p.be_ok_to_see_other_member_schedule_detail,
          Static.TCI_N_COMMENT,
          Static.TCI_N_MEDICAL_RELEASE_DESCRIPTION,
          Static.TCI_N_BE_MARINE_MEDIC,
          Static.TCI_N_COLON,
          Static.TCI_N_NAME_INTERACTIVE,
          Static.TCI_N_NAME_NONINTERACTIVE,
          Static.TCI_N_BE_DRIVER_QUALIFIED,
          Static.TCI_N_BE_SELECTED,
          Static.TCI_N_MEMBER_AGENCY_ID,
          Static.TCI_N_MEMBER_AGENCY_DESIGNATOR,
          Static.TCI_N_BE_CHALLENGE,
          Static.TCI_N_BE_GREENHORNS,
          Static.TCI_N_NUM_UNITS_CITYWIDE,
          Static.TCI_N_SLASH,
          Static.TCI_N_PHONE_NUM,
          Static.TCI_N_CAD_NUM,
          be_n_unit_spec_change
          );
        //
        p.saved_d_unit_spec = current_d_unit_spec;
        p.saved_n_unit_spec = current_n_unit_spec;
        //
        // Increment row counter
        //
        p.num_datagrid_rows++;
        }
      //
      if (p.be_interactive)
        {
        if (be_any_kind_of_item)
          {
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(((e.Item.Cells[Static.TCI_D_NAME_INTERACTIVE].Controls[0]) as LinkButton));
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(((e.Item.Cells[Static.TCI_N_NAME_INTERACTIVE].Controls[0]) as LinkButton));
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[Static.TCI_D_ASSIGNMENT_ID].EnableViewState = true;
          e.Item.Cells[Static.TCI_D_MEMBER_AGENCY_ID].EnableViewState = true;
          e.Item.Cells[Static.TCI_D_MEMBER_ID].EnableViewState = true;
          e.Item.Cells[Static.TCI_D_POST_DESIGNATOR].EnableViewState = true;
          e.Item.Cells[Static.TCI_D_POST_CARDINALITY_INTERACTIVE].EnableViewState = true;
          e.Item.Cells[Static.TCI_N_ASSIGNMENT_ID].EnableViewState = true;
          e.Item.Cells[Static.TCI_N_MEMBER_AGENCY_ID].EnableViewState = true;
          e.Item.Cells[Static.TCI_N_MEMBER_ID].EnableViewState = true;
          e.Item.Cells[Static.TCI_N_POST_DESIGNATOR].EnableViewState = true;
          e.Item.Cells[Static.TCI_N_POST_CARDINALITY_INTERACTIVE].EnableViewState = true;
          }
        }
      }

    private void LinkButton_quickmessage_Click(string shift_name)
      {
      var msg_protected_quickmessage_by_shift = new TClass_msg_protected.quickmessage_by_shift();
      msg_protected_quickmessage_by_shift.agency_filter = p.agency_filter;
      msg_protected_quickmessage_by_shift.release_filter = p.release_filter;
      msg_protected_quickmessage_by_shift.depth_filter = p.depth_filter;
      msg_protected_quickmessage_by_shift.relative_month = p.relative_month;
      msg_protected_quickmessage_by_shift.nominal_day_filter = p.nominal_day_filter_active;
      msg_protected_quickmessage_by_shift.shift_name = shift_name;
      MessageDropCrumbAndTransferTo
        (
        msg:msg_protected_quickmessage_by_shift,
        folder_name:"protected",
        aspx_name:"quickmessage_by_shift"
        );
      }

    private void LinkButton_quickmessage_day_Click(object sender, EventArgs e)
      {
      LinkButton_quickmessage_Click("DAY");
      }

    private void LinkButton_quickmessage_night_Click(object sender, EventArgs e)
      {
      LinkButton_quickmessage_Click("NIGHT");
      }

    protected void DropDownList_d_post_SelectedIndexChanged(object sender, EventArgs e)
      {
      var sender_grandparent_datagriditem = (sender as DropDownList).Parent.Parent as DataGridItem;
      v.be_full_watchbill_publish_mandatory = p.biz_agencies.BeFullWatchbillPublishMandatory(p.relative_month);
      if(p.biz_schedule_assignments.BeOkToEnableControls
          (
          post_id:k.Safe(sender_grandparent_datagriditem.Cells[Static.TCI_D_POST_ID].Text,k.safe_hint_type.NUM),
          be_interactive:p.be_interactive,
          be_ok_to_edit_post:p.be_ok_to_edit_post,
          agency_id:sender_grandparent_datagriditem.Cells[Static.TCI_D_MEMBER_AGENCY_ID].Text,
          own_agency:p.own_agency,
          be_ok_to_edit_schedule_tier_department_only:p.be_ok_to_edit_schedule_tier_department_only,
          medical_release_description:sender_grandparent_datagriditem.Cells[Static.TCI_D_MEDICAL_RELEASE_DESCRIPTION].Text,
          be_ok_to_edit_schedule_liberally:p.be_ok_to_edit_schedule_liberally,
          be_squad_exclusivity_expired:p.be_squad_exclusivity_expired,
          be_ok_to_schedule_squad_truck_team:p.be_ok_to_schedule_squad_truck_team,
          be_ok_to_schedule_volunteer_field_supervisor_team:p.be_ok_to_schedule_volunteer_field_supervisor_team,
          be_ok_to_schedule_mci_team:p.be_ok_to_schedule_mci_team,
          be_ok_to_schedule_bike_team:p.be_ok_to_schedule_bike_team,
          be_ok_to_edit_schedule_for_any_special_agency:p.be_ok_to_edit_schedule_for_any_special_agency,
          be_full_watchbill_publish_mandatory:v.be_full_watchbill_publish_mandatory
          )
        )
        {
        p.biz_schedule_assignments.SetPost
          (
          id:k.Safe(sender_grandparent_datagriditem.Cells[Static.TCI_D_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),
          post_id:k.Safe((sender as DropDownList).SelectedValue,k.safe_hint_type.NUM)
          );
        }
      else
        {
        SessionSet("ip_address",HttpContext.Current.Request.UserHostAddress);
        throw k.PRIVILEGE_VIOLATION;
        }
      v.be_full_watchbill_publish_mandatory.Clear();
      }

    protected void DropDownList_n_post_SelectedIndexChanged(object sender, EventArgs e)
      {
      var sender_grandparent_datagriditem = (sender as DropDownList).Parent.Parent as DataGridItem;
      v.be_full_watchbill_publish_mandatory = p.biz_agencies.BeFullWatchbillPublishMandatory(p.relative_month);
      if(p.biz_schedule_assignments.BeOkToEnableControls
          (
          post_id:k.Safe(sender_grandparent_datagriditem.Cells[Static.TCI_N_POST_ID].Text,k.safe_hint_type.NUM),
          be_interactive:p.be_interactive,
          be_ok_to_edit_post:p.be_ok_to_edit_post,
          agency_id:sender_grandparent_datagriditem.Cells[Static.TCI_N_MEMBER_AGENCY_ID].Text,
          own_agency:p.own_agency,
          be_ok_to_edit_schedule_tier_department_only:p.be_ok_to_edit_schedule_tier_department_only,
          medical_release_description:sender_grandparent_datagriditem.Cells[Static.TCI_N_MEDICAL_RELEASE_DESCRIPTION].Text,
          be_ok_to_edit_schedule_liberally:p.be_ok_to_edit_schedule_liberally,
          be_squad_exclusivity_expired:p.be_squad_exclusivity_expired,
          be_ok_to_schedule_squad_truck_team:p.be_ok_to_schedule_squad_truck_team,
          be_ok_to_schedule_volunteer_field_supervisor_team:p.be_ok_to_schedule_volunteer_field_supervisor_team,
          be_ok_to_schedule_mci_team:p.be_ok_to_schedule_mci_team,
          be_ok_to_schedule_bike_team:p.be_ok_to_schedule_bike_team,
          be_ok_to_edit_schedule_for_any_special_agency:p.be_ok_to_edit_schedule_for_any_special_agency,
          be_full_watchbill_publish_mandatory:v.be_full_watchbill_publish_mandatory
          )
        )
        {
        p.biz_schedule_assignments.SetPost
          (
          id:k.Safe(sender_grandparent_datagriditem.Cells[Static.TCI_N_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),
          post_id:k.Safe((sender as DropDownList).SelectedValue,k.safe_hint_type.NUM)
          );
        }
      else
        {
        SessionSet("ip_address",HttpContext.Current.Request.UserHostAddress);
        throw k.PRIVILEGE_VIOLATION;
        }
      v.be_full_watchbill_publish_mandatory.Clear();
      }

    protected void DropDownList_d_post_cardinality_SelectedIndexChanged(object sender, EventArgs e)
      {
      var sender_grandparent_datagriditem = (sender as DropDownList).Parent.Parent as DataGridItem;
      v.be_full_watchbill_publish_mandatory = p.biz_agencies.BeFullWatchbillPublishMandatory(p.relative_month);
      if(p.biz_schedule_assignments.BeOkToEnableControls
          (
          post_id:k.Safe(sender_grandparent_datagriditem.Cells[Static.TCI_D_POST_ID].Text,k.safe_hint_type.NUM),
          be_interactive:p.be_interactive,
          be_ok_to_edit_post:p.be_ok_to_edit_post,
          agency_id:sender_grandparent_datagriditem.Cells[Static.TCI_D_MEMBER_AGENCY_ID].Text,
          own_agency:p.own_agency,
          be_ok_to_edit_schedule_tier_department_only:p.be_ok_to_edit_schedule_tier_department_only,
          medical_release_description:sender_grandparent_datagriditem.Cells[Static.TCI_D_MEDICAL_RELEASE_DESCRIPTION].Text,
          be_ok_to_edit_schedule_liberally:p.be_ok_to_edit_schedule_liberally,
          be_squad_exclusivity_expired:p.be_squad_exclusivity_expired,
          be_ok_to_schedule_squad_truck_team:p.be_ok_to_schedule_squad_truck_team,
          be_ok_to_schedule_volunteer_field_supervisor_team:p.be_ok_to_schedule_volunteer_field_supervisor_team,
          be_ok_to_schedule_mci_team:p.be_ok_to_schedule_mci_team,
          be_ok_to_schedule_bike_team:p.be_ok_to_schedule_bike_team,
          be_ok_to_edit_schedule_for_any_special_agency:p.be_ok_to_edit_schedule_for_any_special_agency,
          be_full_watchbill_publish_mandatory:v.be_full_watchbill_publish_mandatory
          )
        )
        {
        p.biz_schedule_assignments.SetPostCardinality
          (
          id:k.Safe(sender_grandparent_datagriditem.Cells[Static.TCI_D_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),
          post_cardinality:k.Safe((sender as DropDownList).SelectedValue,k.safe_hint_type.ALPHA)
          );
        }
      else
        {
        SessionSet("ip_address",HttpContext.Current.Request.UserHostAddress);
        throw k.PRIVILEGE_VIOLATION;
        }
      v.be_full_watchbill_publish_mandatory.Clear();
      }

    protected void DropDownList_n_post_cardinality_SelectedIndexChanged(object sender, EventArgs e)
      {
      var sender_grandparent_datagriditem = (sender as DropDownList).Parent.Parent as DataGridItem;
      v.be_full_watchbill_publish_mandatory = p.biz_agencies.BeFullWatchbillPublishMandatory(p.relative_month);
      if(p.biz_schedule_assignments.BeOkToEnableControls
          (
          post_id:k.Safe(sender_grandparent_datagriditem.Cells[Static.TCI_N_POST_ID].Text,k.safe_hint_type.NUM),
          be_interactive:p.be_interactive,
          be_ok_to_edit_post:p.be_ok_to_edit_post,
          agency_id:sender_grandparent_datagriditem.Cells[Static.TCI_N_MEMBER_AGENCY_ID].Text,
          own_agency:p.own_agency,
          be_ok_to_edit_schedule_tier_department_only:p.be_ok_to_edit_schedule_tier_department_only,
          medical_release_description:sender_grandparent_datagriditem.Cells[Static.TCI_N_MEDICAL_RELEASE_DESCRIPTION].Text,
          be_ok_to_edit_schedule_liberally:p.be_ok_to_edit_schedule_liberally,
          be_squad_exclusivity_expired:p.be_squad_exclusivity_expired,
          be_ok_to_schedule_squad_truck_team:p.be_ok_to_schedule_squad_truck_team,
          be_ok_to_schedule_volunteer_field_supervisor_team:p.be_ok_to_schedule_volunteer_field_supervisor_team,
          be_ok_to_schedule_mci_team:p.be_ok_to_schedule_mci_team,
          be_ok_to_schedule_bike_team:p.be_ok_to_schedule_bike_team,
          be_ok_to_edit_schedule_for_any_special_agency:p.be_ok_to_edit_schedule_for_any_special_agency,
          be_full_watchbill_publish_mandatory:v.be_full_watchbill_publish_mandatory
          )
        )
        {
        p.biz_schedule_assignments.SetPostCardinality
          (
          id:k.Safe(sender_grandparent_datagriditem.Cells[Static.TCI_N_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),
          post_cardinality:k.Safe((sender as DropDownList).SelectedValue,k.safe_hint_type.ALPHA)
          );
        }
      else
        {
        SessionSet("ip_address",HttpContext.Current.Request.UserHostAddress);
        throw k.PRIVILEGE_VIOLATION;
        }
      v.be_full_watchbill_publish_mandatory.Clear();
      }

    protected void Button_save_Click(object sender, EventArgs e)
      {
      Bind();
      }

    protected void A_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      var d_member_id = k.Safe(e.Item.Cells[Static.TCI_D_MEMBER_ID].Text,k.safe_hint_type.NUM);
      var n_member_id = k.Safe(e.Item.Cells[Static.TCI_N_MEMBER_ID].Text,k.safe_hint_type.NUM);
      p.msg_protected_member_schedule_detail.relative_month = p.relative_month;
      if (e.CommandName.StartsWith("Select"))
        {
        if (e.CommandName == "SelectDayAvailMember")
          {
          p.msg_protected_member_schedule_detail.member_id = d_member_id;
          p.msg_protected_member_schedule_detail.member_agency_id = k.Safe(e.Item.Cells[Static.TCI_D_MEMBER_AGENCY_ID].Text,k.safe_hint_type.NUM);
          }
        else if (e.CommandName == "SelectNightAvailMember")
          {
          p.msg_protected_member_schedule_detail.member_id = n_member_id;
          p.msg_protected_member_schedule_detail.member_agency_id = k.Safe(e.Item.Cells[Static.TCI_N_MEMBER_AGENCY_ID].Text,k.safe_hint_type.NUM);
          }
        MessageDropCrumbAndTransferTo(p.msg_protected_member_schedule_detail,"protected","member_schedule_detail");
        }
      if (e.CommandName.StartsWith("SeeMemberDetailFor"))
        {
        if (e.CommandName == "SeeMemberDetailForDayAvailMember")
          {
          SessionSet("member_summary",p.biz_members.Summary(d_member_id));
          }
        else if (e.CommandName == "SeeMemberDetailForNightAvailMember")
          {
          SessionSet("member_summary",p.biz_members.Summary(n_member_id));
          }
        DropCrumbAndTransferTo("member_detail.aspx");
        }
      }

    protected void RadioButtonList_be_nominal_day_mode_specific_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.be_nominal_day_mode_specific = (k.Safe(RadioButtonList_be_nominal_day_mode_specific.SelectedValue,k.safe_hint_type.NUM) == "1");
      p.nominal_day_filter_active = (p.be_nominal_day_mode_specific ? (int.Parse(p.nominal_day_filter_saved) <= p.selected_month_day_last.Day ? p.nominal_day_filter_saved : "1") : k.EMPTY);
      Bind();
      }

    protected void Calendar_nominal_day_SelectionChanged(object sender, EventArgs e)
      {
      SelectCalendarNominalDay();
      }

    private void SelectCalendarNominalDay()
      {
      RadioButtonList_be_nominal_day_mode_specific.SelectedValue = "1";
      p.be_nominal_day_mode_specific = true;
      Calendar_nominal_day.SelectedDates.SelectRange(Calendar_nominal_day.SelectedDate, Calendar_nominal_day.SelectedDate);
      p.nominal_day_filter_active = Calendar_nominal_day.SelectedDate.Day.ToString();
      p.nominal_day_filter_saved = p.nominal_day_filter_active;
      Bind();
      }

    protected void Calendar_nominal_day_DayRender(object sender, DayRenderEventArgs e)
      {
      e.Day.IsSelectable = false;
      if ((p.be_interactive) && (e.Day.Date.Month == DateTime.Now.AddMonths(p.relative_month.val).Month))
        {
        if (p.be_nominal_day_mode_specific && e.Day.IsSelected)
          {
          e.Cell.ForeColor = Color.White;
          }
        else
          {
          e.Day.IsSelectable = true;
          e.Cell.ForeColor = (e.Day.IsSelected ? Color.LightBlue : Color.Blue);
          }
        }
      }

    protected void CheckBox_expand_posts_CheckedChanged(object sender, EventArgs e)
      {
      Bind();
      }

    protected void DropDownList_max_post_cardinality_SelectedIndexChanged(object sender, EventArgs e)
      {
      Bind();
      }

    internal void SetTarget(string target)
      {
      var nominal_day_target = target.Substring(target.LastIndexOf("/") + 1);
      if (nominal_day_target.Length > 0)
        {
        p.nominal_day_filter_saved = p.nominal_day_filter_active = nominal_day_target;
        }
      }

    protected void LinkButton_previous_Click(object sender, EventArgs e)
      {
      Calendar_nominal_day.SelectedDate = Calendar_nominal_day.SelectedDate.AddDays(-1);
      SelectCalendarNominalDay();
      }

    protected void LinkButton_next_Click(object sender, EventArgs e)
      {
      Calendar_nominal_day.SelectedDate = Calendar_nominal_day.SelectedDate.AddDays(1);
      SelectCalendarNominalDay();
      }

    private void ManageDayBumpLinkButtons()
      {
      var be_interactive_nominal_day_mode_specific_and_not_day_of_month_first = p.be_interactive && p.be_nominal_day_mode_specific && (p.nominal_day_filter_active != "1");
      var be_interactive_nominal_day_mode_specific_and_not_day_of_month_last = p.be_interactive && p.be_nominal_day_mode_specific && (p.nominal_day_filter_active != p.selected_month_day_last.Day.ToString());
      LinkButton_previous_top.Visible = be_interactive_nominal_day_mode_specific_and_not_day_of_month_first;
      LinkButton_previous_middle.Visible = be_interactive_nominal_day_mode_specific_and_not_day_of_month_first;
      LinkButton_previous_bottom.Visible = be_interactive_nominal_day_mode_specific_and_not_day_of_month_first;
      LinkButton_next_top.Visible = be_interactive_nominal_day_mode_specific_and_not_day_of_month_last;
      LinkButton_next_middle.Visible = be_interactive_nominal_day_mode_specific_and_not_day_of_month_last;
      LinkButton_next_bottom.Visible = be_interactive_nominal_day_mode_specific_and_not_day_of_month_last;
      }

    protected void Button_show_day_timelines_Click(object sender, EventArgs e)
      {
      p.individual_work_timelines_mode.val = -1;
      Bind();
      }

    protected void Button_show_night_timelines_Click(object sender, EventArgs e)
      {
      p.individual_work_timelines_mode.val = +1;
      Bind();
      }

    protected void Button_hide_timelines_Click(object sender, EventArgs e)
      {
      p.individual_work_timelines_mode.val = 0;
      Bind();
      }
    }

  }
