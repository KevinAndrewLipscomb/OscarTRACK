using Class_biz_schedule_assignments;
using System.Configuration;

namespace UserControl_assignment_assistant
  {

  public struct p_type
    {
    public bool be_loaded;
    public TClass_biz_schedule_assignments biz_schedule_assignments;
    }

  public partial class TWebUserControl_assignment_assistant: ki_web_ui.usercontrol_class
    {

    private p_type p;

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
      if (Session["UserControl_assignment_assistant.p"] != null)
        {
        p = (p_type)(Session["UserControl_assignment_assistant.p"]);
        p.be_loaded = IsPostBack && ((Session["M_UserControl_schedule_binder_PlaceHolder_content"] as string) == "UserControl_assignment_assistant");
        }
      else
        {
        p.be_loaded = false;
        p.biz_schedule_assignments = new TClass_biz_schedule_assignments();
        }
      }

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebUserControl_assignment_assistant_PreRender;
      }

    private void TWebUserControl_assignment_assistant_PreRender(object sender, System.EventArgs e)
      {
      SessionSet("UserControl_assignment_assistant.p", p);
      }

    public TWebUserControl_assignment_assistant Fresh()
      {
      Session.Remove("UserControl_assignment_assistant.p");
      return this;
      }

    protected void Button_run_Click(object sender, System.EventArgs e)
      {
      p.biz_schedule_assignments.Initialize();
      }

    }

  }
