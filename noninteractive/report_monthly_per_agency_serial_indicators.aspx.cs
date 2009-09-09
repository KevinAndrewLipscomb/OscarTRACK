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
using Class_biz_agencies;
using Class_biz_notifications;
namespace report_monthly_per_agency_serial_indicators
{
    public struct p_type
    {
        public string agency_id;
        public TClass_biz_agencies biz_agencies;
        public TClass_biz_notifications biz_notifications;
    } // end p_type

    public partial class TWebForm_report_monthly_per_agency_serial_indicators: System.Web.UI.Page
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
            string passthrough_parms;
            string url;
            Title.InnerText = ConfigurationManager.AppSettings["application_name"] + " - report_monthly_per_agency_serial_indicators";
            Label_application_name.Text = ConfigurationManager.AppSettings["application_name"];
            url = "http://" + ConfigurationManager.AppSettings["host_domain_name"] + "/" + ConfigurationManager.AppSettings["application_name"];
            HyperLink_web_site.Text = url;
            HyperLink_web_site.NavigateUrl = url;
            Label_agency.Text = this.Request["agency"];
            p.agency_id = p.biz_agencies.IdOfShortDesignator(this.Request["agency"]);
            if (this.Request["agency"] == "EMS")
            {
                passthrough_parms = "&agency=" + p.agency_id + "&be_agency_applicable=0";
            }
            else
            {
                passthrough_parms = "&agency=" + p.agency_id + "&be_agency_applicable=1";
            }
            Img_core_ops_size.Attributes["src"] = k.ExpandAsperand(Img_core_ops_size.Attributes["src"]) + passthrough_parms;
            Img_num_members_in_pipeline.Attributes["src"] = k.ExpandAsperand(Img_num_members_in_pipeline.Attributes["src"]) + passthrough_parms;
            Img_crew_shifts_forecast.Attributes["src"] = k.ExpandAsperand(Img_crew_shifts_forecast.Attributes["src"]) + passthrough_parms;
            Img_utilization.Attributes["src"] = k.ExpandAsperand(Img_utilization.Attributes["src"]) + passthrough_parms;
            Img_standard_enrollment.Attributes["src"] = k.ExpandAsperand(Img_standard_enrollment.Attributes["src"]) + passthrough_parms;
            Img_median_length_of_service.Attributes["src"] = k.ExpandAsperand(Img_median_length_of_service.Attributes["src"]) + passthrough_parms;
            Img_commensuration.Attributes["src"] = k.ExpandAsperand(Img_commensuration.Attributes["src"]) + passthrough_parms;

        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            p.biz_agencies = new TClass_biz_agencies();
            p.biz_notifications = new TClass_biz_notifications();
            // Set session objects referenced by UserControl_roster.
            this.Session.Add("mode:report", k.EMPTY);
            this.Session.Add("mode:report/monthly-per-agency-serial-indicators", k.EMPTY);
            if (this.Request["agency"] == "EMS")
            {
                this.Session.Add("privilege_array", new string[1] {"see-all-squads"});
            }
            else
            {
                this.Session.Add("privilege_array", new string[0]);
            }

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
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], p.biz_notifications.TargetOfAboutAgency("report-monthly-per-agency-serial-indicators", p.agency_id), "Report: Monthly " + this.Request["agency"] + " Serial Indicators", body, true);
            this.Session.Abandon();

        }

    } // end TWebForm_report_monthly_per_agency_serial_indicators

}
