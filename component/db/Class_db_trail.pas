unit Class_db_trail;

interface

uses
  Class_db;

type
  TClass_db_trail = class(TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    function Saved(action: string): string;
  end;

implementation

uses
  mysql.data.mysqlclient,
  kix,
  system.configuration,
  system.Text.regularexpressions,
  system.web;

constructor TClass_db_trail.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

function TClass_db_trail.Saved(action: string): string;
begin
  //
  // Make a local journal entry for convenient review.
  //
  self.Open;
  mysqlcommand.Create
    (
    'insert into journal'
    + ' set timestamp = null'
    +   ' , actor = "' + httpcontext.current.user.identity.name + '"'
    +   ' , action = "' + regex.Replace(action,QUOTE,DOUBLE_QUOTE) + '"',
    connection
    )
    .ExecuteNonQuery;
  self.Close;
  //
  // Send a representation of the action offsite as a contingency.
  //
  kix.SmtpMailSend
    (
    configurationmanager.appsettings['sender_email_address'],
    configurationmanager.appsettings['failsafe_recipient_email_address'],
    'DB action by ' + httpcontext.current.user.identity.name,
    '/*' + datetime.Now.tostring('yyyyMMddHHmmssfffffff') + '*/ ' + action
    );
  //
  Saved := action;
  //
end;

end.
