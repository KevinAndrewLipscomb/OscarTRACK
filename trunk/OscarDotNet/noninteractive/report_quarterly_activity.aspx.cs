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



using System.Text;
using System.IO;
using Class_biz_role_member_map;
namespace report_quarterly_activity
{
    public partial class TWebForm_report_quarterly_activity: System.Web.UI.Page
    {
        private p_type p;
        // / <summary>
        // / Required method for Designer support -- do not modify
        // / the contents of this method with the code editor.
        // / </summary>
        private void InitializeComponent()
        {
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            string url;
            Title.InnerText = ConfigurationManager.AppSettings["application_name"] + " - report_quarterly_activity";
            Label_application_name.Text = ConfigurationManager.AppSettings["application_name"];
            Label_application_name_2.Text = Label_application_name.Text;
            Label_application_name_3.Text = Label_application_name.Text;
            url = ConfigurationManager.AppSettings["runtime_root_fullspec"];
            HyperLink_web_site.Text = url;
            HyperLink_web_site.NavigateUrl = url;

        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            // Set session objects referenced by UserControl_roster.
            this.Session.Add("mode:report", k.EMPTY);
            this.Session.Add("mode:report/quarterly-behind-the-scenes-activity", k.EMPTY);
            p.biz_role_member_map = new TClass_biz_role_member_map();

        }

        protected override void Render(HtmlTextWriter writer)
        {
            string body;
            StringBuilder sb;
            // Write the HTML stream into a StringBuilder.
            sb = new StringBuilder();
            base.Render(new HtmlTextWriter(new StringWriter(sb)));
            // //
            // writer.Write(sb.ToString());
            // //
            body = sb.ToString();
            // Send output stream as an email message.
            // from
            // to
            // subject
            // body
            // be_html
            // cc
           k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], p.biz_role_member_map.EmailTargetOf("Department Authority", "EMS"), "Report: Quarterly Behind-The-Scenes Activity", body, true, ConfigurationManager.AppSettings["sender_email_address"]);
            this.Session.Abandon();

        }

        private struct p_type
        {
            public TClass_biz_role_member_map biz_role_member_map;
        } // end p_type

    } // end TWebForm_report_quarterly_activity

}
