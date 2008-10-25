unit Class_db_enrollment;

interface

uses
  Class_db,
  Class_db_trail,
  system.collections;

const
  TCCI_ID = 0;
  TCCI_START_DATE = 1;
  TCCI_DESCRIPTION = 2;
  TCCI_NOTE = 3;

type
  TClass_db_enrollment = class(TClass_db)
  private
    db_trail: TClass_db_trail;
  public
    constructor Create;
    procedure BindMemberHistory
      (
      member_id: string;
      target: system.object
      );
    procedure BindTransitionRadioButtonList
      (
      member_id: string;
      tier_id: string;
      target: system.object
      );
    procedure BindUncontrolledListControl(target: system.object);
    function CodeOf(description: string): string;
    function DescriptionOf(level_code: string): string;
    function ElaborationOf(description: string): string;
    function MakeSeniorityPromotions: string;
    function NumObligedShifts(description: string): cardinal;
    function SeniorityPromotionsSince(watermark: string): queue;
    function SetLevel
      (
      new_level_code: string;
      effective_date: datetime;
      note: string;
      member_id: string;
      e_item: system.object
      )
      : boolean;
  end;

implementation

uses
  kix,
  mysql.data.mysqlclient,
  Class_db_members,
  system.web.ui.webcontrols;

constructor TClass_db_enrollment.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

procedure TClass_db_enrollment.BindMemberHistory
  (
  member_id: string;
  target: system.object
  );
begin
  self.Open;
  DataGrid(target).datasource := mysqlcommand.Create
    (
    'select enrollment_history.id as id'                    // column 0
    + ' , date_format(start_date,"%Y-%m-%d") as start_date' // column 1
    + ' , enrollment_level.description as description'      // column 2
    + ' , note'                                             // column 3
    + ' from enrollment_history'
    +   ' join member on (member.id=enrollment_history.member_id)'
    +   ' join enrollment_level on (enrollment_level.code=enrollment_history.level_code)'
    + ' where member.id = ' + member_id
    + ' order by start_date desc, enrollment_history.id desc',
    connection
    )
    .ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

procedure TClass_db_enrollment.BindTransitionRadioButtonList
  (
  member_id: string;
  tier_id: string;
  target: system.object
  );
var
  dr: mysqldatareader;
  display_html: string;
