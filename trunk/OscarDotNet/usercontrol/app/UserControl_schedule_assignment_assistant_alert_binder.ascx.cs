// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~binder.cs~template

using kix;
using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using UserControl_schedule_assignment_assistant_alert_time_off;
using UserControl_schedule_assignment_assistant_alert_time_on;
using UserControl_schedule_assignment_assistant_alert_unexpected_submissions;

namespace UserControl_schedule_assignment_assistant_alert_binder
  {
  public class UserControl_schedule_assignment_assistant_alert_binder_Static
    {
    public const int TSSI_TIME_OFF = 0;
    public const int TSSI_TIME_ON = 1;
    public const int TSSI_UNEXPECTED_SUBMISSIONS = 2;
    }

  public struct p_type
    {
    public string agency_filter;
    public bool be_loaded;
    public string content_id;
    public k.subtype<int> relative_month;
    public string release_filter;
    public uint tab_index;
    }

  public partial class TWebUserControl_schedule_assignment_assistant_alert_binder: ki_web_ui.usercontrol_class
    {
    private p_type p;

    TWebUserControl_schedule_assignment_assistant_alert_time_off UserControl_schedule_assignment_assistant_alert_time_off = null;
    TWebUserControl_schedule_assignment_assistant_alert_time_on UserControl_schedule_assignment_assistant_alert_time_on = null;
    TWebUserControl_schedule_assignment_assistant_alert_unexpected_submissions UserControl_schedule_assignment_assistant_alert_unexpected_submissions = null;

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
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
      UserControl_schedule_assignment_assistant_alert_time_off = ((TWebUserControl_schedule_assignment_assistant_alert_time_off)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_alert_time_off.ascx")));
      UserControl_schedule_assignment_assistant_alert_time_on = ((TWebUserControl_schedule_assignment_assistant_alert_time_on)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_alert_time_on.ascx")));
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
        p.tab_index = UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_TIME_OFF;
        p.content_id = AddIdentifiedControlToPlaceHolder(UserControl_schedule_assignment_assistant_alert_time_off,"UserControl_schedule_assignment_assistant_alert_time_off",PlaceHolder_content,InstanceId());
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
      this.PreRender += this.TWebUserControl_schedule_assignment_assistant_alert_binder_PreRender;
      //this.Load += this.Page_Load;
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
      else if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_UNEXPECTED_SUBMISSIONS)
        {
        UserControl_schedule_assignment_assistant_alert_unexpected_submissions.SetFilter(p.agency_filter,p.release_filter,p.relative_month);
        }
      }

    private void FillPlaceHolder
      (
      bool be_fresh_control_required,
      string target
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