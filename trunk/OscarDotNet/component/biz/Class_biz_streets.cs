// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_streets;
using kix;
using System;
using System.Collections;

namespace Class_biz_streets
  {
  public class TClass_biz_streets
    {
    private TClass_db_streets db_streets = null;

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

    internal string NormalizedSuffixRendition(string name)
      {
      var normalized_suffix_rendition = k.EMPTY;
      var simplified_name = k.Safe(name.Trim().ToUpper().Replace(k.SPACE + k.SPACE,k.SPACE),k.safe_hint_type.ALPHA_WORDS);
      var word_array = simplified_name.Split(new string[] {k.SPACE},StringSplitOptions.RemoveEmptyEntries);
      if (word_array.Length == 1)
        {
        normalized_suffix_rendition = simplified_name;
        }
      else
        {
        var last_word = word_array[word_array.Length - 1];
        if (new ArrayList() {"AV","AVENUE"}.Contains(last_word))
          {
          last_word = "AVE";
          }
        else if (last_word == "BOULEVARD")
          {
          last_word = "BLVD";
          }
        else if (last_word == "CIRCLE")
          {
          last_word = "CIR";
          }
        else if (last_word == "COMMON")
          {
          last_word = "CMN";
          }
        else if (last_word == "COURT")
          {
          last_word = "CT";
          }
        else if (last_word == "COVE")
          {
          last_word = "CV";
          }
        else if (last_word == "COVES")
          {
          last_word = "CVS";
          }
        else if (last_word == "CRESCENT")
          {
          last_word = "CRES";
          }
        else if (last_word == "DRIVE")
          {
          last_word = "DR";
          }
        else if (new ArrayList() {"LANDING","LDNG"}.Contains(last_word))
          {
          last_word = "LNDG";
          }
        else if (last_word == "LANE")
          {
          last_word = "LN";
          }
        else if (new ArrayList() {"PARKWAY","PWKY"}.Contains(last_word))
          {
          last_word = "PKWY";
          }
        else if (last_word == "PLACE")
          {
          last_word = "PL";
          }
        else if (last_word == "POINT")
          {
          last_word = "PT";
          }
        else if (last_word == "ROAD")
          {
          last_word = "RD";
          }
        else if (last_word == "RIDGE")
          {
          last_word = "RDG";
          }
        else if (new ArrayList() {"SQUARE","SQR"}.Contains(last_word))
          {
          last_word = "SQ";
          }
        else if (last_word == "STREET")
          {
          last_word = "ST";
          }
        else if (last_word == "TERRACE")
          {
          last_word = "TER";
          }
        else if (last_word == "TURNPIKE")
          {
          last_word = "TPKE";
          }
        else if (last_word == "TRAIL")
          {
          last_word = "TRL";
          }
        else if (last_word == "TRACE")
          {
          last_word = "TRCE";
          }
        else if (last_word == "WY")
          {
          last_word = "WAY";
          }
        else if (last_word == "CROSSING")
          {
          last_word = "XING";
          }
        //
        for (var i = new k.subtype<int>(0,word_array.Length - 1); i.val < i.LAST; i.val++)
          {
          normalized_suffix_rendition += word_array[i.val] + k.SPACE;
          }
        normalized_suffix_rendition += last_word;
        }
      return normalized_suffix_rendition;
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
