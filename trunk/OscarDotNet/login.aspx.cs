using System.Configuration;

using kix;

using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data.SqlClient;
using System.Data.Common;





using System.Web.UI;
using System.Web.Security;
using Class_biz_users;
namespace login
{
    public struct p_type
    {
        public TClass_biz_users biz_users;
    } // end p_type

    public partial class TWebForm_login: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_login_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (IsPostBack)
            {
                if ((Session["login.p"] != null))
                {
                    p = (p_type)(Session["login.p"]);
                }
                else
                {
                    Server.Transfer("~/timeout.aspx");
                }
            }
            else
            {
                Title.InnerText = ConfigurationManager.AppSettings["application_name"] + " - login";
                p.biz_users = new TClass_biz_users();
                Focus(TextBox_username, true);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void LinkButton_new_user_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("new_user_registration.aspx");
        }

        protected void LinkButton_forgot_username_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("remind_username.aspx");
        }

        protected void LinkButton_forgot_password_Click(object sender, System.EventArgs e)
        {
            string username;
            if (TextBox_username.Text == k.EMPTY)
            {
                Alert(k.alert_cause_type.USER, k.alert_state_type.FAILURE, "misusrnam", "Please enter your username.", true);
            }
            else
            {
                username = k.Safe(TextBox_username.Text.Trim(), k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM);
                if (p.biz_users.BeRegisteredUsername(username))
                {
                    p.biz_users.IssueTemporaryPassword(username, k.Safe(Request.UserHostName, k.safe_hint_type.HOSTNAME));
                    Alert(k.alert_cause_type.LOGIC, k.alert_state_type.NORMAL, "tmpassent", "A temporary password has been sent to the email address that " + ConfigurationManager.AppSettings["application_name"] + " has on file for " + username + ".  Please log in after you receive it.  You will receive further instructions at that" + " time.", true);
                }
                else
                {
                    Alert(k.alert_cause_type.USER, k.alert_state_type.FAILURE, "nosuchusr", "No such user registered", true);
                }
            }
        }

        private void TWebForm_login_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("login.p", p);
        }

        protected void CustomValidator_account_exists_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = p.biz_users.BeAuthorized(k.Safe(TextBox_username.Text.Trim(), k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM), k.Digest(k.Safe(TextBox_password.Text.Trim(), k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM)));
        }

        protected void Button_log_in_Click(object sender, System.EventArgs e)
        {
            string username;
            username = k.Safe(TextBox_username.Text.Trim(), k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM);
            if (Page.IsValid)
            {
                SessionSet("user_id", p.biz_users.IdOf(username));
                SessionSet("username", username);
                p.biz_users.RecordSuccessfulLogin(Session["user_id"].ToString());
                FormsAuthentication.RedirectFromLoginPage(username, CheckBox_keep_me_logged_in.Checked);
            }
            else
            {
                if (p.biz_users.BeRegisteredUsername(username))
                {
                    p.biz_users.RecordUnsuccessfulLoginAttempt(username);
                }
            }
        }

    } // end TWebForm_login

}
