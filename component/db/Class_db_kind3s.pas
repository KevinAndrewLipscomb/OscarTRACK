unit Class_db_kind3s;

interface

uses
  borland.data.provider,
  Class_db;

type
  TClass_db_kind3s = class(TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    function NameOf(code: string): string;
  end;

implementation

constructor TClass_db_kind3s.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

function TClass_db_kind3s.NameOf(code: string): string;
begin
  self.Open;
  NameOf := bdpcommand.Create('select name from kind3_code_name_map where code = ' + code,connection).ExecuteScalar.tostring;
  self.Close;
end;

end.
