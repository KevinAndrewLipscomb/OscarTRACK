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
      string payer_email,
      string payment_status,
      string receiver_email,
      string mc_gross
      )
      {
      //
      // Prepend PayPal validation argument.
      //
      var readback = "cmd=_notify-validate&" + message;
      //
      // create an HttpRequest channel to perform handshake with PayPal
      //
      var http_web_request = (HttpWebRequest)WebRequest.Create("https://www.paypal.com/cgi-bin/webscr");
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
//
k.SmtpMailSend
  (
  from:ConfigurationManager.AppSettings["sender_email_address"],
  to:ConfigurationManager.AppSettings["sender_email_address"],
  subject:"PayPal IPN",
  message_string:readback
  );
//
      if (response.Equals("VERIFIED"))
        {
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
