using System.Configuration;

using kix;

using System;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI;




using System.Web;
using System.Web.Security;
namespace UserControl_precontent
{
    public partial class TWebUserControl_precontent: ki_web_ui.usercontrol_class
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                Label_application_name.Text = ConfigurationManager.AppSettings["application_name"];
                if (!(Session["username"] != null))
                {
                    TableRow_account_control.Visible = false;
                }
                else
                {
                    Label_username.Text = Session["username"].ToString();
                }
            }

        }

        protected override void OnInit(System.EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);

        }

        private void ScriptManager_control_AsyncPostBackError(object sender, System.Web.UI.AsyncPostBackErrorEventArgs e)
        {
            k.EscalatedException(e.Exception, HttpContext.Current.User.Identity.Name, Session);
            ScriptManager_control.AsyncPostBackErrorMessage = AlertMessage(k.alert_cause_type.LOGIC, k.alert_state_type.FAILURE, "xparposbac", "OOPS!" + k.NEW_LINE + k.NEW_LINE + "The application encountered an unexpected error." + k.NEW_LINE + k.NEW_LINE + "The Application Administrator has been notified by pager and email.");

        }

        protected void LinkButton_change_email_address_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo(k.ExpandTildePath("~/protected/change_email_address.aspx"));
        }

        protected void LinkButton_change_password_Click(object sender, System.EventArgs e)
        {
            DropCrumbAndTransferTo(k.ExpandTildePath("~/protected/change_password.aspx"));
        }

        protected void LinkButton_logout_Click(object sender, System.EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Server.Transfer(k.ExpandTildePath("~/Default.aspx"));
        }

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.ScriptManager_control.AsyncPostBackError += this.ScriptManager_control_AsyncPostBackError;
            //this.Load += this.Page_Load;
        }

    } // end TWebUserControl_precontent

}
