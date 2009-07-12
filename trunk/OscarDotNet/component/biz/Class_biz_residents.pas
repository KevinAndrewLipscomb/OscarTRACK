unit Class_biz_residents;

interface

uses
  Class_db_residents;

type
  TClass_biz_residents = class
  private
    db_residents: TClass_db_residents;
  public
    constructor Create;
    function BeExtantId(id: string): boolean;
  end;

implementation

constructor TClass_biz_residents.Create;
begin
  inherited Create;
  db_residents := TClass_db_residents.Create;
end;

function TClass_biz_residents.BeExtantId(id: string): boolean;
begin
  BeExtantId := db_residents.BeExtantId(id);
end;

end.
