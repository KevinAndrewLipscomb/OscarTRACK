using Class_biz_role_member_map;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;
using UserControl_role_holders_per_agency;

namespace report_monthly_role_holders
{
    public partial class TWebForm_report_monthly_role_holders: ki_web_ui.page_class
    {
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
            Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - report_monthly_role_holders";
            Label_agency.Text = Request["agency"];
            Label_application_name_1.Text = ConfigurationManager.AppSettings["application_name"];
            Label_application_name_2.Text = ConfigurationManager.AppSettings["application_name"];
            url = ConfigurationManager.AppSettings["runtime_root_fullspec"];
            HyperLink_web_site.Text = url;
            HyperLink_web_site.NavigateUrl = url;
            HyperLink_roles_help.NavigateUrl = url + "doc/roles.aspx";

        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            // Set session objects referenced by UserControl_roster.
            Session.Add("mode:report", k.EMPTY);
            Session.Add("mode:report/monthly-role-holders-per-agency", k.EMPTY);
            p.biz_role_member_map = new TClass_biz_role_member_map();
            if (Request["agency"] == "EMS")
            {
                p.role_name = "Department Authority";
            }
            else
            {
                p.role_name = "Squad Commander";
            }
            Session.Add("agency_short_designator", Request["agency"]);
            PlaceHolder_control.Controls.Add(((TWebUserControl_role_holders_per_agency)(LoadControl("~/usercontrol/app/UserControl_role_holders_per_agency.ascx"))));

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
            // cc
           k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], p.biz_role_member_map.EmailTargetOf(p.role_name, Request["agency"]), "Report: Monthly " + Request["agency"] + " Role Holders", body, true, ConfigurationManager.AppSettings["sender_email_address"]);
            Session.Abandon();

        }

        private struct p_type
        {
            public TClass_biz_role_member_map biz_role_member_map;
            public string role_name;
        }

    } // end TWebForm_report_monthly_role_holders

}
