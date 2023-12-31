// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_streets;
using kix;

namespace Class_biz_streets
  {
  public class TClass_biz_streets
    {
    private readonly TClass_db_streets db_streets = null;

    public TClass_biz_streets() : base()
      {
      db_streets = new TClass_db_streets();
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_streets.Bind(partial_spec, target);
      }

    public void BindDirectToListControl
      (
      object target,
      string agency_keyclick_enumerator,
      string unselected_literal,
      string selected_value
      )
      {
      db_streets.BindDirectToListControl(target,agency_keyclick_enumerator,unselected_literal,selected_value);
      }
    public void BindDirectToListControl(object target, string agency_keyclick_enumerator, string unselected_literal)
      {
      BindDirectToListControl(target, agency_keyclick_enumerator, unselected_literal, k.EMPTY);
      }
    public void BindDirectToListControl(object target, string agency_keyclick_enumerator)
      {
      BindDirectToListControl(target, agency_keyclick_enumerator, "-- street --");
      }

    public bool Delete(string id)
      {
      return db_streets.Delete(id);
      }

    public bool Get
      (
      string id,
      out string city_id,
      out string name
      )
      {
      return db_streets.Get
        (
        id,
        out city_id,
        out name
        );
      }

    public string IdOf
      (
      string street_name,
      string city_name
      )
      {
      return db_streets.IdOf(street_name,city_name);
      }

    internal string NameOfId(string id)
      {
      return db_streets.NameOfId(id);
      }

    internal string NormalizedSuffixRendition(string name)
      {
      return db_streets.NormalizedSuffixRendition(name);
      }

    internal void Prune()
      {
      db_streets.Prune();
      }

    public void Set
      (
      string id,
      string city_id,
      string name
      )
      {
      db_streets.Set
        (
        id,
        city_id,
        NormalizedSuffixRendition(name)
        );
      }

    } // end TClass_biz_streets

  }
