unit Class_biz_accounts;

interface

uses
  Class_biz_agencys,
  Class_biz_milestones,
  Class_biz_members,
  Class_biz_user,
  Class_db_accounts,
  ki,
  borland.vcl.sysutils,
  system.configuration,
  system.web.mail;

const ID = '$Id$';

type
  TClass_biz_accounts = class
  private
    biz_agencys: TClass_biz_agencys;
    biz_members: TClass_biz_members;
    biz_user: TClass_biz_user;
    db_accounts: TClass_db_accounts;
    function SelfEmailAddress: string;
  public
    constructor Create;
    function BeStalePassword
      (
      user_kind: string;
      user_id: string
      )
      : boolean;
    function BeValidSysAdminCredentials(encoded_password: string): boolean;
    procedure BindAgencys(target: system.object);
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
    procedure Remind
      (
      milestone: milestone_type;
      num_days_left: cardinal;
      deadline_date: datetime;
      member_id: string
      );
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
  biz_agencys := TClass_biz_agencys.Create;
  biz_members := TClass_biz_members.Create;
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
  BeValidSysAdminCredentials := (encoded_password = configurationsettings.appsettings['sysadmin_encoded_password']);
end;

procedure TClass_biz_accounts.BindAgencys(target: system.object);
begin
  db_accounts.BindAgencys(target);
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

function TClass_biz_accounts.SelfEmailAddress: string;
begin
  SelfEmailAddress := EmailAddressByKindId(biz_user.Kind,biz_user.IdNum);
end;

procedure TClass_biz_accounts.Remind
  (
  milestone: milestone_type;
  num_days_left: cardinal;
  deadline_date: datetime;
  member_id: string
  );
var
  member_email_address: string;
  member_name: string;
  task_description: string;
begin
  member_email_address := EmailAddressByKindId('member',member_id);
  member_name := biz_members.NameOf(member_id);
  //
  case milestone of
  FIRST_MILESTONE:
    task_description := 'finalize your EMSOF request and submit it to your agency EMSOF coordinator';
  SECOND_MILESTONE:
    task_description := 'purchase all the items in your EMSOF request(s)';
  end;
  //
  ki.SmtpMailSend
    (
    ConfigurationSettings.AppSettings['sender_email_address'],
    member_email_address,
    'Reminder of approaching deadline',
    'This is an automated reminder from OSCAR.' + NEW_LINE
    + NEW_LINE
    + 'You have ' + num_days_left.tostring + ' days to ' + task_description + '.  The deadline is '
    + deadline_date.tostring('HH:mm:ss dddd, MMMM d, yyyy') + '.' + NEW_LINE
    + NEW_LINE
    + 'You can review your EMSOF requests by visiting:' + NEW_LINE
    + NEW_LINE
    + '   http://' + ConfigurationSettings.AppSettings['host_domain_name'] + '/'
    + ConfigurationSettings.AppSettings['application_name'] + NEW_LINE
    + NEW_LINE
    + '-- ' + ConfigurationSettings.AppSettings['application_name']
    );
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
