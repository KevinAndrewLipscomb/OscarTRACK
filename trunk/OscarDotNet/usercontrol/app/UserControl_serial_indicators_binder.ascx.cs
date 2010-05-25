// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~binder.cs~template

using kix;
using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using UserControl_serial_fleet_indicators_binder;
using UserControl_serial_personnel_indicators_binder;

namespace UserControl_serial_indicators_binder
  {
  public class UserControl_serial_indicators_binder_Static
    {
    public const int TSSI_PERSONNEL = 0;
    public const int TSSI_FLEET = 1;
    }

  public struct p_type
    {
    public bool be_loaded;
    public string content_id;
    public uint tab_index;
    }

  public partial class TWebUserControl_serial_indicators_binder: ki_web_ui.usercontrol_class
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
      if (Session["UserControl_serial_indicators_binder.p"] != null)
        {
        p = (p_type)(Session["UserControl_serial_indicators_binder.p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_dashboard_binder_UserControl_serial_aspects_binder_PlaceHolder_content"] as string) == "UserControl_serial_indicators_binder");
        //
        // Dynamic controls must be re-added on each postback.
        //
        if (p.tab_index == UserControl_serial_indicators_binder_Static.TSSI_PERSONNEL)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_personnel_indicators_binder)(LoadControl("~/usercontrol/app/UserControl_serial_personnel_indicators_binder.ascx"))), "UserControl_serial_personnel_indicators_binder", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_serial_indicators_binder_Static.TSSI_FLEET)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_fleet_indicators_binder)(LoadControl("~/usercontrol/app/UserControl_serial_fleet_indicators_binder.ascx"))), "UserControl_serial_fleet_indicators_binder", PlaceHolder_content);
          }
        }
      else
        {
        p.be_loaded = false;
        p.tab_index = UserControl_serial_indicators_binder_Static.TSSI_PERSONNEL;
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_personnel_indicators_binder)(LoadControl("~/usercontrol/app/UserControl_serial_personnel_indicators_binder.ascx"))).Fresh(), "UserControl_serial_personnel_indicators_binder", PlaceHolder_content);
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
      this.PreRender += this.TWebUserControl_serial_indicators_binder_PreRender;
      //this.Load += this.Page_Load;
      }

    private void TWebUserControl_serial_indicators_binder_PreRender(object sender, System.EventArgs e)
      {
      //
      // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
      // not it is already loaded in the user's browser.
      //
      SessionSet(PlaceHolder_content.ClientID, p.content_id);
      SessionSet("UserControl_serial_indicators_binder.p", p);
      }

    public TWebUserControl_serial_indicators_binder Fresh()
      {
      Session.Remove("UserControl_serial_indicators_binder.p");
      return this;
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      if (p.tab_index == UserControl_serial_indicators_binder_Static.TSSI_PERSONNEL)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_personnel_indicators_binder)(LoadControl("~/usercontrol/app/UserControl_serial_personnel_indicators_binder.ascx"))).Fresh(), "UserControl_serial_personnel_indicators_binder", PlaceHolder_content);
        }
      else if (p.tab_index == UserControl_serial_indicators_binder_Static.TSSI_FLEET)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_serial_fleet_indicators_binder)(LoadControl("~/usercontrol/app/UserControl_serial_fleet_indicators_binder.ascx"))).Fresh(), "UserControl_serial_fleet_indicators_binder", PlaceHolder_content);
        }
      }

    } // end TWebUserControl_serial_indicators_binder

  }

