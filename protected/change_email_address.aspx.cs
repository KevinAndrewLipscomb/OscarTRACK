using Class_biz_user;
using Class_biz_users;
using kix;
using System;
using System.Configuration;

namespace change_email_address
  {
    public partial class TWebForm_change_email_address: ki_web_ui.page_class
    {

    private struct p_type
      {
          public TClass_biz_user biz_user;
          public TClass_biz_users biz_users;
      }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebForm_change_email_address_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_email_address";
            string email_address;
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
                if (Request.ServerVariables["URL"] == Request.CurrentExecutionFilePath)
                {
                    Session.Clear();
                    Server.Transfer("~/login.aspx");
                }
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
            SessionSet(InstanceId() + ".p", p);
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

        protected void CustomValidator_email_address_novelty_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
          {
          args.IsValid = !p.biz_users.BeEmailAddressMappedToMember(k.Safe(args.Value, k.safe_hint_type.EMAIL_ADDRESS));
          }

    } // end TWebForm_change_email_address

}
