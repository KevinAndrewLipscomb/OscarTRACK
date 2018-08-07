using System;
using System.Configuration;

namespace UserControl_register_on_vb_ems_sideband
  {

  public partial class TWebUserControl_register_on_vb_ems_sideband: ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public bool be_loaded;
      }

    private p_type p;

    protected void Page_Load(object sender, EventArgs e)
      {
      if (!p.be_loaded)
        {
        Literal_vb_ems_sideband_password.Text = ConfigurationManager.AppSettings["vb_ems_sideband_password"];
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
        //
        // If this control is being used dynamically under one or more parent binder(s), it must ascertain which instance it is, and whether or not that instance's parent binder
        // had it loaded already.
        //
        //if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_register_on_vb_ems_sideband")
        //  {
        //  p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_register_on_vb_ems_sideband");
        //  }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_register_on_vb_ems_sideband")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_register_on_vb_ems_sideband");
//        }
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
      PreRender += TWebUserControl_register_on_vb_ems_sideband_PreRender;
      }

    private void TWebUserControl_register_on_vb_ems_sideband_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_register_on_vb_ems_sideband Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    }

  }
