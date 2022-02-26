using Class_biz_user;
using Class_biz_users;
using kix;
using System;
using System.Configuration;
using System.Web.UI;

namespace change_password
{
    public partial class TWebForm_change_password: ki_web_ui.page_class
    {
    private struct p_type
    {
        public TClass_biz_users biz_users;
        public TClass_biz_user biz_user;
    }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebForm_change_password_PreRender;
        }

    private void InjectPersistentClientSideScript()
      {
      EstablishClientSideFunction(k.client_side_function_enumeral_type.EL);
      EstablishClientSideFunction
        (
        "SecurePassword()",
        k.EMPTY
        + " if (El('" + TextBox_nominal_password.ClientID + "').value != '') El('" + TextBox_nominal_password.ClientID + "').value = new jsSHA(El('" + TextBox_nominal_password.ClientID + "').value,'ASCII').getHash('HEX');"
        + " if (El('" + TextBox_confirmation_password.ClientID + "').value != '') El('" + TextBox_confirmation_password.ClientID + "').value = new jsSHA(El('" + TextBox_confirmation_password.ClientID + "').value,'ASCII').getHash('HEX');"
        );
      //
      Form_control.Attributes.Add("onsubmit","SecurePassword()");
      }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - change_password";
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
                p.biz_users = new TClass_biz_users();
                p.biz_user = new TClass_biz_user();
                Focus(TextBox_nominal_password, true);
            }
            InjectPersistentClientSideScript();
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void CustomValidator_confirmation_password_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = (TextBox_nominal_password.Text.Trim() == TextBox_confirmation_password.Text.Trim());
        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        private void TWebForm_change_password_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                p.biz_users.SetPassword(p.biz_user.IdNum(), k.Safe(TextBox_nominal_password.Text.Trim(), k.safe_hint_type.HEX));
                BackTrack();
            }
            else
            {
                ValidationAlert(true);
            }
        }

    } // end TWebForm_change_password

}
