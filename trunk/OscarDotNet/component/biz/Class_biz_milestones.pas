unit Class_biz_milestones;

interface

const
  ID = '$Id$';

type
  TClass_biz_milestones = class
  private
    { Private Declarations }
  public
    constructor Create;
    procedure Sweep;
  end;

type
  milestone_type =
    (
    FIRST_MILESTONE = 1,
    SECOND_MILESTONE = 2
    );
implementation

uses
  Class_db_milestones,
  Class_biz_accounts,
  system.collections;

//
// REMINDER_CONTROL_TABLE
//
const
  MAX_NUM_REMINDERS = 6;
type
  relative_day_num_array_index_type = 0..5;
  relative_day_num_array_type = array[relative_day_num_array_index_type] of cardinal;
  reminder_control_record_type =
    RECORD
    num_reminders: cardinal;
    relative_day_num_array: relative_day_num_array_type;
    END;
  reminder_control_table_type = array[milestone_type] of reminder_control_record_type;
const
  REMINDER_CONTROL_TABLE: reminder_control_table_type =
    (
    (num_reminders:6; relative_day_num_array:(1,3,7,14,30,90)), // FIRST_MILESTONE
    (num_reminders:6; relative_day_num_array:(1,3,7,14,30,90))  // SECOND_MILESTONE
    );

constructor TClass_biz_milestones.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

procedure TClass_biz_milestones.Sweep;
var
  be_handled: boolean;
  be_processed: boolean;
  biz_accounts: TClass_biz_accounts;
  deadline: datetime;
  db_milestones: TClass_db_milestones;
  i: cardinal;
//  j: cardinal;
  master_id: string;
  master_id_q: queue;
  milestone: milestone_type;
  relative_day_num: cardinal;
  today: datetime;
begin
  biz_accounts := TClass_biz_accounts.Create;
  db_milestones := TClass_db_milestones.Create;
  master_id_q := nil;
  today := datetime.Today;
  //
  for milestone := Low(milestone_type) to High(milestone_type) do begin
    db_milestones.Check(ord(milestone),be_processed,deadline);
    if not be_processed then begin
      if (today > deadline) then begin
        case milestone of
        FIRST_MILESTONE:
          BEGIN
          END;
        SECOND_MILESTONE:
          BEGIN
          // Not application-enforceable
          END;
        end;
        for i := 1 to master_id_q.Count do begin
          master_id := master_id_q.Dequeue.tostring;
          //biz_accounts.MakeDeadlineFailureNotification;
        end;
        db_milestones.MarkProcessed(ord(milestone));
      end else begin
        be_handled := FALSE;
        i := 0;
        while (not be_handled) and (i < REMINDER_CONTROL_TABLE[milestone].num_reminders) do begin
          relative_day_num := REMINDER_CONTROL_TABLE[milestone].relative_day_num_array[i];
          if today = deadline.AddDays(-(relative_day_num)).Date then begin
//            master_id_q := biz_emsof_requests.SusceptibleTo(milestone);
//            for j := 1 to master_id_q.Count do begin
//              master_id := master_id_q.Dequeue.tostring;
//              biz_accounts.Remind(milestone,relative_day_num,deadline,biz_emsof_requests.MemberIdOfMasterId(master_id));
//              be_handled := TRUE;
//            end;
          end;
          i := i + 1;
        end;
      end;
    end;
  end;
end;

end.
