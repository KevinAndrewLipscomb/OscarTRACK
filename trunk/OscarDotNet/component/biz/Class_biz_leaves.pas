unit Class_biz_leaves;

interface

uses
  Class_db_enrollment,
  Class_db_leaves,
  Class_biz_members,
  Class_biz_notifications;

type
  relativity_type =
    (
    PAST,
    FORMATIVE,
    ESTABLISHED,
    FUTURE
    );
  TClass_biz_leaves = class
  private
    db_enrollment: TClass_db_enrollment;
    db_leaves: TClass_db_leaves;
    biz_members: TClass_biz_members;
    biz_notifications: TClass_biz_notifications;
  public
    constructor Create;
    function BeOverlap
      (
      member_id: string;
      relative_start_month: string;
      relative_end_month: string;
      id: string = ''
      )
      : boolean;
    function BeValid
      (
      start_month: string;
      end_month: string
      )
      : boolean;
    procedure BindMemberRecords
      (
      member_id: string;
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object
      );
    procedure BindKindDropDownList
      (
      target: system.object;
      use_select: boolean = TRUE
      );
    procedure BindEndMonthDropDownList
      (
      target: system.object;
      use_select: boolean = TRUE;
      include_last_month: boolean = FALSE
      );
    procedure BindNumObligatedShiftsDropDownList
      (
      enrollment: string;
      target: system.object
      );
    procedure BindStartMonthDropDownList
      (
      target: system.object;
      use_select: boolean = TRUE
      );
    procedure Delete(id: string);
    procedure DescribeThisAndNextMonthForMember
      (
      member_id: string;
      out this_month_description: string;
      out next_month_description: string;
      null_description: string
      );
    procedure Change
      (
      id: string;
      member_id: string;
      old_start_month: string;
      old_end_month: string;
      old_kind_of_leave: string;
      old_num_obliged_shifts: string;
      old_note: string;
      new_relative_start_month: string;
      new_relative_end_month: string;
      new_kind_of_leave_code: string;
      new_num_obligated_shifts: string;
      new_note: string
      );
    function DescriptionOf(code: string): string;
    function EndDateOf(id: string): datetime;
    function EndMonthOf(leave_item: system.object): string;
    procedure Grant
      (
      member_id: string;
      relative_start_month: string;
      relative_end_month: string;
      kind_of_leave_code: string;
      num_obligated_shifts: string;
      note: string
      );
    function IdOf(leave_item: system.object): string;
    function KindOf(leave_item: system.object): string;
    function KindOfLeaveCodeOf(id: string): string;
    procedure MakeLeaveExpirationNotifications;
    function MemberIdOf(id: string): string;
    function NoteOf(id: string): string;
    function NoteOfTcc(leave_item: system.object): string;
    function NumObligedShiftsOf(id: string): cardinal;
    function NumObligedShiftsOfTcc(leave_item: system.object): string;
    function RelativityOf
      (
      start_month: string;
      end_month: string
      )
      : relativity_type;
    function StartDateOf(id: string): datetime;
    function StartMonthOf(leave_item: system.object): string;
    function TcciOfId: cardinal;
  end;

implementation

uses
  system.collections,
  system.web.ui.webcontrols;

constructor TClass_biz_leaves.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_enrollment := TClass_db_enrollment.Create;
  db_leaves := TClass_db_leaves.Create;
  biz_members := TClass_biz_members.Create;
  biz_notifications := TClass_biz_notifications.Create;
end;

function TClass_biz_leaves.BeOverlap
  (
  member_id: string;
  relative_start_month: string;
  relative_end_month: string;
  id: string = ''
  )
  : boolean;
begin
  BeOverlap := db_leaves.BeOverlap(member_id,relative_start_month,relative_end_month,id);
end;

function TClass_biz_leaves.BeValid
  (
  start_month: string;
  end_month: string
  )
  : boolean;
begin
  BeValid := (int32.Parse(start_month) <= int32.Parse(end_month));
    //
    // The month values may be negative if we are editing a leave that started in a prior month and/or changing the end month to
    // last month.
    //
end;

procedure TClass_biz_leaves.BindEndMonthDropDownList
  (
  target: system.object;
  use_select: boolean = TRUE;
  include_last_month: boolean = FALSE
  );
var
  lowest_offset: integer;
  month_offset: integer;
begin
  DropDownList(target).Items.Clear;
  if use_select then begin
    DropDownList(target).Items.Add(listitem.Create('-- Select --',''));
  end;
  //
  if include_last_month then begin
    lowest_offset := -1;
  end else begin
    lowest_offset := 0;
  end;
  for month_offset := lowest_offset to 11 do begin
    DropDownList(target).Items.Add
      (listitem.Create(datetime.today.AddMonths(month_offset).tostring('MMM yyyy'),month_offset.tostring));
  end;
end;

procedure TClass_biz_leaves.BindKindDropDownList
  (
  target: system.object;
  use_select: boolean = TRUE
  );
begin
  db_leaves.BindKindDropDownList(target,use_select);
end;

procedure TClass_biz_leaves.BindMemberRecords
  (
  member_id: string;
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object
  );
