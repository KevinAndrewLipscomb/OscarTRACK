unit Class_db_accounts;

interface

uses
  borland.data.provider,
  Class_db;

type
  TClass_db_accounts = class(TClass_db)
  private
    { Private Declarations }
  public
    constructor Create;
    function BeStalePassword
      (
      user_kind: string;
      user_id: string
      )
      : boolean;
    procedure BindKind3s(target: system.object);
    procedure BindKind2s(target: system.object);
    procedure BindKind1s(target: system.object);
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
end;

function TClass_db_accounts.BeStalePassword
  (
  user_kind: string;
  user_id: string
  )
  : boolean;
begin
  self.Open;
  BeStalePassword := '1' = Borland.Data.Provider.BdpCommand.Create
    (
    'SELECT be_stale_password FROM ' + user_kind + '_user where id=' + user_id,
    connection
    )
    .ExecuteScalar.tostring;
  self.Close;
end;

procedure TClass_db_accounts.BindKind3s(target: system.object);
var
  bdr: borland.data.provider.bdpdatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  DropDownList(target).items.Add(listitem.Create('-- Select --','0'));
  bdr := Borland.Data.Provider.BdpCommand.Create
    (
    'SELECT kind3_user.id,name '
    + 'FROM kind3_user JOIN kind3 on (kind3.id = kind3_user.id) '
    + 'WHERE be_active = TRUE '
    + 'ORDER BY name',
    connection
    )
    .ExecuteReader;
  while bdr.Read do begin
    DropDownList(target).Items.Add(listitem.Create(bdr['name'].tostring,'kind3_' + bdr['id'].ToString));
  end;
  bdr.Close;
  self.Close;
end;

procedure TClass_db_accounts.BindKind2s(target: system.object);
var
  bdr: borland.data.provider.bdpdatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  DropDownList(target).items.Add(listitem.Create('-- Select --','0'));
  bdr := Borland.Data.Provider.BdpCommand.Create
    (
    'SELECT id,name '
    + 'FROM kind2_user JOIN kind2 using (id) '
    + 'WHERE be_active = TRUE '
    + 'ORDER BY name',
    connection
    )
    .ExecuteReader;
  while bdr.Read do begin
    DropDownList(target).Items.Add
      (listitem.Create(bdr['name'].tostring,'kind2_' + bdr['id'].ToString));
  end;
  bdr.Close;
  self.Close;
end;

procedure TClass_db_accounts.BindKind1s(target: system.object);
var
  bdr: borland.data.provider.bdpdatareader;
begin
  self.Open;
  DropDownList(target).items.Clear;
  DropDownList(target).items.Add(listitem.Create('-- Select --','0'));
  bdr := Borland.Data.Provider.BdpCommand.Create
    (
    'SELECT id,name FROM kind1_user JOIN kind1 using (id) WHERE be_active = TRUE ORDER BY name',
    connection
    )
    .ExecuteReader;
  while bdr.Read do begin
    DropDownList(target).Items.Add(listitem.Create(bdr['name'].tostring,'kind1_' + bdr['id'].ToString));
  end;
  bdr.Close;
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
  bdr: bdpdatareader;
begin
  self.Open;
  bdr := bdpcommand.Create
    (
    'SELECT be_stale_password'
    + ' , password_reset_email_address'
    + ' FROM ' + user_kind + '_user'
    + ' where id = ' + user_id,
    connection
    )
    .ExecuteReader;
  bdr.Read;
  if bdr['be_stale_password'].tostring = '0' then begin
    be_stale_password := FALSE;
    if be_stale_password then begin
      email_address := bdr['password_reset_email_address'].tostring;
    end else begin
      email_address := system.string.EMPTY;
    end;
  end else begin
    be_stale_password := TRUE;
  end;
  bdr.Close;
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
  EmailAddressByKindId := borland.data.provider.bdpcommand.Create
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
  bdr: borland.data.provider.bdpdatareader;
  email_target: string;
begin
  email_target := system.string.EMPTY;
  self.Open;
  bdr := borland.data.provider.bdpcommand.Create
    (
    'select password_reset_email_address'
    + ' from kind2_user'
    +   ' join kind2_role on (kind2_role.user_id=kind2_user.id)'
    +   ' join kind2_group on (kind2_group.id=kind2_role.group_id)'
    + ' where kind2_group.name = "' + role + '"',
    connection
    )
    .ExecuteReader;
  while bdr.Read do begin
    email_target := email_target + bdr['password_reset_email_address'].tostring + ',';
  end;
  bdr.Close;
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
  Exists := nil <> borland.data.provider.bdpcommand.Create
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
  borland.data.provider.bdpcommand.Create
    (
    'UPDATE ' + user_kind + '_user '
    + 'SET password_reset_email_address = "' + email_address + '"'
    + 'WHERE id = ' + user_id,
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
  borland.data.provider.bdpcommand.Create
    (
    'update ' + user_kind + '_user'
    + ' set encoded_password = "' + encoded_password + '",'
    +   ' be_stale_password = FALSE '
    + ' where id = ' + user_id,
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
  borland.data.provider.bdpcommand.Create
    (
    'update ' + user_kind + '_user'
    + ' set encoded_password = "' + encoded_password + '",'
    +   ' be_stale_password = TRUE '
    + ' where id = ' + user_id,
    connection
    )
    .ExecuteNonQuery;
  self.Close;
end;

end.
