using kix;
using System.IO;
using System.Net;
using System.Text;
using System.Configuration;

namespace Class_biz_paypal_ipn_listener
  {

  public class TClass_biz_paypal_ipn_listener
    {

    internal TClass_biz_paypal_ipn_listener() : base()
      {
      }

    internal void ProcessNotification
      (
      string message,
      string payment_status,
      string receiver_email,
      string amount_donated,
      string donor_email_address,
      string donor_first_name,
      string donor_last_name,
      string date_of_donation,
      string memo
      )
      {
      //
      // Prepend PayPal validation argument.
      //
      var readback = "cmd=_notify-validate&" + message;
      //
      // create an HttpRequest channel to perform handshake with PayPal
      //
      var application_name = ConfigurationManager.AppSettings["application_name"];
      var http_web_request = (HttpWebRequest)WebRequest.Create("https://www" + (application_name.EndsWith("_d") || application_name.EndsWith("_x") ? ".sandbox" : k.EMPTY) + ".paypal.com/cgi-bin/webscr");
      http_web_request.Method = "POST";
      http_web_request.ContentType = "application/x-www-form-urlencoded";
      http_web_request.ContentLength = readback.Length;
      //
      // send data back to PayPal to request verification
      //
      var stream_writer = new StreamWriter(http_web_request.GetRequestStream(), Encoding.ASCII);
      stream_writer.Write(readback);
      stream_writer.Close();
      //
      // receive response from PayPal
      //
      var stream_reader = new StreamReader(http_web_request.GetResponse().GetResponseStream());
      var response = stream_reader.ReadToEnd();
      stream_reader.Close();
      //
      if (response.Equals("VERIFIED"))
        {
//
k.SmtpMailSend
  (
  from:ConfigurationManager.AppSettings["sender_email_address"],
  to:ConfigurationManager.AppSettings["sender_email_address"],
  subject:"PayPal IPN",
  message_string:message.Replace("&",k.NEW_LINE) + k.NEW_LINE
  + "Parsed payment_status = " + payment_status + k.NEW_LINE
  + "Parsed receiver_email = " + receiver_email + k.NEW_LINE
  + "Parsed amount_donated = " + amount_donated + k.NEW_LINE
  + "Parsed donor_email_address = " + donor_email_address + k.NEW_LINE
  + "Parsed donor_first_name = " + donor_first_name + k.NEW_LINE
  + "Parsed donor_last_name = " + donor_last_name + k.NEW_LINE
  + "Parsed date_of_donation = " + date_of_donation + k.NEW_LINE
  + "Parsed memo = " + memo + k.NEW_LINE
  );
//
        //
        // paypal has verified the data, it is safe for us to perform processing now
        //
        if (payment_status.Equals("Completed"))
          {
          //
          // if the seller email is us (we don't want anyone else getting our payment!)
          //
          if (receiver_email.ToLower().Equals("my.paypal.seller.account@mycompany.com"))
            {
            //
            // complete order processing
            // E.g. arrange for despatch of products, mark order as complete, send emails out,
            //
            }
          }
        }       
      }

    } // end TClass_biz_paypal_ipn_listener

  }
