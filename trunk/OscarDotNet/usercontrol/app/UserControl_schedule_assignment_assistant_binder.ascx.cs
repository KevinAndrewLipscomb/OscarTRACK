// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~binder.cs~template

using Class_biz_agencies;
using Class_biz_members;
using Class_biz_schedule_assignments;
using Class_biz_user;
using kix;
using System;
using System.Collections;
using System.Configuration;
using UserControl_schedule_assignment_assistant_alert_binder;
using UserControl_schedule_assignment_assistant_holdouts;
using UserControl_schedule_assignment_assistant_intro;
using UserControl_schedule_assignment_assistant_publish;
using UserControl_schedule_assignment_assistant_special_requests;
using UserControl_schedule_proposal;

namespace UserControl_schedule_assignment_assistant_binder
  {
  public class UserControl_schedule_assignment_assistant_binder_Static
    {
    public const int TSSI_HOLDOUTS = 0;
    public const int TSSI_ALERT = 1;
    public const int TSSI_SPECIAL_REQUESTS = 2;
    public const int TSSI_WATCHBILL = 3;
    public const int TSSI_PUBLISH = 4;
    public const int TSSI_ABOUT = 5;
    }

  public struct p_type
    {
    public string agency_filter;
    public bool be_loaded;
    public bool be_ok_to_audit_holdouts;
    public bool be_ok_to_edit_schedule;
    public bool be_post_publish_submissions_detected;
    public bool be_user_privileged_to_see_all_squads;
    public TClass_biz_agencies biz_agencies;
    public TClass_biz_members biz_members;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    public TClass_biz_user biz_user;
    public string content_id;
    public string full_next_month_access_day;
    public k.subtype<int> relative_month;
    public string release_filter;
    public uint tab_index;
    public string user_member_id;
    public string user_member_agency_id;
    }

  public partial class TWebUserControl_schedule_assignment_assistant_binder: ki_web_ui.usercontrol_class
    {
    private p_type p;

    protected TWebUserControl_schedule_assignment_assistant_alert_binder UserControl_schedule_assignment_assistant_alert_binder = null;
    protected TWebUserControl_schedule_assignment_assistant_holdouts UserControl_schedule_assignment_assistant_holdouts = null;
    protected TWebUserControl_schedule_assignment_assistant_intro UserControl_schedule_assignment_assistant_intro = null;
    protected TWebUserControl_schedule_assignment_assistant_publish UserControl_schedule_assignment_assistant_publish = null;
    protected TWebUserControl_schedule_assignment_assistant_special_requests UserControl_schedule_assignment_assistant_special_requests = null;
    protected TWebUserControl_schedule_proposal UserControl_schedule_proposal = null;

    private void ManagePostPublishSubmissionDetection()
      {
      p.be_post_publish_submissions_detected = false;
      if (!p.biz_schedule_assignments.BeFullWatchbillPublishMandatory(p.agency_filter, p.relative_month))
        {
        p.be_post_publish_submissions_detected =
          p.biz_schedule_assignments.BePendingNotifications(p.relative_month, p.user_member_id, p.user_member_agency_id, be_virgin_watchbill:false,be_selected_only:true);
        }
      Label_post_publish_submissions.Visible = p.be_ok_to_edit_schedule && p.be_post_publish_submissions_detected;
      }

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        var be_ok_to_work_on_next_month_assignments = p.biz_schedule_assignments.BeOkToWorkOnNextMonthAssignments();
        p.biz_agencies.BindListControlShort(DropDownList_agency_filter);
        DropDownList_agency_filter.SelectedValue = p.agency_filter;
        DropDownList_release_filter.SelectedValue = p.release_filter;
        RadioButtonList_which_month.SelectedValue = p.relative_month.val.ToString();
        RadioButtonList_which_month.Enabled =
          (
            (p.be_ok_to_edit_schedule && p.biz_schedule_assignments.BeOkToWorkOnNextMonthAvailabilities())
          ||
            (!p.biz_schedule_assignments.BeFullWatchbillPublishMandatory(p.agency_filter,new k.subtype<int>(1,1)) && be_ok_to_work_on_next_month_assignments)
          );
        Button_refresh.Enabled = p.be_ok_to_edit_schedule;
        if (p.be_ok_to_edit_schedule && (!new ArrayList(p.biz_user.Roles()).Contains("Department Street Supervisor")))
          {
          TableRow_guidance_1.Visible = true;
          TableRow_guidance_2.Visible = true;
          Literal_partial_next_month_access_day.Text = (int.Parse(ConfigurationManager.AppSettings["last_day_of_month_to_submit_schedule_availabilities"]) + 1).ToString();
          Literal_full_next_month_access_day.Text = p.full_next_month_access_day;
          Literal_dept_next_month_access_hour.Text = int.Parse(ConfigurationManager.AppSettings["deadline_hour_for_squad_to_publish_schedule"]).ToString();
          Literal_dept_next_month_access_day.Text = int.Parse(ConfigurationManager.AppSettings["deadline_day_for_squad_to_publish_schedule"]).ToString();
          TabPanel_holdouts.HeaderText = "<b>STEP 3:</b> " + TabPanel_holdouts.HeaderText;
          TabPanel_alert.HeaderText = "<b>STEP 4:</b> " + TabPanel_alert.HeaderText;
          TabPanel_special_requests.HeaderText = "<b>STEP 5:</b> " + TabPanel_special_requests.HeaderText;
          TabPanel_proposal.HeaderText = "<b>STEP 6:</b> " + TabPanel_proposal.HeaderText;
          }
        ManagePostPublishSubmissionDetection();
        TabPanel_holdouts.Enabled = p.be_ok_to_audit_holdouts || p.be_ok_to_edit_schedule;
        TabPanel_alert.Enabled = p.be_ok_to_edit_schedule;
        TabPanel_special_requests.Enabled = p.be_ok_to_edit_schedule;
        TabPanel_publish_print.Enabled = p.be_ok_to_edit_schedule && ((p.relative_month.val == 0) || be_ok_to_work_on_next_month_assignments);
        TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      //
      UserControl_schedule_assignment_assistant_holdouts = ((TWebUserControl_schedule_assignment_assistant_holdouts)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_holdouts.ascx")));
      UserControl_schedule_assignment_assistant_intro = ((TWebUserControl_schedule_assignment_assistant_intro)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_intro.ascx")));
      UserControl_schedule_assignment_assistant_alert_binder = ((TWebUserControl_schedule_assignment_assistant_alert_binder)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_alert_binder.ascx")));
      UserControl_schedule_assignment_assistant_special_requests = ((TWebUserControl_schedule_assignment_assistant_special_requests)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_special_requests.ascx")));
      UserControl_schedule_proposal = ((TWebUserControl_schedule_proposal)(LoadControl("~/usercontrol/app/UserControl_schedule_proposal.ascx")));
      UserControl_schedule_assignment_assistant_publish = ((TWebUserControl_schedule_assignment_assistant_publish)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_publish.ascx")));
      //
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["M_S_PlaceHolder_content"] as string) == "G");
        FillPlaceHolder(false);
        }
      else
        {
        p.biz_agencies = new TClass_biz_agencies();
        p.biz_members = new TClass_biz_members();
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        p.biz_user = new TClass_biz_user();
        //
        p.be_ok_to_audit_holdouts = k.Has((string[])(Session["privilege_array"]), "audit-holdouts");
        p.be_ok_to_edit_schedule = k.Has((string[])(Session["privilege_array"]), "edit-schedule");
        p.be_user_privileged_to_see_all_squads = k.Has((string[])(Session["privilege_array"]), "see-all-squads");
        p.full_next_month_access_day = (int.Parse(ConfigurationManager.AppSettings["last_day_of_month_to_actually_wait_for_schedule_availabilities"]) + 1).ToString();
        p.user_member_id = Session["member_id"].ToString();
        p.user_member_agency_id = p.biz_members.AgencyIdOfId(p.user_member_id);
        p.agency_filter = (p.biz_schedule_assignments.BeOkToDefaultAgencyFilterToAll(p.be_user_privileged_to_see_all_squads,p.biz_user.Roles()) ? k.EMPTY : p.user_member_agency_id);
        p.be_loaded = false;
        p.relative_month = new k.subtype<int>(0,1);
        p.release_filter = k.EMPTY;
        //
        if (p.be_ok_to_edit_schedule && (!new ArrayList(p.biz_user.Roles()).Contains("Department Street Supervisor")))
          {
          p.tab_index = (uint)UserControl_schedule_assignment_assistant_binder_Static.TSSI_HOLDOUTS;
          }
        else
          {
          p.tab_index = (uint)UserControl_schedule_assignment_assistant_binder_Static.TSSI_WATCHBILL;
          }
        //
        FillPlaceHolder(true);
        }
      }

    private void InitializeComponent()
      {
      TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
      PreRender += TWebUserControl_schedule_assignment_assistant_binder_PreRender;
      }

    private void TWebUserControl_schedule_assignment_assistant_binder_PreRender(object sender, System.EventArgs e)
      {
      if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_PUBLISH)
        {
        ManagePostPublishSubmissionDetection();
        }
      //
      // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
      // not it is already loaded in the user's browser.
      //
      SessionSet(PlaceHolder_content.ClientID, p.content_id);
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_binder Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void Button_refresh_Click(object sender, System.EventArgs e)
      {
      p.biz_schedule_assignments.Update(p.relative_month.val.ToString(),working_directory:Server.MapPath("scratch"));
      ManagePostPublishSubmissionDetection();
      Bind();
      }

    protected void DropDownList_agency_filter_SelectedIndexChanged(object sender, System.EventArgs e)
      {
      p.agency_filter = k.Safe(DropDownList_agency_filter.SelectedValue,k.safe_hint_type.NUM);
      ManagePostPublishSubmissionDetection();
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
      ManagePostPublishSubmissionDetection();
      Bind(be_for_month_change:true);
      if ((p.relative_month.val == 1) && p.biz_schedule_assignments.BeOkToWorkOnNextMonthAssignments() && !p.biz_schedule_assignments.BeProposalGeneratedForNextMonth())
        {
        Button_refresh.Attributes.Add
          (
          "onclick",
          "return alert(\"- - - ---------------------------------------------------- - - -\\n"
          + "       issuer:  \\t" + ConfigurationManager.AppSettings["application_name"] + "\\n"
          + "       state:   \\tnormal\\n"
          + "       time:    \\t" + DateTime.Now.ToString("s") + "\\n"
          + "- - - ---------------------------------------------------- - - -\\n\\n\\n"
          + (
            "If you are the first scheduler on or after day " + p.full_next_month_access_day
            + " of this month to perform a Refresh on Next month, it may take a few minutes for the application to generate the initial proposal." + k.NEW_LINE
            + k.NEW_LINE
            + "Please be patient."
            )
            .Replace(Convert.ToString(k.NEW_LINE), "\\n")
          + "\\n\\n\""
          + ");"
          );
        }
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      FillPlaceHolder(true);
      }

    private void Bind(bool be_for_month_change)
      {
      if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_HOLDOUTS)
        {
        UserControl_schedule_assignment_assistant_holdouts.SetFilter(p.agency_filter,p.release_filter,p.relative_month,p.be_post_publish_submissions_detected);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_ALERT)
        {
        UserControl_schedule_assignment_assistant_alert_binder.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_SPECIAL_REQUESTS)
        {
        UserControl_schedule_assignment_assistant_special_requests.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_WATCHBILL)
        {
        UserControl_schedule_proposal.SetFilter(p.agency_filter,p.release_filter,p.relative_month,be_for_month_change);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_PUBLISH)
        {
        UserControl_schedule_assignment_assistant_publish.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      }
    private void Bind()
      {
      Bind(be_for_month_change:false);
      }

    private void FillPlaceHolder
      (
      bool be_fresh_control_required,
      string target
      )
      {
      if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_HOLDOUTS)
        {
        var c = UserControl_schedule_assignment_assistant_holdouts;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_schedule_assignment_assistant_holdouts",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetFilter(p.agency_filter,p.release_filter,p.relative_month,p.be_post_publish_submissions_detected);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_ALERT)
        {
        var c = UserControl_schedule_assignment_assistant_alert_binder;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_schedule_assignment_assistant_alert_binder",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_SPECIAL_REQUESTS)
        {
        var c = UserControl_schedule_assignment_assistant_special_requests;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_schedule_assignment_assistant_special_requests",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_WATCHBILL)
        {
        var c = UserControl_schedule_proposal;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"C",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        c.SetTarget(target);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_PUBLISH)
        {
        var c = UserControl_schedule_assignment_assistant_publish;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_schedule_assignment_assistant_publish",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_binder_Static.TSSI_ABOUT)
        {
        var c = UserControl_schedule_assignment_assistant_intro;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_schedule_assignment_assistant_intro",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        }
      }
    private void FillPlaceHolder(bool be_fresh_control_required)
      {
      FillPlaceHolder(be_fresh_control_required,target:k.EMPTY);
      }

    public void SetTarget(string target)
      {
      if (target != k.EMPTY)
        {
        if (target.ToLower().Contains("/compliance/"))
          {
          p.tab_index = UserControl_schedule_assignment_assistant_binder_Static.TSSI_HOLDOUTS;
          }
        else if (target.ToLower().Contains("/alert/"))
          {
          p.tab_index = UserControl_schedule_assignment_assistant_binder_Static.TSSI_ALERT;
          }
        else if (target.ToLower().Contains("/special-requests/"))
          {
          p.tab_index = UserControl_schedule_assignment_assistant_binder_Static.TSSI_SPECIAL_REQUESTS;
          }
        else if (target.ToLower().Contains("/proposal/"))
          {
          p.tab_index = UserControl_schedule_assignment_assistant_binder_Static.TSSI_WATCHBILL;
          }
        else if (target.ToLower().Contains("/publish/"))
          {
          p.tab_index = UserControl_schedule_assignment_assistant_binder_Static.TSSI_PUBLISH;
          }
        else if (target.ToLower().Contains("/about/"))
          {
          p.tab_index = UserControl_schedule_assignment_assistant_binder_Static.TSSI_ABOUT;
          }
        //
        PlaceHolder_content.Controls.Clear();
        FillPlaceHolder(false,target);
        //
        }
      }

    }

  }

