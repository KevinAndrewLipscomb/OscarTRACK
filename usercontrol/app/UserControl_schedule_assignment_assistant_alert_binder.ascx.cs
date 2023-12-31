// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~binder.cs~template

using kix;
using UserControl_schedule_assignment_assistant_alert_time_off;
using UserControl_schedule_assignment_assistant_alert_time_on;
using UserControl_schedule_assignment_assistant_alert_travel_gap;
using UserControl_schedule_assignment_assistant_alert_unexpected_submissions;

namespace UserControl_schedule_assignment_assistant_alert_binder
  {
  public partial class TWebUserControl_schedule_assignment_assistant_alert_binder: ki_web_ui.usercontrol_class
    {

    private static class UserControl_schedule_assignment_assistant_alert_binder_Static
      {
      public const int TSSI_UNEXPECTED_SUBMISSIONS = 0;
      public const int TSSI_TIME_OFF = 1;
      public const int TSSI_TIME_ON = 2;
      public const int TSSI_TRAVEL_GAP = 3;
      }

    private struct p_type
      {
      public string agency_filter;
      public bool be_loaded;
      public string content_id;
      public k.subtype<int> relative_month;
      public string release_filter;
      public uint tab_index;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    TWebUserControl_schedule_assignment_assistant_alert_time_off UserControl_schedule_assignment_assistant_alert_time_off = null;
    TWebUserControl_schedule_assignment_assistant_alert_time_on UserControl_schedule_assignment_assistant_alert_time_on = null;
    TWebUserControl_schedule_assignment_assistant_alert_travel_gap UserControl_schedule_assignment_assistant_alert_travel_gap = null;
    TWebUserControl_schedule_assignment_assistant_alert_unexpected_submissions UserControl_schedule_assignment_assistant_alert_unexpected_submissions = null;

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
        TabPanel_unexpected_submissions.HeaderText = "<b>STEP 4a:</b> " + TabPanel_unexpected_submissions.HeaderText;
        TabPanel_time_off.HeaderText = "<b>STEP 4b:</b> " + TabPanel_time_off.HeaderText;
        TabPanel_time_on.HeaderText = "<b>STEP 4c:</b> " + TabPanel_time_on.HeaderText;
        TabPanel_travel_gap.HeaderText = "<b>STEP 4d:</b> " + TabPanel_travel_gap.HeaderText;
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      //
      UserControl_schedule_assignment_assistant_alert_time_off = ((TWebUserControl_schedule_assignment_assistant_alert_time_off)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_alert_time_off.ascx")));
      UserControl_schedule_assignment_assistant_alert_time_on = ((TWebUserControl_schedule_assignment_assistant_alert_time_on)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_alert_time_on.ascx")));
      UserControl_schedule_assignment_assistant_alert_travel_gap = ((TWebUserControl_schedule_assignment_assistant_alert_travel_gap)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_alert_travel_gap.ascx")));
      UserControl_schedule_assignment_assistant_alert_unexpected_submissions = ((TWebUserControl_schedule_assignment_assistant_alert_unexpected_submissions)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_alert_unexpected_submissions.ascx")));
      //
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["M_S_G_PlaceHolder_content"] as string) == "UserControl_schedule_assignment_assistant_alert_binder");
        //
        // Dynamic controls must be re-added on each postback.
        //
        if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_TIME_OFF)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_assignment_assistant_alert_time_off, "UserControl_schedule_assignment_assistant_alert_time_off", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_TIME_ON)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_assignment_assistant_alert_time_on, "UserControl_schedule_assignment_assistant_alert_time_on", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_TRAVEL_GAP)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_assignment_assistant_alert_travel_gap, "UserControl_schedule_assignment_assistant_alert_travel_gap", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_UNEXPECTED_SUBMISSIONS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_assignment_assistant_alert_unexpected_submissions, "UserControl_schedule_assignment_assistant_alert_unexpected_submissions", PlaceHolder_content);
          }
        }
      else
        {
        p.agency_filter = k.EMPTY;
        p.be_loaded = false;
        p.relative_month = new k.subtype<int>(0,1);
        p.release_filter = k.EMPTY;
        //
        p.tab_index = UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_UNEXPECTED_SUBMISSIONS;
        p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_assignment_assistant_alert_unexpected_submissions,"UserControl_schedule_assignment_assistant_alert_unexpected_submissions",PlaceHolder_content,InstanceId());
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
      PreRender += TWebUserControl_schedule_assignment_assistant_alert_binder_PreRender;
      }

    private void TWebUserControl_schedule_assignment_assistant_alert_binder_PreRender(object sender, System.EventArgs e)
      {
      //
      // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
      // not it is already loaded in the user's browser.
      //
      SessionSet(PlaceHolder_content.ClientID, p.content_id);
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_alert_binder Fresh()
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

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      FillPlaceHolder(true);
      }

    private void Bind()
      {
      if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_TIME_OFF)
        {
        UserControl_schedule_assignment_assistant_alert_time_off.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_TIME_ON)
        {
        UserControl_schedule_assignment_assistant_alert_time_on.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_TRAVEL_GAP)
        {
        UserControl_schedule_assignment_assistant_alert_travel_gap.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_UNEXPECTED_SUBMISSIONS)
        {
        UserControl_schedule_assignment_assistant_alert_unexpected_submissions.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      }

    private void FillPlaceHolder
      (
      #pragma warning disable CA1801 // Remove unused parameter
      bool be_fresh_control_required,
      string target
      #pragma warning restore CA1801 // Remove unused parameter
      )
      {
      if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_TIME_OFF)
        {
        var c = UserControl_schedule_assignment_assistant_alert_time_off;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_schedule_assignment_assistant_alert_time_off",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_TIME_ON)
        {
        var c = UserControl_schedule_assignment_assistant_alert_time_on;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_schedule_assignment_assistant_alert_time_on",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_TRAVEL_GAP)
        {
        var c = UserControl_schedule_assignment_assistant_alert_travel_gap;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_schedule_assignment_assistant_alert_travel_gap",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      else if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_UNEXPECTED_SUBMISSIONS)
        {
        var c = UserControl_schedule_assignment_assistant_alert_unexpected_submissions;
        p.content_id = AddIdentifiedControlToPlaceHolder(c,"UserControl_schedule_assignment_assistant_alert_unexpected_submissions",PlaceHolder_content,(be_fresh_control_required ? InstanceId() : k.EMPTY));
        c.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      }
    private void FillPlaceHolder(bool be_fresh_control_required)
      {
      FillPlaceHolder(be_fresh_control_required,k.EMPTY);
      }

    } // end TWebUserControl_schedule_assignment_assistant_alert_binder

  }