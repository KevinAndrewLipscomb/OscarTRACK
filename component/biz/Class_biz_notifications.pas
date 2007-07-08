unit Class_biz_notifications;

interface

uses
  Class_db_notifications;

type
  TClass_biz_notifications = class
  private
    application_name: string;
    db_notifications: TClass_db_notifications;
    host_domain_name: string;
  public
    constructor Create;
    procedure IssueForAgencyChange
      (
      member_id: string;
      first_name: string;
      last_name: string;
      cad_num: string;
      old_agency_medium_designator: string;
      new_agency_medium_designator: string
      );
    procedure IssueForDriverQualificationChange
      (
      member_id: string;
      first_name: string;
      last_name: string;
      cad_num: string;
      be_driver_qualified: boolean
      );
    procedure IssueForForgottenUsername
      (
      email_address: string;
      username: string;
      client_host_name: string
      );
    procedure IssueForLeaveChanged
      (
      member_id: string;
      first_name: string;
      last_name: string;
      cad_num: string;
      old_start_month: string;
      old_end_month: string;
      old_kind_of_leave: string;
      old_num_obligated_shifts: string;
      old_note: string ;
      new_start_month: string;
      new_end_month: string;
      new_kind_of_leave: string;
      new_num_obligated_shifts: string;
      new_note: string;
      change_indicator_start_month: string;
      change_indicator_end_month: string;
      change_indicator_kind_of_leave: string;
      change_indicator_num_obliged_shifts: string;
      change_indicator_note: string
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
      member_id: string;
      first_name: string;
      last_name: string;
      cad_num: string;
      medical_release_level: string;
      be_driver_qualified: boolean;
      agency_name: string;
      email_address: string;
      enrollment_date: string;
      enrollment_level: string
      );
    procedure IssueForMembershipEstablishmentTrouble
      (
      full_name: string;
      explanation: string
      );
    procedure IssueForNeedsEnrollmentReview
      (
      member_id: string;
      first_name: string;
      last_name: string;
      cad_num: string;
      old_level: string;
      medical_release_level: string
      );
    procedure IssueForNewEnrollmentLevel
      (
      member_id: string;
      first_name: string;
      last_name: string;
      cad_num: string;
      new_level: string;
      effective_date: string;
      note: string
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
    procedure IssueForTemporaryPassword
      (
      username: string;
      client_host_name: string;
      temporary_password: string
      );
    procedure IssueMemberStatusStatement
      (
      email_address: string;
      first_name: string;
      last_name: string;
      cad_num: string;
      agency: string;
      section_num: string;
      medical_release_description: string;
      be_driver_qualified: string;
      enrollment: string;
      length_of_service: string;
      kind_of_leave: string;
      obliged_shifts: string
      );
  end;

implementation

uses
  borland.vcl.sysutils,
  Class_biz_members,
  Class_biz_user,
  Class_biz_users,
  ki,
  system.configuration,
  system.io,
  system.text.regularexpressions,
  system.web,
  system.web.mail;

var
  BreakChars: array[1..3] of char;

constructor TClass_biz_notifications.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  application_name := configurationsettings.appsettings['application_name'];
  db_notifications := TClass_db_notifications.Create;
  host_domain_name := configurationsettings.appsettings['host_domain_name'];
end;

procedure TClass_biz_notifications.IssueForAgencyChange
  (
  member_id: string;
  first_name: string;
  last_name: string;
  cad_num: string;
  old_agency_medium_designator: string;
  new_agency_medium_designator: string
  );
var
  actor: string;
  actor_email_address: string;
  actor_member_id: string;
  biz_members: TClass_biz_members;
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
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
      .Replace('<old_agency_medium_designator/>',old_agency_medium_designator)
      .Replace('<new_agency_medium_designator/>',new_agency_medium_designator);
  END;
  //
begin
  //
  biz_members := TClass_biz_members.Create;
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  //
  actor_member_id := biz_members.IdOfUserId(biz_user.IdNum);
  actor := biz_user.Roles[0] + SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + SPACE + biz_members.LastNameOfMemberId(actor_member_id);
  actor_email_address := biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum);
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/agency_change.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_members.EmailAddressOf(member_id) + ',' + actor_email_address + ',' + db_notifications.TargetOf('agency-change',member_id),
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForDriverQualificationChange
  (
  member_id: string;
  first_name: string;
  last_name: string;
  cad_num: string;
  be_driver_qualified: boolean
  );
