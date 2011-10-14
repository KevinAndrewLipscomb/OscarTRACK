using System.Configuration;

using kix;

using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


using System.Web.Security;
using Class_biz_users;
namespace verify_efficipay_signature
{
    public struct p_type
    {
        public TClass_biz_users biz_users;
    } // end p_type

    public partial class TWebForm_verify_efficipay_signature: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_verify_efficipay_signature_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            switch(NatureOfVisit(InstanceId() + ".p"))
            {
                case nature_of_visit_type.VISIT_INITIAL:
                    Title.InnerText = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - verify_efficipay_signature";
                    p.biz_users = new TClass_biz_users();
                    Label_application_name.Text = ConfigurationManager.AppSettings["application_name"];
                    Focus(TextBox_username, true);
                    break;
                case nature_of_visit_type.VISIT_POSTBACK_STANDARD:
                    p = (p_type)(Session[InstanceId() + ".p"]);
                    break;
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("login.aspx");
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            string username;
            if (Page.IsValid)
            {
                username = k.Safe(TextBox_username.Text, k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM);
                p.biz_users.RegisterNew(username, k.Digest(k.Safe(TextBox_nominal_password.Text, k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM)), k.Safe(TextBox_email_address.Text, k.safe_hint_type.EMAIL_ADDRESS));
                SessionSet("username", username);
                SessionSet("user_id", p.biz_users.IdOf(username));
                FormsAuthentication.RedirectFromLoginPage(username, false);
            }
            else
            {
                ValidationAlert(true);
            }
        }

        protected void CustomValidator_email_address_novelty_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = !p.biz_users.BeRegisteredEmailAddress(k.Safe(args.Value, k.safe_hint_type.EMAIL_ADDRESS));
        }

        protected void CustomValidator_email_address_domain_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = k.BeValidDomainPartOfEmailAddress(args.Value);
        }

        protected void CustomValidator_username_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = !p.biz_users.BeRegisteredUsername(k.Safe(args.Value, k.safe_hint_type.HYPHENATED_UNDERSCORED_ALPHANUM));
        }

        private void TWebForm_verify_efficipay_signature_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

    } // end TWebForm_verify_efficipay_signature

}
