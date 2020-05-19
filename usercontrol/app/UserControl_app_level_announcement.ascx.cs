using System;
using System.Configuration;

namespace UserControl_app_level_announcement
  {

  public partial class TWebUserControl_app_level_announcement: ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public bool be_loaded;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    protected void Page_Load(object sender, EventArgs e)
      {
      if (!p.be_loaded)
        {
        Label_application_name.Text = ConfigurationManager.AppSettings["application_name"];
        Panel_content.Visible = DateTime.Now < new DateTime(2019,6,1,20,0,0);
        p.be_loaded = true;
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      var instance_id = InstanceId();
      if (Session[instance_id + ".p"] != null)
        {
        p = (p_type)(Session[instance_id + ".p"]);
        p.be_loaded = IsPostBack;  // This test is sufficient if this control is being used statically on its page.
//        //
//        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
//        // had it loaded already.
//        //
//#warning Revise the binder-related instance_id to this control appropriately.
//        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_app_level_announcement")
//          {
//#warning Revise the ClientID path to this control appropriately.
//          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_app_level_announcement");
//          }
////      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_app_level_announcement")
////        {
////        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_app_level_announcement");
////        }
        }
      else
        {
        p.be_loaded = false;
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_app_level_announcement_PreRender;
      }

    private void TWebUserControl_app_level_announcement_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_app_level_announcement Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    }

  }
