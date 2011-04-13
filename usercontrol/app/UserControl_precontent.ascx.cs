using kix;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;

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
            var timeout_page = k.ExpandTildePath("~/timeout.aspx");
            if (Request.ServerVariables["URL"] != timeout_page)
              {
              EstablishUpdatePanelCompliantTimeoutHandler((Session.Timeout - 1)*60000,timeout_page); // session timeout minus 1 minute
              }
        }

        protected override void OnInit(System.EventArgs e)
        {
            base.OnInit(e);
        }

        protected void ScriptManager_control_AsyncPostBackError(object sender, System.Web.UI.AsyncPostBackErrorEventArgs e)
        {
            k.EscalatedException(e.Exception, HttpContext.Current.User.Identity.Name, Session);
            ScriptManager_control.AsyncPostBackErrorMessage = AlertMessage(k.alert_cause_type.LOGIC, k.alert_state_type.FAILURE, "xparposbac", "OOPS!" + k.NEW_LINE + k.NEW_LINE + "The application encountered an unexpected error." + k.NEW_LINE + k.NEW_LINE + "The Application Administrator has been notified by pager and email.");
            Server.ClearError();
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

    } // end TWebUserControl_precontent

}
