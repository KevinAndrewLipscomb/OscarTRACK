unit Class_db_department_staffers;

interface

uses
  mysql.data.mysqlclient,
  Class_db;

type
  TClass_db_department_staffers = class(TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    function RegionCodeOf(id: string): string;
    function RegionNameOf(id: string): string;
  end;

implementation

constructor TClass_db_department_staffers.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

function TClass_db_department_staffers.RegionCodeOf(id: string): string;
begin
  self.Open;
  RegionCodeOf := mysql.data.mysqlclient.mysqlcommand.Create
    (
    'SELECT region_code FROM department_staffer WHERE id = ' + id,
    connection
    )
    .ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_department_staffers.RegionNameOf(id: string): string;
begin
  self.Open;
  RegionNameOf := mysql.data.mysqlclient.mysqlcommand.Create
    (
    'SELECT name'
    + ' FROM department_staffer join region_code_name_map on (region_code_name_map.code=department_staffer.region_code)'
    + ' WHERE id = ' + id,
    connection
    )
    .ExecuteScalar.tostring;
  self.Close;
end;

end.
