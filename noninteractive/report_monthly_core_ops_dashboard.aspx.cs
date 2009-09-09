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
using Class_biz_members;
using UserControl_current_indicators;
namespace report_monthly_core_ops_dashboard
{
    public struct p_type
    {
        public TClass_biz_members biz_members;
        public string member_id;
    } // end p_type

    public partial class TWebForm_report_monthly_core_ops_dashboard: System.Web.UI.Page
    {
        private p_type p;
        protected System.Web.UI.WebControls.Label Label_application_name_2 = null;
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
            Title.InnerText = ConfigurationManager.AppSettings["application_name"] + " - report_monthly_core_ops_dashboard";
            Label_application_name_1.Text = ConfigurationManager.AppSettings["application_name"];
            url = "http://" + ConfigurationManager.AppSettings["host_domain_name"] + "/" + ConfigurationManager.AppSettings["application_name"];
            HyperLink_web_site.Text = url;
            HyperLink_web_site.NavigateUrl = url;

        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            p.biz_members = new TClass_biz_members();
            // Set session objects referenced by UserControl_roster.
            this.Session.Add("mode:report", k.EMPTY);
            this.Session.Add("mode:report/monthly-core-ops-dashboard", k.EMPTY);
            PlaceHolder_current.Controls.Add(((TWebUserControl_current_indicators)(this.LoadControl("~/usercontrol/app/UserControl_current_indicators.ascx"))));

        }

        protected override void Render(HtmlTextWriter writer)
        {
            string body;
            uint i;
            Queue recipient_q;
            StringBuilder sb;
            // Write the HTML stream into a StringBuilder.
            sb = new StringBuilder();
            base.Render(new HtmlTextWriter(new StringWriter(sb)));
            // //
            // writer.Write(sb.ToString());
            // //
            body = sb.ToString();
            // Send output stream as an email message.
            recipient_q = p.biz_members.CurrentMemberEmailAddressesQueue();
            for (i = 1; i <= recipient_q.Count; i ++ )
            {
                // from
                // to
                // subject
                // body
                // be_html
                k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], recipient_q.Dequeue().ToString(), "Report: Monthly Core Ops Dashboard", body, true);
            }
            this.Session.Abandon();

        }

    } // end TWebForm_report_monthly_core_ops_dashboard

}