var
  actor: string;
  actor_email_address: string;
  actor_member_id: string;
  biz_members: TClass_biz_members;
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
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
      .Replace('<be_driver_qualified/>',YesNoOf(be_driver_qualified));
  END;
  //
begin
  //
  biz_members := TClass_biz_members.Create;
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  //
  actor_member_id := biz_members.IdOfUserId(biz_user.IdNum);
  actor := biz_user.Roles[0] + SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + SPACE
  + biz_members.LastNameOfMemberId(actor_member_id);
  actor_email_address := biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum);
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/driver_qualification_change.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_members.EmailAddressOf(member_id)
    + ',' + actor_email_address
    + ',' + db_notifications.TargetOf('driver-qualification-change',member_id),
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForForgottenUsername
  (
  email_address: string;
  username: string;
  client_host_name: string
  );
var
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
  template_reader: streamreader;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      // always needed
      .Replace('<application_name/>',application_name)
      .Replace('<host_domain_name/>',host_domain_name)
      // message-dependent
      .Replace('<client_host_name/>',client_host_name)
      .Replace('<email_address/>',client_host_name)
      .Replace('<username/>',username);
  END;
  //
begin
  //
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  //
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/username_reminder.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    email_address,
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForLeaveChanged
  (
  member_id: string;
  first_name: string;
  last_name: string;
  cad_num: string;
  old_start_month: string;
  old_end_month: string;
  old_kind_of_leave: string;
  old_num_obligated_shifts: string;
  old_note: string ;
  new_start_month: string;
  new_end_month: string;
  new_kind_of_leave: string;
  new_num_obligated_shifts: string;
  new_note: string;
  change_indicator_start_month: string;
  change_indicator_end_month: string;
  change_indicator_kind_of_leave: string;
  change_indicator_num_obliged_shifts: string;
  change_indicator_note: string
  );
var
  actor: string;
  actor_email_address: string;
  actor_member_id: string;
  biz_members: TClass_biz_members;
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
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
      .Replace('<old_start_month/>',old_start_month)
      .Replace('<old_end_month/>',old_end_month)
      .Replace('<old_kind_of_leave/>',old_kind_of_leave)
      .Replace('<old_num_obligated_shifts/>',old_num_obligated_shifts)
      .Replace('<old_note/>',old_note)
      .Replace('<new_start_month/>',new_start_month)
      .Replace('<new_end_month/>',new_end_month)
      .Replace('<new_kind_of_leave/>',new_kind_of_leave)
      .Replace('<new_num_obligated_shifts/>',new_num_obligated_shifts)
      .Replace('<new_note/>',new_note)
      .Replace('<change_indicator_start_month/>',change_indicator_start_month)
      .Replace('<change_indicator_end_month/>',change_indicator_end_month)
      .Replace('<change_indicator_kind_of_leave/>',change_indicator_kind_of_leave)
      .Replace('<change_indicator_num_obliged_shifts/>',change_indicator_num_obliged_shifts)
      .Replace('<change_indicator_note/>',change_indicator_note);
  END;
  //
begin
  //
  biz_members := TClass_biz_members.Create;
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  //
  actor_member_id := biz_members.IdOfUserId(biz_user.IdNum);
  actor := biz_user.Roles[0] + SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + SPACE + biz_members.LastNameOfMemberId(actor_member_id);
  actor_email_address := biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum);
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/leave_changed.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_members.EmailAddressOf(member_id) + ',' + actor_email_address + ',' + db_notifications.TargetOf('leave-granted',member_id),
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
  actor_member_id: string;
  biz_members: TClass_biz_members;
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
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
      .Replace('<start_month/>',start_month)
      .Replace('<end_month/>',end_month)
      .Replace('<kind_of_leave/>',kind_of_leave)
      .Replace('<num_obligated_shifts/>',num_obligated_shifts)
      .Replace('<note/>',note)
  END;
  //
