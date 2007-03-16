unit Class_db_leaves;

interface

uses
  Class_db,
  Class_db_trail;

const
  TCCI_ID = 0;
  TCCI_START_DATE = 1;
  TCCI_END_DATE = 2;
  TCCI_KIND_OF_LEAVE = 3;
  TCCI_NOTE = 4;

type
  TClass_db_leaves = class(TClass_db)
  private
    db_trail: TClass_db_trail;
  public
    constructor Create;
    procedure BindKindDropDownList(target: system.object);
    procedure BindMemberRecords
      (
      member_id: string;
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object
      );
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
  borland.data.provider,
  system.web.ui.webcontrols;

constructor TClass_db_leaves.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

procedure TClass_db_leaves.BindKindDropDownList(target: system.object);
var
  bdr: borland.data.provider.bdpdatareader;
begin
  self.Open;
  DropDownList(target).Items.Clear;
  DropDownList(target).Items.Add(listitem.Create('-- Select --',''));
  //
  bdr := Borland.Data.Provider.BdpCommand.Create
    ('SELECT code,description FROM kind_of_leave_code_description_map ORDER BY description',connection).ExecuteReader;
  while bdr.Read do begin
    DropDownList(target).Items.Add(listitem.Create(bdr['description'].tostring,bdr['code'].tostring));
  end;
  bdr.Close;
  self.Close;
end;

procedure TClass_db_leaves.BindMemberRecords
  (
  member_id: string;
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object
  );
begin
  self.Open;
  if be_sort_order_ascending then begin
    sort_order := sort_order.Replace('%',' asc');
  end else begin
    sort_order := sort_order.Replace('%',' desc');
  end;
  DataGrid(target).datasource := bdpcommand.Create
    (
    'select leave_of_absence.id as id'                                     // column 0
    + ' , date_format(start_date,"%Y-%m") as start_date'                   // column 1
    + ' , date_format(end_date,"%Y-%m") as end_date'                       // column 2
    + ' , kind_of_leave_code_description_map.description as kind_of_leave' // column 3
    + ' , num_obliged_shifts'                                              // column 4
    + ' , note'                                                            // column 5
    + ' from leave_of_absence'
    +   ' join member on (member.id=leave_of_absence.member_id)'
    +   ' join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)'
    + ' where member.id = ' + member_id
    + ' order by ' + sort_order,
    connection
    )
    .ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

procedure TClass_db_leaves.Delete(id: string);
begin
  self.Open;
  bdpcommand.Create(db_trail.Saved('delete from leave_of_absence where id = ' + id),connection).ExecuteNonQuery;
  self.Close;
end;

procedure TClass_db_leaves.DescribeThisAndNextMonthForMember
  (
  member_id: string;
  out this_month_description: string;
  out next_month_description: string;
  null_description: string
  );
var
  this_month_description_obj: system.object;
  next_month_description_obj: system.object;
begin
  self.Open;
  this_month_description_obj := bdpcommand.Create
    (
    'select description'
    + ' from leave_of_absence'
    +   ' join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)'
    + ' where member_id = ' + member_id
    +   ' and start_date <= CONCAT(DATE_FORMAT(CURDATE(),"%Y-%m-"),"01")'
    +   ' and end_date >= LAST_DAY(CURDATE())',
    connection
    )
    .ExecuteScalar;
  if this_month_description_obj = nil then begin
    this_month_description := null_description;
  end else begin
    this_month_description := this_month_description_obj.tostring;
  end;
  next_month_description_obj := bdpcommand.Create
    (
    'select description'
    + ' from leave_of_absence'
    +   ' join kind_of_leave_code_description_map on (kind_of_leave_code_description_map.code=leave_of_absence.kind_of_leave_code)'
    + ' where member_id = ' + member_id
    +   ' and start_date <= CONCAT(DATE_FORMAT(DATE_ADD(CURDATE(),INTERVAL 1 MONTH),"%Y-%m-"),"01")'
    +   ' and end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL 1 MONTH))',
    connection
    )
    .ExecuteScalar;
  if next_month_description_obj = nil then begin
    next_month_description := null_description;
  end else begin
    next_month_description := next_month_description_obj.tostring;
  end;
  self.Close;
end;

function TClass_db_leaves.DescriptionOf(code: string): string;
begin
  self.Open;
  DescriptionOf :=bdpcommand.Create
    ('SELECT description FROM kind_of_leave_code_description_map WHERE code = ' + code,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_leaves.EndDateOf(id: string): datetime;
begin
  self.Open;
  EndDateOf := datetime(bdpcommand.Create('select end_date from leave_of_absence where id = ' + id,connection).ExecuteScalar);
  self.Close;
end;

procedure TClass_db_leaves.Grant
  (
  member_id: string;
  relative_start_month: string;
  relative_end_month: string;
  kind_of_leave_code: string;
  num_obligated_shifts: string;
  note: string
  );
begin
  self.Open;
  bdpcommand.Create
    (
    db_trail.Saved
      (
      'insert into leave_of_absence'
      + ' set member_id = ' + member_id
      + ' , kind_of_leave_code = ' + kind_of_leave_code
      + ' , start_date = DATE_ADD(DATE_FORMAT(CURDATE(),"%Y-%m-01"),INTERVAL ' + relative_start_month + ' MONTH)'
      + ' , end_date = LAST_DAY(DATE_ADD(CURDATE(),INTERVAL ' + relative_end_month + ' MONTH))'
      + ' , num_obliged_shifts = ' + num_obligated_shifts
      + ' , note = "' + note + '"'
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

function TClass_db_leaves.KindOfLeaveCodeOf(id: string): string;
begin
  self.Open;
  KindOfLeaveCodeOf := bdpcommand.Create
    ('select kind_of_leave_code from leave_of_absence where id = ' + id,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_leaves.MemberIdOf(id: string): string;
begin
  self.Open;
  MemberIdOf := bdpcommand.Create('select member_id from leave_of_absence where id = ' + id,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_leaves.NoteOf(id: string): string;
begin
  self.Open;
  NoteOf := bdpcommand.Create('select note from leave_of_absence where id = ' + id,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_leaves.NumObligedShiftsOf(id: string): cardinal;
begin
  self.Open;
  NumObligedShiftsOf := uint32.Parse
    (bdpcommand.Create('select num_obliged_shifts from leave_of_absence where id = ' + id,connection).ExecuteScalar.tostring);
  self.Close;
end;

function TClass_db_leaves.StartDateOf(id: string): datetime;
begin
  self.Open;
  StartDateOf := datetime(bdpcommand.Create('select start_date from leave_of_absence where id = ' + id,connection).ExecuteScalar);
  self.Close;
end;

function TClass_db_leaves.TcciOfId: cardinal;
begin
  TcciOfId := TCCI_ID;
end;

end.
