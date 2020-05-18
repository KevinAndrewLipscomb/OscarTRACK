using Class_biz_user;
using System;
using System.Threading;
using System.Web;

#pragma warning disable CA1716
namespace Global
  {
  public class TGlobal: HttpApplication
    {

    public TGlobal() : base()
      {
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
