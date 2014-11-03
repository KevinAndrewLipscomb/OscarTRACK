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
      var address_name = HttpUtility.UrlDecode(Request["address_name"]);
      var address_street = HttpUtility.UrlDecode(Request["address_street"]);
      var address_city = HttpUtility.UrlDecode(Request["address_city"]);
      var address_state = HttpUtility.UrlDecode(Request["address_state"]);
      var address_zip = HttpUtility.UrlDecode(Request["address_zip"]);
      var address_country = HttpUtility.UrlDecode(Request["address_country"]);
      var address_country_code = HttpUtility.UrlDecode(Request["address_country_code"]);
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
            //
            var street_address_candidate = k.EMPTY;
            if (memo != null)
              {
              street_address_candidate = memo.Split(new string[] {k.NEW_LINE,"\r\n"},StringSplitOptions.RemoveEmptyEntries)[0].Trim().ToUpper();
              hash_table.Add("memo",k.Safe(memo,k.safe_hint_type.PUNCTUATED));
              }
            if (address_street != null)
              {
              street_address_candidate = address_street;
              hash_table.Add("address_name",k.Safe(address_name,k.safe_hint_type.ORG_NAME));
              hash_table.Add("address_street",k.Safe(address_street,k.safe_hint_type.POSTAL_STREET_ADDRESS));
              hash_table.Add("address_city",k.Safe(address_city,k.safe_hint_type.POSTAL_CITY));
              hash_table.Add("address_state",k.Safe(address_state,k.safe_hint_type.ALPHA));
              hash_table.Add("address_zip",k.Safe(address_zip,k.safe_hint_type.HYPHENATED_NUM));
              hash_table.Add("address_country",k.Safe(address_country,k.safe_hint_type.ALPHA_WORDS));
              hash_table.Add("address_country_code",k.Safe(address_country_code,k.safe_hint_type.ALPHA));
              }
            if (street_address_candidate.Length > 0)
              {
              var presumed_house_num = k.Safe(street_address_candidate.Split(new string[] {k.SPACE},StringSplitOptions.RemoveEmptyEntries)[0],k.safe_hint_type.NUM);
              hash_table.Add("donor_house_num",presumed_house_num);
              hash_table.Add("donor_street_name",k.Safe(street_address_candidate.Replace(presumed_house_num + k.SPACE,k.EMPTY).Trim(),k.safe_hint_type.POSTAL_STREET_ADDRESS));
              }
            //
            k.SmtpMailSend
              (
              from:ConfigurationManager.AppSettings["sender_email_address"],
              to:ConfigurationManager.AppSettings["sender_email_address"],
              subject:"PayPal IPN",
              message_string:k.EMPTY
              + "---begin-memo---" + k.NEW_LINE
              + (memo == null ? k.EMPTY : memo + k.NEW_LINE)
              + "---end-memo-----" + k.NEW_LINE
              + k.NEW_LINE
              + "---begin-paypal-assistant-link---" + k.NEW_LINE
              + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "protected/paypal_assistant.aspx?" + ShieldedQueryStringOfHashtable(hash_table) + k.NEW_LINE
              + "---end-paypal-assistant-link-----" + k.NEW_LINE
              + k.NEW_LINE
              + "---begin-ipn---" + k.NEW_LINE
              + message.Replace("&",k.NEW_LINE) + k.NEW_LINE
              + "---end-ipn-----" + k.NEW_LINE
              );
            }
          }
        } // VERIFIED
      }

    } // end TWebForm_paypal_ipn_listener

  }
