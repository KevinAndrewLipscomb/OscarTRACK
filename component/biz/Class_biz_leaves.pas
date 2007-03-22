unit Class_biz_leaves;

interface

uses
  Class_db_enrollment,
  Class_db_leaves,
  Class_biz_notifications;

type
  TClass_biz_leaves = class
  private
    db_enrollment: TClass_db_enrollment;
    db_leaves: TClass_db_leaves;
    biz_notifications: TClass_biz_notifications;
  public
    constructor Create;
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
    procedure BindKindDropDownList(target: system.object);
    procedure BindEndMonthDropDownList(target: system.object);
    procedure BindNumObligatedShiftsDropDownList
      (
      enrollment: string;
      target: system.object
      );
    procedure BindStartMonthDropDownList(target: system.object);
    procedure Delete(id: string);
    procedure DescribeThisAndNextMonthForMember
      (
      member_id: string;
      out this_month_description: string;
      out next_month_description: string;
      null_description: string
      );
    function DescriptionOf(code: string): string;
    function EndDateOf(id: string): datetime;
    procedure Grant
      (
      member_id: string;
      relative_start_month: string;
      relative_end_month: string;
      kind_of_leave_code: string;
      num_obligated_shifts: string;
      note: string
      );
    function KindOfLeaveCodeOf(id: string): string;
    function MemberIdOf(id: string): string;
    function NoteOf(id: string): string;
    function NumObligedShiftsOf(id: string): cardinal;
    function StartDateOf(id: string): datetime;
    function TcciOfId: cardinal;
  end;

implementation

uses
  Class_biz_members,
  system.web.ui.webcontrols;

constructor TClass_biz_leaves.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_enrollment := TClass_db_enrollment.Create;
  db_leaves := TClass_db_leaves.Create;
  biz_notifications := TClass_biz_notifications.Create;
end;

function TClass_biz_leaves.BeValid
  (
  start_month: string;
  end_month: string
  )
  : boolean;
begin
  BeValid := (uint32.Parse(start_month) <= uint32.Parse(end_month));
end;

procedure TClass_biz_leaves.BindEndMonthDropDownList(target: system.object);
var
  month_offset: cardinal;
begin
  DropDownList(target).Items.Clear;
  DropDownList(target).Items.Add(listitem.Create('-- Select --',''));
  //
  for month_offset := 0 to 11 do begin
    DropDownList(target).Items.Add
      (listitem.Create(datetime.today.AddMonths(month_offset).tostring('MMM yyyy'),month_offset.tostring));
  end;
end;

procedure TClass_biz_leaves.BindKindDropDownList(target: system.object);
begin
  db_leaves.BindKindDropDownList(target);
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

procedure TClass_biz_leaves.BindStartMonthDropDownList(target: system.object);
var
  month_offset: cardinal;
begin
  DropDownList(target).Items.Clear;
  DropDownList(target).Items.Add(listitem.Create('-- Select --',''));
  //
  for month_offset := 0 to 11 do begin
    DropDownList(target).Items.Add(listitem.Create(datetime.today.AddMonths(month_offset).tostring('MMM yyyy'),month_offset.tostring));
  end;
end;

procedure TClass_biz_leaves.Delete(id: string);
var
  biz_members: TClass_biz_members;
  member_id: string;
begin
  //
  biz_members := TClass_biz_members.Create;
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

procedure TClass_biz_leaves.Grant
  (
  member_id: string;
  relative_start_month: string;
  relative_end_month: string;
  kind_of_leave_code: string;
  num_obligated_shifts: string;
  note: string
  );
var
  biz_members: TClass_biz_members;
begin
  //
  biz_members := TClass_biz_members.Create;
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

function TClass_biz_leaves.KindOfLeaveCodeOf(id: string): string;
begin
  KindOfLeaveCodeOf := db_leaves.KindOfLeaveCodeOf(id);
end;

function TClass_biz_leaves.MemberIdOf(id: string): string;
begin
  MemberIdOf := db_leaves.MemberIdOf(id);
end;

function TClass_biz_leaves.NoteOf(id: string): string;
begin
  NoteOf := db_leaves.NoteOf(id);
end;

function TClass_biz_leaves.NumObligedShiftsOf(id: string): cardinal;
begin
  NumObligedShiftsOf := db_leaves.NumObligedShiftsOf(id);
end;

function TClass_biz_leaves.StartDateOf(id: string): datetime;
begin
  StartDateOf := db_leaves.StartDateOf(id);
end;

function TClass_biz_leaves.TcciOfId: cardinal;
begin
  TcciOfId := db_leaves.TcciOfId;
end;

end.
