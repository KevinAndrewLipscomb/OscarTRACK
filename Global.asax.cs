using Class_biz_user;
using System;
using System.Threading;
using System.Web;

namespace Global
  {
  public class TGlobal: HttpApplication
    {

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      }

    public TGlobal() : base()
      {
      InitializeComponent();
      }

    protected void Application_Start(object sender, EventArgs e)
      {
      //chartview.SetLicensePath(Server.MapPath("bin"));
      //
      // Establish an application-scoped object to allow synchronized control of nonreentrant spcchartnet code.
      //
      Application.Add
        (
        name:"spcchartnet_avail",
        value:new AutoResetEvent(initialState:true)
        );
      }

    protected void Session_Start(object sender, EventArgs e)
      {
      }

    protected void Application_BeginRequest(object sender, EventArgs e)
      {
      }

    protected void Application_EndRequest(object sender, EventArgs e)
      {
      }

    protected void Application_AuthenticateRequest(object sender, EventArgs e)
      {
      if (Request.IsAuthenticated)
        {
        HttpContext.Current.User = new System.Security.Principal.GenericPrincipal
          (
          identity:User.Identity,
          roles:new TClass_biz_user().Roles()
          );
        }
      }

    protected void Application_Error(object sender, EventArgs e)
      {
      Server.Transfer(path:"~/exception.aspx");
      }

    protected void Session_End(object sender, EventArgs e)
      {
      }

    protected void Application_End(object sender, EventArgs e)
      {
      }

    } // end TGlobal

  }
