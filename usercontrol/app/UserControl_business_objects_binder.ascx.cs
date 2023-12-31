// Derived from KiAspdotnetFramework/UserControl/app/UserControl~template~binder.cs~template

using kix;
using UserControl_agency;
using UserControl_agency_satellite_station;
using UserControl_cad_object_binder;
using UserControl_eval_object_binder;
using UserControl_fleet_object_binder;
using UserControl_fund_drive_object_binder;
using UserControl_post;
using UserControl_shift;
using UserControl_sms_gateway;
using UserControl_uniform_object_binder;

namespace UserControl_business_objects_binder
  {
  public partial class TWebUserControl_business_objects_binder: ki_web_ui.usercontrol_class
    {
    private static class Static
      {
      public const int TSSI_AGENCIES = 0;
      public const int TSSI_POSTS = 1;
      public const int TSSI_SATELLITE_STATIONS = 2;
      public const int TSSI_FLEET_OBJECTS = 3;
      public const int TSSI_FUND_DRIVE_OBJECTS = 4;
      public const int TSSI_UNIFORM_OBJECTS = 5;
      public const int TSSI_SHIFTS = 6;
      public const int TSSI_EVAL_OBJECTS = 7;
      public const int TSSI_SMS_GATEWAYS = 8;
      public const int TSSI_CAD_OBJECTS = 9;
      }

    private struct p_type
      {
      public bool be_loaded;
      public string content_id;
      public uint tab_index;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    private void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        if (k.Has((string[])(Session["privilege_array"]), "config-agencies"))
          {
          TabPanel_agencies.Enabled = true;
          }
        if (k.Has((string[])(Session["privilege_array"]), "config-agencies"))
          {
          TabPanel_posts.Enabled = true;
          }
        if (k.Has((string[])(Session["privilege_array"]), "config-agencies"))
          {
          TabPanel_satellite_stations.Enabled = true;
          }
        if (k.Has((string[])(Session["privilege_array"]), "config-fleet-attributes"))
          {
          TabPanel_fleet_objects.Enabled = true;
          }
        if (k.Has((string[])(Session["privilege_array"]), "config-fund-drive-attributes"))
          {
          TabPanel_fund_drive_objects.Enabled = true;
          }
        if (k.Has((string[])(Session["privilege_array"]), "config-uniforms"))
          {
          TabPanel_uniform_objects.Enabled = true;
          }
        if (k.Has((string[])(Session["privilege_array"]), "config-shifts"))
          {
          TabPanel_shifts.Enabled = true;
          }
        if (k.Has((string[])(Session["privilege_array"]), "config-eval-attributes"))
          {
          TabPanel_eval_objects.Enabled = true;
          }
        if (k.Has((string[])(Session["privilege_array"]), "config-sms-gateways"))
          {
          TabPanel_sms_gateways.Enabled = true;
          }
        if (k.Has((string[])(Session["privilege_array"]), "config-cad-objects"))
          {
          TabPanel_cad_objects.Enabled = true;
          }
        p.be_loaded = true;
        }
      TabContainer_control.ActiveTabIndex = (int)(p.tab_index);
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_config_PlaceHolder_content"] as string) == "UserControl_business_objects_binder");
        //
        // Dynamic controls must be re-added on each postback.
        //
        if (p.tab_index == Static.TSSI_AGENCIES)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_agency)(LoadControl("~/usercontrol/app/UserControl_agency.ascx"))), "UserControl_agency", PlaceHolder_content);
          }
        else if (p.tab_index == Static.TSSI_POSTS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_post)(LoadControl("~/usercontrol/app/UserControl_post.ascx"))), "UserControl_post", PlaceHolder_content);
          }
        else if (p.tab_index == Static.TSSI_SATELLITE_STATIONS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_agency_satellite_station)(LoadControl("~/usercontrol/app/UserControl_agency_satellite_station.ascx"))), "UserControl_agency_satellite_station", PlaceHolder_content);
          }
        else if (p.tab_index == Static.TSSI_FLEET_OBJECTS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_fleet_object_binder)(LoadControl("~/usercontrol/app/UserControl_fleet_object_binder.ascx"))), "UserControl_fleet_object_binder", PlaceHolder_content);
          }
        else if (p.tab_index == Static.TSSI_FUND_DRIVE_OBJECTS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_fund_drive_object_binder)(LoadControl("~/usercontrol/app/UserControl_fund_drive_object_binder.ascx"))), "UserControl_fund_drive_object_binder", PlaceHolder_content);
          }
        else if (p.tab_index == Static.TSSI_UNIFORM_OBJECTS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_uniform_object_binder)(LoadControl("~/usercontrol/app/UserControl_uniform_object_binder.ascx"))), "UserControl_uniform_object_binder", PlaceHolder_content);
          }
        else if (p.tab_index == Static.TSSI_SHIFTS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_shift)(LoadControl("~/usercontrol/app/UserControl_shift.ascx"))), "UserControl_shift", PlaceHolder_content);
          }
        else if (p.tab_index == Static.TSSI_EVAL_OBJECTS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_eval_object_binder)(LoadControl("~/usercontrol/app/UserControl_eval_object_binder.ascx"))), "UserControl_eval_object_binder", PlaceHolder_content);
          }
        else if (p.tab_index == Static.TSSI_SMS_GATEWAYS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_sms_gateway)(LoadControl("~/usercontrol/app/UserControl_sms_gateway.ascx"))), "UserControl_sms_gateway", PlaceHolder_content);
          }
        else if (p.tab_index == Static.TSSI_CAD_OBJECTS)
          {
          p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_cad_object_binder)(LoadControl("~/usercontrol/app/UserControl_cad_object_binder.ascx"))), "UserControl_cad_object_binder", PlaceHolder_content);
          }
        }
      else
        {
        p.be_loaded = false;
        p.tab_index = Static.TSSI_AGENCIES;
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_agency)(LoadControl("~/usercontrol/app/UserControl_agency.ascx"))),"UserControl_agency",PlaceHolder_content,InstanceId());
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      TabContainer_control.ActiveTabChanged += TabContainer_control_ActiveTabChanged;
      PreRender += TWebUserControl_business_objects_binder_PreRender;
      }

    private void TWebUserControl_business_objects_binder_PreRender(object sender, System.EventArgs e)
      {
      //
      // Indicate to children which content control was active on this pass, so that on subsequent passes a child can detect whether or
      // not it is already loaded in the user's browser.
      //
      SessionSet(PlaceHolder_content.ClientID, p.content_id);
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_business_objects_binder Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    private void TabContainer_control_ActiveTabChanged(object sender, System.EventArgs e)
      {
      p.tab_index = (uint)(TabContainer_control.ActiveTabIndex);
      PlaceHolder_content.Controls.Clear();
      if (p.tab_index == Static.TSSI_AGENCIES)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_agency)(LoadControl("~/usercontrol/app/UserControl_agency.ascx"))),"UserControl_agency",PlaceHolder_content,InstanceId());
        }
      else if (p.tab_index == Static.TSSI_POSTS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_post)(LoadControl("~/usercontrol/app/UserControl_post.ascx"))),"UserControl_post",PlaceHolder_content,InstanceId());
        }
      else if (p.tab_index == Static.TSSI_SATELLITE_STATIONS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_agency_satellite_station)(LoadControl("~/usercontrol/app/UserControl_agency_satellite_station.ascx"))),"UserControl_agency_satellite_station",PlaceHolder_content,InstanceId());
        }
      else if (p.tab_index == Static.TSSI_FLEET_OBJECTS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_fleet_object_binder)(LoadControl("~/usercontrol/app/UserControl_fleet_object_binder.ascx"))),"UserControl_fleet_object_binder",PlaceHolder_content,InstanceId());
        }
      else if (p.tab_index == Static.TSSI_FUND_DRIVE_OBJECTS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_fund_drive_object_binder)(LoadControl("~/usercontrol/app/UserControl_fund_drive_object_binder.ascx"))),"UserControl_fund_drive_object_binder",PlaceHolder_content,InstanceId());
        }
      else if (p.tab_index == Static.TSSI_UNIFORM_OBJECTS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_uniform_object_binder)(LoadControl("~/usercontrol/app/UserControl_uniform_object_binder.ascx"))),"UserControl_uniform_object_binder",PlaceHolder_content,InstanceId());
        }
      else if (p.tab_index == Static.TSSI_SHIFTS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_shift)(LoadControl("~/usercontrol/app/UserControl_shift.ascx"))),"UserControl_shift",PlaceHolder_content,InstanceId());
        }
      else if (p.tab_index == Static.TSSI_EVAL_OBJECTS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_eval_object_binder)(LoadControl("~/usercontrol/app/UserControl_eval_object_binder.ascx"))),"UserControl_eval_object_binder",PlaceHolder_content,InstanceId());
        }
      else if (p.tab_index == Static.TSSI_SMS_GATEWAYS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_sms_gateway)(LoadControl("~/usercontrol/app/UserControl_sms_gateway.ascx"))),"UserControl_sms_gateway",PlaceHolder_content,InstanceId());
        }
      else if (p.tab_index == Static.TSSI_CAD_OBJECTS)
        {
        p.content_id = AddIdentifiedControlToPlaceHolder(((TWebUserControl_cad_object_binder)(LoadControl("~/usercontrol/app/UserControl_cad_object_binder.ascx"))),"UserControl_cad_object_binder",PlaceHolder_content,InstanceId());
        }
      }

    } // end TWebUserControl_business_objects_binder

  }