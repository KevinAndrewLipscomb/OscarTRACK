using Class_biz_agencies;
using Class_biz_members;
using Class_biz_role_member_map;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;
using UserControl_roster;

namespace report_monthly_test_candidate_roster
{
    public struct p_type
    {
        public string agency_short_designator;
        public TClass_biz_agencies biz_agencies;
        public TClass_biz_members biz_members;
        public TClass_biz_role_member_map biz_role_member_map;
        public string role_name;
    } // end p_type

    public partial class TWebForm_report_monthly_test_candidate_roster: System.Web.UI.Page
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
            Title = ConfigurationManager.AppSettings["application_name"] + " - report_monthly_test_candidate_roster";
            Label_application_name_1.Text = ConfigurationManager.AppSettings["application_name"];
            Label_application_name_2.Text = ConfigurationManager.AppSettings["application_name"];
            url = "http://" + ConfigurationManager.AppSettings["host_domain_name"] + "/" + ConfigurationManager.AppSettings["application_name"];
            HyperLink_web_site.Text = url;
            HyperLink_web_site.NavigateUrl = url;

        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            p.biz_agencies = new TClass_biz_agencies();
            p.biz_members = new TClass_biz_members();
            p.biz_role_member_map = new TClass_biz_role_member_map();
            // Set session objects referenced by UserControl_roster.
            Session.Add("mode:report", k.EMPTY);
            Session.Add("mode:report/monthly-test-candidate-roster", k.EMPTY);
            p.agency_short_designator = Request["agency"];
            Session.Add("noninteractive_effective_agency_id",p.biz_agencies.IdOfShortDesignator(p.agency_short_designator));
            if (p.agency_short_designator == "EMS")
            {
                p.role_name = "Department BLS ID Coordinator";
                Session.Add("privilege_array", new string[1] {"see-all-squads"});
            }
            else
            {
                p.role_name = "Squad Training Officer";
                Session.Add("privilege_array", new string[0]);
            }
            Session.Add("member_id", p.biz_members.IdOfAppropriateRoleHolder(p.role_name, p.agency_short_designator));
            PlaceHolder_roster.Controls.Add(((TWebUserControl_roster)(LoadControl("~/usercontrol/app/UserControl_roster.ascx"))));

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
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], p.biz_role_member_map.EmailTargetOf(p.role_name, p.agency_short_designator), "Report: Monthly Test Candidate Roster", body, true);
            Session.Abandon();

        }

    } // end TWebForm_report_monthly_test_candidate_roster

}