begin
  db_leaves.BindMemberRecords(member_id,sort_order,be_sort_order_ascending,target);
end;

procedure TClass_biz_leaves.BindNumObligatedShiftsDropDownList
  (
  enrollment: string;
  target: system.object
  );
var
  num_obliged_shifts: cardinal;
begin
  DropDownList(target).Items.Clear;
  DropDownList(target).Items.Add(listitem.Create('-- Select --',''));
  //
  for num_obliged_shifts := 0 to math.Max(0,(integer(db_enrollment.NumObligedShifts(enrollment)) - 1)) do begin
    // The integer() cast and the use of math.Max are workarounds to what I suspect should be a runtime overflow bug.
    DropDownList(target).Items.Add(listitem.Create(num_obliged_shifts.tostring,num_obliged_shifts.tostring));
  end;
end;

procedure TClass_biz_leaves.BindStartMonthDropDownList
  (
  target: system.object;
  use_select: boolean = TRUE
  );
var
  month_offset: cardinal;
begin
  DropDownList(target).Items.Clear;
  if use_select then begin
    DropDownList(target).Items.Add(listitem.Create('-- Select --',''));
  end;
  //
  for month_offset := 0 to 11 do begin
    DropDownList(target).Items.Add(listitem.Create(datetime.today.AddMonths(month_offset).tostring('MMM yyyy'),month_offset.tostring));
  end;
end;

procedure TClass_biz_leaves.Change
  (
  id: string;
  member_id: string;
  old_start_month: string;
  old_end_month: string;
  old_kind_of_leave: string;
  old_num_obliged_shifts: string;
  old_note: string;
  new_relative_start_month: string;
  new_relative_end_month: string;
  new_kind_of_leave_code: string;
  new_num_obligated_shifts: string;
  new_note: string
  );
const
  AFFIRMATIVE_CHANGE_INDICATOR = '  <==';
var
  change_indicator_end_month: string;
  change_indicator_kind_of_leave: string;
  change_indicator_note: string;
  change_indicator_num_obliged_shifts: string;
  change_indicator_start_month: string;
  new_end_month: string;
  new_kind_of_leave: string;
  new_start_month: string;
begin
  //
  db_leaves.Change
    (
    id,
    new_relative_start_month,
    new_relative_end_month,
    new_kind_of_leave_code,
    new_num_obligated_shifts,
    new_note
    );
  //
  new_start_month := datetime.today.AddMonths(int32.Parse(new_relative_start_month)).tostring('MMM yyyy');
    // new_relative_start_month may be negative if we are changing an existing leave that started in a prior month
  new_end_month := datetime.today.AddMonths(int32.Parse(new_relative_end_month)).tostring('MMM yyyy');
    // new_relative_end_month may be negative if we are changing the end month to last month
  new_kind_of_leave := DescriptionOf(new_kind_of_leave_code);
  //
  change_indicator_start_month := EMPTY;
  change_indicator_end_month := EMPTY;
  change_indicator_kind_of_leave := EMPTY;
  change_indicator_num_obliged_shifts := EMPTY;
  change_indicator_note := EMPTY;
  if old_start_month <> new_start_month then begin
    change_indicator_start_month := AFFIRMATIVE_CHANGE_INDICATOR;
  end;
  if old_end_month <> new_end_month then begin
    change_indicator_end_month := AFFIRMATIVE_CHANGE_INDICATOR;
  end;
  if old_kind_of_leave <> new_kind_of_leave then begin
    change_indicator_kind_of_leave := AFFIRMATIVE_CHANGE_INDICATOR;
  end;
  if old_num_obliged_shifts <> new_num_obligated_shifts then begin
    change_indicator_num_obliged_shifts := AFFIRMATIVE_CHANGE_INDICATOR;
  end;
  if old_note <> new_note then begin
    change_indicator_note := AFFIRMATIVE_CHANGE_INDICATOR;
  end;
  //
  biz_notifications.IssueForLeaveChanged
    (
    member_id,
    biz_members.FirstNameOfMemberId(member_id),
    biz_members.LastNameOfMemberId(member_id),
    biz_members.CadNumOfMemberId(member_id),
    old_start_month,
    old_end_month,
    old_kind_of_leave,
    old_num_obliged_shifts,
    old_note,
    new_start_month,
    new_end_month,
    new_kind_of_leave,
    new_num_obligated_shifts,
    new_note,
    change_indicator_start_month,
    change_indicator_end_month,
    change_indicator_kind_of_leave,
    change_indicator_num_obliged_shifts,
    change_indicator_note
    );
  //
end;

procedure TClass_biz_leaves.Delete(id: string);
var
  member_id: string;
begin
  //
  member_id := MemberIdOf(id);
  biz_notifications.IssueForLeaveDeleted
    (
    member_id,
    biz_members.FirstNameOfMemberId(member_id),
    biz_members.LastNameOfMemberId(member_id),
    biz_members.CadNumOfMemberId(member_id),
    StartDateOf(id).tostring('MMM yyyy'),
    EndDateOf(id).tostring('MMM yyyy'),
    DescriptionOf(KindOfLeaveCodeOf(id)),
    NumObligedShiftsOf(id).tostring,
    NoteOf(id)
    );
  //
  db_leaves.Delete(id);
  //
