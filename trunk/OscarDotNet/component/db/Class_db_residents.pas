unit Class_db_residents;

interface

uses
  Class_dbkeyclick;

type
  TClass_db_residents = class(TClass_dbkeyclick)
  private
    { Private Declarations }
  public
    constructor Create;
    function BeExtantId(id: string): boolean;
  end;

implementation

uses mysql.data.mysqlclient;

constructor TClass_db_residents.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

function TClass_db_residents.BeExtantId(id: string): boolean;
begin
  self.Open;
  BeExtantId := nil <> mysqlcommand.Create('select TRUE from resident where id = "' + id + '"',connection).ExecuteScalar;
  self.Close;
end;

end.
