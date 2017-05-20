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
      string x_to_header,
      string subject,
      string plain
      )
      {
      var department_fleet_target = db_notifications.TargetOfAboutAgency("vehicle-needs-shuttled","0");
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"],
        to:k.EMPTY, // db_notifications.TargetOfAboutAgency("vehicle-needs-shuttled",db_agencies.IdOfShortDesignator(short_designator:k.Safe(x_to_header,k.safe_hint_type.EMAIL_ADDRESS).Replace("fleetman@frompaper2web.com",k.EMPTY))),
        subject:subject,
        message_string:k.EMPTY
        + "-- x_to_header: " + x_to_header + k.NEW_LINE
        + k.NEW_LINE
        + plain + k.NEW_LINE
        + k.NEW_LINE
        + "+---=::=---" + k.NEW_LINE
        + "|" + k.NEW_LINE
        + "| Via OscarTRACK FleetMan" + k.NEW_LINE
        + "|" + k.NEW_LINE
        + "+---=::=---" + k.NEW_LINE,
        be_html:false,
        cc:department_fleet_target,
        reply_to:department_fleet_target
        );
      }

    } // end TClass_biz_fleetman

  }
