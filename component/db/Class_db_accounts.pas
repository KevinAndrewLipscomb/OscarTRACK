unit Class_db_accounts;

interface

uses
  mysql.data.mysqlclient,
  Class_db,
  Class_db_trail;

type
  TClass_db_accounts = class(TClass_db)
  private
    db_trail: TClass_db_trail;
  public
    constructor Create;
    function BeStalePassword
      (
      user_kind: string;
      user_id: string
      )
      : boolean;
    procedure BindSquadCommanders(target: system.object);
    procedure BindDepartmentStaffers(target: system.object);
    procedure BindMembers(target: system.object);
    procedure Check
      (
      user_kind: string;
      user_id: string;
      out be_stale_password: boolean;
      out email_address: string
      );
    function EmailAddressByKindId
      (
      user_kind: string;
      user_id: string
      )
      : string;
    function EmailTargetByRole(role: string): string;
    function Exists
      (
      user_kind: string;
      user_id: string;
      encoded_password: string
      )
      : boolean;
    procedure SetEmailAddress
      (
      user_kind: string;
      user_id: string;
      email_address: string
      );
    procedure SetPassword
      (
      user_kind: string;
      user_id: string;
      encoded_password: string
      );
    procedure SetTemporaryPassword
      (
      user_kind: string;
      user_id: string;
      encoded_password: string
      );
  end;

implementation

uses
  system.web.ui.webcontrols;

constructor TClass_db_accounts.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_trail := TClass_db_trail.Create;
end;

function TClass_db_accounts.BeStalePassword
  (
  user_kind: string;
  user_id: string
  )
  : boolean;
begin
  self.Open;
  BeStalePassword := '1' = mysql.data.mysqlclient.mysqlcommand.Create
    (
    'SELECT be_stale_password FROM ' + user_kind + '_user where id=' + user_id,
    connection
    )
    .ExecuteScalar.tostring;
  self.Close;
end;

