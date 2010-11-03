// Derived from KiAspdotnetFramework/UserControl/app/UserControl~fund_drive_object~binder.cs~fund_drive_object

using kix;
using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using UserControl_city;
using UserControl_state;
using UserControl_street;

namespace UserControl_fund_drive_object_binder
  {
  public class UserControl_fund_drive_object_binder_Static
    {
    public const int TSSI_STREET = 0;
    public const int TSSI_CITY = 1;
    public const int TSSI_STATE = 2;
    }

  public struct p_type
    {
    public bool be_loaded;
    public string content_id;
    public uint tab_index;
    }

  public partial class TWebUserControl_fund_drive_object_binder: ki_web_ui.usercontrol_class
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
      if (Session["UserControl_fund_drive_object_binder.p"] != null)
        {
        p = (p_type)(Session["UserControl_fund_drive_object_binder.p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_config_UserControl_business_objects_binder_PlaceHolder_content"] as string) == "UserControl_fund_drive_object_binder");
        //
        // Dynamic controls must be re-added on each postback.
        //
        if (p.tab_index == UserControl_fund_drive_object_binder_Static.TSSI_STREET)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_street)(LoadControl("~/usercontrol/app/UserControl_street.ascx"))), "UserControl_street", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_fund_drive_object_binder_Static.TSSI_CITY)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_city)(LoadControl("~/usercontrol/app/UserControl_city.ascx"))), "UserControl_city", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_fund_drive_object_binder_Static.TSSI_STATE)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_state)(LoadControl("~/usercontrol/app/UserControl_state.ascx"))), "UserControl_state", PlaceHolder_content);
          }
        }
      else
        {
        p.be_loaded = false;
        p.tab_index = UserControl_fund_drive_object_binder_Static.TSSI_STREET;
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_street)(LoadControl("~/usercontrol/app/UserControl_street.ascx"))).Fresh(), "UserControl_street", PlaceHolder_content);
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
      this.PreRender += this.TWebUserControl_fund_drive_object_binder_PreRender;
      //this.Load += this.Page_Load;
      }

    private void TWebUserControl_fund_drive_object_binder_PreRender(object sender, System.EventArgs e)
      {
      //
      // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
      // not it is already loaded in the user's browser.
      //
      SessionSet(PlaceHolder_content.ClientID, p.content_id);
      SessionSet("UserControl_fund_drive_object_binder.p", p);
      }

    public TWebUserControl_fund_drive_object_binder Fresh()
      {
      Session.Remove("UserControl_fund_drive_object_binder.p");
      return this;
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      if (p.tab_index == UserControl_fund_drive_object_binder_Static.TSSI_STREET)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_street)(LoadControl("~/usercontrol/app/UserControl_street.ascx"))).Fresh(), "UserControl_street", PlaceHolder_content);
        }
      else if (p.tab_index == UserControl_fund_drive_object_binder_Static.TSSI_CITY)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_city)(LoadControl("~/usercontrol/app/UserControl_city.ascx"))).Fresh(), "UserControl_city", PlaceHolder_content);
        }
      else if (p.tab_index == UserControl_fund_drive_object_binder_Static.TSSI_STATE)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_state)(LoadControl("~/usercontrol/app/UserControl_state.ascx"))).Fresh(), "UserControl_state", PlaceHolder_content);
        }
      }

    } // end TWebUserControl_fund_drive_object_binder

  }

