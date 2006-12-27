unit Class_biz_agencies;

interface

uses
  Class_db_agencies;

type
  TClass_biz_agencies = class
  private
    db_agencies: TClass_db_agencies;
  public
    constructor Create;
    function NameOf(code: string): string;
  end;

implementation

constructor TClass_biz_agencies.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_agencies := TClass_db_agencies.Create;
end;

function TClass_biz_agencies.NameOf(code: string): string;
begin
  NameOf := db_agencies.NameOf(code);
end;

end.
