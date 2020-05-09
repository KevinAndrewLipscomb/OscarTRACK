using Class_biz_agencies;
using Class_biz_members;
using kix;
using System;
using System.Collections;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;
using UserControl_roster;

namespace report_monthly_current_phone_list
{
    public struct p_type
    {
        public TClass_biz_agencies biz_agencies;
        public TClass_biz_members biz_members;
        public string member_id;
    } // end p_type

    public partial class TWebForm_report_monthly_current_phone_list: System.Web.UI.Page
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
            Title = ConfigurationManager.AppSettings["application_name"] + " - report_monthly_current_phone_list";
            Label_application_name_1.Text = ConfigurationManager.AppSettings["application_name"];
            Label_application_name_2.Text = ConfigurationManager.AppSettings["application_name"];
            url = "http://" + ConfigurationManager.AppSettings["host_domain_name"] + "/" + ConfigurationManager.AppSettings["application_name"];
            HyperLink_web_site.Text = url;
            HyperLink_web_site.NavigateUrl = url;

        }

        protected override void OnInit(EventArgs e)
        {
            string role_name;
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            p.biz_agencies = new TClass_biz_agencies();
            p.biz_members = new TClass_biz_members();
            // Set session objects referenced by UserControl_roster.
            Session.Add("mode:report", k.EMPTY);
            Session.Add("mode:report/monthly-current-phone-list", k.EMPTY);
            Session.Add("noninteractive_effective_agency_id",p.biz_agencies.IdOfShortDesignator(Request["agency"]));
            if (Request["agency"] == "EMS")
            {
                role_name = "Department Authority";
                Session.Add("privilege_array", new string[1] {"see-all-squads"});
            }
            else
            {
                role_name = "Squad Commander";
                Session.Add("privilege_array", new string[0]);
            }
            p.member_id = p.biz_members.IdOfAppropriateRoleHolder(role_name, Request["agency"]);
            Session.Add("member_id", p.member_id);
            PlaceHolder_roster.Controls.Add(((TWebUserControl_roster)(LoadControl("~/usercontrol/app/UserControl_roster.ascx"))));

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
            recipient_q = p.biz_members.CurrentMemberEmailAddressesQueue(Request["agency"]);
            uint recipient_q_count = (uint)(recipient_q.Count);
            for (i = 1; i <= recipient_q_count; i ++ )
            {
                // from
                // to
                // subject
                // body
                // be_html
                k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], recipient_q.Dequeue().ToString(), "Report: Monthly Current Phone List", body, true);
            }
            Session.Abandon();

        }

    } // end TWebForm_report_monthly_current_phone_list

}
