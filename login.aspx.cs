using Class_biz_users;
using kix;
using System;
using System.Configuration;
using System.Web.Security;
using System.Web.UI;

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
            PreRender += TWebForm_login_PreRender;
        }

        private void InjectPersistentClientSideScript()
          {
          EstablishClientSideFunction(k.client_side_function_enumeral_type.EL);
          EstablishClientSideFunction("SetClientTimezoneOffset()","El('" + Hidden_client_timezone_offset.ClientID + "').value = (new Date()).getTimezoneOffset();");
          Button_log_in.Attributes.Add("onclick","SetClientTimezoneOffset();");
          LinkButton_new_user.Attributes.Add("onclick","SetClientTimezoneOffset();");
          EstablishClientSideFunction
            (
            "SecurePassword()",
            k.EMPTY
            + "if (El('" + TextBox_password.ClientID + "').value != '') El('" + TextBox_password.ClientID + "').value = new jsSHA(El('" + TextBox_password.ClientID + "').value,'ASCII').getHash('HEX')"
            );
          //
          Form_control.Attributes.Add("onsubmit","SecurePassword()");
          }

        protected void Page_Load(object sender, System.EventArgs e)
          {
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
          else
            {
              Title = ConfigurationManager.AppSettings["application_name"] + " - login";
              Literal_application_name.Text = ConfigurationManager.AppSettings["application_name"];
              p.biz_users = new TClass_biz_users();
                RequireConfirmation(LinkButton_forgot_password,"Are you sure you want a new password?");
                TextBox_username.Focus();
            }
          InjectPersistentClientSideScript();
          }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void LinkButton_new_user_Click(object sender, System.EventArgs e)
          {
          SessionSet("client_timezone_offset", double.Parse(k.Safe(Hidden_client_timezone_offset.Value,k.safe_hint_type.HYPHENATED_NUM)));
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
            SessionSet(InstanceId() + ".p", p);
        }

        protected void CustomValidator_account_exists_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = p.biz_users.BeAuthorized(k.Safe(TextBox_username.Text.Trim(), k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM), k.Safe(TextBox_password.Text.Trim(), k.safe_hint_type.HEX));
        }

        protected void Button_log_in_Click(object sender, System.EventArgs e)
        {
            string username;
            username = k.Safe(TextBox_username.Text.Trim(), k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM);
            if (Page.IsValid)
            {
                var user_id = p.biz_users.IdOf(username);
                SessionSet("user_id",user_id);
                SessionSet("username", username);
                SessionSet("password_reset_email_address",p.biz_users.PasswordResetEmailAddressOfId(user_id));
                double client_timezone_offset;
                try
                  {
                  client_timezone_offset = double.Parse(k.Safe(Hidden_client_timezone_offset.Value,k.safe_hint_type.HYPHENATED_NUM));
                  }
                catch (FormatException)
                  {
                  client_timezone_offset = 270;
                  }
                SessionSet("client_timezone_offset",client_timezone_offset);
                p.biz_users.RecordSuccessfulLogin(Session["user_id"].ToString());
                FormsAuthentication.SetAuthCookie(username, CheckBox_keep_me_logged_in.Checked);
                var redirect_url = FormsAuthentication.GetRedirectUrl(userName:username,createPersistentCookie:CheckBox_keep_me_logged_in.Checked);
                if (redirect_url.Contains(value:"/protected/paypal_assistant.aspx?q="))
                  {
                  FormsAuthentication.RedirectFromLoginPage(userName:username,createPersistentCookie:CheckBox_keep_me_logged_in.Checked);
                  }
                else
                  {
                  Response.Redirect("~/protected/overview.aspx");
                  }
            }
            else
            {
                if (p.biz_users.BeRegisteredUsername(username))
                {
                    p.biz_users.RecordUnsuccessfulLoginAttempt(username);
                }
            }
        }

        protected void LinkButton_verify_efficipay_signature_Click(object sender, EventArgs e)
          {
          Server.Transfer("verify_efficipay_signature.aspx");
          }

    } // end TWebForm_login

}
