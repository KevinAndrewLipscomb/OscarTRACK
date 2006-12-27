unit Class_db_agencies;

interface

uses
  borland.data.provider,
  Class_db;

type
  TClass_db_agencies = class(TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    function NameOf(code: string): string;
  end;

implementation

constructor TClass_db_agencies.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

function TClass_db_agencies.NameOf(code: string): string;
begin
  self.Open;
  NameOf := bdpcommand.Create('select name from agency_code_name_map where code = ' + code,connection).ExecuteScalar.tostring;
  self.Close;
end;

end.
