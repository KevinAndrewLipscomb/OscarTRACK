// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_efficipay_dockets;
using kix;
using System;
using System.Collections;

namespace Class_biz_efficipay_dockets
  {
  public class TClass_biz_efficipay_dockets
    {
    private TClass_db_efficipay_dockets db_efficipay_dockets = null;

    public TClass_biz_efficipay_dockets() : base()
      {
      db_efficipay_dockets = new TClass_db_efficipay_dockets();
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

    internal string IdOf(object summary)
      {
      return db_efficipay_dockets.IdOf(summary);
      }

    public void Set
      (
      string id,
      string agency_id,
      string num,
      string attachment_key,
      bool be_ready_for_review,
      DateTime expiration_date
      )
      {
      db_efficipay_dockets.Set
        (
        id,
        agency_id,
        num,
        attachment_key,
        be_ready_for_review,
        expiration_date
        );
      }

    public object Summary(string id)
      {
      return db_efficipay_dockets.Summary(id);
      }

    } // end TClass_biz_efficipay_dockets

  }
