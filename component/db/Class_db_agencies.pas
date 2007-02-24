unit Class_db_agencies;

interface

uses
  Class_db;

type
  TClass_db_agencies = class(TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    procedure BindDropDownList(target: system.object);
    function NameOf(code: string): string;
  end;

implementation

uses
  borland.data.provider,
  system.web.ui.webcontrols;

constructor TClass_db_agencies.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

procedure TClass_db_agencies.BindDropDownList(target: system.object);
var
  bdr: bdpdatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  DropDownList(target).Items.Add(listitem.Create('-- Select --',''));
  bdr := Borland.Data.Provider.BdpCommand.Create
    (
    'SELECT id'
    + ' , concat(short_designator," - ",long_designator) as designator'
    + ' from agency'
    + ' where be_active = TRUE'
    + ' order by short_designator',
    connection
    )
    .ExecuteReader;
  while bdr.Read do begin
    DropDownList(target).Items.Add(listitem.Create(bdr['designator'].tostring,bdr['id'].ToString));
  end;
  bdr.Close;
  self.Close;
end;

function TClass_db_agencies.NameOf(code: string): string;
begin
  self.Open;
  NameOf := bdpcommand.Create('select name from agency_code_name_map where code = ' + code,connection).ExecuteScalar.tostring;
  self.Close;
end;

end.
