// Derived from KiAspdotnetFramework/UserControl/app/UserControl~fleet_object~binder.cs~fleet_object

using kix;
using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using UserControl_chassis_make;
using UserControl_chassis_model;
using UserControl_custom_make;
using UserControl_custom_model;
using UserControl_fuel;
using UserControl_vehicle;
using UserControl_vehicle_kind;

namespace UserControl_fleet_object_binder
  {
  public class UserControl_fleet_object_binder_Static
    {
    public const int TSSI_VEHICLE_KINDS = 0;
    public const int TSSI_CHASSIS_MAKES = 1;
    public const int TSSI_CHASSIS_MODELS = 2;
    public const int TSSI_CUSTOM_MAKES = 3;
    public const int TSSI_CUSTOM_MODELS = 4;
    public const int TSSI_FUELS = 5;
    }

  public struct p_type
    {
    public bool be_loaded;
    public string content_id;
    public uint tab_index;
    }

  public partial class TWebUserControl_fleet_object_binder: ki_web_ui.usercontrol_class
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
      if (Session["UserControl_fleet_object_binder.p"] != null)
        {
        p = (p_type)(Session["UserControl_fleet_object_binder.p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_config_UserControl_business_objects_binder_PlaceHolder_content"] as string) == "UserControl_fleet_object_binder");
        //
        // Dynamic controls must be re-added on each postback.
        //
        if (p.tab_index == UserControl_fleet_object_binder_Static.TSSI_VEHICLE_KINDS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_vehicle_kind)(LoadControl("~/usercontrol/app/UserControl_vehicle_kind.ascx"))), "UserControl_vehicle_kind", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_fleet_object_binder_Static.TSSI_FUELS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_fuel)(LoadControl("~/usercontrol/app/UserControl_fuel.ascx"))), "UserControl_fuel", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_fleet_object_binder_Static.TSSI_CHASSIS_MAKES)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_chassis_make)(LoadControl("~/usercontrol/app/UserControl_chassis_make.ascx"))), "UserControl_chassis_make", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_fleet_object_binder_Static.TSSI_CHASSIS_MODELS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_chassis_model)(LoadControl("~/usercontrol/app/UserControl_chassis_model.ascx"))), "UserControl_chassis_model", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_fleet_object_binder_Static.TSSI_CUSTOM_MAKES)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_custom_make)(LoadControl("~/usercontrol/app/UserControl_custom_make.ascx"))), "UserControl_custom_make", PlaceHolder_content);
          }
        else if (p.tab_index == UserControl_fleet_object_binder_Static.TSSI_CUSTOM_MODELS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_custom_model)(LoadControl("~/usercontrol/app/UserControl_custom_model.ascx"))), "UserControl_custom_model", PlaceHolder_content);
          }
        }
      else
        {
        p.be_loaded = false;
        p.tab_index = UserControl_fleet_object_binder_Static.TSSI_VEHICLE_KINDS;
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_vehicle_kind)(LoadControl("~/usercontrol/app/UserControl_vehicle_kind.ascx"))).Fresh(), "UserControl_vehicle_kind", PlaceHolder_content);
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      this.TabContainer_control.ActiveTabChanged += this.TabContainer_control_ActiveTabChanged;
      this.PreRender += this.TWebUserControl_fleet_object_binder_PreRender;
      //this.Load += this.Page_Load;
      }

    private void TWebUserControl_fleet_object_binder_PreRender(object sender, System.EventArgs e)
      {
      //
      // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
      // not it is already loaded in the user's browser.
      //
      SessionSet(PlaceHolder_content.ClientID, p.content_id);
      SessionSet("UserControl_fleet_object_binder.p", p);
      }

    public TWebUserControl_fleet_object_binder Fresh()
      {
      Session.Remove("UserControl_fleet_object_binder.p");
      return this;
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      if (p.tab_index == UserControl_fleet_object_binder_Static.TSSI_VEHICLE_KINDS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_vehicle_kind)(LoadControl("~/usercontrol/app/UserControl_vehicle_kind.ascx"))).Fresh(), "UserControl_vehicle_kind", PlaceHolder_content);
        }
      else if (p.tab_index == UserControl_fleet_object_binder_Static.TSSI_FUELS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_fuel)(LoadControl("~/usercontrol/app/UserControl_fuel.ascx"))).Fresh(), "UserControl_fuel", PlaceHolder_content);
        }
      else if (p.tab_index == UserControl_fleet_object_binder_Static.TSSI_CHASSIS_MAKES)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_chassis_make)(LoadControl("~/usercontrol/app/UserControl_chassis_make.ascx"))).Fresh(), "UserControl_chassis_make", PlaceHolder_content);
        }
      else if (p.tab_index == UserControl_fleet_object_binder_Static.TSSI_CHASSIS_MODELS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_chassis_model)(LoadControl("~/usercontrol/app/UserControl_chassis_model.ascx"))).Fresh(), "UserControl_chassis_model", PlaceHolder_content);
        }
      else if (p.tab_index == UserControl_fleet_object_binder_Static.TSSI_CUSTOM_MAKES)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_custom_make)(LoadControl("~/usercontrol/app/UserControl_custom_make.ascx"))).Fresh(), "UserControl_custom_make", PlaceHolder_content);
        }
      else if (p.tab_index == UserControl_fleet_object_binder_Static.TSSI_CUSTOM_MODELS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_custom_model)(LoadControl("~/usercontrol/app/UserControl_custom_model.ascx"))).Fresh(), "UserControl_custom_model", PlaceHolder_content);
        }
      }

    } // end TWebUserControl_fleet_object_binder

  }

