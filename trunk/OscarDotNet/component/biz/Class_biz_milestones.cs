using Class_biz_users;
using Class_db_milestones;
using System;
using System.Collections;

namespace Class_biz_milestones
  {
  public class TClass_biz_milestones
    {

    private static class Static
      {
      private static reminder_control_record_type[] the_reminder_control_table =
        {
        new reminder_control_record_type {num_reminders = 6, relative_day_num_array = new uint[MAX_NUM_REMINDERS] {1, 3, 7, 14, 30, 90}},
        new reminder_control_record_type {num_reminders = 6, relative_day_num_array = new uint[MAX_NUM_REMINDERS] {1, 3, 7, 14, 30, 90}}
        };
      public const int MAX_NUM_REMINDERS = 6;
      public static reminder_control_record_type[] REMINDER_CONTROL_TABLE
        {
        get => the_reminder_control_table;
        set => the_reminder_control_table = value;
        }
      }

    private struct reminder_control_record_type
      {
      public uint num_reminders;
      public uint[] relative_day_num_array;
      }

    private enum milestone_type
      {
      FIRST_MILESTONE = 1,
      SECOND_MILESTONE = 2,
      }

    public TClass_biz_milestones() : base()
      {
      }

        public void Sweep()
        {
            bool be_handled;
            bool be_processed;
            TClass_biz_users biz_users;
            DateTime deadline;
            uint i;
            // j: cardinal;
            string master_id;
            Queue master_id_q;
            uint relative_day_num;
            DateTime today;
            biz_users = new TClass_biz_users();
            var db_milestones = new TClass_db_milestones();
            master_id_q = null;
            today = DateTime.Today;
            foreach (milestone_type milestone in Enum.GetValues(typeof(milestone_type)))
            {
                db_milestones.Check((uint)(milestone), out be_processed, out deadline);
                if (!be_processed)
                {
                    if ((today > deadline))
                    {
                        switch(milestone)
                        {
                            case milestone_type.FIRST_MILESTONE:
                                break;
                            case milestone_type.SECOND_MILESTONE:
                                break;
                        // Not application-enforceable
                        }
                        uint master_id_q_count = (uint)(master_id_q.Count);
                        for (i = 1; i <= master_id_q_count; i ++ )
                        {
                            master_id = master_id_q.Dequeue().ToString();
                        // biz_users.MakeDeadlineFailureNotification;
                        }
                        db_milestones.MarkProcessed((uint)(milestone));
                    }
                    else
                    {
                        be_handled = false;
                        i = 0;
                        while (!be_handled && (i < Static.REMINDER_CONTROL_TABLE[(int)milestone].num_reminders))
                        {
                            relative_day_num = Static.REMINDER_CONTROL_TABLE[(int)milestone].relative_day_num_array[i];
                            if (today == deadline.AddDays( -relative_day_num).Date)
                            {
                            // master_id_q := biz_emsof_requests.SusceptibleTo(milestone);
                            // for j := 1 to master_id_q.Count do begin
                            // master_id := master_id_q.Dequeue.ToString();
                            // biz_users.Remind(milestone,relative_day_num,deadline,biz_emsof_requests.MemberIdOfMasterId(master_id));
                            // be_handled := TRUE;
                            // end;
                            }
                            i++;
                        }
                    }
                }
            }
        }

    } // end TClass_biz_milestones

}
