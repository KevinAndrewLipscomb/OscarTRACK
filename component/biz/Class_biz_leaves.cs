using Class_biz_members;
using Class_biz_notifications;
using Class_db_enrollment;
using Class_db_leaves;
using kix;
using System;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Class_biz_leaves
{
    public class TClass_biz_leaves
    {
        private TClass_db_enrollment db_enrollment = null;
        private TClass_db_leaves db_leaves = null;
        private TClass_biz_members biz_members = null;
        private TClass_biz_notifications biz_notifications = null;

    //Constructor  Create()
    public TClass_biz_leaves() : base()
        {
            // TODO: Add any constructor code here
            db_enrollment = new TClass_db_enrollment();
            db_leaves = new TClass_db_leaves();
            biz_members = new TClass_biz_members();
            biz_notifications = new TClass_biz_notifications();
        }
        public bool BeOverlap(string member_id, string relative_start_month, string relative_end_month, string id)
        {
            bool result;
            result = db_leaves.BeOverlap(member_id, relative_start_month, relative_end_month, id);
            return result;
        }

        public bool BeOverlap(string member_id, string relative_start_month, string relative_end_month)
        {
            return BeOverlap(member_id, relative_start_month, relative_end_month, "");
        }

        public bool BeValid(string start_month, string end_month)
        {
            bool result;
            result = (int.Parse(start_month) <= int.Parse(end_month));
            // The month values may be negative if we are editing a leave that started in a prior month and/or changing the end month to
            // last month.

            return result;
        }

    internal bool BeValidMedical
      (
      string kind_of_leave_description,
      string end_month
      )
      {
      return (kind_of_leave_description != "Medical") || (int.Parse(end_month) >= 1);
      }

        public void BindEndMonthDropDownList(object target, bool use_select, bool include_last_month)
        {
            int lowest_offset;
            int month_offset;
            ((target) as DropDownList).Items.Clear();
            if (use_select)
            {
                ((target) as DropDownList).Items.Add(new ListItem("-- Select --", ""));
            }
            if (include_last_month)
            {
                lowest_offset =  -1;
            }
            else
            {
                lowest_offset = 0;
            }
            for (month_offset = lowest_offset; month_offset <= 11; month_offset ++ )
            {
                ((target) as DropDownList).Items.Add(new ListItem(DateTime.Today.AddMonths(month_offset).ToString("MMM yyyy"), month_offset.ToString()));
            }
        }

    internal void KeepMedicalsExtendedIntoNextMonth()
      {
      medical_expiring_this_month_rec_class medical_expiring_this_month_rec;
      var convenient_next_month_date = DateTime.Today.AddMonths(1);
      var first_of_next_month = new DateTime
        (
        year:convenient_next_month_date.Year,
        month:convenient_next_month_date.Month,
        day:1
        );
      var medical_expiring_this_month_rec_q = db_leaves.MedicalExpiringThisMonthRecQ();
      var medical_expiring_this_month_rec_q_count = medical_expiring_this_month_rec_q.Count;
      for (var i = new k.subtype<int>(0,medical_expiring_this_month_rec_q_count); i.val < i.LAST; i.val++)
        {
        medical_expiring_this_month_rec = medical_expiring_this_month_rec_q.Dequeue();
        if (BeOverlap(member_id:medical_expiring_this_month_rec.member_id, relative_start_month:"1", relative_end_month:"1"))
          {
          //
          // That leave must be canceled so it can be replaced with an extension of the current medical leave.
          //
          db_leaves.CurtailOnEffectiveDate
            (
            member_id:medical_expiring_this_month_rec.member_id,
            effective_date:first_of_next_month,
            due_to_phrase:"medical leave"
            );
          }
        else
          {
          Change
            (
            id:medical_expiring_this_month_rec.id,
            member_id:medical_expiring_this_month_rec.member_id,
            old_start_month:DateTime.Today.AddMonths(int.Parse(medical_expiring_this_month_rec.start_month)).ToString("MMM yyyy"),
            old_end_month:DateTime.Today.ToString("MMM yyyy"),
            old_kind_of_leave:"Medical",
            old_num_obliged_shifts:"0",
            old_note:medical_expiring_this_month_rec.note,
            new_relative_start_month:medical_expiring_this_month_rec.start_month,
            new_relative_end_month:"1",
            new_kind_of_leave_code:db_leaves.KindOfLeaveCodeOf(id:medical_expiring_this_month_rec.id),
            new_num_obligated_shifts:"0",
            new_note:medical_expiring_this_month_rec.note,
            be_interactive:false
            );
          biz_notifications.IssueForMedicalLeaveAutomaticallyExtendedIntoNextMonth
            (
            member_id:medical_expiring_this_month_rec.member_id,
            first_name:biz_members.FirstNameOfMemberId(medical_expiring_this_month_rec.member_id),
            last_name:biz_members.LastNameOfMemberId(medical_expiring_this_month_rec.member_id),
            cad_num:biz_members.CadNumOfMemberId(medical_expiring_this_month_rec.member_id)
            );
          }
        }
      }

    public void BindEndMonthDropDownList(object target)
        {
            BindEndMonthDropDownList(target, true);
        }

        public void BindEndMonthDropDownList(object target, bool use_select)
        {
            BindEndMonthDropDownList(target, use_select, false);
        }

        public void BindKindDropDownList(object target, bool use_select)
        {
            db_leaves.BindKindDropDownList(target, use_select);
        }

        public void BindKindDropDownList(object target)
        {
            BindKindDropDownList(target, true);
        }

        public void BindMemberRecords(string member_id, string sort_order, bool be_sort_order_ascending, object target)
        {
            db_leaves.BindMemberRecords(member_id, sort_order, be_sort_order_ascending, target);
        }

        public void BindNumObligatedShiftsDropDownList(string enrollment, object target)
        {
            uint num_obliged_shifts;
            ((target) as DropDownList).Items.Clear();
            ((target) as DropDownList).Items.Add(new ListItem("-- Select --", ""));
            uint limit = (uint)(Math.Max(0, (((int)db_enrollment.NumObligedShifts(enrollment)) - 1)));
            for (num_obliged_shifts = 0; num_obliged_shifts <= limit; num_obliged_shifts ++ )
            {
                // The integer() cast and the use of Math.Max are workarounds to what I suspect should be a runtime overflow bug.
                ((target) as DropDownList).Items.Add(new ListItem(num_obliged_shifts.ToString(), num_obliged_shifts.ToString()));
            }
        }

    public void BindStartMonthDropDownList(object target, bool use_select)
        {
            uint month_offset;
            ((target) as DropDownList).Items.Clear();
            if (use_select)
            {
                ((target) as DropDownList).Items.Add(new ListItem("-- Select --", ""));
            }
            for (month_offset = 0; month_offset <= 11; month_offset ++ )
            {
                ((target) as DropDownList).Items.Add(new ListItem(DateTime.Today.AddMonths((int)month_offset).ToString("MMM yyyy"), month_offset.ToString()));
            }
        }

        public void BindStartMonthDropDownList(object target)
        {
            BindStartMonthDropDownList(target, true);
        }

    public void Change
      (
      string id,
      string member_id,
      string old_start_month,
      string old_end_month,
      string old_kind_of_leave,
      string old_num_obliged_shifts,
      string old_note,
      string new_relative_start_month,
      string new_relative_end_month,
      string new_kind_of_leave_code,
      string new_num_obligated_shifts,
      string new_note,
      bool be_interactive = true
      )
      {
      const string AFFIRMATIVE_CHANGE_INDICATOR = "  <==";
      db_leaves.Change(id,new_relative_start_month,new_relative_end_month,new_kind_of_leave_code,new_num_obligated_shifts,new_note);
      var new_start_month = DateTime.Today.AddMonths(int.Parse(new_relative_start_month)).ToString("MMM yyyy");
        // new_relative_start_month may be negative if we are changing an existing leave that started in a prior month
      var new_end_month = DateTime.Today.AddMonths(int.Parse(new_relative_end_month)).ToString("MMM yyyy");
        // new_relative_end_month may be negative if we are changing the end month to last month
      var new_kind_of_leave = DescriptionOf(new_kind_of_leave_code);
      var change_indicator_end_month = (old_end_month != new_end_month ? AFFIRMATIVE_CHANGE_INDICATOR : k.EMPTY);
      var change_indicator_kind_of_leave = (old_kind_of_leave != new_kind_of_leave ? AFFIRMATIVE_CHANGE_INDICATOR : k.EMPTY);
      var change_indicator_num_obliged_shifts = (old_num_obliged_shifts != new_num_obligated_shifts ? AFFIRMATIVE_CHANGE_INDICATOR : k.EMPTY);
      var change_indicator_note = (old_note != new_note ? AFFIRMATIVE_CHANGE_INDICATOR : k.EMPTY);
      var change_indicator_start_month = (old_start_month != new_start_month ? AFFIRMATIVE_CHANGE_INDICATOR : k.EMPTY);
      biz_notifications.IssueForLeaveChanged
        (
        member_id:member_id,
        first_name:biz_members.FirstNameOfMemberId(member_id),
        last_name:biz_members.LastNameOfMemberId(member_id),
        cad_num:biz_members.CadNumOfMemberId(member_id),
        old_start_month:old_start_month,
        old_end_month:old_end_month,
        old_kind_of_leave:old_kind_of_leave,
        old_num_obligated_shifts:old_num_obliged_shifts,
        old_note:old_note,
        new_start_month:new_start_month,
        new_end_month:new_end_month,
        new_kind_of_leave:new_kind_of_leave,
        new_num_obligated_shifts:new_num_obligated_shifts,
        new_note:new_note,
        change_indicator_start_month:change_indicator_start_month,
        change_indicator_end_month:change_indicator_end_month,
        change_indicator_kind_of_leave:change_indicator_kind_of_leave,
        change_indicator_num_obliged_shifts:change_indicator_num_obliged_shifts,
        change_indicator_note:change_indicator_note,
        be_interactive:be_interactive
        );
      }

    internal bool BeOkToClearImmediately
      (
      string kind_of_leave,
      bool be_user_privileged_to_clear_medical_leave,
      bool be_canonical,DateTime specific_end_date
      )
      {
      return (kind_of_leave == "Medical")
      && be_user_privileged_to_clear_medical_leave
      && be_canonical
      && (specific_end_date >= DateTime.Today);
      }

    internal void ClearImmediately
      (
      string id,
      string member_id
      )
      {
      db_leaves.ClearImmediately(id);
      biz_notifications.IssueForLeaveClearedImmediately
        (
        member_id:member_id,
        first_name:biz_members.FirstNameOfMemberId(member_id),
        last_name:biz_members.LastNameOfMemberId(member_id),
        cad_num:biz_members.CadNumOfMemberId(member_id)
        );
      }

        public void Delete(string id)
        {
            string member_id;
            member_id = MemberIdOf(id);
            biz_notifications.IssueForLeaveDeleted(member_id, biz_members.FirstNameOfMemberId(member_id), biz_members.LastNameOfMemberId(member_id), biz_members.CadNumOfMemberId(member_id), StartDateOf(id).ToString("MMM yyyy"), EndDateOf(id).ToString("MMM yyyy"), DescriptionOf(KindOfLeaveCodeOf(id)), NumObligedShiftsOf(id).ToString(), NoteOf(id));
            db_leaves.Delete(id);

        }

        public void DescribeThisAndNextMonthForMember(string member_id, out string this_month_description, out string next_month_description, string null_description)
        {
            db_leaves.DescribeThisAndNextMonthForMember(member_id, out this_month_description, out next_month_description, null_description);
        }

        public string DescriptionOf(string code)
        {
            string result;
            result = db_leaves.DescriptionOf(code);
            return result;
        }

        public DateTime EndDateOf(string id)
        {
            DateTime result;
            result = db_leaves.EndDateOf(id);
            return result;
        }

        public string EndMonthOf(object leave_item)
        {
            string result;
            result = db_leaves.EndMonthOf(leave_item);
            return result;
        }

        public void Grant(string member_id, string relative_start_month, string relative_end_month, string kind_of_leave_code, string num_obligated_shifts, string note)
        {
            db_leaves.Grant(member_id, relative_start_month, relative_end_month, kind_of_leave_code, num_obligated_shifts, note);
            biz_notifications.IssueForLeaveGranted(member_id, biz_members.FirstNameOfMemberId(member_id), biz_members.LastNameOfMemberId(member_id), biz_members.CadNumOfMemberId(member_id), DateTime.Today.AddMonths(int.Parse(relative_start_month)).ToString("MMM yyyy"), DateTime.Today.AddMonths(int.Parse(relative_end_month)).ToString("MMM yyyy"), DescriptionOf(kind_of_leave_code), num_obligated_shifts, note);

        }

        public string IdOf(object leave_item)
        {
            string result;
            result = db_leaves.IdOf(leave_item);
            return result;
        }

        public string KindOf(object leave_item)
        {
            string result;
            result = db_leaves.KindOf(leave_item);
            return result;
        }

        public string KindOfLeaveCodeOf(string id)
        {
            string result;
            result = db_leaves.KindOfLeaveCodeOf(id);
            return result;
        }

    public void MakeLeaveEndingSoonNotifications()
      {
      expire_after_days_rec_class expire_after_days_rec;
      var expire_after_days_rec_q = db_leaves.ExpireAfterDays(int.Parse(ConfigurationManager.AppSettings["days_advance_notice_for_leaves_ending"]));
      var expire_after_days_rec_q_count = expire_after_days_rec_q.Count;
      for (var i = new k.int_positive(); i.val <= expire_after_days_rec_q_count; i.val++ )
        {
        expire_after_days_rec = expire_after_days_rec_q.Dequeue();
        if (!BeOverlap(member_id:expire_after_days_rec.member_id, relative_start_month:"1", relative_end_month:"1"))
          {
          // Back-to-back leaves are ruled out, so we won't be misleading anyone by declaring that this person's (generic) leave has
          // expired.
          biz_notifications.IssueForLeaveEndingSoon
            (
            member_id:expire_after_days_rec.member_id,
            first_name:biz_members.FirstNameOfMemberId(expire_after_days_rec.member_id),
            last_name:biz_members.LastNameOfMemberId(expire_after_days_rec.member_id),
            cad_num:biz_members.CadNumOfMemberId(expire_after_days_rec.member_id),
            kind_of_leave:expire_after_days_rec.kind_of_leave
            );
          }
        }
      }

    public void MakeLeaveExpirationNotifications()
      {
      expire_after_days_rec_class expire_after_days_rec;
      var expire_after_days_rec_q = db_leaves.ExpireAfterDays(-1);
      var expire_after_days_rec_q_count = expire_after_days_rec_q.Count;
      for (var i = new k.int_positive(); i.val <= expire_after_days_rec_q_count; i.val++ )
        {
        expire_after_days_rec = expire_after_days_rec_q.Dequeue();
        if (!BeOverlap(member_id:expire_after_days_rec.member_id, relative_start_month:"0", relative_end_month:"0"))
          {
          //
          // Back-to-back leaves are ruled out, so we won't be misleading anyone by declaring that this person's (generic) leave has expired.
          //
          biz_notifications.IssueForLeaveExpiredYesterday
            (
            member_id:expire_after_days_rec.member_id,
            first_name:biz_members.FirstNameOfMemberId(expire_after_days_rec.member_id),
            last_name:biz_members.LastNameOfMemberId(expire_after_days_rec.member_id),
            cad_num:biz_members.CadNumOfMemberId(expire_after_days_rec.member_id),
            kind_of_leave:expire_after_days_rec.kind_of_leave
            );
          }
        }
      }

        public string MemberIdOf(string id)
        {
            string result;
            result = db_leaves.MemberIdOf(id);
            return result;
        }

        public string NoteOf(string id)
        {
            string result;
            result = db_leaves.NoteOf(id);
            return result;
        }

        public string NoteOfTcc(object leave_item)
        {
            string result;
            result = db_leaves.NoteOfTcc(leave_item);
            return result;
        }

        public uint NumObligedShiftsOf(string id)
        {
            uint result;
            result = db_leaves.NumObligedShiftsOf(id);
            return result;
        }

        public string NumObligedShiftsOfTcc(object leave_item)
        {
            string result;
            result = db_leaves.NumObligedShiftsOfTcc(leave_item);
            return result;
        }

        public relativity_type RelativityOf(string start_month, string end_month)
        {
            relativity_type result;
            var this_month = DateTime.Today.ToString("yyyy-MM");
            //
            // The following two lines are necessary now that we're also processing mid-cycle leave data.
            //
            start_month = start_month.Substring(0,7);
            end_month = end_month.Substring(0,7);
            //
            if (end_month.CompareTo(this_month) < 0)
            {
                result = relativity_type.PAST;
            }
            else if (start_month.CompareTo(this_month) > 0)
            {
                result = relativity_type.FUTURE;
            }
            else if (start_month == this_month)
            {
                result = relativity_type.FORMATIVE;
            }
            else
            {
                result = relativity_type.ESTABLISHED;
            }
            return result;
        }

        public DateTime StartDateOf(string id)
        {
            DateTime result;
            result = db_leaves.StartDateOf(id);
            return result;
        }

        public string StartMonthOf(object leave_item)
        {
            string result;
            result = db_leaves.StartMonthOf(leave_item);
            return result;
        }

        public uint TcciOfId()
        {
            uint result;
            result = db_leaves.TcciOfId();
            return result;
        }

    } // end TClass_biz_leaves

    public enum relativity_type
    {
        PAST,
        FORMATIVE,
        ESTABLISHED,
        FUTURE,
    } // end relativity_type

}
