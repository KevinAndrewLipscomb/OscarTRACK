using Class_biz_agencies;
using Class_biz_notifications;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;

namespace report_monthly_per_agency_serial_indicators
  {
  public partial class TWebForm_report_monthly_per_agency_serial_indicators: ki_web_ui.page_class
    {
    private struct p_type
      {
      public string agency_id;
      public TClass_biz_agencies biz_agencies;
      public TClass_biz_notifications biz_notifications;
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
      Title = ConfigurationManager.AppSettings["application_name"] + " - report_monthly_per_agency_serial_indicators";
      Label_application_name.Text = ConfigurationManager.AppSettings["application_name"];
      url = "http://" + ConfigurationManager.AppSettings["host_domain_name"] + "/" + ConfigurationManager.AppSettings["application_name"];
      HyperLink_web_site.Text = url;
      HyperLink_web_site.NavigateUrl = url;
      p.agency_id = p.biz_agencies.IdOfShortDesignator(Request["agency"]);
      UserControl_serial_indicators_per_agency_control.agency_id = p.agency_id;
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      p.biz_agencies = new TClass_biz_agencies();
      p.biz_notifications = new TClass_biz_notifications();
      // Set session objects referenced by UserControl_roster.
      Session.Add("mode:report", k.EMPTY);
      Session.Add("mode:report/monthly-per-agency-serial-indicators", k.EMPTY);
      if (Request["agency"] == "EMS")
        {
        Session.Add("privilege_array", new string[1] {"see-all-squads"});
        }
      else
        {
        Session.Add("privilege_array", Array.Empty<string>());
        }
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
      k.SmtpMailSend(ConfigurationManager.AppSettings["sender_email_address"], p.biz_notifications.TargetOfAboutAgency("report-monthly-per-agency-serial-indicators", p.agency_id), "Report: Monthly " + Request["agency"] + " Serial Indicators", body, true);
      Session.Abandon();
      }

    } // end TWebForm_report_monthly_per_agency_serial_indicators

  }
