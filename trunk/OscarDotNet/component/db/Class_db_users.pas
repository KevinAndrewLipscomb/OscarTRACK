unit Class_db_users;

interface

uses
  Class_db,
  Class_db_trail,
  ki;

type
  TClass_db_users = class(TClass_db)
  private
    db_trail: TClass_db_trail;
  public
    constructor Create;
    function BeAuthorized
      (
      username: string;
      encoded_password: string
      )
      : boolean;
    function BeRegisteredEmailAddress(email_address: string): boolean;
    function BeRegisteredUsername(username: string): boolean;
    function BeStalePassword(id: string): boolean;
    function IdOf(username: string): string;
    function NumUnsuccessfulLoginAttemptsOf(username: string): cardinal;
    function PasswordResetEmailAddressOfId(id: string): string;
    function PasswordResetEmailAddressOfUsername(username: string): string;
    function PrivilegesOf(id: string): ki.string_array;
    procedure RecordSuccessfulLogin(id: string);
    procedure RecordUnsuccessfulLoginAttempt(username: string);
    procedure RegisterNew
      (
      username: string;
      encoded_password: string;
      email_address: string
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
    procedure SetTemporaryPassword
      (
      username: string;
      encoded_password: string
      );
    function UsernameOfEmailAddress(email_address: string): string;
  end;

implementation

uses
  borland.data.provider;

constructor TClass_db_users.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

function TClass_db_users.BeAuthorized
  (
  username: string;
  encoded_password: string
  )
  : boolean;
begin
  self.Open;
  BeAuthorized := nil <> bdpcommand.Create
    (
    'SELECT 1 FROM user'
    + ' where username = "' + username + '"'
    +   ' and encoded_password = "' + encoded_password + '"',
    connection
    )
    .ExecuteScalar;
  self.Close;
end;

function TClass_db_users.BeRegisteredEmailAddress(email_address: string): boolean;
begin
  self.Open;
  BeRegisteredEmailAddress := nil <> bdpcommand.Create
    ('SELECT 1 FROM user where password_reset_email_address = "' + email_address + '"',connection).ExecuteScalar;
  self.Close;
end;

function TClass_db_users.BeRegisteredUsername(username: string): boolean;
begin
  self.Open;
  BeRegisteredUsername := nil <> bdpcommand.Create('SELECT 1 FROM user where username = "' + username + '"',connection).ExecuteScalar;
  self.Close;
end;

function TClass_db_users.BeStalePassword(id: string): boolean;
begin
  self.Open;
  BeStalePassword := '1' = bdpcommand.Create
    (
    'SELECT be_stale_password FROM user where id=' + id,
    connection
    )
    .ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_users.IdOf(username: string): string;
begin
  self.Open;
  IdOf := bdpcommand.Create('select id from user where username = "' + username + '"',connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_users.NumUnsuccessfulLoginAttemptsOf(username: string): cardinal;
begin
  self.Open;
  NumUnsuccessfulLoginAttemptsOf := uint32.Parse
    (
    bdpcommand.Create
      (
      'select num_unsuccessful_login_attempts from user where username = "' + username + '"',
      connection
      )
      .ExecuteScalar.tostring
    );
  self.Close;
end;

function TClass_db_users.PasswordResetEmailAddressOfId(id: string): string;
begin
  self.Open;
  PasswordResetEmailAddressOfId := bdpcommand.Create
    ('select password_reset_email_address from user where id = ' + id,connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_users.PasswordResetEmailAddressOfUsername(username: string): string;
begin
  self.Open;
  PasswordResetEmailAddressOfUsername := bdpcommand.Create
    ('select password_reset_email_address from user where username = "' + username + '"',connection).ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_users.PrivilegesOf(id: string): ki.string_array;
var
  bdr: bdpdatareader;
  num_privileges: cardinal;
  privileges_of: ki.string_array;
begin
  self.Open;
  bdr := bdpcommand.Create
    (
    'select distinct name'
    + ' from privilege'
    +   ' join role_privilege_map on (role_privilege_map.privilege_id=privilege.id)'
    +   ' join role_user_map on (role_user_map.role_id=role_privilege_map.role_id)'
    + ' where user_id = ' + id,
    connection
    )
    .ExecuteReader;
  num_privileges := 0;
  while bdr.Read do begin
    num_privileges := num_privileges + 1;
    SetLength(privileges_of,num_privileges);
    privileges_of[num_privileges - 1] := bdr['name'].tostring;
  end;
  bdr.Close;
  self.Close;
  PrivilegesOf := privileges_of;
end;

procedure TClass_db_users.RecordSuccessfulLogin(id: string);
begin
  self.Open;
  bdpcommand.Create
    (
    db_trail.Saved
      (
      'update user'
      + ' set num_unsuccessful_login_attempts = 0'
      +   ' , last_login = NOW()'
      + ' where id = ' + id
      ),
    connection
    )
    .ExecuteNonquery;
  self.Close;
end;

procedure TClass_db_users.RecordUnsuccessfulLoginAttempt(username: string);
begin
  self.Open;
  bdpcommand.Create
    (
    db_trail.Saved
      (
      'update user'
      + ' set num_unsuccessful_login_attempts = num_unsuccessful_login_attempts + 1'
      + ' where username = "' + username + '"'
      ),
    connection
    )
    .ExecuteNonquery;
  self.Close;
end;

procedure TClass_db_users.RegisterNew
  (
  username: string;
  encoded_password: string;
  email_address: string
  );
begin
  self.Open;
  bdpcommand.Create
    (
    db_trail.Saved
      (
      'insert into user'
      + ' set username = "' + username + '"'
      +   ' , encoded_password = "' + encoded_password + '"'
      +   ' , be_stale_password = FALSE'
      +   ' , password_reset_email_address = "' + email_address + '"'
      +   ' , last_login = NOW()'
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

procedure TClass_db_users.SetEmailAddress
  (
  id: string;
  email_address: string
  );
begin
  self.Open;
  borland.data.provider.bdpcommand.Create
    (
    db_trail.Saved
      (
      'UPDATE user '
      + 'SET password_reset_email_address = "' + email_address + '"'
      + 'WHERE id = ' + id
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

procedure TClass_db_users.SetPassword
  (
  id: string;
  encoded_password: string
  );
begin
  self.Open;
  borland.data.provider.bdpcommand.Create
    (
    db_trail.Saved
      (
      'update user'
      + ' set encoded_password = "' + encoded_password + '",'
      +   ' be_stale_password = FALSE '
      + ' where id = ' + id
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

procedure TClass_db_users.SetTemporaryPassword
  (
  username: string;
  encoded_password: string
  );
begin
  self.Open;
  borland.data.provider.bdpcommand.Create
    (
    db_trail.Saved
      (
      'update user'
      + ' set encoded_password = "' + encoded_password + '",'
      +   ' be_stale_password = TRUE '
      + ' where username = "' + username + '"'
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

function TClass_db_users.UsernameOfEmailAddress(email_address: string): string;
begin
  self.Open;
  UsernameOfEmailAddress := bdpcommand.Create
    ('select username from user where password_reset_email_address = "' + email_address + '"',connection).ExecuteScalar.tostring;
  self.Close;
end;

end.
