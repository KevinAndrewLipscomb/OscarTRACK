using System;
using System.Configuration;

namespace roles
  {

  public partial class TWebForm_roles: ki_web_ui.page_class
    {

    private struct p_type
      {
      }

    private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      PreRender += TWebForm_roles_PreRender;
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      if (!IsPostBack)
        {
        Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - roles";
        }
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      if (IsPostBack)
        {
        if ((Session[InstanceId() + ".p"] != null))
          {
          p = (p_type)(Session[InstanceId() + ".p"]);
          }
        else
          {
          Server.Transfer("~/timeout.aspx");
          }
        }
      }

    private void TWebForm_roles_PreRender(object sender, System.EventArgs e)
      {
      SessionSet(InstanceId() + ".p", p);
      }

    } // end TWebForm_roles

  }
