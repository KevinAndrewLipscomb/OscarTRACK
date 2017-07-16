using Class_db_agencies;
using Class_db_notifications;
using kix;
using System;
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
      string x_from_header,
      string x_to_header,
      string subject,
      string plain
      )
      {
      var primary_target = k.EMPTY;
      var department_fleet_target = db_notifications.TargetOfAboutAgency("vehicle-needs-shuttled","0");
      var x_to_header_element_array = k.Safe(x_to_header,k.safe_hint_type.EMAIL_ADDRESS_CSV).Split(separator:new string[] {k.COMMA},options:StringSplitOptions.RemoveEmptyEntries);
      for (var i = new k.subtype<int>(0,x_to_header_element_array.Length); i.val < i.LAST; i.val++)
        {
        if
          (
            x_to_header_element_array[i.val].Contains("fleetman@frompaper2web.com")
          ||
            x_to_header_element_array[i.val].Contains("fleetman@vbrescuecouncil.")
          )
        //then
          {
          primary_target += db_notifications.TargetOfAboutAgency
            (
            name:"vehicle-needs-shuttled",
            agency_id:db_agencies.IdOfShortDesignator
              (
              short_designator:x_to_header_element_array[i.val]
                .Replace("fleetman@frompaper2web.com",k.EMPTY)
                .Replace("fleetman@vbrescuecouncil.org",k.EMPTY)
                .Replace("fleetman@vbrescuecouncil.com",k.EMPTY)
              )
            );
          }
        else
          {
          primary_target += x_to_header_element_array[i.val];
          }
        primary_target += k.COMMA;
        }
      k.SmtpMailSend
        (
        from:ConfigurationManager.AppSettings["sender_email_address"].Replace(ConfigurationManager.AppSettings["application_name"],"VbRescueCouncilFleetMan"),
        to:primary_target,
        subject:subject,
        message_string:k.EMPTY
        + "+---=::=---" + k.NEW_LINE
        + "|" + k.NEW_LINE
        + "| This message was delivered via the VbRescueCouncil FleetMan feature." + k.NEW_LINE
        + "| Direct all responses through the Department Fleet Coordinators indicated in the Cc/Reply-To fields." + k.NEW_LINE
        + "|" + k.NEW_LINE
        + "+---=::=---" + k.NEW_LINE
        + k.NEW_LINE
        + plain,
        be_html:false,
        cc:department_fleet_target,
        bcc:x_from_header,
        reply_to:department_fleet_target
        );
      }

    } // end TClass_biz_fleetman

  }
