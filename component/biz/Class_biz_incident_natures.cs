// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_incident_natures;
using kix;
using System;
using System.Collections;

namespace Class_biz_incident_natures
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_incident_natures
    {
    private TClass_db_incident_natures db_incident_natures = null;

    public TClass_biz_incident_natures() : base()
      {
      db_incident_natures = new TClass_db_incident_natures();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_incident_natures.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_incident_natures.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl(object target)
      {
      db_incident_natures.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_incident_natures.Delete(id);
      }

    public bool Get
      (
      string id,
      out string designator,
      out string description
      )
      {
      return db_incident_natures.Get
        (
        id,
        out designator,
        out description
        );
      }

    public void Set
      (
      string id,
      string designator,
      string description
      )
      {
      db_incident_natures.Set
        (
        id,
        designator,
        description
        );
      }

    internal object Summary(string id)
      {
      return db_incident_natures.Summary(id);
      }

    } // end TClass_biz_incident_natures

  }
