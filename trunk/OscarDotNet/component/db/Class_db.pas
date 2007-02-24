unit Class_db;

interface

uses
  borland.data.provider,
  system.configuration,
  system.data;



type
  TClass_db = class abstract
  private
    { Private Declarations }
  protected
    connection: borland.data.provider.bdpconnection;
    procedure Close;
    procedure Open;
  public
    constructor Create;
  end;

implementation

constructor TClass_db.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  connection := borland.data.provider.bdpconnection.Create;
  connection.ConnectionOptions := 'transaction isolation=ReadCommitted';
  connection.ConnectionString := ConfigurationSettings.AppSettings['bdp_connection_string'];
end;

procedure TClass_db.Close;
begin
  connection.Close;
end;

procedure TClass_db.Open;
begin
  if connection.State <> connectionstate.OPEN then begin
    connection.Open;
  end;
end;

end.
