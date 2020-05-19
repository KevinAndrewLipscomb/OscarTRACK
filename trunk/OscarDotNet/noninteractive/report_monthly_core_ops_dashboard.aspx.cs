using Class_biz_members;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;
using UserControl_current_indicators;

namespace report_monthly_core_ops_dashboard
  {
  public partial class TWebForm_report_monthly_core_ops_dashboard: ki_web_ui.page_class
    {

    private struct p_type
    {
        public TClass_biz_members biz_members;
    }

        private p_type p; // Private Parcel of Page-Pertinent Process-Persistent Parameters

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
            Title = ConfigurationManager.AppSettings["application_name"] + " - report_monthly_core_ops_dashboard";
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
            Session.Add("mode:report", k.EMPTY);
            Session.Add("mode:report/monthly-core-ops-dashboard", k.EMPTY);
            PlaceHolder_current.Controls.Add(((TWebUserControl_current_indicators)(LoadControl("~/usercontrol/app/UserControl_current_indicators.ascx"))));

        }

        protected override void Render(HtmlTextWriter writer)
        {
            uint i;
            // Write the HTML stream into a StringBuilder.
            var sb = new StringBuilder();
            using var html_text_writer = new HtmlTextWriter(new StringWriter(sb));
            base.Render(html_text_writer);
            // //
            // writer.Write(sb.ToString());
            // //
            var body = sb.ToString();
            // Send output stream as an email message.
            var recipient_q = p.biz_members.CurrentMemberEmailAddressesQueue();
            uint recipient_q_count = (uint)(recipient_q.Count);
            for (i = 1; i <= recipient_q_count; i ++ )
            {
                // from
                // to
                // subject
                // body
                // be_html
                k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], recipient_q.Dequeue().ToString(), "Report: Monthly Core Ops Dashboard", body, true);
            }
            Session.Abandon();

        }

    } // end TWebForm_report_monthly_core_ops_dashboard

}
