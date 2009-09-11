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


using Class_biz_notifications;
using Class_biz_user;
namespace establish_membership_trouble
{
    public partial class TWebForm_establish_membership_trouble: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            this.PreRender += this.TWebForm_establish_membership_trouble_PreRender;
            //this.Load += this.Page_Load;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                Title.Text = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - establish_membership_trouble";
                Label_sponsor_1.Text = ConfigurationManager.AppSettings["sponsor"];
                Label_sponsor_2.Text = ConfigurationManager.AppSettings["sponsor"];
                Label_application_name_1.Text = ConfigurationManager.AppSettings["application_name"];
                Label_application_name_2.Text = ConfigurationManager.AppSettings["application_name"];
                Label_application_name_3.Text = ConfigurationManager.AppSettings["application_name"];
                Focus(TextBox_full_name, true);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            if (IsPostBack)
            {
                if ((Session["establish_membership_trouble.p"] != null))
                {
                    p = (p_type)(Session["establish_membership_trouble.p"]);
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
                else
                {
                    p.biz_notifications = new TClass_biz_notifications();
                    p.biz_user = new TClass_biz_user();
                }
            }

        }

        protected void Button_cancel_Click(object sender, System.EventArgs e)
        {
            BackTrack();
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            p.biz_notifications.IssueForMembershipEstablishmentTrouble(k.Safe(TextBox_full_name.Text, k.safe_hint_type.HUMAN_NAME), k.Safe(TextBox_explanation.Text, k.safe_hint_type.PUNCTUATED));
            Session.Clear();
            Server.Transfer("~/login.aspx");
        }

        private void TWebForm_establish_membership_trouble_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("establish_membership_trouble.p", p);
        }

        private struct p_type
        {
            public TClass_biz_notifications biz_notifications;
            public TClass_biz_user biz_user;
        } // end p_type

    } // end TWebForm_establish_membership_trouble

}
