using Class_biz_evals;
using kix;
using System;

namespace Class_msg_protected
{
	public class TClass_msg_protected
	  {
    internal class confirm_paypal_donation
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
    internal class coverage_assistant
      {
      internal object summary = null;
      }
    internal class efficipay_docket_detail
      {
      internal string agency_id = k.EMPTY;
      internal object summary = null;
      }
    internal class eval_detail
      {
      internal string id = k.EMPTY;
      internal string user_member_id = k.EMPTY;
      internal bool be_user_evaluatee = true;
      }
    internal class individual_tapout_detail
      {
      internal string member_id = k.EMPTY;
      }
    internal class member_schedule_detail
      {
      internal string member_id = k.EMPTY;
      internal k.subtype<int> relative_month;
      internal string member_agency_id = k.EMPTY;
      }
    internal class patient_encounter_detail
      {
      internal presentation_mode_enum presentation_mode = presentation_mode_enum.NONE;
      internal string eval_id = k.EMPTY;
      internal string eval_spec = k.EMPTY;
      internal string id = k.EMPTY;
      }
    internal class overview
      {
      internal string target = k.EMPTY;
      }
    internal class process_paypal_donation
      {
      internal string agency = k.EMPTY;
      internal string amount_donated = k.EMPTY;
      internal string donor_email_address = k.EMPTY;
      internal string donor_name = k.EMPTY;
      internal DateTime donation_date;
      internal string donor_house_num = k.EMPTY;
      internal string donor_street_id = k.EMPTY;
      internal string donor_street_name = k.EMPTY;
      }
    internal class quickmessage_by_shift
      {
      internal string agency_filter = k.EMPTY;
      internal string release_filter = k.EMPTY;
      internal string depth_filter = k.EMPTY;
      internal k.subtype<int> relative_month;
      internal string nominal_day_filter = k.EMPTY;
      internal string shift_name = k.EMPTY;
      }
    internal class trespass_detail
      {
      internal string house_num = k.EMPTY;
      internal k.int_positive street_id;
      }
	  }
}