begin
  //
  biz_members := TClass_biz_members.Create;
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  //
  actor_member_id := biz_members.IdOfUserId(biz_user.IdNum);
  actor := biz_user.Roles[0] + SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + SPACE + biz_members.LastNameOfMemberId(actor_member_id);
  actor_email_address := biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum);
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/leave_deleted.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_members.EmailAddressOf(member_id) + ',' + actor_email_address + ',' + db_notifications.TargetOf('leave-deleted',member_id),
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
  actor_member_id: string;
  biz_members: TClass_biz_members;
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
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
      .Replace('<start_month/>',start_month)
      .Replace('<end_month/>',end_month)
      .Replace('<kind_of_leave/>',kind_of_leave)
      .Replace('<num_obligated_shifts/>',num_obligated_shifts)
      .Replace('<note/>',note)
  END;
  //
begin
  //
  biz_members := TClass_biz_members.Create;
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  //
  actor_member_id := biz_members.IdOfUserId(biz_user.IdNum);
  actor := biz_user.Roles[0] + SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + SPACE + biz_members.LastNameOfMemberId(actor_member_id);
  actor_email_address := biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum);
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/leave_granted.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_members.EmailAddressOf(member_id) + ',' + actor_email_address + ',' + db_notifications.TargetOf('leave-granted',member_id),
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
  actor_member_id: string;
  biz_members: TClass_biz_members;
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
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
  //
  biz_members := TClass_biz_members.Create;
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  //
  actor_member_id := biz_members.IdOfUserId(biz_user.IdNum);
  actor := biz_user.Roles[0] + SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + SPACE + biz_members.LastNameOfMemberId(actor_member_id);
  actor_email_address := biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum);
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/medical_release_level_change.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_members.EmailAddressOf(member_id)
    + ',' + actor_email_address
    + ',' + db_notifications.TargetOf('medical-release-level-change',member_id),
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForMemberAdded
  (
  member_id: string;
  first_name: string;
  last_name: string;
  cad_num: string;
  medical_release_level: string;
  be_driver_qualified: boolean;
  agency_name: string;
  email_address: string;
  enrollment_date: string;
  enrollment_level: string
  );
var
  actor: string;
  actor_email_address: string;
  actor_member_id: string;
  biz_members: TClass_biz_members;
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
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
      .Replace('<be_driver_qualified/>',YesNoOf(be_driver_qualified))
      .Replace('<agency_name/>',agency_name)
      .Replace('<email_address/>',email_address)
      .Replace('<enrollment_date/>',enrollment_date)
      .Replace('<enrollment_level/>',enrollment_level)
      .Replace('<host_domain_name/>',host_domain_name);
  END;
  //
begin
  //
  biz_members := TClass_biz_members.Create;
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  //
  actor_member_id := biz_members.IdOfUserId(biz_user.IdNum);
  actor := biz_user.Roles[0] + SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + SPACE + biz_members.LastNameOfMemberId(actor_member_id);
  actor_email_address := biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum);
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/member_added.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    email_address + ',' + actor_email_address + ',' + db_notifications.TargetOf('member-added',member_id),
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForMembershipEstablishmentTrouble
  (
  full_name: string;
  explanation: string
  );
var
  user_email_address: string;
  biz_user: TClass_biz_user;
  template_reader: streamreader;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      .Replace('<full_name/>',full_name.toupper)
      .Replace('<user_email_address/>',user_email_address)
      .Replace('<application_name/>',application_name)
      .Replace
        (
        '<explanation/>',
        WrapText
          (explanation,(NEW_LINE + '   '),BreakChars,int16.Parse(configurationsettings.AppSettings['email_blockquote_maxcol']))
        )
      .Replace('<host_domain_name/>',host_domain_name);
  END;
  //
begin
  //
  biz_user := TClass_biz_user.Create;
  //
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/membership_establishment_trouble.txt'));
  user_email_address := biz_user.EmailAddress;
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    // to
    configurationsettings.appsettings['membership_establishment_liaison'] + ','
    + configurationsettings.appsettings['application_name'] + '-appadmin@' + host_domain_name,
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForNeedsEnrollmentReview
  (
  member_id: string;
  first_name: string;
  last_name: string;
  cad_num: string;
  old_level: string;
  medical_release_level: string
  );
var
  actor: string;
  actor_email_address: string;
  actor_member_id: string;
  biz_members: TClass_biz_members;
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
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
      .Replace('<old_level/>',old_level)
      .Replace('<medical_release_level/>',medical_release_level);
  END;
  //
