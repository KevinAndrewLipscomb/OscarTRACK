unit Class_db_medical_release_levels;

interface

uses
  Class_db;

const
  LOWEST_RELEASED_CODE = 3;

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
  borland.data.provider,
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
  bdr: bdpdatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  if selected_description = system.string.EMPTY then begin
    DropDownList(target).Items.Add(listitem.Create('-- Select --',''));
  end;
  bdr := Borland.Data.Provider.BdpCommand.Create
    (
    'SELECT code, description from medical_release_code_description_map order by pecking_order',
    connection
    )
    .ExecuteReader;
  while bdr.Read do begin
    DropDownList(target).Items.Add(listitem.Create(bdr['description'].tostring,bdr['code'].ToString));
    if bdr['description'].tostring = selected_description then begin
      DropDownList(target).selectedvalue := bdr['code'].tostring;
    end;
  end;
  bdr.Close;
  self.Close;
end;

function TClass_db_medical_release_levels.DescriptionOf(code: string): string;
begin
  self.Open;
  DescriptionOf := bdpcommand.Create
    ('select description from medical_release_code_description_map where code = ' + code,connection).ExecuteScalar.tostring;
  self.Close;
end;

end.
