unit Class_biz_kind2s;

interface

uses
  Class_db_kind2s;

type
  TClass_biz_kind2s = class
  private
    db_kind2s: TClass_db_kind2s;
  public
    constructor Create;
    function RegionCodeOf(id: string): string;
    function RegionNameOf(id: string): string;
  end;

implementation

constructor TClass_biz_kind2s.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_kind2s := TClass_db_kind2s.Create;
end;

function TClass_biz_kind2s.RegionCodeOf(id: string): string;
begin
  RegionCodeOf := db_kind2s.RegionCodeOf(id);
end;

function TClass_biz_kind2s.RegionNameOf(id: string): string;
begin
  RegionNameOf := db_kind2s.RegionNameOf(id);
end;

end.
