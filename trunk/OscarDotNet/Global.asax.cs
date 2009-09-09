using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;



using System.Threading;
using System.Security.Principal;
using Class_biz_user;
namespace Global
{
    public class TGlobal: System.Web.HttpApplication
    {
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
        }

        //Constructor  Create()
        public TGlobal() : base()
        {
            // Required for Designer support
            InitializeComponent();
            // TODO: Add any constructor code after InitializeComponent call

        }
        protected void Application_Start(object sender, EventArgs e)
        {
            //chartview.SetLicensePath(this.Server.MapPath("bin"));
            // Establish an application-scoped object to allows synchronized control of nonreentrant spcchartnet code.
            this.Application.Add("spcchartnet_avail", new AutoResetEvent(true));

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
            if (this.Request.IsAuthenticated)
            {
                HttpContext.Current.User = new System.Security.Principal.GenericPrincipal(this.User.Identity, new TClass_biz_user().Roles());
            }
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            this.Server.Transfer("~/exception.aspx");
        }

        protected void Session_End(object sender, EventArgs e)
        {
        }

        protected void Application_End(object sender, EventArgs e)
        {
        }

    } // end TGlobal

}
