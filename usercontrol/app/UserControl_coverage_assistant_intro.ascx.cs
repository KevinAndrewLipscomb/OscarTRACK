using Class_msg_protected;
using System.Configuration;

namespace UserControl_coverage_assistant_intro
  {

  public partial class TWebUserControl_coverage_assistant_intro: ki_web_ui.usercontrol_class
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
//#warning Revise the binder-related instance_id to this control appropriately.
//        if (instance_id == "ASP.protected_overview_aspx.UserControl_member_binder_coverage_assistant_intro")
//          {
//#warning Revise the ClientID path to this control appropriately.
//          p.be_loaded &= ((Session["UserControl_member_binder_PlaceHolder_content"] as string) == "UserControl_coverage_assistant_intro");
//          }
////      else if (instance_id == "ASP.~_aspx.UserControl_~_binder_coverage_assistant_intro")
////        {
////        p.be_loaded &= ((Session["UserControl_~_binder_PlaceHolder_content"] as string) == "UserControl_coverage_assistant_intro");
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
      PreRender += TWebUserControl_coverage_assistant_intro_PreRender;
      }

    private void TWebUserControl_coverage_assistant_intro_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_coverage_assistant_intro Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void LinkButton_my_assignments_Click(object sender, System.EventArgs e)
      {
      MyAssignments();
      }

    protected void LinkButton_my_assignments_2_Click(object sender, System.EventArgs e)
      {
      MyAssignments();
      }

    private void MyAssignments()
      {
      var msg = new TClass_msg_protected.overview();
      msg.target = "/schedule/my-assignments/";
      MessageBack
        (
        msg:msg,
        folder_name:"protected",
        aspx_name:"overview"
        );
      BackTrack();
      }

    }

  }
