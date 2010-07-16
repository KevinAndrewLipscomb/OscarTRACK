// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_mini_fix_requests;
using Class_biz_members;
using kix;
using System;
using System.Collections;

namespace Class_biz_mini_fix_requests
  {
  public static class Class_biz_mini_fix_requests_Static
    {
    public static string COMMENT_SEPARATOR = k.NEW_LINE + ":" + k.NEW_LINE + ":" + k.NEW_LINE;
    }
  public class TClass_biz_mini_fix_requests
    {
    private TClass_db_mini_fix_requests db_mini_fix_requests = null;
    private TClass_biz_members biz_members = null;

    public TClass_biz_mini_fix_requests() : base()
      {
      db_mini_fix_requests = new TClass_db_mini_fix_requests();
      biz_members = new TClass_biz_members();
      }

    public void Append
      (
      string id,
      string old_description,
      string note_to_append
      )
      {
      var replacement_description = old_description + Class_biz_mini_fix_requests_Static.COMMENT_SEPARATOR + biz_members.UserAttributionIndicator() + note_to_append;
      db_mini_fix_requests.Replace(id,replacement_description);
      }

    public bool Bind
      (
      string vehicle_id,
      string partial_spec,
      object target
      )
      {
      return db_mini_fix_requests.Bind(vehicle_id,partial_spec, target);
      }

    public void BindDirectToListControl
      (
      string vehicle_id,
      object target
      )
      {
      db_mini_fix_requests.BindDirectToListControl(vehicle_id,target);
      }

    public bool Delete(string id)
      {
      return db_mini_fix_requests.Delete(id);
      }

    public bool Get
      (
      string id,
      out string vehicle_name,
      out string description
      )
      {
      return db_mini_fix_requests.Get
        (
        id,
        out vehicle_name,
        out description
        );
      }

    public void Set
      (
      string id,
      string vehicle_name,
      string description,
      string note_to_append
      )
      {
      note_to_append = biz_members.UserAttributionIndicator() + note_to_append;
      if (description != k.EMPTY)
        {
        note_to_append = description + Class_biz_mini_fix_requests_Static.COMMENT_SEPARATOR + note_to_append;
        }
      db_mini_fix_requests.Set
        (
        id,
        vehicle_name,
        note_to_append
        );
      }

    } // end TClass_biz_mini_fix_requests

  }
