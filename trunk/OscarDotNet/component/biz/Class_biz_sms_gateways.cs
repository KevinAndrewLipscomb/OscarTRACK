// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_sms_gateways;
using kix;
using System;
using System.Collections;

namespace Class_biz_sms_gateways
  {
  public class TClass_biz_sms_gateways
    {
    private TClass_db_sms_gateways db_sms_gateways = null;

    public TClass_biz_sms_gateways() : base()
      {
      db_sms_gateways = new TClass_db_sms_gateways();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_sms_gateways.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_sms_gateways.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl
      (
      object target,
      string unselected_literal,
      string selected_value
      )
      {
      db_sms_gateways.BindDirectToListControl(target,unselected_literal,selected_value);
      }
    public void BindDirectToListControl(object target, string unselected_literal)
      {
      BindDirectToListControl(target,unselected_literal,selected_value:k.EMPTY);
      }
    public void BindDirectToListControl(object target)
      {
      BindDirectToListControl(target,unselected_literal:"-- sms_gateway --");
      }

    public bool Delete(string id)
      {
      return db_sms_gateways.Delete(id);
      }

    public bool Get
      (
      string id,
      out string carrier_name,
      out string hostname
      )
      {
      return db_sms_gateways.Get
        (
        id,
        out carrier_name,
        out hostname
        );
      }

    public void Set
      (
      string id,
      string carrier_name,
      string hostname
      )
      {
      db_sms_gateways.Set
        (
        id,
        carrier_name,
        hostname
        );
      }

    internal object Summary(string id)
      {
      return db_sms_gateways.Summary(id);
      }

    } // end TClass_biz_sms_gateways

  }
