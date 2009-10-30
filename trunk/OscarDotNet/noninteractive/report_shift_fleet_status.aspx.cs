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
using Class_biz_role_member_map;
using UserControl_fleet;
namespace report_shift_fleet_status
{
    public struct p_type
    {
        public string agency_short_designator;
        public TClass_biz_members biz_members;
        public TClass_biz_role_member_map biz_role_member_map;
        public string role_name;
    } // end p_type

    public partial class TWebForm_report_shift_fleet_status: System.Web.UI.Page
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
            Title = ConfigurationManager.AppSettings["application_name"] + " - report_shift_fleet_status";
            Label_application_name_1.Text = ConfigurationManager.AppSettings["application_name"];
            Label_application_name_2.Text = ConfigurationManager.AppSettings["application_name"];
            var url = "http://" + ConfigurationManager.AppSettings["host_domain_name"] + "/" + ConfigurationManager.AppSettings["application_name"];
            HyperLink_web_site.Text = url;
            HyperLink_web_site.NavigateUrl = url;

        }

        protected override void OnInit(EventArgs e)
        {
            // Required for Designer support
            InitializeComponent();
            base.OnInit(e);
            p.biz_members = new TClass_biz_members();
            p.biz_role_member_map = new TClass_biz_role_member_map();
            // Set session objects referenced by UserControl_roster.
            Session.Add("mode:report", k.EMPTY);
            Session.Add("mode:report/shift-fleet-status", k.EMPTY);
            p.agency_short_designator = Request["agency"];
            if (p.agency_short_designator == "EMS")
            {
                p.role_name = "Department Fleet Coordinator";
                Session.Add("privilege_array", new string[1] {"see-all-squads"});
            }
            else
            {
                p.role_name = "Squad Fleet Coordinator";
                Session.Add("privilege_array", new string[0]);
            }
            Session.Add("member_id", p.biz_members.IdOfAppropriateRoleHolder(p.role_name, p.agency_short_designator));
            PlaceHolder_fleet_status.Controls.Add(((TWebUserControl_fleet)(LoadControl("~/usercontrol/app/UserControl_fleet.ascx"))));

        }

        protected override void Render(HtmlTextWriter writer)
        {
            // Write the HTML stream into a StringBuilder.
            var sb = new StringBuilder();
            base.Render(new HtmlTextWriter(new StringWriter(sb)));
            // //
            writer.Write(sb.ToString());
            // //
            //var body = sb.ToString();
            //k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], p.biz_role_member_map.EmailTargetOf(p.role_name, p.agency_short_designator), "Report: Shiftwise Fleet Status", body, true);
            //Session.Abandon();

        }

    } // end TWebForm_report_shift_fleet_status

}
