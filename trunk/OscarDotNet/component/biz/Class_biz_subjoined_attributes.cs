// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_subjoined_attributes;
using System;

namespace Class_biz_subjoined_attributes
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_subjoined_attributes
    {
    private readonly TClass_db_subjoined_attributes db_subjoined_attributes = null;

    public TClass_biz_subjoined_attributes() : base()
      {
      db_subjoined_attributes = new TClass_db_subjoined_attributes();
      }

    internal bool BeAnyImplementedSince(DateTime time)
      {
      return db_subjoined_attributes.BeAnyImplementedSince(time);
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_subjoined_attributes.Bind(partial_spec, target);
      }

    public void BindBaseDataList
      (
      object target,
      DateTime last_login
      )
      {
      db_subjoined_attributes.BindBaseDataList(target,last_login);
      }

    public void BindDirectToListControl(object target)
      {
      db_subjoined_attributes.BindDirectToListControl(target);
      }

    public bool Delete(string id)
      {
      return db_subjoined_attributes.Delete(id);
      }

    public bool Get
      (
      string id,
      out DateTime time_implemented,
      out string involvement_id,
      out string name
      )
      {
      return db_subjoined_attributes.Get
        (
        id,
        out time_implemented,
        out involvement_id,
        out name
        );
      }

    public void Set
      (
      string id,
      DateTime time_implemented,
      string involvement_id,
      string name
      )
      {
      db_subjoined_attributes.Set
        (
        id,
        time_implemented,
        involvement_id,
        name
        );
      }

    internal object Summary(string id)
      {
      return db_subjoined_attributes.Summary(id);
      }

    } // end TClass_biz_subjoined_attributes

  }
