// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_db_mini_fix_requests;
using Class_biz_members;
using Class_biz_notifications;
using kix;
using System;
using System.Collections;
using System.Configuration;

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
    private TClass_biz_notifications biz_notifications = null;

    public TClass_biz_mini_fix_requests() : base()
      {
      db_mini_fix_requests = new TClass_db_mini_fix_requests();
      biz_members = new TClass_biz_members();
      biz_notifications = new TClass_biz_notifications();
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

    internal bool BeVehicleLogEmpty(string vehicle_id)
      {
      return db_mini_fix_requests.BeVehicleLogEmpty(vehicle_id);
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

    internal void BindLog
      (
      string vehicle_id,
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_mini_fix_requests.BindLog(vehicle_id,sort_order,be_sort_order_ascending,target);
      }

    internal string VehicleLog(string vehicle_id)
      {
      var vehicle_log = k.EMPTY;
      var id_q = new Queue();
      var description_q = new Queue();
      db_mini_fix_requests.VehicleLog(vehicle_id,ref id_q,ref description_q);
      while (id_q.Count > 0)
        {
        vehicle_log += new string(Convert.ToChar(k.SPACE),3) + "MiniFixLog entry # " + id_q.Dequeue().ToString() + ":" + k.NEW_LINE
        + new string(Convert.ToChar(k.SPACE),6) + k.WrapText(description_q.Dequeue().ToString(),k.NEW_LINE + new string(Convert.ToChar(k.SPACE),6), Class_biz_notifications_Static.BreakChars, short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"]));
        if (id_q.Count > 0)
          {
          vehicle_log += k.NEW_LINE + k.NEW_LINE;
          }
        }
      return vehicle_log;
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
      string vehicle_id,
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
      biz_notifications.IssueForMiniFixRequestSubmission(vehicle_id,note_to_append);
      }

    } // end TClass_biz_mini_fix_requests

  }
