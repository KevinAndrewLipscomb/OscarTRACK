using Class_biz_agencies;
using Class_biz_medical_release_levels;
using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_biz_shifts;
using Class_msg_protected;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace UserControl_schedule_proposal
  {

  public struct p_type
    {
    public string agency_filter;
    public bool be_commanded_watchbill_noninteractive;
    public bool be_datagrid_empty;
    public bool be_interactive;
    public bool be_lineup;
    public bool be_loaded;
    public bool be_now_day_shift;
    public bool be_nominal_day_mode_specific;
    public bool be_ok_to_edit_post;
    public bool be_ok_to_see_other_member_schedule_detail;
    public bool be_squad_exclusivity_expired;
    public bool be_user_privileged_to_see_all_squads;
    public TClass_biz_agencies biz_agencies;
    public TClass_biz_medical_release_levels biz_medical_release_levels;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public TClass_biz_shifts biz_shifts;
    public string depth_filter;
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

  public partial class TWebUserControl_schedule_proposal: ki_web_ui.usercontrol_class
    {

    public static class UserControl_schedule_proposal_Static
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
      public const int TCI_D_COLON = 15;
      public const int TCI_D_NAME_INTERACTIVE = 16;
      public const int TCI_D_NAME_NONINTERACTIVE = 17;
      public const int TCI_D_BE_DRIVER_QUALIFIED = 18;
      public const int TCI_D_MEMBER_AGENCY_ID = 19;
      public const int TCI_D_MEMBER_AGENCY_DESIGNATOR = 20;
      public const int TCI_D_BE_SELECTED = 21;
      public const int TCI_D_COMMENT = 22;
      public const int TCI_D_BE_CHALLENGE = 23;
      public const int TCI_D_PHONE_NUM = 24;
      public const int TCI_N_SPACER_MAJOR = 25;
      public const int TCI_N_NUM_UNITS_FROM_AGENCY = 26;
      public const int TCI_N_SLASH = 27;
      public const int TCI_N_NUM_UNITS_CITYWIDE = 28;
      public const int TCI_N_SPACER_MINOR = 29;
      public const int TCI_N_ASSIGNMENT_ID = 30;
      public const int TCI_N_POST_ID = 31;
      public const int TCI_N_AGENCY_SHORT_DESIGNATOR = 32;
      public const int TCI_N_MEMBER_ID = 33;
      public const int TCI_N_POST_DESIGNATOR = 34;
      public const int TCI_N_POST_CARDINALITY_NONINTERACTIVE = 35;
      public const int TCI_N_POST_CARDINALITY_INTERACTIVE = 36;
      public const int TCI_N_MEDICAL_RELEASE_DESCRIPTION = 37;
      public const int TCI_N_COLON = 38;
      public const int TCI_N_NAME_INTERACTIVE = 39;
      public const int TCI_N_NAME_NONINTERACTIVE = 40;
      public const int TCI_N_BE_DRIVER_QUALIFIED = 41;
      public const int TCI_N_MEMBER_AGENCY_ID = 42;
      public const int TCI_N_MEMBER_AGENCY_DESIGNATOR = 43;
      public const int TCI_N_BE_SELECTED = 44;
      public const int TCI_N_COMMENT = 45;
      public const int TCI_N_BE_CHALLENGE = 46;
      public const int TCI_N_PHONE_NUM = 47;
      //
      public const int CI_DESIGNATOR_DROPDOWNLIST = 0;
      public const int CI_DESIGNATOR_LABEL = 1;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (p.be_interactive && p.be_ok_to_edit_post)
          {
          TableRow_guidance.Visible = true;
          Literal_application_name.Text = ConfigurationManager.AppSettings["application_name"];
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
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        p.biz_shifts = new TClass_biz_shifts();
        //
        p.agency_filter = k.EMPTY;
        p.be_commanded_watchbill_noninteractive = (Session["mode:report/commanded-watchbill-noninteractive"] != null);
        p.be_interactive = (Session["mode:report"] == null);
        p.be_lineup = (Session["mode:report/commanded-lineup"] != null);
        p.be_now_day_shift = p.biz_shifts.BeInDayShift(DateTime.Now.TimeOfDay.Add(new TimeSpan(hours:1,minutes:0,seconds:0)));
        p.be_nominal_day_mode_specific =  (p.be_interactive || p.be_lineup);
        p.be_ok_to_edit_post = k.Has((string[])(Session["privilege_array"]), "edit-schedule");
        p.be_ok_to_see_other_member_schedule_detail = k.Has((string[])(Session["privilege_array"]), "see-other-member-schedule-detail");
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
      if (be_for_month_change)
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
      var watchbill_maag_hashtable = new Hashtable();
      watchbill_maag_hashtable["agency_id"] = p.agency_filter;
      watchbill_maag_hashtable["relative_month"] = p.relative_month.val;
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
      p.depth_filter = "1";
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
        var nominal_datetime_filter_active = new DateTime(p.selected_year_num,p.selected_month_num,int.Parse(p.nominal_day_filter_active));
        Calendar_nominal_day.SelectedDates.SelectRange(nominal_datetime_filter_active,nominal_datetime_filter_active);
        }
      else
        {
        Calendar_nominal_day.SelectedDates.SelectRange(p.selected_month_day_first,p.selected_month_day_last);
        }
      Calendar_nominal_day.Enabled = p.be_interactive;
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
          A.Columns[UserControl_schedule_proposal_Static.TCI_NOMINAL_DAY].HeaderStyle.Font.Size = interactive_major_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_NOMINAL_DAY].ItemStyle.Font.Size = interactive_major_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_D_NUM_UNITS_FROM_AGENCY].ItemStyle.Font.Size = interactive_minor_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_D_SLASH].ItemStyle.Font.Size = interactive_minor_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_D_NUM_UNITS_CITYWIDE].ItemStyle.Font.Size = interactive_minor_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_N_NUM_UNITS_FROM_AGENCY].ItemStyle.Font.Size = interactive_minor_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_N_SLASH].ItemStyle.Font.Size = interactive_minor_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_N_NUM_UNITS_CITYWIDE].ItemStyle.Font.Size = interactive_minor_font_size;
          }
        else
          {
          A.Font.Size = noninteractive_neutral_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_NOMINAL_DAY].HeaderStyle.Font.Size = noninteractive_major_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_NOMINAL_DAY].ItemStyle.Font.Size = noninteractive_major_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_D_NUM_UNITS_FROM_AGENCY].ItemStyle.Font.Size = noninteractive_minor_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_D_SLASH].ItemStyle.Font.Size = noninteractive_minor_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_D_NUM_UNITS_CITYWIDE].ItemStyle.Font.Size = noninteractive_minor_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_D_NAME_NONINTERACTIVE].HeaderStyle.Font.Size = noninteractive_major_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_N_NUM_UNITS_FROM_AGENCY].ItemStyle.Font.Size = noninteractive_minor_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_N_SLASH].ItemStyle.Font.Size = noninteractive_minor_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_N_NUM_UNITS_CITYWIDE].ItemStyle.Font.Size = noninteractive_minor_font_size;
          A.Columns[UserControl_schedule_proposal_Static.TCI_N_NAME_NONINTERACTIVE].HeaderStyle.Font.Size = noninteractive_major_font_size;
          }
        //
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_SPACER_MAJOR].Visible = (!p.be_lineup || p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_NUM_UNITS_FROM_AGENCY].Visible = p.be_interactive && (p.agency_filter != k.EMPTY);
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_SLASH].Visible = p.be_interactive && (p.agency_filter != k.EMPTY);
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_NUM_UNITS_CITYWIDE].Visible = (!p.be_lineup || p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_SPACER_MINOR].Visible = (!p.be_lineup || p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_POST_DESIGNATOR].Visible = (!p.be_lineup || p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_POST_CARDINALITY_NONINTERACTIVE].Visible = !p.be_interactive && (!p.be_lineup || p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_POST_CARDINALITY_INTERACTIVE].Visible = p.be_interactive;
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_MEDICAL_RELEASE_DESCRIPTION].Visible = (!p.be_lineup || p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_COLON].Visible = (!p.be_lineup || p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_NAME_INTERACTIVE].Visible = p.be_interactive;
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_NAME_NONINTERACTIVE].Visible = !p.be_interactive && (!p.be_lineup || p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_BE_DRIVER_QUALIFIED].Visible = (!p.be_lineup || p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_MEMBER_AGENCY_DESIGNATOR].Visible = (!p.be_lineup || p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_COMMENT].Visible = (!p.be_lineup || p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_D_PHONE_NUM].Visible = (p.be_lineup && p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_SPACER_MAJOR].Visible = !(p.be_lineup && p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_NUM_UNITS_FROM_AGENCY].Visible = p.be_interactive && (p.agency_filter != k.EMPTY);
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_SLASH].Visible = p.be_interactive && (p.agency_filter != k.EMPTY);
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_NUM_UNITS_CITYWIDE].Visible = !(p.be_lineup && p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_SPACER_MINOR].Visible = !(p.be_lineup && p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_POST_DESIGNATOR].Visible = !(p.be_lineup && p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_POST_CARDINALITY_NONINTERACTIVE].Visible = !p.be_interactive && !(p.be_lineup && p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_POST_CARDINALITY_INTERACTIVE].Visible = p.be_interactive;
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_MEDICAL_RELEASE_DESCRIPTION].Visible = !(p.be_lineup && p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_COLON].Visible = !(p.be_lineup && p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_NAME_INTERACTIVE].Visible = p.be_interactive;
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_NAME_NONINTERACTIVE].Visible = !p.be_interactive && !(p.be_lineup && p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_BE_DRIVER_QUALIFIED].Visible = !(p.be_lineup && p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_MEMBER_AGENCY_DESIGNATOR].Visible = !(p.be_lineup && p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_COMMENT].Visible = !(p.be_lineup && p.be_now_day_shift);
        A.Columns[UserControl_schedule_proposal_Static.TCI_N_PHONE_NUM].Visible = (p.be_lineup && !p.be_now_day_shift);
        //
        p.biz_schedule_assignments.GetAgencyFootprintInfo(p.agency_filter,p.relative_month,p.nominal_day_filter_active,out p.post_footprint,out p.max_post_cardinality_actual);
        var proto_post_list_item_collection = new ListItemCollection();
        p.biz_agencies.BindEmsPostListItemCollectionShort((p.be_interactive ? p.biz_members.HighestTierOf(Session["member_id"].ToString()) : "1"),p.agency_filter,p.post_footprint,!CheckBox_expand_posts.Checked,proto_post_list_item_collection);
        p.proto_post_list_item_array = new ListItem[proto_post_list_item_collection.Count];
        proto_post_list_item_collection.CopyTo(p.proto_post_list_item_array,0);
        var max_post_cardinality_commanded = k.Safe(DropDownList_max_post_cardinality.SelectedValue,k.safe_hint_type.ALPHA);
        p.max_post_cardinality_effective = (max_post_cardinality_commanded.CompareTo(p.max_post_cardinality_actual) >= 0 ? max_post_cardinality_commanded : p.max_post_cardinality_actual);
        DropDownList_max_post_cardinality.SelectedValue = p.max_post_cardinality_effective;
        //
        var num_members = new k.int_nonnegative();
        var num_crew_shifts = new k.decimal_nonnegative();
        p.biz_schedule_assignments.BindBaseDataList(p.agency_filter,p.release_filter,p.depth_filter,p.relative_month,p.nominal_day_filter_active,A,ref num_members,ref num_crew_shifts);
        Literal_num_members.Text = num_members.val.ToString();
        Literal_num_crew_shifts.Text = num_crew_shifts.val.ToString("F1");
        ManageDayBumpLinkButtons();
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
      int tci_colon,
      int tci_name_interactive,
      int tci_name_noninteractive,
      int tci_be_driver_qualified,
      int tci_be_selected,
      int tci_member_agency_id,
      int tci_member_agency_designator,
      int tci_be_challenge,
      int tci_num_units_citywide,
      int tci_slash,
      int tci_phone_num,
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
        if (e.Item.Cells[tci_be_challenge].Text == "1")
          {
          e.Item.Cells[tci_comment].BackColor = Color.Yellow;
          e.Item.Cells[tci_medical_release_description].BackColor = Color.Yellow;
          e.Item.Cells[tci_colon].BackColor = Color.Yellow;
          e.Item.Cells[tci_name_interactive].BackColor = Color.Yellow;
          e.Item.Cells[tci_name_noninteractive].BackColor = Color.Yellow;
          e.Item.Cells[tci_be_driver_qualified].BackColor = Color.Yellow;
          e.Item.Cells[tci_member_agency_designator].BackColor = Color.Yellow;
          }
        }
      else
        {
        e.Item.Cells[tci_member_agency_id].ForeColor = Color.Gray;
        e.Item.Cells[tci_medical_release_description].ForeColor = Color.Gray;
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
      // Italicize medical_release_description for zone-duty-capable ALS
      //
      if (e.Item.Cells[tci_medical_release_description].Text != "&nbsp;")
        {
        e.Item.Cells[tci_medical_release_description].Font.Italic = (new ArrayList() {"P","I","C"}).Contains(e.Item.Cells[tci_medical_release_description].Text);
        }
      else
        {
        e.Item.Cells[tci_colon].Text = k.EMPTY;
        }
      //
      // Manage ablement of interactive name linkbutton.
      //
      ((e.Item.Cells[tci_name_interactive].Controls[0]) as LinkButton).Enabled = be_ok_to_enable_controls;
      //
      // Manage member_agency_id.
      //
      var member_agency_id = k.Safe(e.Item.Cells[tci_member_agency_id].Text,k.safe_hint_type.NUM);
      if (member_agency_id != k.EMPTY)
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
        e.Item.Cells[tci_colon].Style.Add("border-top","thin solid silver");
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
      bool be_unit_spec_change
      )
      {
      var post_drop_down_list = ((e.Item.Cells[tci_post_designator].Controls[UserControl_schedule_proposal_Static.CI_DESIGNATOR_DROPDOWNLIST]) as DropDownList);
      var post_label = ((e.Item.Cells[tci_post_designator].Controls[UserControl_schedule_proposal_Static.CI_DESIGNATOR_LABEL]) as Label);
      var post_cardinality_drop_down_list = ((e.Item.Cells[tci_post_cardinality_interactive].Controls[0]) as DropDownList);
      if (post_id != k.EMPTY)
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
            post_label.Text = (p.depth_filter == k.EMPTY ? "&nbsp;" : k.EMPTY) + post_drop_down_list.SelectedItem.Text;
            }
          if (e.Item.Cells[tci_be_challenge].Text == "1")
            {
            e.Item.Cells[tci_post_designator].BackColor = Color.Yellow;
            e.Item.Cells[tci_post_cardinality_interactive].BackColor = Color.Yellow;
            e.Item.Cells[tci_post_cardinality_noninteractive].BackColor = Color.Yellow;
            }
          }
        }
      if ((post_id == k.EMPTY) || !p.be_interactive || !be_selected)
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

    protected void A_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
      {
      var be_any_kind_of_item = (new ArrayList {ListItemType.AlternatingItem,ListItemType.Item,ListItemType.EditItem,ListItemType.SelectedItem}.Contains(e.Item.ItemType));
      if (e.Item.ItemType == ListItemType.Header)
        {
        e.Item.Cells[UserControl_schedule_proposal_Static.TCI_NOMINAL_DAY].Text = DateTime.Now.AddMonths(p.relative_month.val).ToString("MMM").ToUpper();
        }
      else if (be_any_kind_of_item)
        {
        var nominal_day_datetime = DateTime.Parse(e.Item.Cells[UserControl_schedule_proposal_Static.TCI_NOMINAL_DAY].Text);
        //
        // Set up bookmark.
        //
        ((e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_SPACER_MAJOR].Controls[0]) as HtmlAnchor).Name = nominal_day_datetime.Day.ToString();
        //
        // Show certain columns only for first row of nominal day.
        //
        var monthless_rendition_of_nominal_day = p.biz_schedule_assignments.MonthlessRenditionOfNominalDay(nominal_day_datetime);
        if (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_DISPLAY_SEQ_NUM].Text == "1")
          {
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_NOMINAL_DAY].Text = "<br/>" + monthless_rendition_of_nominal_day;
          e.Item.Style.Add("border-top","thick solid black");
          }
        else
          {
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_NOMINAL_DAY].Text = k.EMPTY;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_NUM_UNITS_FROM_AGENCY].Text = k.EMPTY;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_SLASH].Text = k.EMPTY;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_NUM_UNITS_CITYWIDE].Text = k.EMPTY;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_NUM_UNITS_FROM_AGENCY].Text = k.EMPTY;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_SLASH].Text = k.EMPTY;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_NUM_UNITS_CITYWIDE].Text = k.EMPTY;
          }
        //
        var d_be_selected = (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_BE_SELECTED].Text == "1");
        var d_post_id = k.Safe(e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_ID].Text,k.safe_hint_type.NUM);
        var d_be_ok_to_enable_controls = (d_post_id != k.EMPTY)
          && p.be_interactive
          && p.be_ok_to_edit_post
          &&
            (
              (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEMBER_AGENCY_ID].Text == p.own_agency)
            ||
              p.biz_agencies.BeAgencyResponsibleForPost(p.own_agency,d_post_id)
            ||
              (
                p.be_user_privileged_to_see_all_squads
              &&
                (
                  !p.biz_agencies.BeFullWatchbillPublishMandatory(e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEMBER_AGENCY_ID].Text,p.relative_month)
                ||
                  p.be_squad_exclusivity_expired
                )
              )
            );
        var n_be_selected = (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_BE_SELECTED].Text == "1");
        var n_post_id = k.Safe(e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_ID].Text,k.safe_hint_type.NUM);
        var n_be_ok_to_enable_controls = (n_post_id != k.EMPTY)
          && p.be_interactive
          && p.be_ok_to_edit_post
          &&
            (
              (e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEMBER_AGENCY_ID].Text == p.own_agency)
            ||
              p.biz_agencies.BeAgencyResponsibleForPost(p.own_agency,n_post_id)
            ||
              (
                p.be_user_privileged_to_see_all_squads
              &&
                (
                  !p.biz_agencies.BeFullWatchbillPublishMandatory(e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEMBER_AGENCY_ID].Text,p.relative_month)
                ||
                  p.be_squad_exclusivity_expired
                )
              )
            );
        //
        var current_d_unit_spec = monthless_rendition_of_nominal_day + "--" + d_post_id + "--" + e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_CARDINALITY_NONINTERACTIVE].Text;
        var current_n_unit_spec = monthless_rendition_of_nominal_day + "--" + n_post_id + "--" + e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_CARDINALITY_NONINTERACTIVE].Text;
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
          UserControl_schedule_proposal_Static.TCI_D_POST_DESIGNATOR,
          UserControl_schedule_proposal_Static.TCI_D_POST_CARDINALITY_INTERACTIVE,
          UserControl_schedule_proposal_Static.TCI_D_POST_CARDINALITY_NONINTERACTIVE,
          UserControl_schedule_proposal_Static.TCI_D_BE_CHALLENGE,
          be_d_unit_spec_change
          );
        ManageComplexColumns
          (
          e,
          n_be_selected,
          n_post_id,
          n_be_ok_to_enable_controls,
          UserControl_schedule_proposal_Static.TCI_N_POST_DESIGNATOR,
          UserControl_schedule_proposal_Static.TCI_N_POST_CARDINALITY_INTERACTIVE,
          UserControl_schedule_proposal_Static.TCI_N_POST_CARDINALITY_NONINTERACTIVE,
          UserControl_schedule_proposal_Static.TCI_N_BE_CHALLENGE,
          be_n_unit_spec_change
          );
        ManageSimpleColumns
          (
          e,
          d_be_selected,
          d_be_ok_to_enable_controls || p.be_ok_to_see_other_member_schedule_detail,
          UserControl_schedule_proposal_Static.TCI_D_COMMENT,
          UserControl_schedule_proposal_Static.TCI_D_MEDICAL_RELEASE_DESCRIPTION,
          UserControl_schedule_proposal_Static.TCI_D_COLON,
          UserControl_schedule_proposal_Static.TCI_D_NAME_INTERACTIVE,
          UserControl_schedule_proposal_Static.TCI_D_NAME_NONINTERACTIVE,
          UserControl_schedule_proposal_Static.TCI_D_BE_DRIVER_QUALIFIED,
          UserControl_schedule_proposal_Static.TCI_D_BE_SELECTED,
          UserControl_schedule_proposal_Static.TCI_D_MEMBER_AGENCY_ID,
          UserControl_schedule_proposal_Static.TCI_D_MEMBER_AGENCY_DESIGNATOR,
          UserControl_schedule_proposal_Static.TCI_D_BE_CHALLENGE,
          UserControl_schedule_proposal_Static.TCI_D_NUM_UNITS_CITYWIDE,
          UserControl_schedule_proposal_Static.TCI_D_SLASH,
          UserControl_schedule_proposal_Static.TCI_D_PHONE_NUM,
          be_d_unit_spec_change
          );
        ManageSimpleColumns
          (
          e,
          n_be_selected,
          n_be_ok_to_enable_controls || p.be_ok_to_see_other_member_schedule_detail,
          UserControl_schedule_proposal_Static.TCI_N_COMMENT,
          UserControl_schedule_proposal_Static.TCI_N_MEDICAL_RELEASE_DESCRIPTION,
          UserControl_schedule_proposal_Static.TCI_N_COLON,
          UserControl_schedule_proposal_Static.TCI_N_NAME_INTERACTIVE,
          UserControl_schedule_proposal_Static.TCI_N_NAME_NONINTERACTIVE,
          UserControl_schedule_proposal_Static.TCI_N_BE_DRIVER_QUALIFIED,
          UserControl_schedule_proposal_Static.TCI_N_BE_SELECTED,
          UserControl_schedule_proposal_Static.TCI_N_MEMBER_AGENCY_ID,
          UserControl_schedule_proposal_Static.TCI_N_MEMBER_AGENCY_DESIGNATOR,
          UserControl_schedule_proposal_Static.TCI_N_BE_CHALLENGE,
          UserControl_schedule_proposal_Static.TCI_N_NUM_UNITS_CITYWIDE,
          UserControl_schedule_proposal_Static.TCI_N_SLASH,
          UserControl_schedule_proposal_Static.TCI_N_PHONE_NUM,
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
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(((e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_NAME_INTERACTIVE].Controls[0]) as LinkButton));
          ScriptManager.GetCurrent(Page).RegisterPostBackControl(((e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_NAME_INTERACTIVE].Controls[0]) as LinkButton));
          //
          // Remove all cell controls from viewstate except for the one at TCI_ID.
          //
          foreach (TableCell cell in e.Item.Cells)
            {
            cell.EnableViewState = false;
            }
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_ASSIGNMENT_ID].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEMBER_AGENCY_ID].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEMBER_ID].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_DESIGNATOR].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_POST_CARDINALITY_INTERACTIVE].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_ASSIGNMENT_ID].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEMBER_AGENCY_ID].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEMBER_ID].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_DESIGNATOR].EnableViewState = true;
          e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_POST_CARDINALITY_INTERACTIVE].EnableViewState = true;
          }
        }
      }

    protected void DropDownList_d_post_SelectedIndexChanged(object sender, EventArgs e)
      {
      if (k.Has((string[])(Session["privilege_array"]), "edit-schedule"))
        {
        p.biz_schedule_assignments.SetPost
          (k.Safe(((sender as DropDownList).Parent.Parent as DataGridItem).Cells[UserControl_schedule_proposal_Static.TCI_D_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),k.Safe((sender as DropDownList).SelectedValue,k.safe_hint_type.NUM));
        }
      else
        {
        SessionSet("ip_address",HttpContext.Current.Request.UserHostAddress);
        k.EscalatedException(k.PRIVILEGE_VIOLATION,Page.User.Identity.Name,Session);
        }
      }

    protected void DropDownList_n_post_SelectedIndexChanged(object sender, EventArgs e)
      {
      if (k.Has((string[])(Session["privilege_array"]), "edit-schedule"))
        {
        p.biz_schedule_assignments.SetPost
          (k.Safe(((sender as DropDownList).Parent.Parent as DataGridItem).Cells[UserControl_schedule_proposal_Static.TCI_N_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),k.Safe((sender as DropDownList).SelectedValue,k.safe_hint_type.NUM));
        }
      else
        {
        SessionSet("ip_address",HttpContext.Current.Request.UserHostAddress);
        k.EscalatedException(k.PRIVILEGE_VIOLATION,Page.User.Identity.Name,Session);
        }
      }

    protected void DropDownList_d_post_cardinality_SelectedIndexChanged(object sender, EventArgs e)
      {
      if (k.Has((string[])(Session["privilege_array"]), "edit-schedule"))
        {
        p.biz_schedule_assignments.SetPostCardinality
          (k.Safe(((sender as DropDownList).Parent.Parent as DataGridItem).Cells[UserControl_schedule_proposal_Static.TCI_D_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),k.Safe((sender as DropDownList).SelectedValue,k.safe_hint_type.ALPHA));
        }
      else
        {
        SessionSet("ip_address",HttpContext.Current.Request.UserHostAddress);
        k.EscalatedException(k.PRIVILEGE_VIOLATION,Page.User.Identity.Name,Session);
        }
      }

    protected void DropDownList_n_post_cardinality_SelectedIndexChanged(object sender, EventArgs e)
      {
      if (k.Has((string[])(Session["privilege_array"]), "edit-schedule"))
        {
        p.biz_schedule_assignments.SetPostCardinality
          (k.Safe(((sender as DropDownList).Parent.Parent as DataGridItem).Cells[UserControl_schedule_proposal_Static.TCI_N_ASSIGNMENT_ID].Text,k.safe_hint_type.NUM),k.Safe((sender as DropDownList).SelectedValue,k.safe_hint_type.ALPHA));
        }
      else
        {
        SessionSet("ip_address",HttpContext.Current.Request.UserHostAddress);
        k.EscalatedException(k.PRIVILEGE_VIOLATION,Page.User.Identity.Name,Session);
        }
      }

    protected void Button_save_Click(object sender, EventArgs e)
      {
      Bind();
      }

    protected void A_ItemCommand(object source, DataGridCommandEventArgs e)
      {
      p.msg_protected_member_schedule_detail.relative_month = p.relative_month;
      if (e.CommandName == "SelectDayAvailMember")
        {
        p.msg_protected_member_schedule_detail.member_id = k.Safe(e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEMBER_ID].Text,k.safe_hint_type.NUM);
        p.msg_protected_member_schedule_detail.member_agency_id = k.Safe(e.Item.Cells[UserControl_schedule_proposal_Static.TCI_D_MEMBER_AGENCY_ID].Text,k.safe_hint_type.NUM);
        }
      else if (e.CommandName == "SelectNightAvailMember")
        {
        p.msg_protected_member_schedule_detail.member_id = k.Safe(e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEMBER_ID].Text,k.safe_hint_type.NUM);
        p.msg_protected_member_schedule_detail.member_agency_id = k.Safe(e.Item.Cells[UserControl_schedule_proposal_Static.TCI_N_MEMBER_AGENCY_ID].Text,k.safe_hint_type.NUM);
        }
      MessageDropCrumbAndTransferTo(p.msg_protected_member_schedule_detail,"protected","member_schedule_detail");
      }

    protected void RadioButtonList_be_nominal_day_mode_specific_SelectedIndexChanged(object sender, EventArgs e)
      {
      p.be_nominal_day_mode_specific = (k.Safe(RadioButtonList_be_nominal_day_mode_specific.SelectedValue,k.safe_hint_type.NUM) == "1");
      p.nominal_day_filter_active = (p.be_nominal_day_mode_specific ? p.nominal_day_filter_saved : k.EMPTY );
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

    }

  }
