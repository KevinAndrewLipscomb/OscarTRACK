unit Class_db_medical_release_levels;

interface

uses
  Class_db;

const
  LOWEST_RELEASED_PECK_CODE = 20;

type
  TClass_db_medical_release_levels = class(TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    function BeValidForCurrentEnrollmentLevel
      (
      code: string;
      enrollment_level_description: string
      )
      : boolean;
    procedure BindListControl(target: system.object);
    function DescriptionOf(code: string): string;
  end;

implementation

uses
  kix,
  mysql.data.mysqlclient,
  system.web.ui.webcontrols;

constructor TClass_db_medical_release_levels.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

function TClass_db_medical_release_levels.BeValidForCurrentEnrollmentLevel
  (
  code: string;
  enrollment_level_description: string
  )
  : boolean;
begin
  self.Open;
  BeValidForCurrentEnrollmentLevel := '1' = mysqlcommand.Create
    (
    'select'
    + ' ('
    +   ' select TRUE'
    +   ' from enrollment_level'
    +   ' where description = "' + enrollment_level_description + '"'
    +     ' and core_ops_commitment_level_code = 1'
    + ' )'
    + ' or'
    + ' ('
    +   ' select TRUE'
    +   ' from medical_release_code_description_map'
    +   ' where code = "' + code + '"'
    +     ' and pecking_order >= (select pecking_order from medical_release_code_description_map where description = "Trainee")'
    + ' )',
    connection
    )
    .ExecuteScalar.tostring;
  self.Close;
end;

procedure TClass_db_medical_release_levels.BindListControl(target: system.object);
var
  dr: mysqldatareader;
begin
  self.Open;
  ListControl(target).items.Clear;
  ListControl(target).Items.Add(listitem.Create('-- Select --',''));
  dr := mysqlcommand.Create
    (
    'SELECT code, description from medical_release_code_description_map where be_hereafter_valid order by pecking_order',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    ListControl(target).Items.Add(listitem.Create(dr['description'].tostring,dr['code'].ToString));
  end;
  dr.Close;
  self.Close;
end;

function TClass_db_medical_release_levels.DescriptionOf(code: string): string;
begin
  self.Open;
  DescriptionOf := mysqlcommand.Create
    ('select description from medical_release_code_description_map where code = ' + code,connection).ExecuteScalar.tostring;
  self.Close;
end;

end.
