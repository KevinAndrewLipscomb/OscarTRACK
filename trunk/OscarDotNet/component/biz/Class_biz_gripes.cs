// Derived from KiAspdotnetFramework/component/biz/Class~biz~~template~kicrudhelped~item.cs~template

using Class_biz_members;
using Class_biz_notifications;
using Class_db_gripes;
using kix;
using OscarDotNet.component.os;
using System;
using System.Collections;
using System.Configuration;
using System.Web;

namespace Class_biz_gripes
  {

  public static class Class_biz_gripes_Static
    {
    public const string ATTACHMENT_FOLDER_SPEC = "../pub/attachment/gripe/";
    public const string COMMENT_SEPARATOR = k.NEW_LINE + ":" + k.NEW_LINE + ":" + k.NEW_LINE;
    }

  public class TClass_biz_gripes
    {

    private readonly TClass_biz_members biz_members = null;
    private readonly TClass_biz_notifications biz_notifications = null;
    private readonly TClass_db_gripes db_gripes = null;
    private readonly Class_fs fs = null;

    public TClass_biz_gripes() : base()
      {
      biz_members = new TClass_biz_members();
      biz_notifications = new TClass_biz_notifications();
      db_gripes = new TClass_db_gripes();
      fs = new Class_fs();
      }

    public void Append
      (
      string id,
      string old_description,
      string note_to_append
      )
      {
      var replacement_description = old_description + Class_biz_gripes_Static.COMMENT_SEPARATOR + biz_members.UserAttributionIndicator() + note_to_append;
      db_gripes.Replace(id,replacement_description);
      }

    internal bool BeVehicleLogEmpty(string vehicle_id)
      {
      return db_gripes.BeVehicleLogEmpty(vehicle_id);
      }

    public bool Bind
      (
      string vehicle_id,
      string partial_spec,
      object target
      )
      {
      return db_gripes.Bind(vehicle_id,partial_spec, target);
      }

    public void BindDirectToListControl
      (
      string vehicle_id,
      object target
      )
      {
      db_gripes.BindDirectToListControl(vehicle_id,target);
      }

    internal void BindLog
      (
      string vehicle_id,
      string sort_order,
      bool be_sort_order_ascending,
      object target
      )
      {
      db_gripes.BindLog(vehicle_id,sort_order,be_sort_order_ascending,target);
      }

    internal string VehicleLog(string vehicle_id)
      {
      var vehicle_log = k.EMPTY;
      var id_q = new Queue();
      var description_q = new Queue();
      db_gripes.VehicleLog(vehicle_id,ref id_q,ref description_q);
      while (id_q.Count > 0)
        {
        vehicle_log += new string(Convert.ToChar(k.SPACE),3) + "Gripe # " + id_q.Dequeue().ToString() + ":" + k.NEW_LINE
        + new string(Convert.ToChar(k.SPACE),6) + k.WrapText(description_q.Dequeue().ToString(),k.NEW_LINE + new string(Convert.ToChar(k.SPACE),6), Class_biz_notifications_Static.BreakChars, short.Parse(ConfigurationManager.AppSettings["email_blockquote_maxcol"]));
        if (id_q.Count > 0)
          {
          vehicle_log += k.NEW_LINE + k.NEW_LINE;
          }
        }
      return vehicle_log;
      }

    internal void ManageStalled()
      {
      var stalled_id_q = db_gripes.StalledIdQ();
      while (stalled_id_q.Count > 0)
        {
        Delete(stalled_id_q.Dequeue());
        }
      }

    public bool Delete(string id)
      {
      var the_delete = db_gripes.Delete(id);
      fs.CondemnFolder(spec:HttpContext.Current.Server.MapPath(Class_biz_gripes_Static.ATTACHMENT_FOLDER_SPEC + id));
      return the_delete;
      }

    public bool Get
      (
      string id,
      out string vehicle_name,
      out string description
      )
      {
      return db_gripes.Get
        (
        id,
        out vehicle_name,
        out description
        );
      }

    internal void SendWorkOrder
      (
      string vehicle_id,
      string user_id,
      string urlencoded_work_order_coordinator_title,
      string urlencoded_main_reason_for_visit,
      string urlencoded_serialized_gripe_inclusion_hashtable,
      string working_directory,
      string urlencoded_target
      )
      {
      var stdout = k.EMPTY;
      var stderr = k.EMPTY;
      k.RunCommandIteratedOverArguments
        (
        "c:\\cygwin\\bin\\wget",
        new ArrayList()
          {
          "--output-document=/dev/null --no-check-certificate"
          + " --post-data"
          +   "=vehicle_id=" + vehicle_id
          +   "&user_id=" + user_id
          +   "&work_order_coordinator_title=" + urlencoded_work_order_coordinator_title
          +   "&main_reason_for_visit=" + urlencoded_main_reason_for_visit
          +   "&serialized_gripe_inclusion_hashtable=\"" + urlencoded_serialized_gripe_inclusion_hashtable + "\""
          +   "&target=" + urlencoded_target
          + k.SPACE
          + "\"" + ConfigurationManager.AppSettings["runtime_root_fullspec"] + "noninteractive/report_commanded_gripe_sheet.aspx\""
          },
        working_directory,
        out stdout,
        out stderr
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
        note_to_append = description + Class_biz_gripes_Static.COMMENT_SEPARATOR + note_to_append;
        }
      db_gripes.Set
        (
        id,
        vehicle_name,
        note_to_append
        );
      biz_notifications.IssueForGripeSubmission(vehicle_id,note_to_append);
      }

    } // end TClass_biz_gripes

  }
