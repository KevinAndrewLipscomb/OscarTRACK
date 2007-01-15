unit Class_biz_leaves;

interface

uses
  Class_db_enrollment,
  Class_db_leaves;

type
  TClass_biz_leaves = class
  private
    db_enrollment: TClass_db_enrollment;
    db_leaves: TClass_db_leaves;
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
  end;

implementation

uses
  system.web.ui.webcontrols;

constructor TClass_biz_leaves.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_enrollment := TClass_db_enrollment.Create;
  db_leaves := TClass_db_leaves.Create;
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
  for num_obliged_shifts := 0 to (db_enrollment.NumObligedShifts(enrollment) - 1) do begin
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

end.
