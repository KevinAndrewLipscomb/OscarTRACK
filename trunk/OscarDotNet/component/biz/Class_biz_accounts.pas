unit Class_biz_accounts;

interface

uses
  Class_biz_agencies,
  Class_biz_milestones,
  Class_biz_user,
  Class_db_accounts,
  kix,
  borland.vcl.sysutils,
  system.configuration,
  system.web.mail;



type
  TClass_biz_accounts = class
  private
    biz_agencies: TClass_biz_agencies;
    biz_user: TClass_biz_user;
    db_accounts: TClass_db_accounts;
  public
    constructor Create;
    function BeStalePassword
      (
      user_kind: string;
      user_id: string
      )
      : boolean;
    function BeValidSysAdminCredentials(encoded_password: string): boolean;
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

constructor TClass_biz_accounts.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  biz_agencies := TClass_biz_agencies.Create;
  biz_user := TClass_biz_user.Create;
  db_accounts := TClass_db_accounts.Create;
end;

function TClass_biz_accounts.BeStalePassword
  (
  user_kind: string;
  user_id: string
  )
  : boolean;
begin
  BeStalePassword := db_accounts.BeStalePassword(user_kind,user_id);
end;

function TClass_biz_accounts.BeValidSysAdminCredentials(encoded_password: string): boolean;
begin
  BeValidSysAdminCredentials := (encoded_password = configurationmanager.appsettings['sysadmin_encoded_password']);
end;

procedure TClass_biz_accounts.BindSquadCommanders(target: system.object);
begin
  db_accounts.BindSquadCommanders(target);
end;

procedure TClass_biz_accounts.BindDepartmentStaffers(target: system.object);
begin
  db_accounts.BindDepartmentStaffers(target);
end;

procedure TClass_biz_accounts.BindMembers(target: system.object);
begin
  db_accounts.BindMembers(target);
end;

procedure TClass_biz_accounts.Check
  (
  user_kind: string;
  user_id: string;
  out be_stale_password: boolean;
  out email_address: string
  );
begin
  db_accounts.Check(user_kind,user_id,be_stale_password,email_address);
end;

function TClass_biz_accounts.EmailAddressByKindId
  (
  user_kind: string;
  user_id: string
  )
  : string;
begin
  EmailAddressByKindId := db_accounts.EmailAddressByKindId(user_kind,user_id);
end;

function TClass_biz_accounts.EmailTargetByRole(role: string): string;
begin
  EmailTargetByRole := db_accounts.EmailTargetByRole(role);
end;

function TClass_biz_accounts.Exists
  (
  user_kind: string;
  user_id: string;
  encoded_password: string
  )
  : boolean;
begin
  Exists := db_accounts.Exists(user_kind,user_id,encoded_password);
end;

procedure TClass_biz_accounts.SetEmailAddress
  (
  user_kind: string;
  user_id: string;
  email_address: string
  );
begin
  db_accounts.SetEmailAddress(user_kind,user_id,email_address);
end;

procedure TClass_biz_accounts.SetPassword
  (
  user_kind: string;
  user_id: string;
  encoded_password: string
  );
begin
  db_accounts.SetPassword(user_kind,user_id,encoded_password);
end;

procedure TClass_biz_accounts.SetTemporaryPassword
  (
  user_kind: string;
  user_id: string;
  encoded_password: string
  );
begin
  db_accounts.SetTemporaryPassword(user_kind,user_id,encoded_password);
end;

end.
