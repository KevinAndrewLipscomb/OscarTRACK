using kix;
using System.Configuration;

namespace UserControl_strength_chart
  {

  public partial class TWebUserControl_strength_chart: ki_web_ui.usercontrol_class
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
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_S_G_S")
          {
          p.be_loaded &= ((Session["M_S_G_PlaceHolder_content"] as string) == "S");
          }
//      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_strength_chart")
//        {
//        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_strength_chart");
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
      PreRender += TWebUserControl_strength_chart_PreRender;
      }

    private void TWebUserControl_strength_chart_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_strength_chart Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    internal void SetP
      (
      string agency_filter,
      k.subtype<int> relative_month
      )
      {
      T.SetP(agency_filter,relative_month);
      }

    }

  }
