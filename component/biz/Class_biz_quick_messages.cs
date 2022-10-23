using kix;
using System.Configuration;
using System.Text.RegularExpressions;

namespace Class_biz_quick_messages
  {

  internal enum reply_mode_enum
    {
    EMAIL,
    PHONE,
    BOUNCER
    };

  public class TClass_biz_quick_messages
    {

    public TClass_biz_quick_messages() : base()
      {
      }

    internal void Send
      (
      bool be_email_mode,
      string author_title_clause,
      string author_first_name,
      string author_last_name,
      string author_target_email,
      string author_target_sms,
      string distribution_list,
      string subject,
      string body,
      reply_mode_enum reply_mode
      )
      {
      var attribution = k.EMPTY;
      if (be_email_mode)
        {
        attribution += "-- From "
        + author_title_clause + k.SPACE + author_first_name + k.SPACE + author_last_name
        + " (" + author_target_email + ")"
        + " [via " + ConfigurationManager.AppSettings["application_name"] + "]" + k.NEW_LINE
        + k.NEW_LINE;
        }
      else
        {
        attribution += "From " + author_last_name + " via " + ConfigurationManager.AppSettings["application_name"] + ": ";
        }
      k.SmtpMailSend
        (
        from: ConfigurationManager.AppSettings["sender_email_address"],
        to: Regex.Replace
          (
          input:distribution_list,
          pattern:ConfigurationManager.AppSettings["main_headquarters_phone_number"] + "@.+?(,|$)", // matches for example 7573851999@clicksend.com terminated by a comma or EOL
          replacement:k.EMPTY
          ),
        subject: subject,
        message_string: attribution
        + body
        + (be_email_mode ? k.EMPTY : (reply_mode == reply_mode_enum.BOUNCER ? " [Replies will bounce]" : " [Reply to " + (reply_mode == reply_mode_enum.PHONE ? (author_target_sms.Length > 0 ? k.FormatAsNanpPhoneNum(author_target_sms.Substring(0,10)) : "unavailable") : author_target_email ) + "]")),
        be_html: false,
        cc: k.EMPTY,
        bcc: author_target_email,
        reply_to: (reply_mode == reply_mode_enum.BOUNCER ? ConfigurationManager.AppSettings["bouncer_email_address"] : (reply_mode == reply_mode_enum.PHONE ? author_target_sms : author_target_email))
        );
      }

    } // end TClass_biz_quick_messages

  }