procedure TClass_db_accounts.BindSquadCommanders(target: system.object);
var
  dr: mysql.data.mysqlclient.mysqldatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  DropDownList(target).items.Add(listitem.Create('-- Select --','0'));
  dr := mysql.data.mysqlclient.mysqlcommand.Create
    (
    'SELECT squad_commander_user.id,concat(squad_commander_user.id,"50") as name'
    + ' FROM squad_commander_user JOIN agency on (agency.id = squad_commander_user.id)'
    + ' WHERE agency.be_active = TRUE'
    +   ' and squad_commander_user.be_active = TRUE'
    + ' ORDER BY agency.id',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    DropDownList(target).Items.Add(listitem.Create(dr['name'].tostring,'squad_commander_' + dr['id'].ToString));
  end;
  dr.Close;
  self.Close;
end;

procedure TClass_db_accounts.BindDepartmentStaffers(target: system.object);
var
  dr: mysql.data.mysqlclient.mysqldatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  DropDownList(target).items.Add(listitem.Create('-- Select --','0'));
  dr := mysql.data.mysqlclient.mysqlcommand.Create
    (
    'SELECT id,name '
    + 'FROM department_staffer_user JOIN department_staffer using (id) '
    + 'WHERE be_active = TRUE '
    + 'ORDER BY name',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    DropDownList(target).Items.Add
      (listitem.Create(dr['name'].tostring,'department_staffer_' + dr['id'].ToString));
  end;
  dr.Close;
  self.Close;
end;

procedure TClass_db_accounts.BindMembers(target: system.object);
var
  dr: mysql.data.mysqlclient.mysqldatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  DropDownList(target).items.Add(listitem.Create('-- Select --','0'));
  dr := mysql.data.mysqlclient.mysqlcommand.Create
    (
    'SELECT id'
    + ' , concat(last_name,", ",first_name,ifnull(concat(", ",cad_num),"")) as name'
    + ' FROM member_user JOIN member using (id)'
    + ' WHERE be_active = TRUE'
    + ' ORDER BY last_name,first_name,cad_num',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    DropDownList(target).Items.Add(listitem.Create(dr['name'].tostring,'member_' + dr['id'].ToString));
  end;
  dr.Close;
  self.Close;
end;

procedure TClass_db_accounts.Check
  (
  user_kind: string;
  user_id: string;
  out be_stale_password: boolean;
  out email_address: string
  );
var
  dr: mysqldatareader;
begin
  self.Open;
  dr := mysqlcommand.Create
    (
    'SELECT be_stale_password'
    + ' , password_reset_email_address'
    + ' FROM ' + user_kind + '_user'
    + ' where id = ' + user_id,
    connection
    )
    .ExecuteReader;
  dr.Read;
  if dr['be_stale_password'].tostring = '0' then begin
    be_stale_password := FALSE;
    if be_stale_password then begin
      email_address := dr['password_reset_email_address'].tostring;
    end else begin
      email_address := system.string.EMPTY;
    end;
  end else begin
    be_stale_password := TRUE;
  end;
  dr.Close;
  self.Close;
end;

function TClass_db_accounts.EmailAddressByKindId
  (
  user_kind: string;
  user_id: string
  )
  : string;
begin
  self.Open;
  EmailAddressByKindId := mysql.data.mysqlclient.mysqlcommand.Create
    (
    'select password_reset_email_address from ' + user_kind + '_user where id = ' + user_id,
    connection
    )
    .ExecuteScalar.tostring;
  self.Close;
end;

function TClass_db_accounts.EmailTargetByRole
  (
  role: string
  )
  : string;
var
  dr: mysql.data.mysqlclient.mysqldatareader;
  email_target: string;
begin
  email_target := system.string.EMPTY;
  self.Open;
  dr := mysql.data.mysqlclient.mysqlcommand.Create
    (
    'select password_reset_email_address'
    + ' from department_staffer_user'
    +   ' join department_staffer_role on (department_staffer_role.user_id=department_staffer_user.id)'
    +   ' join department_staffer_group on (department_staffer_group.id=department_staffer_role.group_id)'
    + ' where department_staffer_group.name = "' + role + '"',
    connection
    )
    .ExecuteReader;
  while dr.Read do begin
    email_target := email_target + dr['password_reset_email_address'].tostring + ',';
  end;
  dr.Close;
  self.Close;
  EmailTargetByRole := email_target.Substring(0,email_target.Length - 1);
end;

function TClass_db_accounts.Exists
  (
  user_kind: string;
  user_id: string;
  encoded_password: string
  )
  : boolean;
begin
  self.Open;
  Exists := nil <> mysql.data.mysqlclient.mysqlcommand.Create
    (
    'SELECT 1 FROM ' + user_kind + '_user'
    +  ' where id = ' + user_id
    +     ' and encoded_password = "' + encoded_password + '"',
    connection
    )
    .ExecuteScalar;
  self.Close;
end;

procedure TClass_db_accounts.SetEmailAddress
  (
  user_kind: string;
  user_id: string;
  email_address: string
  );
begin
  self.Open;
  mysql.data.mysqlclient.mysqlcommand.Create
    (
    db_trail.Saved
      (
      'UPDATE ' + user_kind + '_user '
      + 'SET password_reset_email_address = "' + email_address + '"'
      + 'WHERE id = ' + user_id
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

procedure TClass_db_accounts.SetPassword
  (
  user_kind: string;
  user_id: string;
  encoded_password: string
  );
begin
  self.Open;
  mysql.data.mysqlclient.mysqlcommand.Create
    (
    db_trail.Saved
      (
      'update ' + user_kind + '_user'
      + ' set encoded_password = "' + encoded_password + '",'
      +   ' be_stale_password = FALSE '
      + ' where id = ' + user_id
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

procedure TClass_db_accounts.SetTemporaryPassword
  (
  user_kind: string;
  user_id: string;
  encoded_password: string
  );
begin
  self.Open;
  mysql.data.mysqlclient.mysqlcommand.Create
    (
    db_trail.Saved
      (
      'update ' + user_kind + '_user'
      + ' set encoded_password = "' + encoded_password + '",'
      +   ' be_stale_password = TRUE '
      + ' where id = ' + user_id
      ),
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

end.
