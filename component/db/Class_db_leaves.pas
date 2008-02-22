unit Class_db_leaves;

interface

uses
  Class_db,
  Class_db_trail,
  system.collections;

const
  TCCI_ID = 0;
  TCCI_START_DATE = 1;
  TCCI_END_DATE = 2;
  TCCI_KIND_OF_LEAVE = 3;
  TCCI_NUM_SHIFTS = 4;
  TCCI_NOTE = 5;

type
  TClass_db_leaves = class(TClass_db)
  private
    db_trail: TClass_db_trail;
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
    procedure BindKindDropDownList
      (
      target: system.object;
      use_select: boolean = TRUE
      );
    procedure BindMemberRecords
      (
      member_id: string;
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object
      );
    procedure Change
      (
      id: string;
      new_relative_start_month: string;
      new_relative_end_month: string;
      new_kind_of_leave_code: string;
      new_num_obligated_shifts: string;
      new_note: string
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
    function EndMonthOf(leave_item: system.object): string;
    function ExpiredYesterday: queue;
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
    function MemberIdOf(id: string): string;
    function NoteOf(id: string): string;
    function NoteOfTcc(leave_item: system.object): string;
    function NumObligedShiftsOf(id: string): cardinal;
    function NumObligedShiftsOfTcc(leave_item: system.object): string;
    function StartDateOf(id: string): datetime;
    function StartMonthOf(leave_item: system.object): string;
    function TcciOfId: cardinal;
  end;

implementation

uses
  mysql.data.mysqlclient,
  kix,
  system.web.ui.webcontrols;

constructor TClass_db_leaves.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

function TClass_db_leaves.BeOverlap
  (
  member_id: string;
  relative_start_month: string;
  relative_end_month: string;
  id: string = ''
  )
  : boolean;
var
  cmdtext: string;
begin
  cmdtext := 'select 1'
  + ' from leave_of_absence'
  + ' where'
  +     ' member_id = ' + member_id
  +   ' and'
  +   ' ('
  +     ' ('
  +       ' start_date <= DATE_ADD(DATE_FORMAT(CURDATE(),"%Y-%m-01"),INTERVAL ' + relative_start_month + ' MONTH)'
  +     ' and'
  +       ' end_date >= DATE_ADD(DATE_FORMAT(CURDATE(),"%Y-%m-01"),INTERVAL ' + relative_start_month + ' MONTH)'
  +     ' )'
  +   ' or'
  +     ' ('
  +       ' start_date <= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL ' + relative_end_month + ' MONTH))'
  +     ' and'
  +       ' end_date >= LAST_DAY(DATE_ADD(CURDATE(),INTERVAL ' + relative_end_month + ' MONTH))'
  +     ' )'
  +   ' )';
  if id <> system.string.EMPTY then begin
    cmdtext := cmdtext + ' and id <> ' + id;
  end;
  cmdtext := cmdtext + ' limit 1';
  self.Open;
  BeOverlap := (mysqlcommand.Create(cmdtext,connection).ExecuteScalar <> nil);
  self.Close;
end;

procedure TClass_db_leaves.BindKindDropDownList
  (
  target: system.object;
  use_select: boolean = TRUE
  );
var
  dr: mysql.data.mysqlclient.mysqldatareader;
begin
  self.Open;
  DropDownList(target).Items.Clear;
  if use_select then begin
    DropDownList(target).Items.Add(listitem.Create('-- Select --',''));
  end;
  //
  dr := mysql.data.mysqlclient.mysqlcommand.Create
    ('SELECT code,description FROM kind_of_leave_code_description_map ORDER BY description',connection).ExecuteReader;
  while dr.Read do begin
    DropDownList(target).Items.Add(listitem.Create(dr['description'].tostring,dr['code'].tostring));
  end;
  dr.Close;
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
  DataGrid(target).datasource := mysqlcommand.Create
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

procedure TClass_db_leaves.Change
  (
  id: string;
  new_relative_start_month: string;
  new_relative_end_month: string;
  new_kind_of_leave_code: string;
  new_num_obligated_shifts: string;
  new_note: string
  );
begin
  self.Open;
  mysqlcommand.Create
    (
    db_trail.Saved
      (
      'update leave_of_absence'
      + ' set start_date = DATE_ADD(DATE_FORMAT(CURDATE(),"%Y-%m-01"),INTERVAL ' + new_relative_start_month + ' MONTH)'
      + ' , end_date = LAST_DAY(DATE_ADD(CURDATE(),INTERVAL ' + new_relative_end_month + ' MONTH))'
      + ' , kind_of_leave_code = ' + new_kind_of_leave_code
      + ' , num_obliged_shifts = ' + new_num_obligated_shifts
      + ' , note = "' + new_note + '"'
      + ' where id = ' + id
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

procedure TClass_db_leaves.Delete(id: string);
begin
  self.Open;
  mysqlcommand.Create(db_trail.Saved('delete from leave_of_absence where id = ' + id),connection).ExecuteNonQuery;
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
  this_month_description_obj := mysqlcommand.Create
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
  next_month_description_obj := mysqlcommand.Create
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
  DescriptionOf :=mysqlcommand.Create
    ('SELECT description FROM kind_of_leave_code_description_map WHERE code = ' + code,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_leaves.EndDateOf(id: string): datetime;
begin
  self.Open;
  EndDateOf := datetime(mysqlcommand.Create('select end_date from leave_of_absence where id = ' + id,connection).ExecuteScalar);
  self.Close;
end;

function TClass_db_leaves.EndMonthOf(leave_item: system.object): string;
begin
  EndMonthOf := Safe(DataGridItem(leave_item).cells[TCCI_END_DATE].text,HYPHENATED_ALPHANUM);
end;

function TClass_db_leaves.ExpiredYesterday: queue;
var
  dr: mysqldatareader;
  member_id_q: queue;
begin
  member_id_q := queue.Create;
  self.Open;
  dr := mysqlcommand.Create
    ('select member_id from leave_of_absence where end_date = (CURDATE() - INTERVAL 1 DAY)',connection).ExecuteReader;
  while dr.Read do begin
    member_id_q.Enqueue(dr['member_id']);
  end;
  dr.Close;
  self.Close;
  ExpiredYesterday := member_id_q;
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
  mysqlcommand.Create
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

function TClass_db_leaves.IdOf(leave_item: system.object): string;
begin
  IdOf := Safe(DataGridItem(leave_item).cells[TCCI_ID].text,NUM);
end;

function TClass_db_leaves.KindOf(leave_item: system.object): string;
begin
  KindOf := Safe(DataGridItem(leave_item).cells[TCCI_KIND_OF_LEAVE].text,ALPHA);
end;

function TClass_db_leaves.KindOfLeaveCodeOf(id: string): string;
begin
  self.Open;
  KindOfLeaveCodeOf := mysqlcommand.Create
    ('select kind_of_leave_code from leave_of_absence where id = ' + id,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_leaves.MemberIdOf(id: string): string;
begin
  self.Open;
  MemberIdOf := mysqlcommand.Create('select member_id from leave_of_absence where id = ' + id,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_leaves.NoteOf(id: string): string;
begin
  self.Open;
  NoteOf := mysqlcommand.Create('select note from leave_of_absence where id = ' + id,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_leaves.NoteOfTcc(leave_item: system.object): string;
begin
  if DataGridItem(leave_item).cells[TCCI_NOTE].text = '&nbsp;' then begin
    NoteOfTcc := system.string.EMPTY;
  end else begin
    NoteOfTcc := Safe(DataGridItem(leave_item).cells[TCCI_NOTE].text,NARRATIVE);
  end;
end;

function TClass_db_leaves.NumObligedShiftsOf(id: string): cardinal;
begin
  self.Open;
  NumObligedShiftsOf := uint32.Parse
    (mysqlcommand.Create('select num_obliged_shifts from leave_of_absence where id = ' + id,connection).ExecuteScalar.tostring);
  self.Close;
end;

function TClass_db_leaves.NumObligedShiftsOfTcc(leave_item: system.object): string;
begin
  NumObligedShiftsOfTcc := Safe(DataGridItem(leave_item).cells[TCCI_NUM_SHIFTS].text,NUM);
end;

function TClass_db_leaves.StartDateOf(id: string): datetime;
begin
  self.Open;
  StartDateOf := datetime(mysqlcommand.Create('select start_date from leave_of_absence where id = ' + id,connection).ExecuteScalar);
  self.Close;
end;

function TClass_db_leaves.StartMonthOf(leave_item: system.object): string;
begin
  StartMonthOf := Safe(DataGridItem(leave_item).cells[TCCI_START_DATE].text,HYPHENATED_ALPHANUM);
end;

function TClass_db_leaves.TcciOfId: cardinal;
begin
  TcciOfId := TCCI_ID;
end;

end.
