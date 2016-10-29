using Class_biz_members;
using Class_biz_role_member_map;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;
using UserControl_fleet;

namespace report_shift_fleet_status
  {

  public partial class TWebForm_report_shift_fleet_status: System.Web.UI.Page
    {

    private struct p_type
      {
      public string agency_short_designator;
      public TClass_biz_members biz_members;
      public TClass_biz_role_member_map biz_role_member_map;
      public string target;
      }

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
      //
      // Set session objects referenced by UserControl_roster.
      //
      Session.Add("mode:report", k.EMPTY);
      Session.Add("mode:report/shift-fleet-status", k.EMPTY);
      p.agency_short_designator = Request["agency"];
      var role_name = k.EMPTY;
      if (p.agency_short_designator == "EMS")
        {
        role_name = "Department Fleet Coordinator";
        Session.Add("privilege_array", new string[1] {"see-all-squads"});
        p.target = p.biz_role_member_map.EmailTargetOf(role_name, p.agency_short_designator);
        }
      else
        {
        role_name = "Squad Fleet Coordinator";
        var proto_member_id = p.biz_members.IdOfAppropriateRoleHolder(role_name,p.agency_short_designator);
        if (proto_member_id.Length == 0)
          {
          role_name = "Squad Commander";
          proto_member_id = p.biz_members.IdOfAppropriateRoleHolder(role_name,p.agency_short_designator);
          }
        Session.Add("privilege_array", new string[0]);
        p.target = p.biz_role_member_map.EmailTargetOf(role_name,p.agency_short_designator) + k.COMMA + p.biz_role_member_map.EmailTargetOf("Squad Manager (possibly paid)",p.agency_short_designator);
        }
      var c = LoadControl("~/usercontrol/app/UserControl_fleet.ascx") as TWebUserControl_fleet;
      PlaceHolder_fleet_status.Controls.Add(c);
      c.SetP(agency_short_designator:p.agency_short_designator);
      }

    protected override void Render(HtmlTextWriter writer)
      {
      // Write the HTML stream into a StringBuilder.
      var sb = new StringBuilder();
      base.Render(new HtmlTextWriter(new StringWriter(sb)));
      //
      //writer.Write(sb.ToString());
      //
      var body = sb.ToString();
      k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], p.target, "Report: Shift Fleet Status (" + p.agency_short_designator + ")", body, true);
      Session.Abandon();
      }

    } // end TWebForm_report_shift_fleet_status

  }
