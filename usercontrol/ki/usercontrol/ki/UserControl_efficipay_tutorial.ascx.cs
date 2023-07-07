using System.Configuration;

namespace UserControl_efficipay_tutorial
  {

  public partial class TWebUserControl_efficipay_tutorial: ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public bool be_loaded;
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        var be_browsing_only = (Session["user_id"] == null);
        TableRow_ready_get_started_1.Visible = be_browsing_only;
        TableRow_ready_get_started_2.Visible = be_browsing_only;
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
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
//#warning Revise the binder-related instance_id to this control appropriately.
//        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_efficipay_tutorial")
//          {
//#warning Revise the ClientID path to this control appropriately.
//          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_efficipay_tutorial");
//          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_efficipay_tutorial")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_efficipay_tutorial");
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
      PreRender += TWebUserControl_efficipay_tutorial_PreRender;
      }

    private void TWebUserControl_efficipay_tutorial_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_efficipay_tutorial Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void Button_get_started_Click(object sender, System.EventArgs e)
      {
      Server.Transfer("new_user_registration.aspx");
      }
    }

  }