begin
  self.Open;
  RadioButtonList(target).Items.Clear;
  //
  dr := mysqlcommand.Create
    (
    'SELECT valid_next_level_code'
    + ' , description'
    + ' , elaboration'
    + ' FROM enrollment_transition'
    +   ' join enrollment_level on (enrollment_level.code=enrollment_transition.valid_next_level_code)'
    + ' where current_level_code ='
    +     ' (select level_code from enrollment_history where member_id = ' + member_id + ' order by start_date desc, end_date limit 1)'
    +   ' and'
    +     ' ('
    +       ' (required_historical_level_code is null)'
    +     ' or'
    +       ' (required_historical_level_code in (select level_code from enrollment_history where member_id = ' + member_id + '))'
    +     ' )'
    +   ' and'
    +     ' ('
    +       ' (disallowed_historical_level_code is null)'
    +     ' or'
    +       ' (disallowed_historical_level_code not in (select level_code from enrollment_history where member_id = ' + member_id + '))'
    +     ' )'
    +   ' and'
    +     ' authorized_tier_id >= ' + tier_id
    + ' order by pecking_order',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    display_html := '<b>' + dr['description'].tostring + '</b>';
    if dr['elaboration'].tostring <> EMPTY then begin
      display_html := display_html
      + '<table>'
      +   '<tr>'
      +     '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>'
      +     '<td><small><i>' + dr['elaboration'].tostring + '</i></small></td>'
      +   '</tr>'
      + '</table>';
    end;
    RadioButtonList(target).Items.Add(listitem.Create(display_html,dr['valid_next_level_code'].tostring));
  end;
  dr.Close;
  self.Close;
end;

procedure TClass_db_enrollment.BindUncontrolledListControl(target: system.object);
var
  dr: mysqldatareader;
begin
  self.Open;
  ListControl(target).items.Clear;
  ListControl(target).Items.Add(listitem.Create('-- Select --',''));
  dr := mysqlcommand.Create
    (
    'SELECT code, description from enrollment_level order by pecking_order',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    ListControl(target).Items.Add(listitem.Create(dr['description'].tostring,dr['code'].ToString));
  end;
  dr.Close;
  self.Close;
end;

function TClass_db_enrollment.ElaborationOf(description: string): string;
begin
  self.Open;
  ElaborationOf := mysqlcommand.Create
    ('select elaboration from enrollment_level where description = "' + description + '"',connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_enrollment.CodeOf(description: string): string;
begin
  self.Open;
  CodeOf := mysqlcommand.Create
    ('select code from enrollment_level where description = "' + description + '"',connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_enrollment.DescriptionOf(level_code: string): string;
begin
  self.Open;
  DescriptionOf := mysqlcommand.Create
    ('select description from enrollment_level where code = ' + level_code,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_enrollment.MakeSeniorityPromotions: string;
var
  watermark: string;
begin
  self.Open;
  watermark := mysqlcommand.Create('select max(id) from enrollment_history',connection).ExecuteScalar.tostring;
  mysqlcommand.Create
    (
    //
    // Deliberately not db_trail.Saved.
    //
    'START TRANSACTION;'
    + ' insert into enrollment_history (member_id,level_code,start_date,end_date)'
    +   ' SELECT member_id,(level_code + 1),date_add(start_date,interval 10 year),NULL'
    +     ' FROM enrollment_history'
    +     ' where end_date is null'
    +       ' and start_date <= date_sub(curdate(),interval 10 year)'
    +       ' and level_code in (2,3)'
    + ' ;'
    + ' update enrollment_history'
    +   ' set end_date = date_add(start_date,interval 10 year)'
    +     ' where end_date is null'
    +       ' and start_date <= date_sub(curdate(),interval 10 year)'
    +       ' and level_code in (2,3)'
    +       ' and id <= ' + watermark
    + ' ;'
    + ' COMMIT',
    connection
    )
    .ExecuteNonQuery;
  self.Close;
  MakeSeniorityPromotions := watermark;
end;

function TClass_db_enrollment.NumObligedShifts(description: string): cardinal;
var
  num_obliged_shifts_obj: system.object;
begin
  self.Open;
  num_obliged_shifts_obj := mysqlcommand.Create
    ('select num_shifts from enrollment_level where description = "' + description + '"',connection).ExecuteScalar;
  if num_obliged_shifts_obj <> dbnull.value then begin
    NumObligedShifts := uint32.Parse(num_obliged_shifts_obj.tostring);
  end else begin
    NumObligedShifts := 0;
  end;
  self.Close;
end;

function TClass_db_enrollment.SeniorityPromotionsSince(watermark: string): queue;
var
  dr: mysqldatareader;
  member_id_q: queue;
begin
  member_id_q := queue.Create;
  self.Open;
  dr := mysqlcommand.Create
    (
    'select member_id'
    + ' from enrollment_history'
    + ' where id > ' + watermark
    +   ' and level_code in (3,4)'
    +   ' and end_date is null',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    member_id_q.Enqueue(dr['member_id']);
  end;
  dr.Close;
  self.Close;
  SeniorityPromotionsSince := member_id_q;
end;

function TClass_db_enrollment.SetLevel
  (
  new_level_code: string;
  effective_date: datetime;
  note: string;
  member_id: string;
  e_item: system.object
  )
  : boolean;
var
  current_level_code: cardinal;
  dr: mysqldatareader;
  effective_date_string: string;
  latest_start_date: datetime;
  transaction: mysqltransaction;
begin
  SetLevel := FALSE;
  effective_date_string := effective_date.tostring('yyyy-MM-dd');
  self.Open;
  transaction := connection.BeginTransaction;
  try
    //
    dr := mysqlcommand.Create
      (
      'select start_date,level_code from enrollment_history where member_id = "' + member_id + '" and end_date is null limit 1',
      connection,
      transaction
      )
      .ExecuteReader;
    dr.Read;
    latest_start_date := datetime(dr['start_date']);
    current_level_code := uint32.Parse(dr['level_code'].tostring);
    dr.Close;
    //
    if effective_date >= latest_start_date then begin
      //
      if current_level_code in [11,12,13,14,15,16,22] then begin // advance the member's equivalent_los_start_date
        mysqlcommand.Create
          (
          db_trail.Saved
            (
            'update member'
            + ' set equivalent_los_start_date ='
            +   ' ADDDATE(equivalent_los_start_date,DATEDIFF("' + effective_date_string + '","' + latest_start_date.tostring('yyyy-MM-dd') + '"))'
            + ' where id = "' + member_id + '"'
            ),
          connection,
          transaction
          )
          .ExecuteNonquery;
      end;
      //
      mysqlcommand.Create
        (
        db_trail.Saved
          (
          'update enrollment_history'
          + ' set end_date = "' + effective_date_string + '"'
          + ' where member_id = ' + member_id
          +   ' and end_date is null'
          ),
        connection,
        transaction
        )
        .ExecuteNonQuery;
      mysqlcommand.Create
        (
        db_trail.Saved
          (
          'insert enrollment_history'
          + ' set member_id = ' + member_id
          +   ' , level_code = ' + new_level_code
          +   ' , start_date = "' + effective_date_string + '"'
          +   ' , note = "' + note + '"'
          ),
        connection,
        transaction
        )
        .ExecuteNonQuery;
      transaction.Commit;
      DataGridItem(e_item).cells[Class_db_members.TCCI_ENROLLMENT].text := DescriptionOf(new_level_code);
      SetLevel := TRUE;
    end;
  except
    transaction.Rollback;
  end;
  self.Close;
end;

end.
