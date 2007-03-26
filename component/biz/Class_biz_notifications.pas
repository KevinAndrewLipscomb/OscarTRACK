unit Class_biz_notifications;

interface

uses
  Class_biz_accounts,
  Class_biz_user;

type
  TClass_biz_notifications = class
  private
    application_name: string;
    biz_accounts: TClass_biz_accounts;
    biz_user: TClass_biz_user;
    host_domain_name: string;
  public
    constructor Create;
    procedure IssueForDriverQualificationChange
      (
      member_id: string;
      first_name: string;
      last_name: string;
      cad_num: string;
      be_driver_qualified: string
      );
    procedure IssueForLeaveDeleted
      (
      member_id: string;
      first_name: string;
      last_name: string;
      cad_num: string;
      start_month: string;
      end_month: string;
      kind_of_leave: string;
      num_obligated_shifts: string;
      note: string
      );
    procedure IssueForLeaveGranted
      (
      member_id: string;
      first_name: string;
      last_name: string;
      cad_num: string;
      start_month: string;
      end_month: string;
      kind_of_leave: string;
      num_obligated_shifts: string;
      note: string
      );
    procedure IssueForMedicalReleaseLevelChange
      (
      member_id: string;
      first_name: string;
      last_name: string;
      cad_num: string;
      medical_release_level: string
      );
    procedure IssueForMemberAdded
      (
      first_name: string;
      last_name: string;
      cad_num: string;
      medical_release_level: string;
      be_driver_qualified: string;
      agency_name: string;
      email_address: string;
      enrollment_date: string;
      enrollment_level: string
      );
    procedure IssueForNewEnrollmentLevel
      (
      member_id: string;
      first_name: string;
      last_name: string;
      cad_num: string;
      new_level: string;
      effective_date: string
      );
    procedure IssueForSectionChange
      (
      member_id: string;
      first_name: string;
      last_name: string;
      cad_num: string;
      agency_name: string;
      section_num: string
      );
  end;

implementation

uses
  ki,
  system.configuration,
  system.io,
  system.text.regularexpressions,
  system.web,
  system.web.mail;

constructor TClass_biz_notifications.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  application_name := configurationsettings.appsettings['application_name'];
  biz_accounts := TClass_biz_accounts.Create;
  biz_user := TClass_biz_user.Create;
  host_domain_name := configurationsettings.appsettings['host_domain_name'];
end;

procedure TClass_biz_notifications.IssueForDriverQualificationChange
  (
  member_id: string;
  first_name: string;
  last_name: string;
  cad_num: string;
  be_driver_qualified: string
  );
var
  actor: string;
  actor_email_address: string;
  other_official_targets: string;
  template_reader: streamreader;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      .Replace('<actor/>',actor)
      .Replace('<actor_email_address/>',actor_email_address)
      .Replace('<host_domain_name/>',host_domain_name)
      .Replace('<application_name/>',application_name)
      .Replace('<first_name/>',first_name)
      .Replace('<last_name/>',last_name)
      .Replace('<cad_num/>',cad_num)
      .Replace('<be_driver_qualified/>',be_driver_qualified);
  END;
  //
begin
  actor := 'Captain ' + biz_user.IdNum + '50';
  actor_email_address := biz_accounts.EmailAddressByKindId('squad_commander',biz_user.IdNum);
  other_official_targets := configurationsettings.appsettings['department_member_status_coordinator'];
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/driver_qualification_change.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_accounts.EmailAddressByKindId('member',member_id) + ',' + actor_email_address + ',' + other_official_targets,
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForLeaveDeleted
  (
  member_id: string;
  first_name: string;
  last_name: string;
  cad_num: string;
  start_month: string;
  end_month: string;
  kind_of_leave: string;
  num_obligated_shifts: string;
  note: string
  );
var
  actor: string;
  actor_email_address: string;
  other_official_targets: string;
  template_reader: streamreader;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      .Replace('<actor/>',actor)
      .Replace('<actor_email_address/>',actor_email_address)
      .Replace('<application_name/>',application_name)
      .Replace('<cad_num/>',cad_num)
      .Replace('<first_name/>',first_name)
      .Replace('<host_domain_name/>',host_domain_name)
      .Replace('<last_name/>',last_name)
      .Replace('<member_id/>',member_id)
      .Replace('<start_month/>',start_month)
      .Replace('<end_month/>',end_month)
      .Replace('<kind_of_leave/>',kind_of_leave)
      .Replace('<num_obligated_shifts/>',num_obligated_shifts)
      .Replace('<note/>',note)
  END;
  //
begin
  actor := 'Captain ' + biz_user.IdNum + '50';
  actor_email_address := biz_accounts.EmailAddressByKindId('squad_commander',biz_user.IdNum);
  other_official_targets := configurationsettings.appsettings['department_member_status_coordinator'];
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/leave_deleted.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_accounts.EmailAddressByKindId('member',member_id) + ',' + actor_email_address + ',' + other_official_targets,
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForLeaveGranted
  (
  member_id: string;
  first_name: string;
  last_name: string;
  cad_num: string;
  start_month: string;
  end_month: string;
  kind_of_leave: string;
  num_obligated_shifts: string;
  note: string
  );
var
  actor: string;
  actor_email_address: string;
  other_official_targets: string;
  template_reader: streamreader;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      .Replace('<actor/>',actor)
      .Replace('<actor_email_address/>',actor_email_address)
      .Replace('<application_name/>',application_name)
      .Replace('<cad_num/>',cad_num)
      .Replace('<first_name/>',first_name)
      .Replace('<host_domain_name/>',host_domain_name)
      .Replace('<last_name/>',last_name)
      .Replace('<member_id/>',member_id)
      .Replace('<start_month/>',start_month)
      .Replace('<end_month/>',end_month)
      .Replace('<kind_of_leave/>',kind_of_leave)
      .Replace('<num_obligated_shifts/>',num_obligated_shifts)
      .Replace('<note/>',note)
  END;
  //