begin
  //
  biz_members := TClass_biz_members.Create;
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  //
  actor_member_id := biz_members.IdOfUserId(biz_user.IdNum);
  actor := biz_user.Roles[0] + SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + SPACE + biz_members.LastNameOfMemberId(actor_member_id);
  actor_email_address := biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum);
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/needs_enrollment_review.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_members.EmailAddressOf(member_id)
    + ',' + actor_email_address
    + ',' + db_notifications.TargetOf('needs-enrollment-review',member_id),
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
  effective_date: string;
  note: string
  );
var
  actor: string;
  actor_email_address: string;
  actor_member_id: string;
  biz_members: TClass_biz_members;
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
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
      .Replace('<new_level/>',new_level)
      .Replace('<note/>',note);
  END;
  //
begin
  //
  biz_members := TClass_biz_members.Create;
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  //
  actor_member_id := biz_members.IdOfUserId(biz_user.IdNum);
  actor := biz_user.Roles[0] + SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + SPACE + biz_members.LastNameOfMemberId(actor_member_id);
  actor_email_address := biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum);
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/new_enrollment_level.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_members.EmailAddressOf(member_id)
    + ',' + actor_email_address
    + ',' + db_notifications.TargetOf('new-enrollment-level',member_id),
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
  actor_member_id: string;
  biz_members: TClass_biz_members;
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
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
  //
  biz_members := TClass_biz_members.Create;
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  //
  actor_member_id := biz_members.IdOfUserId(biz_user.IdNum);
  actor := biz_user.Roles[0] + SPACE + biz_members.FirstNameOfMemberId(actor_member_id) + SPACE + biz_members.LastNameOfMemberId(actor_member_id);
  actor_email_address := biz_users.PasswordResetEmailAddressOfId(biz_user.IdNum);
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/section_change.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_members.EmailAddressOf(member_id) + ',' + actor_email_address + ',' + db_notifications.TargetOf('section-change',member_id),
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueForTemporaryPassword
  (
  username: string;
  client_host_name: string;
  temporary_password: string
  );
var
  biz_user: TClass_biz_user;
  biz_users: TClass_biz_users;
  template_reader: streamreader;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      // always needed
      .Replace('<application_name/>',application_name)
      .Replace('<host_domain_name/>',host_domain_name)
      // message-dependent
      .Replace('<client_host_name/>',client_host_name)
      .Replace('<temporary_password/>',temporary_password);
  END;
  //
begin
  biz_user := TClass_biz_user.Create;
  biz_users := TClass_biz_users.Create;
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/temporary_password.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    biz_users.PasswordResetEmailAddressOfUsername(username),
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

procedure TClass_biz_notifications.IssueMemberStatusStatement
  (
  email_address: string;
  first_name: string;
  last_name: string;
  cad_num: string;
  agency: string;
  section_num: string;
  medical_release_description: string;
  be_driver_qualified: string;
  enrollment: string;
  length_of_service: string;
  kind_of_leave: string;
  obliged_shifts: string
  );
var
  template_reader: streamreader;
  //
  FUNCTION Merge(s: string): string;
  BEGIN
    Merge := s
      // always needed
      .Replace('<application_name/>',application_name)
      .Replace('<host_domain_name/>',host_domain_name)
      // message-dependent
      .Replace('<first_name/>',first_name)
      .Replace('<last_name/>',last_name)
      .Replace('<cad_num/>',cad_num)
      .Replace('<agency/>',agency)
      .Replace('<section_num/>',section_num)
      .Replace('<medical_release_description/>',medical_release_description)
      .Replace('<be_driver_qualified/>',be_driver_qualified)
      .Replace('<enrollment/>',enrollment)
      .Replace('<length_of_service/>',length_of_service)
      .Replace('<kind_of_leave/>',kind_of_leave)
      .Replace('<obliged_shifts/>',obliged_shifts);
  END;
  //
begin
  template_reader := &file.OpenText(httpcontext.current.server.MapPath('template/notification/member_status_statement.txt'));
  ki.SmtpMailSend
    (
    //from
    configurationsettings.appsettings['sender_email_address'],
    //to
    email_address,
    //subject
    Merge(template_reader.ReadLine),
    //body
    Merge(template_reader.ReadToEnd)
    );
  template_reader.Close;
end;

begin
  BreakChars[1] := ki.SPACE;
  BreakChars[2] := ki.TAB;
  BreakChars[3] := '-';
end.
