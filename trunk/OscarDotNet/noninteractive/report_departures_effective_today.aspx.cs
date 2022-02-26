using Class_biz_notifications;
using kix;
using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.UI;

namespace report_departures_effective_today
  {
  public partial class TWebForm_report_departures_effective_today: ki_web_ui.page_class
    {

    private struct p_type
      {
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

    protected void Page_Load(object sender, EventArgs e)
      {
      Title = Server.HtmlEncode(ConfigurationManager.AppSettings["application_name"]) + " - report_departures_effective_today";
      }

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      //
      // Set session objects referenced by UserControl_roster.
      //
      Session.Add("mode:report", k.EMPTY);
      Session.Add("mode:report/departures-effective-today", k.EMPTY);
      p.biz_notifications = new TClass_biz_notifications();
      }

    protected override void Render(HtmlTextWriter writer)
      {
      if (UserControl_departures_effective_today_control.BeAny())
        {
        //
        // Write the HTML stream into a StringBuilder.
        //
        var sb = new StringBuilder();
        using var html_text_writer = new HtmlTextWriter(new StringWriter(sb));
        base.Render(html_text_writer);
        // //
        // writer.Write(sb.ToString());
        // //
        var body = sb.ToString();
        k.SmtpMailSend
          (
          from:ConfigurationManager.AppSettings["sender_email_address"],
          to:p.biz_notifications.TargetOfAboutAgency(name:"general-departure",agency_id:k.EMPTY) + k.COMMA + ConfigurationManager.AppSettings["external-general-departure-notification-target"],
          subject:"Report: Departures Effective Today",
          message_string:body,
          be_html:true
          );
        }
      Session.Abandon();
      }

    } // end TWebForm_report_departures_effective_today

  }
