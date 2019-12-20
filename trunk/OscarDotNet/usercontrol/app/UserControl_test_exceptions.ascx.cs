using System;
using System.Configuration;

namespace UserControl_test_exceptions
  {
  public partial class TWebUserControl_test_exceptions : ki_web_ui.usercontrol_class
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
        if (instance_id == "ASP.protected_overview_aspx.UserControl_M_test_binder_test_exceptions")
          {
          p.be_loaded &= ((Session["M_UserControl_test_binder_PlaceHolder_content"] as string) == "UserControl_test_exceptions");
          }
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
      PreRender += TWebUserControl_test_exceptions_PreRender;
      }

    private void TWebUserControl_test_exceptions_PreRender(object sender, EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_test_exceptions Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    protected void Button_connection_to_mysql_server_Click(object sender, EventArgs e)
      {
      throw new Exception("Connection ~ to MySQL server");
      }

    protected void Button_connection_open_failed_too_many_connections_Click(object sender, EventArgs e)
      {
      throw new Exception("Connection open failed. Too many connections");
      }

    protected void Button_client_disconnected_Click(object sender, EventArgs e)
      {
      throw new Exception("The client disconnected.");
      }

    protected void Button_deadlock_Click(object sender, EventArgs e)
      {
      var x = new Exception("ERROR 1213 (40001): Deadlock found when trying to get lock; try restarting transaction")
        {
        Source = "MySql"
        };
    throw x;
      }

    protected void Button_other_mysql_Click(object sender, EventArgs e)
      {
      var x = new Exception("Other MySQL")
        {
        Source = "MySql"
        };
    throw x;
      }

    protected void Button_other_Click(object sender, EventArgs e)
      {
      throw new Exception("Other exception");
      }

    }
  }