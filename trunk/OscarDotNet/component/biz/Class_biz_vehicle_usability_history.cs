// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_biz_notifications;
using Class_biz_vehicles;
using Class_db_vehicle_usability_history;
using kix;
using System;
using System.Collections;

namespace Class_biz_vehicle_usability_history
  {
  public static class Class_biz_vehicle_usability_history_Static
    {
    public static string COMMENT_SEPARATOR = k.NEW_LINE + ":" + k.NEW_LINE + ":" + k.NEW_LINE;
    }
  public class TClass_biz_vehicle_usability_history
    {
    private TClass_biz_notifications biz_notifications = null;
    private TClass_biz_vehicles biz_vehicles = null;
    private TClass_db_vehicle_usability_history db_vehicle_usability_history = null;

    public TClass_biz_vehicle_usability_history() : base()
      {
      db_vehicle_usability_history = new TClass_db_vehicle_usability_history();
      biz_notifications = new TClass_biz_notifications();
      biz_vehicles = new TClass_biz_vehicles();
      }

    public void AppendDownNote
      (
      string vehicle_id,
      string old_comment,
      string note_to_append
      )
      {
      var replacement_note = old_comment + Class_biz_vehicle_usability_history_Static.COMMENT_SEPARATOR + note_to_append;
      db_vehicle_usability_history.ReplaceDownNote(vehicle_id,replacement_note);
      biz_notifications.IssueForVehicleDownNoteAppended(vehicle_id,replacement_note);
      }

    public bool BeLater
      (
      string id,
      DateTime proposed_datetime
      )
      {
      return db_vehicle_usability_history.BeLater(id,proposed_datetime);
      }

    public bool Bind(string partial_spec, object target)
      {
      return db_vehicle_usability_history.Bind(partial_spec, target);
      }

    public void BindDirectToListControl(object target)
      {
      db_vehicle_usability_history.BindDirectToListControl(target);
      }

    public void BindVehicleRecords
      (
      string vehicle_id,
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_vehicle_usability_history.BindVehicleRecords(vehicle_id,sort_order,be_sort_order_ascending,target);
      }

    public bool Delete(string id)
      {
      return db_vehicle_usability_history.Delete(id);
      }

    public bool Get
      (
      string id,
      out string vehicle_id,
      out DateTime time_went_down,
      out string nature_id,
      out string mileage,
      out DateTime time_came_up,
      out string down_comment,
      out string up_comment
      )
      {
      return db_vehicle_usability_history.Get
        (
        id,
        out vehicle_id,
        out time_went_down,
        out nature_id,
        out mileage,
        out time_came_up,
        out down_comment,
        out up_comment
        );
      }

    public string LatestDownComment(string vehicle_id)
      {
      return db_vehicle_usability_history.LatestDownComment(vehicle_id);
      }

    public void Set
      (
      string id,
      string vehicle_id,
      DateTime time_went_down,
      string nature_id,
      string mileage,
      DateTime time_came_up,
      string down_comment,
      string up_comment
      )
      {
      db_vehicle_usability_history.Set
        (
        id,
        vehicle_id,
        time_went_down,
        nature_id,
        mileage,
        time_came_up,
        down_comment,
        up_comment
        );
      }

    } // end TClass_biz_vehicle_usability_history

  }
