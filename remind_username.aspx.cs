using Class_biz_users;
using kix;
using System;
using System.Configuration;

namespace remind_username
  {
  public partial class TWebForm_remind_username: ki_web_ui.page_class
    {
    private struct p_type
    {
        public TClass_biz_users biz_users;
    }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            PreRender += TWebForm_remind_username_PreRender;
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
                if (Request.ServerVariables["URL"] == Request.CurrentExecutionFilePath)
                {
                    // The request for this page could not have been the result of a Server.Transfer call, and the session state is therefore unknown.  This is rarely allowed.
                    Session.Clear();
                    Server.Transfer("~/login.aspx");
                }
                else
                {
                    Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - remind_username";
                    p.biz_users = new TClass_biz_users();
                    Label_application_name_1.Text = ConfigurationManager.AppSettings["application_name"];
                    Label_application_name_2.Text = ConfigurationManager.AppSettings["application_name"];
                    Label_application_name_3.Text = ConfigurationManager.AppSettings["application_name"];
                    Focus(TextBox_email_address, true);
                }
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

        protected void LinkButton_return_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("login.aspx");
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            string email_address;
            email_address = k.Safe(TextBox_email_address.Text.Trim(), k.safe_hint_type.EMAIL_ADDRESS);
            if (p.biz_users.BeRegisteredEmailAddress(email_address))
            {
                p.biz_users.IssueUsernameReminder(email_address, k.Safe(Request.UserHostName, k.safe_hint_type.HOSTNAME));
                Alert(k.alert_cause_type.LOGIC, k.alert_state_type.NORMAL, "usrnamsnt", "The associated " + ConfigurationManager.AppSettings["application_name"] + " username has been sent to " + email_address + k.PERIOD, true);
                Table_return.Visible = true;
            }
            else
            {
                Alert(k.alert_cause_type.USER, k.alert_state_type.FAILURE, "nosucheml", "No such email address registered", true);
            }
        }

        protected void LinkButton_register_new_user_Click(object sender, System.EventArgs e)
        {
            Server.Transfer("new_user_registration.aspx");
        }

        private void TWebForm_remind_username_PreRender(object sender, System.EventArgs e)
        {
            SessionSet(InstanceId() + ".p", p);
        }

    } // end TWebForm_remind_username

}
