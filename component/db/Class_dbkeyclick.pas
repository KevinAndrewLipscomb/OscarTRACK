unit Class_dbkeyclick;

interface

uses
  mysql.data.mysqlclient,
  system.configuration,
  system.data;

type
  TClass_dbkeyclick = class abstract
  private
    { Private Declarations }
  protected
    connection: mysqlconnection;
    procedure Close;
    procedure Open;
  public
    constructor Create;
  end;

implementation

constructor TClass_dbkeyclick.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  connection := mysqlconnection.Create;
  connection.ConnectionString := configurationmanager.AppSettings['dbkeyclick_connection_string'];
end;

procedure TClass_dbkeyclick.Close;
begin
  connection.Close;
end;

procedure TClass_dbkeyclick.Open;
begin
  if connection.State <> connectionstate.OPEN then begin
    connection.Open;
  end;
end;

end.
