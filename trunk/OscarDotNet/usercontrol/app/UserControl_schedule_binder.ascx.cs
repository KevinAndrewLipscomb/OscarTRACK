// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~binder.cs~template

using Class_biz_user;
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
    public TClass_biz_user biz_user;
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
        FillPlaceHolder(false);
        }
      else
        {
        p.biz_user = new TClass_biz_user();
        //
        p.be_loaded = false;
        if(
            (
            new ArrayList
              {
              "Department Chief Scheduler",
              "Department Fleet Supervisor",
              "Department Fleet Coordinator",
              "Department Street Supervisor",
              "Squad Commander",
              "Squad Manager",
              "Squad Assistant Manager",
              "Squad Scheduler",
              "Squad Training Officer",
              "Squad Section Sergeant",
              "Squad Fleet Coordinator"
              }
            )
            .Contains(p.biz_user.Roles()[0]))
          {
          p.tab_index = UserControl_schedule_binder_Static.TSSI_ASSIGNMENT_ASSISTANT;
          }
        else
          {
          p.tab_index = UserControl_schedule_binder_Static.TSSI_AVAILABILITIES;
          }
        FillPlaceHolder(true);
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
      PreRender += TWebUserControl_schedule_binder_PreRender;
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
      FillPlaceHolder(true);
      }

    private void FillPlaceHolder
      (
      bool be_fresh_control_required,
      string target
      )
      {
      if (p.tab_index == UserControl_schedule_binder_Static.TSSI_AVAILABILITIES)
        {
        var c = ((TWebUserControl_availabilities)(LoadControl("~/usercontrol/app/UserControl_availabilities.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder((be_fresh_control_required ? c.Fresh() : c), "UserControl_availabilities", PlaceHolder_content);
        }
      else if (p.tab_index == UserControl_schedule_binder_Static.TSSI_ASSIGNMENT_ASSISTANT)
        {
        var c = ((TWebUserControl_schedule_assignment_assistant_binder)(LoadControl("~/usercontrol/app/UserControl_schedule_assignment_assistant_binder.ascx")));
        p.content_id = AddIdentifiedControlToPlaceHolder((be_fresh_control_required ? c.Fresh() : c), "G", PlaceHolder_content);
        c.SetTarget(target);
        }
      }
    private void FillPlaceHolder(bool be_fresh_control_required)
      {
      FillPlaceHolder(be_fresh_control_required,k.EMPTY);
      }

    public void SetTarget(string target)
      {
      if (target != k.EMPTY)
        {
        if (target.ToLower().Contains("/availabilities/"))
          {
          p.tab_index = UserControl_schedule_binder_Static.TSSI_AVAILABILITIES;
          }
        else if (target.ToLower().Contains("/assignment-assistant/"))
          {
          p.tab_index = UserControl_schedule_binder_Static.TSSI_ASSIGNMENT_ASSISTANT;
          }
        //
        PlaceHolder_content.Controls.Clear();
        FillPlaceHolder(false,target);
        //
        }
      }

    } // end TWebUserControl_schedule_binder

  }

