unit Class_biz_kind3s;

interface

uses
  Class_db_kind3s;

type
  TClass_biz_kind3s = class
  private
    db_kind3s: TClass_db_kind3s;
  public
    constructor Create;
    function NameOf(code: string): string;
  end;

implementation

constructor TClass_biz_kind3s.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_kind3s := TClass_db_kind3s.Create;
end;

function TClass_biz_kind3s.NameOf(code: string): string;
begin
  NameOf := db_kind3s.NameOf(code);
end;

end.
