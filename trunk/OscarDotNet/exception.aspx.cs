using Class_biz_user;
using kix;
using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Web;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace exception
{
    public struct p_type
    {
        public string notification_message;
    } // end p_type

    public partial class TWebForm_exception: ki_web_ui.page_class
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
            //this.Load += this.Page_Load;
            this.PreRender += this.TWebForm_exception_PreRender;
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            switch(NatureOfVisit("exception.p"))
            {
                case nature_of_visit_type.VISIT_INITIAL:
                    Title.InnerText = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - exception";
                    var last_error = Server.GetLastError();
                    var base_exception = last_error.GetBaseException();
                    if (Regex.IsMatch(base_exception.Message, "Connection.*to MySQL server", RegexOptions.IgnoreCase) || (base_exception.Message == "Connection open failed. Too many connections"))
                    {
                        Table_oops.Visible = false;
                    }
                    else
                    {
                        Table_db_down.Visible = false;
                        Focus(TextArea_user_comment, true);
                        p.notification_message = k.EscalatedException(last_error, User.Identity.Name, Session);
                    }
                    break;
                case nature_of_visit_type.VISIT_POSTBACK_STANDARD:
                    p = (p_type)(Session["exception.p"]);
                    break;
            }
            Server.ClearError();

        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
        }

        protected void Button_submit_Click(object sender, System.EventArgs e)
        {
            string comment;
            comment = k.Safe(TextArea_user_comment.Value, k.safe_hint_type.PUNCTUATED);
            if (comment != k.EMPTY)
            {
               k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], ConfigurationManager.AppSettings["sender_email_address"], "EXCEPTION REPORT with user comment", "[USER COMMENT]" + k.NEW_LINE + comment + k.NEW_LINE + k.NEW_LINE + p.notification_message);
            }
            Server.Transfer("login.aspx");
        }

        private void TWebForm_exception_PreRender(object sender, System.EventArgs e)
        {
            SessionSet("exception.p", p);
        }

    } // end TWebForm_exception

}
