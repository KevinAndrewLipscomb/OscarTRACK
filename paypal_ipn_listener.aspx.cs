using kix;
using System;
using System.Collections;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Net;
using System.Text;
using System.Web;

namespace paypal_ipn_listener
  {

  public partial class TWebForm_paypal_ipn_listener: ki_web_ui.page_class
    {

    //--
    //
    // PRIVATE
    //
    //--

    // / <summary>
    // / Required method for Designer support -- do not modify
    // / the contents of this method with the code editor.
    // / </summary>
    private void InitializeComponent()
      {
      }

    //--
    //
    // PROTECTED
    //
    //--

    protected override void OnInit(EventArgs e)
      {
      // Required for Designer support
      InitializeComponent();
      base.OnInit(e);
      }

    protected void Page_Load(object sender, System.EventArgs e)
      {
      var message = Encoding.ASCII.GetString(Request.BinaryRead(Request.ContentLength));
      var payment_status = HttpUtility.UrlDecode(Request["payment_status"]);
      var receiver_email = HttpUtility.UrlDecode(Request["receiver_email"]);
      var amount_donated = HttpUtility.UrlDecode(Request["mc_gross"]);
      var donor_email_address = HttpUtility.UrlDecode(Request["payer_email"]);
      var donor_first_name = HttpUtility.UrlDecode(Request["first_name"]);
      var donor_last_name = HttpUtility.UrlDecode(Request["last_name"]);
      var date_of_donation = HttpUtility.UrlDecode(Request["payment_date"]);
      var memo = HttpUtility.UrlDecode(Request["memo"]);
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
        // paypal has verified the data, it is safe for us to perform processing now
        //
        if (payment_status.Equals("Completed"))
          {
          //
          // if the seller email is us (we don't want anyone else getting our payment!)
          //
          if (new ArrayList() {"infotech@kvrs.org"}.Contains(receiver_email.ToLower()))
            {
            var hash_table = new Hashtable();
            hash_table.Add("agency","KVRS");
            hash_table.Add("amount_donated",k.Safe(amount_donated,k.safe_hint_type.REAL_NUM_INCLUDING_NEGATIVE));
            hash_table.Add("donor_email_address",k.Safe(donor_email_address,k.safe_hint_type.EMAIL_ADDRESS));
            hash_table.Add("donor_name",k.Safe(donor_first_name,k.safe_hint_type.HUMAN_NAME) + k.SPACE + k.Safe(donor_last_name,k.safe_hint_type.HUMAN_NAME));
            hash_table.Add("donation_date",DateTime.ParseExact(s:date_of_donation.Remove(21),format:"HH:mm:ss MMM dd, yyyy",provider:CultureInfo.InvariantCulture));
            hash_table.Add("memo",k.Safe(memo,k.safe_hint_type.PUNCTUATED));
            //
            var presumed_street_address = memo.Split(new string[] {k.NEW_LINE,"\r\n"},StringSplitOptions.RemoveEmptyEntries)[0].Trim().ToUpper();
            var presumed_house_num = k.Safe(presumed_street_address.Split(new string[] {k.SPACE},StringSplitOptions.RemoveEmptyEntries)[0],k.safe_hint_type.NUM);
            //
            hash_table.Add("donor_house_num",presumed_house_num);
            //
            hash_table.Add("donor_street_name",k.Safe(presumed_street_address.Replace(presumed_house_num + k.SPACE,k.EMPTY).Trim(),k.safe_hint_type.POSTAL_STREET_ADDRESS));
            //
            k.SmtpMailSend
              (
              from:ConfigurationManager.AppSettings["sender_email_address"],
              to:ConfigurationManager.AppSettings["sender_email_address"],
              subject:"PayPal IPN",
              message_string:k.EMPTY
              + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "protected/paypal_assistant.aspx?" + ShieldedQueryStringOfHashtable(hash_table) + k.NEW_LINE
              + k.NEW_LINE
              + "memo" + k.NEW_LINE
              + "----" + k.NEW_LINE
              + memo + k.NEW_LINE
              + k.NEW_LINE
              + message.Replace("&",k.NEW_LINE) + k.NEW_LINE
              );
            }
          }
        } // VERIFIED
      }

    } // end TWebForm_paypal_ipn_listener

  }
