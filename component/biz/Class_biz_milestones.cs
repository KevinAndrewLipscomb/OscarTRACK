using System;

using System.Collections;
using Class_db_milestones;
using Class_biz_users;
namespace Class_biz_milestones
{
    public class TClass_biz_milestones
    {
        //Constructor  Create()
        public TClass_biz_milestones() : base()
        {
            // TODO: Add any constructor code here

        }
        public void Sweep()
        {
            bool be_handled;
            bool be_processed;
            TClass_biz_users biz_users;
            DateTime deadline;
            TClass_db_milestones db_milestones;
            uint i;
            // j: cardinal;
            string master_id;
            Queue master_id_q;
            uint relative_day_num;
            DateTime today;
            biz_users = new TClass_biz_users();
            db_milestones = new TClass_db_milestones();
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
                        for (i = 1; i <= master_id_q.Count; i ++ )
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
                        while (!be_handled && (i < Units.Class_biz_milestones.REMINDER_CONTROL_TABLE[(int)milestone].num_reminders))
                        {
                            relative_day_num = Units.Class_biz_milestones.REMINDER_CONTROL_TABLE[(int)milestone].relative_day_num_array[i];
                            if (today == deadline.AddDays( -relative_day_num).Date)
                            {
                            // master_id_q := biz_emsof_requests.SusceptibleTo(milestone);
                            // for j := 1 to master_id_q.Count do begin
                            // master_id := master_id_q.Dequeue.ToString();
                            // biz_users.Remind(milestone,relative_day_num,deadline,biz_emsof_requests.MemberIdOfMasterId(master_id));
                            // be_handled := TRUE;
                            // end;
                            }
                            i = i + 1;
                        }
                    }
                }
            }
        }

    } // end TClass_biz_milestones

    public struct reminder_control_record_type
    {
        public uint num_reminders;
        public uint[] relative_day_num_array;
    } // end reminder_control_record_type

    public enum milestone_type
    {
        FIRST_MILESTONE = 1,
        SECOND_MILESTONE = 2,
    } // end milestone_type

}

namespace Class_biz_milestones.Units
{
    public class Class_biz_milestones
    {
        // REMINDER_CONTROL_TABLE
        public const int MAX_NUM_REMINDERS = 6;
        // FIRST_MILESTONE
        // SECOND_MILESTONE
        public static reminder_control_record_type[] REMINDER_CONTROL_TABLE =
          {
          new reminder_control_record_type {num_reminders = 6, relative_day_num_array = new uint[MAX_NUM_REMINDERS] {1, 3, 7, 14, 30, 90}}, 
          new reminder_control_record_type {num_reminders = 6, relative_day_num_array = new uint[MAX_NUM_REMINDERS] {1, 3, 7, 14, 30, 90}}
          };
    } // end Class_biz_milestones

}

