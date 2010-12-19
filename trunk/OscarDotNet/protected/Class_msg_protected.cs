using kix;
using System;

namespace Class_msg_protected
{
	public class TClass_msg_protected
	  {
    public class confirm_paypal_donation
      {
      internal process_paypal_donation from_process_paypal_donation;
      internal string resident_id = k.EMPTY;
      internal string resident_name = k.EMPTY;
      internal string resident_house_num_and_street = k.EMPTY;
      internal string resident_city = k.EMPTY;
      internal string resident_state = k.EMPTY;
      internal string num_priors = k.EMPTY;
      internal string avg_amount = k.EMPTY;
      }
    public class process_paypal_donation
      {
      internal string amount_donated = k.EMPTY;
      internal string donor_email_address = k.EMPTY;
      internal string donor_name = k.EMPTY;
      internal DateTime donation_date;
      internal string donor_house_num = k.EMPTY;
      internal string donor_street_id = k.EMPTY;
      internal string donor_street_name = k.EMPTY;
      }
	  }
}