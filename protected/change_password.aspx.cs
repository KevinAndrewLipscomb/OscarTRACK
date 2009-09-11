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
using Class_biz_users;
using Class_biz_user;
namespace change_password
{
    public struct p_type
    {
        public TClass_biz_users biz_users;
        public TClass_biz_user biz_user;
    } // end p_type

    public partial class TWebForm_change_password: ki_web_ui.page_class
    {
        private p_type p;
        protected new System.Web.UI.HtmlControls.HtmlTitle Title = null;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.PreRender += this.TWebForm_change_password_PreRender;
            //this.Load += this.Page_Load;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (IsPostBack)
            {
                if ((Session["change_password.p"] != null))
                {
                    p = (p_type)(Session["change_password.p"]);
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
                Title.Text = ConfigurationManager.AppSettings["application_name"] + " - change_password";
                p.biz_users = new TClass_biz_users();
                p.biz_user = new TClass_biz_user();
                Focus(TextBox_nominal_password, true);
            }
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
            SessionSet("change_password.p", p);
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            if (Page.IsValid)
            {
                p.biz_users.SetPassword(p.biz_user.IdNum(), k.Digest(k.Safe(TextBox_nominal_password.Text.Trim(), k.safe_hint_type.ALPHANUM)));
                BackTrack();
            }
            else
            {
                ValidationAlert(true);
            }
        }

    } // end TWebForm_change_password

}
