// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_biz_notifications;
using Class_db_efficipay_dockets;
using Class_db_efficipay_tokens;
using Class_db_members;
using Ionic.Crc;
using kix;
using System;
using System.Collections;
using System.IO;
using System.Text;

namespace Class_biz_efficipay_dockets
  {
  public static class Class_biz_efficipay_dockets_Static
    {
    public const int NEEDS_CHECK_NUM = 0;
    public const int NEEDS_AN_ATTACHMENT = 1;
    public const int NEEDS_READY_FOR_REVIEW = 2;
    public const int NEEDS_SIGNATURE_1 = 3;
    public const int NEEDS_SIGNATURE_2 = 4;
    public const int NEEDS_FINAL_IMPRINT = 5;
    }

  public class TClass_biz_efficipay_dockets
    {
    private TClass_biz_notifications biz_notifications = null;
    private TClass_db_efficipay_dockets db_efficipay_dockets = null;
    private TClass_db_efficipay_tokens db_efficipay_tokens = null;
    private TClass_db_members db_members = null;

    public TClass_biz_efficipay_dockets() : base()
      {
      biz_notifications = new TClass_biz_notifications();
      db_efficipay_dockets = new TClass_db_efficipay_dockets();
      db_efficipay_tokens = new TClass_db_efficipay_tokens();
      db_members = new TClass_db_members();
      }

    internal void ApplySignature
      (
      string id,
      string agency_id,
      string check_num,
      string member_id
      )
      {
      if (db_efficipay_dockets.ApplySignature(id,member_id))
        {
        biz_notifications.IssueForEfficiPayDocketNeedsFinalImprint(agency_id,check_num);
        }      
      }

    internal bool BeOkToShowSigners
      (
      string id
      )
      {
      return (id.Length != 0);
      }

    internal bool BeOkToSign(string id)
      {
      return db_efficipay_dockets.BeOkToSign(id);
      }

    internal bool BeVeritable
      (
      string check_num,
      string signer_member_id,
      string signer_first_name,
      string signer_last_name,
      string hex_code
      )
      {
      var byte_buf = UTF8Encoding.Default.GetBytes(check_num + k.SPACE + signer_member_id + k.SPACE + signer_first_name + k.SPACE + signer_last_name + k.SPACE + db_efficipay_tokens.Current());
      var crc_calculator_stream = new CrcCalculatorStream(new MemoryStream(byte_buf),false);
      crc_calculator_stream.Read(byte_buf,0,byte_buf.Length);
      return (crc_calculator_stream.Crc.ToString("X8") == hex_code);
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_efficipay_dockets.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string agency_filter,
      string ready_for_review_filter
      )
      {
      db_efficipay_dockets.BindBaseDataList(sort_order,be_sort_order_ascending,target,agency_filter,ready_for_review_filter);
      }

    public void BindDirectToListControl(object target)
      {
      db_efficipay_dockets.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_efficipay_dockets.Delete(id);
      }

    internal DateTime ExpirationDate()
      {
      return DateTime.Today.AddMonths(6);
      }

    public bool Get
      (
      string id,
      out string agency_id,
      out string num,
      out string attachment_key,
      out bool be_ready_for_review,
      out string signer_1_member_id,
      out string signer_2_member_id,
      out DateTime expiration_date
      )
      {
      return db_efficipay_dockets.Get
        (
        id,
        out agency_id,
        out num,
        out attachment_key,
        out be_ready_for_review,
        out signer_1_member_id,
        out signer_2_member_id,
        out expiration_date
        );
      }

    internal void GetForFinalCheckImprint
      (
      string id,
      out string check_num,
      out string first_signer,
      out string second_signer,
      out string first_hash,
      out string second_hash
      )
      {
      var dummy_boolean = false;
      var dummy_datetime = DateTime.MinValue;
      var dummy_string = k.EMPTY;
      var signer_1_member_id = k.EMPTY;
      var signer_2_member_id = k.EMPTY;
      Get
        (
        id: id,
        agency_id: out dummy_string,
        num: out check_num,
        attachment_key: out dummy_string,
        be_ready_for_review: out dummy_boolean,
        signer_1_member_id: out signer_1_member_id,
        signer_2_member_id: out signer_2_member_id,
        expiration_date: out dummy_datetime
        );
      first_signer = db_members.EfficipaySignatureIdentifierOf(signer_1_member_id);
      second_signer = db_members.EfficipaySignatureIdentifierOf(signer_2_member_id);
      //
      var current_token = db_efficipay_tokens.Current();
      //
      var first_byte_buf = UTF8Encoding.Default.GetBytes(check_num + k.SPACE + first_signer + k.SPACE + current_token);
      var first_crc_calculator_stream = new CrcCalculatorStream(new MemoryStream(first_byte_buf),false);
      first_crc_calculator_stream.Read(first_byte_buf,0,first_byte_buf.Length);
      first_hash = first_crc_calculator_stream.Crc.ToString("X8");
      //
      var second_byte_buf = UTF8Encoding.Default.GetBytes(check_num + k.SPACE + second_signer + k.SPACE + current_token);
      var second_crc_calculator_stream = new CrcCalculatorStream(new MemoryStream(second_byte_buf),false);
      second_crc_calculator_stream.Read(second_byte_buf,0,second_byte_buf.Length);
      second_hash = second_crc_calculator_stream.Crc.ToString("X8");
      }

    internal string IdOf(object summary)
      {
      return db_efficipay_dockets.IdOf(summary);
      }

    internal void PromoteToReadyForReview
      (
      string id,
      string agency_id,
      string check_num,
      string attachment_key,
      bool be_ready_for_review,
      DateTime expiration_date
      )
      {
      Set(id,agency_id,check_num,attachment_key,be_ready_for_review,expiration_date);
      biz_notifications.IssueForEfficiPayDocketReadyForReview(agency_id,check_num);
      }

    public string Set
      (
      string id,
      string agency_id,
      string num,
      string attachment_key,
      bool be_ready_for_review,
      DateTime expiration_date
      )
      {
      return db_efficipay_dockets.Set
        (
        id,
        agency_id,
        num,
        attachment_key,
        be_ready_for_review,
        expiration_date
        );
      }

    internal int StatusOf
      (
      string id,
      string num,
      bool be_ready_for_review,
      string signer_1_member_id,
      string signer_2_member_id
      )
      {
      var status_of = Class_biz_efficipay_dockets_Static.NEEDS_CHECK_NUM;
      if (num.Length > 0)
        {
        status_of = Class_biz_efficipay_dockets_Static.NEEDS_AN_ATTACHMENT;
        if (id.Length > 0)
          {
          status_of = Class_biz_efficipay_dockets_Static.NEEDS_READY_FOR_REVIEW;
          if (be_ready_for_review)
            {
            status_of = Class_biz_efficipay_dockets_Static.NEEDS_SIGNATURE_1;
            if (signer_1_member_id.Length > 0)
              {
              status_of = Class_biz_efficipay_dockets_Static.NEEDS_SIGNATURE_2;
              if (signer_2_member_id.Length > 0)
                {
                status_of = Class_biz_efficipay_dockets_Static.NEEDS_FINAL_IMPRINT;
                }
              }
            }
          }
        }
      return status_of;
      }

    public object Summary(string id)
      {
      return db_efficipay_dockets.Summary(id);
      }

    } // end TClass_biz_efficipay_dockets

  }
