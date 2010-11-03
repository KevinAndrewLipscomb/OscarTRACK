// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~binder.cs~template

using kix;
using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using UserControl_agency;
using UserControl_fleet_object_binder;
using UserControl_fund_drive_object_binder;

namespace UserControl_business_objects_binder
  {
  public class UserControl_business_objects_binder_Static
    {
    public const int TSSI_AGENCIES = 0;
    public const int TSSI_FLEET_OBJECTS = 1;
    public const int TSSI_FUND_DRIVE_OBJECTS = 2;
    }

  public struct p_type
    {
    public bool be_loaded;
    public string content_id;
    public uint tab_index;
    }

  public partial class TWebUserControl_business_objects_binder: ki_web_ui.usercontrol_class
    {
    private p_type p;

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (k.Has((string[])(Session["privilege_array"]), "config-agencies"))
          {
          TabPanel_agencies.Enabled = true;
          }
        if (k.Has((string[])(Session["privilege_array"]), "config-fleet-attributes"))
          {
          TabPanel_fleet_objects.Enabled = true;
          }
        if (k.Has((string[])(Session["privilege_array"]), "config-fund-drive-attributes"))
          {
          TabPanel_fund_drive_objects.Enabled = true;
          }
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session["UserControl_business_objects_binder.p"] != null)
        {
        p = (p_type)(Session["UserControl_business_objects_binder.p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_config_PlaceHolder_content"] as string) == "UserControl_business_objects_binder");
        //
        // Dynamic controls must be re-added on each postback.
        //
        if (p.tab_index == UserControl_business_objects_binder_Static.TSSI_AGENCIES)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_agency)(LoadControl("~/usercontrol/app/UserControl_agency.ascx"))), "UserControl_agency", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_business_objects_binder_Static.TSSI_FLEET_OBJECTS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_fleet_object_binder)(LoadControl("~/usercontrol/app/UserControl_fleet_object_binder.ascx"))), "UserControl_fleet_object_binder", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_business_objects_binder_Static.TSSI_FUND_DRIVE_OBJECTS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_fund_drive_object_binder)(LoadControl("~/usercontrol/app/UserControl_fund_drive_object_binder.ascx"))), "UserControl_fund_drive_object_binder", PlaceHolder_content);
          }
        }
      else
        {
        p.be_loaded = false;
        p.tab_index = UserControl_business_objects_binder_Static.TSSI_AGENCIES;
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_agency)(LoadControl("~/usercontrol/app/UserControl_agency.ascx"))).Fresh(), "UserControl_agency", PlaceHolder_content);
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
      this.PreRender += this.TWebUserControl_business_objects_binder_PreRender;
      //this.Load += this.Page_Load;
      }

    private void TWebUserControl_business_objects_binder_PreRender(object sender, System.EventArgs e)
      {
      //
      // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
      // not it is already loaded in the user's browser.
      //
      SessionSet(PlaceHolder_content.ClientID, p.content_id);
      SessionSet("UserControl_business_objects_binder.p", p);
      }

    public TWebUserControl_business_objects_binder Fresh()
      {
      Session.Remove("UserControl_business_objects_binder.p");
      return this;
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      if (p.tab_index == UserControl_business_objects_binder_Static.TSSI_AGENCIES)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_agency)(LoadControl("~/usercontrol/app/UserControl_agency.ascx"))).Fresh(), "UserControl_agency", PlaceHolder_content);
        }
      else if (p.tab_index == UserControl_business_objects_binder_Static.TSSI_FLEET_OBJECTS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_fleet_object_binder)(LoadControl("~/usercontrol/app/UserControl_fleet_object_binder.ascx"))).Fresh(), "UserControl_fleet_object_binder", PlaceHolder_content);
        }
      else if (p.tab_index == UserControl_business_objects_binder_Static.TSSI_FUND_DRIVE_OBJECTS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_fund_drive_object_binder)(LoadControl("~/usercontrol/app/UserControl_fund_drive_object_binder.ascx"))).Fresh(), "UserControl_fund_drive_object_binder", PlaceHolder_content);
        }
      }

    } // end TWebUserControl_business_objects_binder

  }

