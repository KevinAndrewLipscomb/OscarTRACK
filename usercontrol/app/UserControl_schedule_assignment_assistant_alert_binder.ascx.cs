// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~binder.cs~template

using kix;
using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using UserControl_schedule_assignment_assistant_alert_time_off;

namespace UserControl_schedule_assignment_assistant_alert_binder
  {
  public class UserControl_schedule_assignment_assistant_alert_binder_Static
    {
    public const int TSSI_TIME_OFF = 0;
    }

  public struct p_type
    {
    public bool be_loaded;
    public string content_id;
    public uint tab_index;
    }

  public partial class TWebUserControl_schedule_assignment_assistant_alert_binder: ki_web_ui.usercontrol_class
    {
    private p_type p;

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_schedule_assignment_assistant_alert_binder.p"] != null)
        {
        p = (p_type)(Session["UserControl_schedule_assignment_assistant_alert_binder.p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_schedule_binder_UserControl_schedule_assignment_assistant_binder_PlaceHolder_content"] as string) == "UserControl_schedule_assignment_assistant_alert_binder");
        //
        // Dynamic controls must be re-added on each postback.
        //
        if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_TIME_OFF)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_schedule_assignment_assistant_alert_time_off)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_alert_time_off.ascx"))), "UserControl_schedule_assignment_assistant_alert_time_off", PlaceHolder_content);
          }
        }
      else
        {
        p.be_loaded = false;
        p.tab_index = UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_TIME_OFF;
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_schedule_assignment_assistant_alert_time_off)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_alert_time_off.ascx"))).Fresh(), "UserControl_schedule_assignment_assistant_alert_time_off", PlaceHolder_content);
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
      SessionSet("UserControl_schedule_assignment_assistant_alert_binder.p", p);
      }

    public TWebUserControl_schedule_assignment_assistant_alert_binder Fresh()
      {
      Session.Remove("UserControl_schedule_assignment_assistant_alert_binder.p");
      return this;
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      if (p.tab_index == UserControl_schedule_assignment_assistant_alert_binder_Static.TSSI_TIME_OFF)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_schedule_assignment_assistant_alert_time_off)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_alert_time_off.ascx"))).Fresh(), "UserControl_schedule_assignment_assistant_alert_time_off", PlaceHolder_content);
        }
      }

    } // end TWebUserControl_schedule_assignment_assistant_alert_binder

  }

