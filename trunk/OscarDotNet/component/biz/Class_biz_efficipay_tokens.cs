// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_efficipay_tokens;
using kix;
using System;
using System.Collections;

namespace Class_biz_efficipay_tokens
  {
  public class TClass_biz_efficipay_tokens
    {
    private TClass_db_efficipay_tokens db_efficipay_tokens = null;

    public TClass_biz_efficipay_tokens() : base()
      {
      db_efficipay_tokens = new TClass_db_efficipay_tokens();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_efficipay_tokens.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      db_efficipay_tokens.BindDirectToListControl(target);
      }

    internal void BindTimePeriodsToListControl(object target)
      {
      db_efficipay_tokens.BindTimePeriodsToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_efficipay_tokens.Delete(id);
      }

    public bool Get
      (
      string id,
      out string value,
      out DateTime time_created,
      out DateTime time_retired
      )
      {
      return db_efficipay_tokens.Get
        (
        id,
        out value,
        out time_created,
        out time_retired
        );
      }

    public void Set
      (
      string id,
      string value,
      DateTime time_created
      )
      {
      db_efficipay_tokens.Set
        (
        id,
        value
        );
      }

    } // end TClass_biz_efficipay_tokens

  }
