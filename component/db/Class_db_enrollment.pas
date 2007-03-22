unit Class_db_enrollment;

interface

uses
  Class_db,
  Class_db_trail;

const
  TCCI_ID = 0;
  TCCI_START_DATE = 1;
  TCCI_DESCRIPTION = 2;

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
      target: system.object
      );
    procedure BindUncontrolledDropDownList(target: system.object);
    function DescriptionOf(level_code: string): string;
    procedure MakeSeniorityPromotions;
    function NumObligedShifts(description: string): cardinal;
    function SetLevel
      (
      new_level_code: string;
      effective_date: datetime;
      member_id: string;
      e_item: system.object
      )
      : boolean;
  end;

implementation

uses
  borland.data.provider,
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
  DataGrid(target).datasource := bdpcommand.Create
    (
    'select enrollment_history.id as id'                                       // column 0
    + ' , date_format(start_date,"%Y-%m-%d") as start_date'                    // column 1
    + ' , enrollment_level.description as description'                         // column 2
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
  target: system.object
  );
var
  bdr: borland.data.provider.bdpdatareader;
  display_html: string;
begin
  self.Open;
  RadioButtonList(target).Items.Clear;
  //
  bdr := Borland.Data.Provider.BdpCommand.Create
    (
    'SELECT valid_next_level_code'
    + ' , description'
    + ' , elaboration'
    + ' FROM enrollment_transition'
    +   ' join enrollment_level on (enrollment_level.code=enrollment_transition.valid_next_level_code)'
    + ' where current_level_code ='
    +   ' (select level_code from enrollment_history where member_id = ' + member_id + ' order by start_date desc limit 1)'
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
    + ' order by pecking_order',
    connection
    )
    .ExecuteReader;
  while bdr.Read do begin
    display_html := '<b>' + bdr['description'].tostring + '</b>';
    if bdr['elaboration'].tostring <> system.string.EMPTY then begin
      display_html := display_html
      + '<table>'
      +   '<tr>'
      +     '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>'
      +     '<td><small><i>' + bdr['elaboration'].tostring + '</i></small></td>'
      +   '</tr>'
      + '</table>';
    end;
    RadioButtonList(target).Items.Add(listitem.Create(display_html,bdr['valid_next_level_code'].tostring));
  end;
  bdr.Close;
  self.Close;
end;

procedure TClass_db_enrollment.BindUncontrolledDropDownList(target: system.object);
var
  bdr: bdpdatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  DropDownList(target).Items.Add(listitem.Create('-- Select --',''));
  bdr := Borland.Data.Provider.BdpCommand.Create
    (
    'SELECT code, description from enrollment_level order by pecking_order',
    connection
    )
    .ExecuteReader;
  while bdr.Read do begin
    DropDownList(target).Items.Add(listitem.Create(bdr['description'].tostring,bdr['code'].ToString));
  end;
  bdr.Close;
  self.Close;
end;

function TClass_db_enrollment.DescriptionOf(level_code: string): string;
begin
  self.Open;
  DescriptionOf := bdpcommand.Create
    ('select description from enrollment_level where code = ' + level_code,connection).ExecuteScalar.tostring;
  self.Close;
end;

procedure TClass_db_enrollment.MakeSeniorityPromotions;
var
  watermark: string;
begin
  self.Open;
  watermark := bdpcommand.Create('select max(id) from enrollment_history',connection).ExecuteScalar.tostring;
  bdpcommand.Create
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
end;

function TClass_db_enrollment.NumObligedShifts(description: string): cardinal;
var
  num_obliged_shifts_obj: system.object;
begin
  self.Open;
  num_obliged_shifts_obj := bdpcommand.Create
    ('select num_shifts from enrollment_level where description = "' + description + '"',connection).ExecuteScalar;
  if num_obliged_shifts_obj <> dbnull.value then begin
    NumObligedShifts := uint32.Parse(num_obliged_shifts_obj.tostring);
  end else begin
    NumObligedShifts := 0;
  end;
  self.Close;
end;

function TClass_db_enrollment.SetLevel
  (
  new_level_code: string;
  effective_date: datetime;
  member_id: string;
  e_item: system.object
  )
  : boolean;
var
  effective_date_string: string;
  latest_start_date: datetime;
begin
  SetLevel := FALSE;
  effective_date_string := effective_date.tostring('yyyy-MM-dd');
  self.Open;
  latest_start_date := datetime
    (bdpcommand.Create('select max(start_date) from enrollment_history where member_id = ' + member_id,connection).ExecuteScalar);
  if effective_date >=  latest_start_date then begin
    bdpcommand.Create
      (
      db_trail.Saved
        (
        'START TRANSACTION;'
        + ' update enrollment_history'
        +   ' set end_date = "' + effective_date_string + '"'
        +   ' where member_id = ' + member_id
        +     ' and end_date is null'
        + ' ;'
        + ' insert into enrollment_history'
        +   ' set member_id = ' + member_id
        +     ' , level_code = ' + new_level_code
        +     ' , start_date = "' + effective_date_string + '"'
        + ' ;'
        + ' COMMIT'
        ),
      connection
      )
      .ExecuteNonQuery;
    DataGridItem(e_item).cells[Class_db_members.TCCI_ENROLLMENT].text := DescriptionOf(new_level_code);
    SetLevel := TRUE;
  end;
  self.Close;
end;

end.
