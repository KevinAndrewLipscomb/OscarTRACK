using Class_biz_notifications;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;
using UserControl_member_schedule_detail_bls_interns;

namespace report_monthly_bls_intern_assignments
  {

  public partial class TWebForm_report_monthly_bls_intern_assignments: Page
    {

    private struct p_type
      {
      public TClass_biz_notifications biz_notifications;
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
      Title = ConfigurationManager.AppSettings["application_name"] + " - report_monthly_bls_intern_assignments";
      Literal_application_name.Text = ConfigurationManager.AppSettings["application_name"];
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
      p.biz_notifications = new TClass_biz_notifications();
      //
      // Set session objects referenced by UserControl_roster.
      //
      Session.Add("mode:report", k.EMPTY);
      PlaceHolder_roster.Controls.Add(((TWebUserControl_member_schedule_detail_bls_interns)(this.LoadControl("~/usercontrol/app/UserControl_member_schedule_detail_bls_interns.ascx"))));
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
        to:p.biz_notifications.TargetOfAboutAgency("report-monthly-bls-intern-schedule-assignments"),
        subject:"Report: Monthly BLS Intern Schedule Assignments",
        message_string:body,
        be_html:true
        );
      Session.Abandon();
      }

    } // end TWebForm_report_monthly_bls_intern_assignments

  }
