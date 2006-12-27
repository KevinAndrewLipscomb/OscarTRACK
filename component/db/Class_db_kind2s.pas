unit Class_db_kind2s;

interface

uses
  borland.data.provider,
  Class_db;

type
  TClass_db_kind2s = class(TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    function RegionCodeOf(id: string): string;
    function RegionNameOf(id: string): string;
  end;

implementation

constructor TClass_db_kind2s.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

function TClass_db_kind2s.RegionCodeOf(id: string): string;
begin
  self.Open;
  RegionCodeOf := borland.data.provider.BdpCommand.Create
    (
    'SELECT region_code FROM kind2 WHERE id = ' + id,
    connection
    )
    .ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_kind2s.RegionNameOf(id: string): string;
begin
  self.Open;
  RegionNameOf := borland.data.provider.BdpCommand.Create
    (
    'SELECT name'
    + ' FROM kind2 join region_code_name_map on (region_code_name_map.code=kind2.region_code)'
    + ' WHERE id = ' + id,
    connection
    )
    .ExecuteScalar.tostring;
  self.Close;
end;

end.
