using Class_biz_members;
using Class_biz_notifications;
using Class_biz_role_member_map;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;
using UserControl_roster;

namespace report_monthly_als_interns
  {

  public partial class TWebForm_report_monthly_als_interns: System.Web.UI.Page
    {

    private struct p_type
      {
      public string agency_short_designator;
      public TClass_biz_members biz_members;
      public TClass_biz_notifications biz_notifications;
      public TClass_biz_role_member_map biz_role_member_map;
      public string role_name;
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
      Title = ConfigurationManager.AppSettings["application_name"] + " - report_monthly_als_interns";
      Literal_application_name_1.Text = ConfigurationManager.AppSettings["application_name"];
      Literal_application_name_2.Text = ConfigurationManager.AppSettings["application_name"];
      var url = "http://" + ConfigurationManager.AppSettings["host_domain_name"] + "/" + ConfigurationManager.AppSettings["application_name"];
      HyperLink_web_site.Text = url;
      HyperLink_web_site.NavigateUrl = url;
      }

    protected override void OnInit(EventArgs e)
      {
      //
      // Required for Designer support
      //
      InitializeComponent();
      base.OnInit(e);
      p.biz_members = new TClass_biz_members();
      p.biz_notifications = new TClass_biz_notifications();
      p.biz_role_member_map = new TClass_biz_role_member_map();
      p.role_name = "Department ALS ID Coordinator";
      p.agency_short_designator = "EMS";
      //
      // Set session objects referenced by UserControl_roster.
      //
      Session.Add("mode:report", k.EMPTY);
      Session.Add("mode:report/monthly-als-interns", k.EMPTY);
      Session.Add("privilege_array", new string[1] {"see-all-squads"});
      Session.Add("member_id", p.biz_members.IdOfAppropriateRoleHolder(p.role_name,p.agency_short_designator));
      Session.Add("noninteractive_effective_agency_id",k.EMPTY);
      PlaceHolder_roster.Controls.Add(((TWebUserControl_roster)(LoadControl("~/usercontrol/app/UserControl_roster.ascx"))));
      }

    protected override void Render(HtmlTextWriter writer)
      {
      //
      // Write the HTML stream into a StringBuilder.
      //
      var sb = new StringBuilder();
      base.Render(new HtmlTextWriter(new StringWriter(sb)));
      // //
      // writer.Write(sb.ToString());
      // //
      var body = sb.ToString();
      //
      // Send output stream as an email message.
      //
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:p.biz_notifications.TargetOfAboutAgency("report-monthly-als-interns"),
        subject:"Report: Monthly ALS Interns",
        message_string:body,
        be_html:true
        );
      Session.Abandon();
      }

    } // end TWebForm_report_monthly_als_interns

  }
