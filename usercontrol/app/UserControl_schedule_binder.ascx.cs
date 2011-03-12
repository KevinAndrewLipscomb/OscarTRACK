// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~binder.cs~template

using kix;
using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using UserControl_availabilities;
using UserControl_schedule_assignment_assistant_binder;

namespace UserControl_schedule_binder
  {
  public class UserControl_schedule_binder_Static
    {
    public const int TSSI_AVAILABILITIES = 0;
    public const int TSSI_ASSIGNMENT_ASSISTANT = 1;
    }

  public struct p_type
    {
    public bool be_loaded;
    public string content_id;
    public uint tab_index;
    }

  public partial class TWebUserControl_schedule_binder: ki_web_ui.usercontrol_class
    {
    private p_type p;

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (k.Has((string[])(Session["privilege_array"]), "edit-schedule"))
          {
          TabPanel_assignment_assistant.Enabled = true;
          }
        TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_schedule_binder.p"] != null)
        {
        p = (p_type)(Session["UserControl_schedule_binder.p"]);
        p.be_loaded = IsPostBack && ((Session["M_PlaceHolder_content"] as string) == "S");
        //
        // Dynamic controls must be re-added on each postback.
        //
        if (p.tab_index == UserControl_schedule_binder_Static.TSSI_AVAILABILITIES)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_availabilities)(LoadControl("~/usercontrol/app/UserControl_availabilities.ascx"))), "UserControl_availabilities", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_schedule_binder_Static.TSSI_ASSIGNMENT_ASSISTANT)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_schedule_assignment_assistant_binder)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_binder.ascx"))), "G", PlaceHolder_content);
          }
        }
      else
        {
        p.be_loaded = false;
        p.tab_index = UserControl_schedule_binder_Static.TSSI_AVAILABILITIES;
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_availabilities)(LoadControl("~/usercontrol/app/UserControl_availabilities.ascx"))).Fresh(), "UserControl_availabilities", PlaceHolder_content);
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
      this.PreRender += this.TWebUserControl_schedule_binder_PreRender;
      //this.Load += this.Page_Load;
      }

    private void TWebUserControl_schedule_binder_PreRender(object sender, System.EventArgs e)
      {
      //
      // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
      // not it is already loaded in the user's browser.
      //
      SessionSet(PlaceHolder_content.ClientID, p.content_id);
      SessionSet("UserControl_schedule_binder.p", p);
      }

    public TWebUserControl_schedule_binder Fresh()
      {
      Session.Remove("UserControl_schedule_binder.p");
      return this;
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      if (p.tab_index == UserControl_schedule_binder_Static.TSSI_AVAILABILITIES)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_availabilities)(LoadControl("~/usercontrol/app/UserControl_availabilities.ascx"))).Fresh(), "UserControl_availabilities", PlaceHolder_content);
        }
      else if (p.tab_index == UserControl_schedule_binder_Static.TSSI_ASSIGNMENT_ASSISTANT)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_schedule_assignment_assistant_binder)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_binder.ascx"))).Fresh(), "G", PlaceHolder_content);
        }
      }

    } // end TWebUserControl_schedule_binder

  }

