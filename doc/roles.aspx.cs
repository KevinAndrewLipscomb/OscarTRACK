using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace roles
{
    struct p_type
    {
    } // end p_type

    public partial class TWebForm_roles: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.PreRender += this.TWebForm_roles_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            //@ Undeclared identifier(3): 'IsPostback'
            if (!IsPostBack)
            {
                //@ Undeclared identifier(3): 'configurationmanager'
                //@ Unsupported property or method(A): 'appsettings'
                //@ Undeclared identifier(3): 'server'
                //@ Unsupported property or method(A): 'HtmlEncode'
                Title.InnerText = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - roles";
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            //@ Undeclared identifier(3): 'IsPostback'
            if (IsPostBack)
            {
                //@ Undeclared identifier(3): 'session'
                if ((Session["roles.p"] != null))
                {
                    //@ Undeclared identifier(3): 'session'
                    p = (p_type)(Session["roles.p"]);
                }
                else
                {
                    //@ Undeclared identifier(3): 'server'
                    //@ Unsupported property or method(A): 'Transfer'
                    Server.Transfer("~/timeout.aspx");
                }
            }
            else
            {
            }

        }

        private void TWebForm_roles_PreRender(object sender, System.EventArgs e)
        {
            //@ Undeclared identifier(3): 'SessionSet'
            SessionSet("roles.p", p);
        }

    } // end TWebForm_roles

}

