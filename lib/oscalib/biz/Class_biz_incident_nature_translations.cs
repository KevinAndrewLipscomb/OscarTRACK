// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using System;
using Class_db_incident_nature_translations;

namespace Class_biz_incident_nature_translations
  {
  public enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_incident_nature_translations
    {
    private readonly TClass_db_incident_nature_translations db_incident_nature_translations = null;

    public TClass_biz_incident_nature_translations() : base()
      {
      db_incident_nature_translations = new TClass_db_incident_nature_translations();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_incident_nature_translations.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_incident_nature_translations.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public string LocalOfForeign(string nature)
      {
      return db_incident_nature_translations.LocalOfForeign(nature);
      }

    public void BindDirectToListControl(object target)
      {
      db_incident_nature_translations.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_incident_nature_translations.Delete(id);
      }

    public bool Get
      (
      string id,
      out string foreign,
      out string local
      )
      {
      return db_incident_nature_translations.Get
        (
        id,
        out foreign,
        out local
        );
      }

    public void Set
      (
      string id,
      string foreign,
      string local
      )
      {
      db_incident_nature_translations.Set
        (
        id,
        foreign,
        local
        );
      }

    public object Summary(string id)
      {
      return db_incident_nature_translations.Summary(id);
      }

    } // end TClass_biz_incident_nature_translations

  }
