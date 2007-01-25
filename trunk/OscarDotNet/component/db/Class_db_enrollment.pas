unit Class_db_enrollment;

interface

uses
  Class_db;

const
  TCCI_ID = 0;
  TCCI_START_DATE = 1;
  TCCI_DESCRIPTION = 2;

type
  TClass_db_enrollment = class(TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    procedure BindTransitionRadioButtonList
      (
      member_id: string;
      target: system.object
      );
    procedure BindMemberHistory
      (
      member_id: string;
      target: system.object
      );
    function NumObligedShifts(description: string): cardinal;
  end;

implementation

uses
  borland.data.provider,
  system.web.ui.webcontrols;

constructor TClass_db_enrollment.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
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
    + ' order by start_date desc',
    connection
    )
    .ExecuteReader;
  DataGrid(target).DataBind;
  self.Close;
end;

function TClass_db_enrollment.NumObligedShifts(description: string): cardinal;
var
  num_obliged_shifts_obj: system.object;
begin
  self.Open;
  num_obliged_shifts_obj := bdpcommand.Create
    ('select num_shifts from obligation_code_description_map where description = "' + description + '"',connection).ExecuteScalar;
  if num_obliged_shifts_obj <> nil then begin
    NumObligedShifts := uint32.Parse(num_obliged_shifts_obj.tostring);
  end else begin
    NumObligedShifts := 0; 
  end;
  self.Close;
end;

end.
