// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_oscalert_logs;
using kix;
using System;
using System.Collections;

namespace Class_biz_oscalert_logs
  {
  public class TClass_biz_oscalert_logs
    {
    private TClass_db_oscalert_logs db_oscalert_logs = null;

    public TClass_biz_oscalert_logs() : base()
      {
      db_oscalert_logs = new TClass_db_oscalert_logs();
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target,
      string impression_filter,
      string recency_filter
      )
      {
      db_oscalert_logs.BindBaseDataList(sort_order,be_sort_order_ascending,target,impression_filter,recency_filter);
      }

    } // end TClass_biz_oscalert_logs

  }
