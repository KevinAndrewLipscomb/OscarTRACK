// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_uniform_classes;

namespace Class_biz_uniform_classes
  {
  internal enum presentation_mode_enum
    {
    NONE,
    FULL_FUNCTION,
    NEW,
    REVIEW_ONLY
    };

  public class TClass_biz_uniform_classes
    {
    private readonly TClass_db_uniform_classes db_uniform_classes = null;

    public TClass_biz_uniform_classes() : base()
      {
      db_uniform_classes = new TClass_db_uniform_classes();
      }

    internal string AgencyIdOf(object summary)
      {
      return db_uniform_classes.AgencyIdOf(summary);
      }
      
    public bool Bind
      (
      string partial_spec,
      object target,
      string agency_id_filter
      )
      {
      return db_uniform_classes.Bind(partial_spec, target, agency_id_filter);
      }

    public void BindBaseDataList
      (
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_uniform_classes.BindBaseDataList(sort_order,be_sort_order_ascending,target);
      }

    public void BindDirectToListControl
      (
      object target,
      string agency_id_filter
      )
      {
      db_uniform_classes.BindDirectToListControl(target,agency_id_filter);
      }

    public bool Delete(string id)
      {
      return db_uniform_classes.Delete(id);
      }

    public bool Get
      (
      string id,
      out string agency_id,
      out string short_designator,
      out string long_designator
      )
      {
      return db_uniform_classes.Get
        (
        id,
        out agency_id,
        out short_designator,
        out long_designator
        );
      }

    internal string LongDesignatorOf(object summary)
      {
      return db_uniform_classes.LongDesignatorOf(summary);
      }
      
    public void Set
      (
      string id,
      string agency_id,
      string short_designator,
      string long_designator
      )
      {
      db_uniform_classes.Set
        (
        id,
        agency_id,
        short_designator,
        long_designator
        );
      }

    internal string ShortDesignatorOf(object summary)
      {
      return db_uniform_classes.ShortDesignatorOf(summary);
      }
      
    internal object Summary(string id)
      {
      return db_uniform_classes.Summary(id);
      }

    } // end TClass_biz_uniform_classes

  }
