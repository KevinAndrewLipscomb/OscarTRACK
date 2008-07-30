unit Class_biz_users;

interface

uses
  Class_biz_notifications,
  Class_db_members,
  Class_db_users,
  kix;

type
  TClass_biz_users = class
  private
    biz_notifications: TClass_biz_notifications;
    db_members: TClass_db_members;
    db_users: TClass_db_users;
  public
    constructor Create;
    function AcceptAsMember
      (
      shared_secret: string;
      id: string
      )
      : boolean;
    function BeAuthorized
      (
      username: string;
      encoded_password: string
      )
      : boolean;
    function BeAuthorizedSysAdmin(encoded_password: string): boolean;
    function BeRegisteredEmailAddress(email_address: string): boolean;
    function BeRegisteredUsername(username: string): boolean;
    function BeStalePassword(id: string): boolean;
    function Bind
      (
      partial_username: string;
      target: system.object
      )
      : boolean;
    procedure Delete(username: string);
    function Get
      (
      username: string;
      out encoded_password: string;
      out be_stale_password: boolean;
      out password_reset_email_address: string;
      out be_active: boolean;
      out num_unsuccessful_login_attempts: uint32;
      out last_login: string
      )
      : boolean;
    function IdOf(username: string): string;
    procedure IssueTemporaryPassword
      (
      username: string;
      client_host_name: string
      );
    procedure IssueUsernameReminder
      (
      email_address: string;
      client_host_name: string
      );
    function NumUnsuccessfulLoginAttemptsOf(username: string): cardinal;
    function PasswordResetEmailAddressOfId(id: string): string;
    function PasswordResetEmailAddressOfUsername(username: string): string;
    function PrivilegesOf(id: string): kix.string_array;
    procedure RecordSuccessfulLogin(id: string);
    procedure RecordUnsuccessfulLoginAttempt(username: string);
    procedure RegisterNew
      (
      username: string;
      encoded_password: string;
      email_address: string
      );
    function SelfEmailAddress: string;
    procedure &Set
      (
      username: string;
      be_stale_password: boolean;
      password_reset_email_address: string;
      be_active: boolean
      );
    procedure SetEmailAddress
      (
      id: string;
      email_address: string
      );
    procedure SetPassword
      (
      id: string;
      encoded_password: string
      );
  end;

implementation

uses
  Class_biz_user,
  system.configuration;

constructor TClass_biz_users.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  biz_notifications := TClass_biz_notifications.Create;
  db_members := TClass_db_members.Create;
  db_users := TClass_db_users.Create;
end;

function TClass_biz_users.AcceptAsMember
  (
  shared_secret: string;
  id: string
  )
  : boolean;
begin
  AcceptAsMember := db_users.AcceptAsMember(shared_secret,id);
end;

function TClass_biz_users.BeAuthorized
  (
  username: string;
  encoded_password: string
  )
  : boolean;
begin
  BeAuthorized := db_users.BeAuthorized(username,encoded_password);
end;

function TClass_biz_users.BeAuthorizedSysAdmin(encoded_password: string): boolean;
begin
  BeAuthorizedSysAdmin := (encoded_password = configurationmanager.appsettings['sysadmin_encoded_password']);
end;

function TClass_biz_users.BeRegisteredEmailAddress(email_address: string): boolean;
begin
  BeRegisteredEmailAddress := db_users.BeRegisteredEmailAddress(email_address);
end;

function TClass_biz_users.BeRegisteredUsername(username: string): boolean;
begin
  BeRegisteredUsername := db_users.BeRegisteredUsername(username);
end;

function TClass_biz_users.BeStalePassword(id: string): boolean;
begin
  BeStalePassword := db_users.BeStalePassword(id);
end;

function TClass_biz_users.Bind
  (
  partial_username: string;
  target: system.object
  )
  : boolean;
begin
  Bind := db_users.Bind(partial_username,target);
end;

