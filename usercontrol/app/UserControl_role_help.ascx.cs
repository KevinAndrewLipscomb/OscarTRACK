using System.Configuration;

namespace UserControl_role_help
  {

  public partial class TWebUserControl_role_help: ki_web_ui.usercontrol_class
    {

    private struct p_type
      {
      public bool be_loaded;
      }

    private p_type p;

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!p.be_loaded)
        {
        Label_application_name_1.Text = ConfigurationManager.AppSettings["application_name"];
        Label_application_name_2.Text = ConfigurationManager.AppSettings["application_name"];
        Label_application_name_3.Text = ConfigurationManager.AppSettings["application_name"];
        Label_application_name_4.Text = ConfigurationManager.AppSettings["application_name"];
        Label_application_name_5.Text = ConfigurationManager.AppSettings["application_name"];
        Label_application_name_6.Text = ConfigurationManager.AppSettings["application_name"];
        p.be_loaded = true;
        }
      }

    protected override void OnInit(System.EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (Session[InstanceId() + ".p"] != null)
        {
        p = (p_type)(Session[InstanceId() + ".p"]);
        p.be_loaded = IsPostBack && ((Session["M_PlaceHolder_content"] as string) == "UserControl_role_help");
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
      PreRender += TWebUserControl_role_help_PreRender;
      }

    private void TWebUserControl_role_help_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    public TWebUserControl_role_help Fresh()
      {
      Session.Remove(InstanceId() + ".p");
      return this;
      }

    }

  }
