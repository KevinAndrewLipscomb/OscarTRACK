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
    procedure BindDropDownList
      (
      target: system.object;
      selected_description: string = ''
      );
    function DescriptionOf(code: string): string;
  end;

implementation

uses
  mysql.data.mysqlclient,
  system.web.ui.webcontrols;

constructor TClass_db_medical_release_levels.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

procedure TClass_db_medical_release_levels.BindDropDownList
  (
  target: system.object;
  selected_description: string = ''
  );
var
  dr: mysqldatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  if selected_description = system.string.EMPTY then begin
    DropDownList(target).Items.Add(listitem.Create('-- Select --',''));
  end;
  dr := mysql.data.mysqlclient.mysqlcommand.Create
    (
    'SELECT code, description from medical_release_code_description_map order by pecking_order',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    DropDownList(target).Items.Add(listitem.Create(dr['description'].tostring,dr['code'].ToString));
    if dr['description'].tostring = selected_description then begin
      DropDownList(target).selectedvalue := dr['code'].tostring;
    end;
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