procedure TClass_biz_users.Delete(username: string);
begin
  db_users.Delete(username);
end;

function TClass_biz_users.Get
  (
  username: string;
  out encoded_password: string;
  out be_stale_password: boolean;
  out password_reset_email_address: string;
  out be_active: boolean;
  out num_unsuccessful_login_attempts: uint32;
  out last_login: string
  )
  : boolean;
begin
  //
  Get := db_users.Get
    (
    username,
    encoded_password,
    be_stale_password,
    password_reset_email_address,
    be_active,
    num_unsuccessful_login_attempts,
    last_login
    );
  //
end;

function TClass_biz_users.IdOf(username: string): string;
begin
  IdOf := db_users.IdOf(username);
end;

procedure TClass_biz_users.IssueTemporaryPassword
  (
  username: string;
  client_host_name: string
  );
var
  temporary_password: string;
begin
  //
  // Build a suitably-random password string.
  //
  temporary_password :=
    System.Guid.NewGuid.ToString.Substring(0,uint32.Parse(configurationmanager.appsettings['temp_password_len']));
  //
  // Make the password string the user's new temporary password, and set the stale flag to force an immediate password change.
  //
  db_users.SetTemporaryPassword(username,Digest(temporary_password));
  //
  // Send the new password to the user's email address of record.
  //
  biz_notifications.IssueForTemporaryPassword(username,client_host_name,temporary_password);
end;

procedure TClass_biz_users.IssueUsernameReminder
  (
  email_address: string;
  client_host_name: string
  );
begin
  biz_notifications.IssueForForgottenUsername(email_address,db_users.UsernameOfEmailAddress(email_address),client_host_name);
end;

function TClass_biz_users.NumUnsuccessfulLoginAttemptsOf(username: string): cardinal;
begin
  NumUnsuccessfulLoginAttemptsOf := db_users.NumUnsuccessfulLoginAttemptsOf(username);
end;

function TClass_biz_users.PasswordResetEmailAddressOfId(id: string): string;
begin
  PasswordResetEmailAddressOfId := db_users.PasswordResetEmailAddressOfId(id);
end;

function TClass_biz_users.PasswordResetEmailAddressOfUsername(username: string): string;
begin
  PasswordResetEmailAddressOfUsername := db_users.PasswordResetEmailAddressOfUsername(username);
end;

function TClass_biz_users.PrivilegesOf(id: string): kix.string_array;
begin
  PrivilegesOf := db_users.PrivilegesOf(id);
end;

procedure TClass_biz_users.RecordSuccessfulLogin(id: string);
begin
  db_users.RecordSuccessfulLogin(id);
end;

procedure TClass_biz_users.RecordUnsuccessfulLoginAttempt(username: string);
begin
  db_users.RecordUnsuccessfulLoginAttempt(username);
end;

procedure TClass_biz_users.RegisterNew
  (
  username: string;
  encoded_password: string;
  email_address: string
  );
begin
  db_users.RegisterNew(username,encoded_password,email_address);
end;

function TClass_biz_users.SelfEmailAddress: string;
begin
  SelfEmailAddress := PasswordResetEmailAddressOfId(TClass_biz_user.Create.IdNum);
end;

procedure TClass_biz_users.&Set
  (
  username: string;
  be_stale_password: boolean;
  password_reset_email_address: string;
  be_active: boolean
  );
begin
  //
  db_users.&Set
    (
    username,
    be_stale_password,
    password_reset_email_address,
    be_active
    );
  //
end;

procedure TClass_biz_users.SetEmailAddress
  (
  id: string;
  email_address: string
  );
begin
  db_users.SetEmailAddress(id,email_address);
  db_members.SetEmailAddress(db_members.IdOfUserId(id),email_address);
end;

procedure TClass_biz_users.SetPassword
  (
  id: string;
  encoded_password: string
  );
begin
  db_users.SetPassword(id,encoded_password);
end;

end.
