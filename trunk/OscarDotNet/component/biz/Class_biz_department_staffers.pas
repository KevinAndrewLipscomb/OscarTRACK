unit Class_biz_department_staffers;

interface

uses
  Class_db_department_staffers;

type
  TClass_biz_department_staffers = class
  private
    db_department_staffers: TClass_db_department_staffers;
  public
    constructor Create;
    function RegionCodeOf(id: string): string;
    function RegionNameOf(id: string): string;
  end;

implementation

constructor TClass_biz_department_staffers.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_department_staffers := TClass_db_department_staffers.Create;
end;

function TClass_biz_department_staffers.RegionCodeOf(id: string): string;
begin
  RegionCodeOf := db_department_staffers.RegionCodeOf(id);
end;

function TClass_biz_department_staffers.RegionNameOf(id: string): string;
begin
  RegionNameOf := db_department_staffers.RegionNameOf(id);
end;

end.
