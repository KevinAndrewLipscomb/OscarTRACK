unit Class_biz_agencys;

interface

uses
  Class_db_agencys;

type
  TClass_biz_agencys = class
  private
    db_agencys: TClass_db_agencys;
  public
    constructor Create;
    function NameOf(code: string): string;
  end;

implementation

constructor TClass_biz_agencys.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_agencys := TClass_db_agencys.Create;
end;

function TClass_biz_agencys.NameOf(code: string): string;
begin
  NameOf := db_agencys.NameOf(code);
end;

end.
