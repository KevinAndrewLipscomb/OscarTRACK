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

namespace report_monthly_trainee_roster
{
    public partial class TWebForm_report_monthly_trainee_roster: ki_web_ui.page_class
    {
    private struct p_type
    {
        public string agency_short_designator;
        public TClass_biz_agencies biz_agencies;
        public TClass_biz_members biz_members;
        public TClass_biz_role_member_map biz_role_member_map;
        public string role_name;
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
            Title = ConfigurationManager.AppSettings["application_name"] + " - report_monthly_trainee_roster";
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
            Session.Add("mode:report/monthly-trainee-roster", k.EMPTY);
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
                Session.Add("privilege_array", Array.Empty<string>());
            }
            Session.Add("member_id", p.biz_members.IdOfAppropriateRoleHolder(p.role_name, p.agency_short_designator));
            PlaceHolder_roster.Controls.Add(((TWebUserControl_roster)(LoadControl("~/usercontrol/app/UserControl_roster.ascx"))));

        }

        protected override void Render(HtmlTextWriter writer)
        {
            // Write the HTML stream into a StringBuilder.
            var sb = new StringBuilder();
            using var html_text_writer = new HtmlTextWriter(new StringWriter(sb));
            base.Render(html_text_writer);
            // //
            // writer.Write(sb.ToString());
            // //
            var body = sb.ToString();
            // Send output stream as an email message.
            // from
            // to
            // subject
            // body
            // be_html
            k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], p.biz_role_member_map.EmailTargetOf(p.role_name, p.agency_short_designator), "Report: Monthly BLS Intern Roster", body, true);
            Session.Abandon();

        }

    } // end TWebForm_report_monthly_trainee_roster

}
