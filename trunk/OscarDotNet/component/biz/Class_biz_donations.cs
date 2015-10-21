using Class_biz_agencies;
using Class_biz_members;
using Class_biz_notifications;
using Class_biz_user;
using Class_db_donations;
using Class_msg_protected;
using kix;

namespace Class_biz_donations
  {
  public class TClass_biz_donations
    {

    private TClass_biz_agencies biz_agencies = null;
    private TClass_biz_members biz_members = null;
    private TClass_biz_notifications biz_notifications = null;
    private TClass_biz_user biz_user = null;
    private TClass_db_donations db_donations = null;
      
    public TClass_biz_donations() : base()
      {
      biz_agencies = new TClass_biz_agencies();
      biz_members = new TClass_biz_members();
      biz_notifications = new TClass_biz_notifications();
      biz_user = new TClass_biz_user();
      db_donations = new TClass_db_donations();
      }

    internal void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string user_email_address,
      string range,
      string entered_by_filter
      )
      {
      db_donations.BindBaseDataList
        (
        sort_order:sort_order,
        be_sort_order_ascending:be_sort_order_ascending,
        target:target,
        user_email_address:user_email_address,
        agency_scope:biz_agencies.KeyclickEnumeratorOf(biz_members.AgencyIdOfId(biz_members.IdOfUserId(biz_user.IdNum()))),
        range:range,
        entered_by_filter:entered_by_filter
        );
      }

    internal void Process
      (
      TClass_msg_protected.confirm_paypal_donation incoming,
      string city
      )
      {
      if (incoming.resident_id.Length == 0) // unknown
        {
        db_donations.Log
          (
          id:"-1",
          amount:incoming.from_process_paypal_donation.amount_donated,
          date:incoming.from_process_paypal_donation.donation_date,
          in_mem_of:k.EMPTY,
          note:"From " + incoming.from_process_paypal_donation.donor_name,
          user_email_address:biz_user.EmailAddress(),
          donor_email_address:incoming.from_process_paypal_donation.donor_email_address
          );
        biz_notifications.IssuePayPalDonationAcknowledgmentToDonorUnrecognized
          (
          agency_keyclick_enumerator:incoming.from_process_paypal_donation.agency,
          amount_donated:incoming.from_process_paypal_donation.amount_donated,
          donor_name:incoming.from_process_paypal_donation.donor_name,
          donation_date:incoming.from_process_paypal_donation.donation_date,
          donor_email_address:incoming.from_process_paypal_donation.donor_email_address
          );
        }
      else if (incoming.resident_id == "0") // out of area
        {
        db_donations.Log
          (
          id:"0",
          amount:incoming.from_process_paypal_donation.amount_donated,
          date:incoming.from_process_paypal_donation.donation_date,
          in_mem_of:k.EMPTY,
          note:"From " + incoming.from_process_paypal_donation.donor_name,
          user_email_address:biz_user.EmailAddress(),
          donor_email_address:incoming.from_process_paypal_donation.donor_email_address
          );
        biz_notifications.IssuePayPalDonationAcknowledgmentToDonorOutOfArea
          (
          agency_keyclick_enumerator:incoming.from_process_paypal_donation.agency,
          amount_donated:incoming.from_process_paypal_donation.amount_donated,
          donor_name:incoming.from_process_paypal_donation.donor_name,
          donation_date:incoming.from_process_paypal_donation.donation_date,
          donor_email_address:incoming.from_process_paypal_donation.donor_email_address
          );
        }
      else
        {
        db_donations.Log
          (
          id:incoming.resident_id,
          amount:incoming.from_process_paypal_donation.amount_donated,
          date:incoming.from_process_paypal_donation.donation_date,
          in_mem_of:k.EMPTY,
          note:k.EMPTY,
          user_email_address:biz_user.EmailAddress(),
          donor_email_address:incoming.from_process_paypal_donation.donor_email_address
          );
        biz_notifications.IssuePayPalDonationAcknowledgmentToDonorRecognized
          (
          agency_keyclick_enumerator:incoming.from_process_paypal_donation.agency,
          amount_donated:incoming.from_process_paypal_donation.amount_donated,
          donor_name:incoming.from_process_paypal_donation.donor_name,
          donation_date:incoming.from_process_paypal_donation.donation_date,
          donor_email_address:incoming.from_process_paypal_donation.donor_email_address,
          resident_name:incoming.resident_name,
          resident_house_num_and_street:incoming.resident_house_num_and_street,
          resident_city:city,
          resident_state:incoming.resident_state
          );
        }
      }

    internal string RecentPerClerkAsCsv
      (
      string clerk_email_address,
      string entered_by_filter,
      string watermark
      )
      {
      return db_donations.RecentPerClerkAsCsv
        (
        clerk_email_address:clerk_email_address,
        agency_scope:biz_agencies.KeyclickEnumeratorOf(biz_members.AgencyIdOfId(biz_members.IdOfUserId(biz_user.IdNum()))),
        entered_by_filter:entered_by_filter,
        watermark:watermark
        );
      }

    }

  }
