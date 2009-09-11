using System.Configuration;

using kix;

using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;

using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;



using System.Web.UI;
using Class_biz_user;
using Class_biz_users;
namespace change_email_address
{
    public struct p_type
    {
        public TClass_biz_user biz_user;
        public TClass_biz_users biz_users;
    } // end p_type

    public partial class TWebForm_change_email_address: ki_web_ui.page_class
    {
        private p_type p;
        protected new System.Web.UI.HtmlControls.HtmlTitle Title = null;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.PreRender += this.TWebForm_change_email_address_PreRender;
            //this.Load += this.Page_Load;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            string email_address;
            if (IsPostBack)
            {
                if ((Session["change_email_address.p"] != null))
                {
                    p = (p_type)(Session["change_email_address.p"]);
                }
                else
                {
                    Server.Transfer("~/timeout.aspx");
                }
            }
            else
            {
                if (Request.ServerVariables["URL"] == Request.CurrentExecutionFilePath)
                {
                    Session.Clear();
                    Server.Transfer("~/login.aspx");
                }
                Title.Text = ConfigurationManager.AppSettings["application_name"] + " - change_email_address";
                p.biz_user = new TClass_biz_user();
                p.biz_users = new TClass_biz_users();
                // Preload email address fields
                email_address = p.biz_users.SelfEmailAddress();
                TextBox_nominal_email_address.Text = email_address;
                TextBox_confirmation_email_address.Text = email_address;
                Focus(TextBox_nominal_email_address, true);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void CustomValidator_confirmation_email_address_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = (TextBox_nominal_email_address.Text.Trim() == TextBox_confirmation_email_address.Text.Trim());
        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        private void TWebForm_change_email_address_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("change_email_address.p", p);
        }

        protected void CustomValidator_nominal_email_address_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = kix.k.BeValidDomainPartOfEmailAddress(args.Value);
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                p.biz_users.SetEmailAddress(p.biz_user.IdNum(), k.Safe(TextBox_nominal_email_address.Text.Trim(), k.safe_hint_type.EMAIL_ADDRESS));
                BackTrack();
            }
            else
            {
                ValidationAlert(true);
            }
        }

    } // end TWebForm_change_email_address

}
