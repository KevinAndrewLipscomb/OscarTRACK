using Class_db_agencies;
using Class_db_notifications;
using kix;
using System.Configuration;
using System.Text.RegularExpressions;

namespace Class_biz_fleetman
  {

  public class TClass_biz_fleetman
    {

    private TClass_db_agencies db_agencies = null;
    private TClass_db_notifications db_notifications = null;

    internal TClass_biz_fleetman() : base()
      {
      db_agencies = new TClass_db_agencies();
      db_notifications = new TClass_db_notifications();
      }

    internal void ProcessCloudmailinRequest
      (
      string from,
      string x_from_header,
      string x_to_header,
      string subject,
      string plain
      )
      {
      var department_fleet_target = db_notifications.TargetOfAboutAgency("vehicle-needs-shuttled","0");
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:db_notifications.TargetOfAboutAgency("vehicle-needs-shuttled",db_agencies.IdOfShortDesignator(Regex.Replace(input:x_to_header,pattern:"fleetman@vbrescuecouncil\\.(com|org)",replacement:k.EMPTY))),
        subject:subject,
        message_string:k.EMPTY
        + "-- from: " + from + k.NEW_LINE
        + "-- x_from_header: " + from + k.NEW_LINE
        + "-- x_to_header: " + from + k.NEW_LINE
        + "-- subject: " + from + k.NEW_LINE
        + k.NEW_LINE
        + plain,
        be_html:false,
        cc:department_fleet_target,
        reply_to:department_fleet_target
        );
      }

    } // end TClass_biz_fleetman

  }