begin
  actor := 'Captain ' + biz_user.IdNum + '50';
  actor_email_address := biz_accounts.EmailAddressByKindId('squad_commander',biz_user.IdNum);
  other_official_targets := configurationsettings.appsettings['department_member_status_coordinator'];
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/leave_granted.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_accounts.EmailAddressByKindId('member',member_id) + ',' + actor_email_address + ',' + other_official_targets,
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForMedicalReleaseLevelChange
  (
  member_id: string;
  first_name: string;
  last_name: string;
  cad_num: string;
  medical_release_level: string
  );
var
  actor: string;
  actor_email_address: string;
  other_official_targets: string;
  template_reader: streamreader;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      .Replace('<actor/>',actor)
      .Replace('<actor_email_address/>',actor_email_address)
      .Replace('<host_domain_name/>',host_domain_name)
      .Replace('<application_name/>',application_name)
      .Replace('<first_name/>',first_name)
      .Replace('<last_name/>',last_name)
      .Replace('<cad_num/>',cad_num)
      .Replace('<medical_release_level/>',medical_release_level);
  END;
  //
begin
  actor := 'Captain ' + biz_user.IdNum + '50';
  actor_email_address := biz_accounts.EmailAddressByKindId('squad_commander',biz_user.IdNum);
  other_official_targets := configurationsettings.appsettings['department_member_status_coordinator'];
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/medical_release_level_change.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_accounts.EmailAddressByKindId('member',member_id) + ',' + actor_email_address + ',' + other_official_targets,
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForMemberAdded
  (
  first_name: string;
  last_name: string;
  cad_num: string;
  medical_release_level: string;
  be_driver_qualified: string;
  agency_name: string;
  email_address: string;
  enrollment_date: string;
  enrollment_level: string
  );
var
  actor: string;
  actor_email_address: string;
  other_official_targets: string;
  template_reader: streamreader;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      .Replace('<actor/>',actor)
      .Replace('<actor_email_address/>',actor_email_address)
      .Replace('<application_name/>',application_name)
      .Replace('<first_name/>',first_name)
      .Replace('<last_name/>',last_name)
      .Replace('<cad_num/>',cad_num)
      .Replace('<medical_release_level/>',medical_release_level)
      .Replace('<be_driver_qualified/>',be_driver_qualified)
      .Replace('<agency_name/>',agency_name)
      .Replace('<email_address/>',email_address)
      .Replace('<enrollment_date/>',enrollment_date)
      .Replace('<enrollment_level/>',enrollment_level)
      .Replace('<host_domain_name/>',host_domain_name);
  END;
  //
begin
  actor := 'Captain ' + biz_user.IdNum + '50';
  actor_email_address := biz_accounts.EmailAddressByKindId('squad_commander',biz_user.IdNum);
  other_official_targets := configurationsettings.appsettings['department_member_status_coordinator'];
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/member_added.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    email_address + ',' + actor_email_address + ',' + other_official_targets,
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForNewEnrollmentLevel
  (
  member_id: string;
  first_name: string;
  last_name: string;
  cad_num: string;
  new_level: string;
  effective_date: string
  );
var
  actor: string;
  actor_email_address: string;
  other_official_targets: string;
  template_reader: streamreader;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      .Replace('<actor/>',actor)
      .Replace('<actor_email_address/>',actor_email_address)
      .Replace('<application_name/>',application_name)
      .Replace('<cad_num/>',cad_num)
      .Replace('<effective_date/>',effective_date)
      .Replace('<first_name/>',first_name)
      .Replace('<host_domain_name/>',host_domain_name)
      .Replace('<last_name/>',last_name)
      .Replace('<member_id/>',member_id)
      .Replace('<new_level/>',new_level);
  END;
  //
begin
  actor := 'Captain ' + biz_user.IdNum + '50';
  actor_email_address := biz_accounts.EmailAddressByKindId('squad_commander',biz_user.IdNum);
  other_official_targets := configurationsettings.appsettings['department_member_status_coordinator'];
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/new_enrollment_level.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_accounts.EmailAddressByKindId('member',member_id) + ',' + actor_email_address + ',' + other_official_targets,
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForSectionChange
  (
  member_id: string;
  first_name: string;
  last_name: string;
  cad_num: string;
  agency_name: string;
  section_num: string
  );
var
  actor: string;
  actor_email_address: string;
  other_official_targets: string;
  template_reader: streamreader;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      .Replace('<actor/>',actor)
      .Replace('<actor_email_address/>',actor_email_address)
      .Replace('<host_domain_name/>',host_domain_name)
      .Replace('<application_name/>',application_name)
      .Replace('<first_name/>',first_name)
      .Replace('<last_name/>',last_name)
      .Replace('<cad_num/>',cad_num)
      .Replace('<agency_name/>',agency_name)
      .Replace('<section_num/>',section_num);
  END;
  //
begin
  actor := 'Captain ' + biz_user.IdNum + '50';
  actor_email_address := biz_accounts.EmailAddressByKindId('squad_commander',biz_user.IdNum);
  other_official_targets := system.string.EMPTY;
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/section_change.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_accounts.EmailAddressByKindId('member',member_id) + ',' + actor_email_address + ',' + other_official_targets,
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

end.
