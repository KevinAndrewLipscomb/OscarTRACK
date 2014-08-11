using Class_biz_notifications;
using Class_biz_user;
using Class_db_donations;
using Class_msg_protected;
using kix;
using System;

namespace Class_biz_donations
  {
  public class TClass_biz_donations
    {

    private TClass_biz_notifications biz_notifications = null;
    private TClass_biz_user biz_user = null;
    private TClass_db_donations db_donations = null;
      
    public TClass_biz_donations() : base()
      {
      biz_notifications = new TClass_biz_notifications();
      biz_user = new TClass_biz_user();
      db_donations = new TClass_db_donations();
      }

    internal void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string user_email_address
      )
      {
      db_donations.BindBaseDataList(sort_order,be_sort_order_ascending,target,user_email_address);
      }

    internal void Process
      (
      TClass_msg_protected.confirm_paypal_donation incoming,
      string city
      )
      {
      if (incoming.resident_id != k.EMPTY)
        {
        db_donations.Log
          (incoming.resident_id,incoming.from_process_paypal_donation.amount_donated,incoming.from_process_paypal_donation.donation_date,k.EMPTY,k.EMPTY,biz_user.EmailAddress(),incoming.from_process_paypal_donation.donor_email_address);
        biz_notifications.IssuePayPalDonationAcknowledgmentToDonorRecognized
          (
          incoming.from_process_paypal_donation.agency,
          incoming.from_process_paypal_donation.amount_donated,
          incoming.from_process_paypal_donation.donor_name,
          incoming.from_process_paypal_donation.donation_date,
          incoming.from_process_paypal_donation.donor_email_address,
          incoming.resident_name,
          incoming.resident_house_num_and_street,
          city,
          incoming.resident_state
          );
        }
      else
        {
        db_donations.Log
          ("-1",incoming.from_process_paypal_donation.amount_donated,incoming.from_process_paypal_donation.donation_date,k.EMPTY,k.EMPTY,biz_user.EmailAddress(),incoming.from_process_paypal_donation.donor_email_address);
        biz_notifications.IssuePayPalDonationAcknowledgmentToDonorUnrecognized
          (
          incoming.from_process_paypal_donation.agency,
          incoming.from_process_paypal_donation.amount_donated,
          incoming.from_process_paypal_donation.donor_name,
          incoming.from_process_paypal_donation.donation_date,
          incoming.from_process_paypal_donation.donor_email_address
          );
        }
      }

    internal string RecentPerClerkAsCsv
      (
      string clerk_email_address,
      string watermark
      )
      {
      return db_donations.RecentPerClerkAsCsv(clerk_email_address,watermark);
      }

    }

  }
