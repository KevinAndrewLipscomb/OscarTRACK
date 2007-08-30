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
      out last_login: datetime
      )
      : boolean;
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
    procedure &Set
      (
      username: string;
      encoded_password: string;
      be_stale_password: boolean;
      password_reset_email_address: string;
      be_active: boolean;
      num_unsuccessful_login_attempts: uint32;
      last_login: datetime
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
  borland.data.provider,
  system.web.ui.webcontrols;

constructor TClass_db_users.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

function TClass_db_users.AcceptAsMember
  (
  shared_secret: string;
  id: string
  )
  : boolean;
var
  accept_as_member: boolean;
  member_id_obj: system.object;
begin
  accept_as_member := FALSE;
  self.Open;
  member_id_obj := bdpcommand.Create('select id from member where cad_num = "' + shared_secret + '"',connection).ExecuteScalar;
  if member_id_obj <> nil then begin
    bdpcommand.Create
      (
      db_trail.Saved
        (
        'START TRANSACTION'
        + ';'
        + ' insert user_member_map'
        +   ' set user_id = ' + id
        +   ' , member_id = ' + member_id_obj.tostring
        +   ' on duplicate key update user_id = ' + id
        + ';'
        + ' update member'
        +   ' join user_member_map on (user_member_map.member_id=member.id)'
        +   ' join user on (user.id=user_member_map.user_id)'
        +   ' set email_address = password_reset_email_address'
        +   ' where member.id = ' + member_id_obj.tostring
        + ';'
        + ' COMMIT'
        ),
      connection
      )
      .ExecuteNonquery;
    accept_as_member := TRUE;
  end;
  self.Close;
  AcceptAsMember := accept_as_member;
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

function TClass_db_users.Bind
  (
  partial_username: string;
  target: system.object
  )
  : boolean;
var
  bdr: bdpdatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  //
  bdr := bdpcommand.Create
    (
    'SELECT username FROM user WHERE username like "' + partial_username + '%" order by username',
    connection
    )
    .ExecuteReader;
  while bdr.Read do begin
    DropDownList(target).Items.Add
      (listitem.Create(bdr['username'].tostring,bdr['username'].tostring));
  end;
  bdr.Close;
  self.Close;
  Bind := DropDownList(target).items.count > 0;
end;

procedure TClass_db_users.Delete(username: string);
begin
  self.Open;
  bdpcommand.Create(db_trail.Saved('delete from user where username = ' + username),connection).ExecuteNonquery;
  self.Close;
end;

function TClass_db_users.Get
  (
      username: string;
      out encoded_password: string;
      out be_stale_password: boolean;
      out password_reset_email_address: string;
      out be_active: boolean;
      out num_unsuccessful_login_attempts: uint32;
      out last_login: datetime
  )
  : boolean;
var
  bdr: bdpdatareader;
begin
  Get := FALSE;
  self.Open;
  bdr := bdpcommand.Create('select * from user where username = "' + username + '"',connection).ExecuteReader;
  if bdr.Read then begin
    //
    username := bdr['username'].tostring;
    encoded_password := bdr['encoded_password'].tostring;
    be_stale_password := (bdr['be_stale_password'].tostring = '1');
    password_reset_email_address := bdr['password_reset_email_address'].tostring;
    be_active := (bdr['be_active'].tostring = '1');
    num_unsuccessful_login_attempts := uint32.Parse(bdr['num_unsuccessful_login_attempts'].tostring);
    last_login := datetime.Parse(bdr['last_login'].tostring);
    //
    Get := TRUE;
    //
  end;
  bdr.Close;
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
    + ' from user_member_map'
    +   ' join role_member_map using (member_id)'
    +   ' join role_privilege_map using (role_id)'
    +   ' join privilege on (privilege.id=role_privilege_map.privilege_id)'
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

procedure TClass_db_users.&Set
  (
      username: string;
      encoded_password: string;
      be_stale_password: boolean;
      password_reset_email_address: string;
      be_active: boolean;
      num_unsuccessful_login_attempts: uint32;
      last_login: datetime
  );
begin
  self.Open;
  bdpcommand.Create
    (
    db_trail.Saved
      (
      'replace user'
      + ' set username = "' + username + '"'
//      + ' , encoded_password = "' + encoded_password + '"'
      + ' , be_stale_password = ' + be_stale_password.tostring
      + ' , password_reset_email_address = "' + password_reset_email_address + '"'
      + ' , be_active = ' + be_active.tostring
//      + ' , num_unsuccessful_login_attempts = ' + num_unsuccessful_login_attempts.tostring
//      + ' , last_login = ' + last_login.tostring
      ),
    connection
    )
    .ExecuteNonquery;
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
      'UPDATE user'
      + ' SET password_reset_email_address = "' + email_address + '"'
      + ' WHERE id = ' + id
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