end;

procedure TClass_biz_leaves.DescribeThisAndNextMonthForMember
  (
  member_id: string;
  out this_month_description: string;
  out next_month_description: string;
  null_description: string
  );
begin
  db_leaves.DescribeThisAndNextMonthForMember(member_id,this_month_description,next_month_description,null_description);
end;

function TClass_biz_leaves.DescriptionOf(code: string): string;
begin
  DescriptionOf := db_leaves.DescriptionOf(code);
end;

function TClass_biz_leaves.EndDateOf(id: string): datetime;
begin
  EndDateOf := db_leaves.EndDateOf(id);
end;

function TClass_biz_leaves.EndMonthOf(leave_item: system.object): string;
begin
  EndMonthOf := db_leaves.EndMonthOf(leave_item);
end;

procedure TClass_biz_leaves.Grant
  (
  member_id: string;
  relative_start_month: string;
  relative_end_month: string;
  kind_of_leave_code: string;
  num_obligated_shifts: string;
  note: string
  );
begin
  //
  db_leaves.Grant(member_id,relative_start_month,relative_end_month,kind_of_leave_code,num_obligated_shifts,note);
  //
  biz_notifications.IssueForLeaveGranted
    (
    member_id,
    biz_members.FirstNameOfMemberId(member_id),
    biz_members.LastNameOfMemberId(member_id),
    biz_members.CadNumOfMemberId(member_id),
    datetime.today.AddMonths(uint32.Parse(relative_start_month)).tostring('MMM yyyy'),
    datetime.today.AddMonths(uint32.Parse(relative_end_month)).tostring('MMM yyyy'),
    DescriptionOf(kind_of_leave_code),
    num_obligated_shifts,
    note
    );
  //
end;

function TClass_biz_leaves.IdOf(leave_item: system.object): string;
begin
  IdOf := db_leaves.IdOf(leave_item);
end;

function TClass_biz_leaves.KindOf(leave_item: system.object): string;
begin
  KindOf := db_leaves.KindOf(leave_item);
end;

function TClass_biz_leaves.KindOfLeaveCodeOf(id: string): string;
begin
  KindOfLeaveCodeOf := db_leaves.KindOfLeaveCodeOf(id);
end;

procedure TClass_biz_leaves.MakeLeaveExpirationNotifications;
var
  i: cardinal;
  member_id: string;
  member_id_q: queue;
begin
  //
  member_id_q := db_leaves.ExpiredYesterday;
  for i := 1 to member_id_q.Count do begin
    member_id := member_id_q.Dequeue.tostring;
    if not BeOverlap(member_id,'0','0') then begin
      //
      // Back-to-back leaves are ruled out, so we won't be misleading anyone by declaring that this person's (generic) leave has
      // expired.
      //
      biz_notifications.IssueForLeaveExpiredYesterday
        (
        member_id,
        biz_members.FirstNameOfMemberId(member_id),
        biz_members.LastNameOfMemberId(member_id),
        biz_members.CadNumOfMemberId(member_id)
        );
    end;
    //
  end;
end;

function TClass_biz_leaves.MemberIdOf(id: string): string;
begin
  MemberIdOf := db_leaves.MemberIdOf(id);
end;

function TClass_biz_leaves.NoteOf(id: string): string;
begin
  NoteOf := db_leaves.NoteOf(id);
end;

function TClass_biz_leaves.NoteOfTcc(leave_item: system.object): string;
begin
  NoteOfTcc := db_leaves.NoteOfTcc(leave_item);
end;

function TClass_biz_leaves.NumObligedShiftsOf(id: string): cardinal;
begin
  NumObligedShiftsOf := db_leaves.NumObligedShiftsOf(id);
end;

function TClass_biz_leaves.NumObligedShiftsOfTcc(leave_item: system.object): string;
begin
  NumObligedShiftsOfTcc := db_leaves.NumObligedShiftsOfTcc(leave_item);
end;

function TClass_biz_leaves.RelativityOf
  (
  start_month: string;
  end_month: string
  )
  : relativity_type;
var
  this_month: string;
begin
  this_month := datetime.Today.tostring('yyyy-MM');
  if end_month < this_month then begin
    RelativityOf := PAST;
  end else if start_month > this_month then begin
    RelativityOf := FUTURE;
  end else if start_month = this_month then begin
    RelativityOf := FORMATIVE;
  end else begin
    RelativityOf := ESTABLISHED;
  end;
end;

function TClass_biz_leaves.StartDateOf(id: string): datetime;
begin
  StartDateOf := db_leaves.StartDateOf(id);
end;

function TClass_biz_leaves.StartMonthOf(leave_item: system.object): string;
begin
  StartMonthOf := db_leaves.StartMonthOf(leave_item);
end;

function TClass_biz_leaves.TcciOfId: cardinal;
begin
  TcciOfId := db_leaves.TcciOfId;
end;

end.
