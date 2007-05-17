unit Class_biz_members;

interface

uses
  Class_biz_agencies,
  Class_biz_enrollment,
  Class_biz_leave,
  Class_biz_medical_release_levels,
  Class_biz_notifications,
  Class_biz_sections,
  Class_db_members,
  Class_db_users;

type
  TClass_biz_members = class
  private
    db_members: TClass_db_members;
    db_users: TClass_db_users;
    biz_agencies: TClass_biz_agencies;
    biz_enrollment: TClass_biz_enrollment;
    biz_medical_release_levels: TClass_biz_medical_release_levels;
    biz_notifications: TClass_biz_notifications;
    biz_sections: TClass_biz_sections;
  public
    constructor Create;
    function Add
      (
      first_name: string;
      last_name: string;
      cad_num: string;
      medical_release_code: string;
      be_driver_qualified: string;
      agency_id: string;
      email_address: string;
      enrollment_date: datetime;
      enrollment_level: string = ''
      )
      : boolean;
    function AgencyIdOfId(id: string): string;
    function BeDriverQualifiedOf(e_item: system.object): string;
    function BeValidProfile(id: string): boolean;
    procedure BindRoster
      (
      member_id: string;
      sort_order: string;
      be_sort_order_ascending: boolean;
      target: system.object;
      relative_month: string;
      agency_filter: string;
      enrollment_filter: Class_biz_enrollment.filter_type = CURRENT;
      leave_filter: Class_biz_leave.filter_type = Class_biz_leave.NONE;
      med_release_level_filter: Class_biz_medical_release_levels.filter_type = ALL;
      section_filter: Class_biz_sections.filter_type = 0
      );
    function CadNumOf(e_item: system.object): string;
    function CadNumOfMemberId(member_id: string): string;
    function EmailAddressOf(member_id: string): string;
    function EnrollmentOf(e_item: system.object): string;
    function FirstNameOf(e_item: system.object): string;
    function FirstNameOfMemberId(member_id: string): string;
    procedure GetProfile
      (
      id: string;
      out name: string;
      out be_valid_profile: boolean
      );
    function IdOf(e_item: system.object): string;
    function IdOfRoleHolderAtAgency
      (
      role_name: string;
      agency_short_designator: string
      )
      : string;
    function IdOfUserId(user_id: string): string;
    function LastNameOf(e_item: system.object): string;
    function LastNameOfMemberId(member_id: string): string;
    function MedicalReleaseLevelOf(e_item: system.object): string;
    function OfficershipOf(member_id: string): string;
    function SectionOf(e_item: system.object): string;
    procedure SetDriverQualification
      (
      be_driver_qualified: boolean;
      e_item: system.object
      );
    procedure SetEmailAddress
      (
      id: string;
      email_address: string
      );
    procedure SetSection
      (
      section_num: string;
      e_item: system.object
      );
    procedure SetMedicalReleaseCode
      (
      code: string;
      e_item: system.object
      );
    procedure SetProfile
      (
      id: string;
      name: string
      );
    function UserIdOf(member_id: string): string;
  end;

implementation

constructor TClass_biz_members.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
  db_members := TClass_db_members.Create;
  db_users := TClass_db_users.Create;
  biz_agencies := TClass_biz_agencies.Create;
  biz_enrollment := TClass_biz_enrollment.Create;
  biz_medical_release_levels := TClass_biz_medical_release_levels.Create;
  biz_notifications := TClass_biz_notifications.Create;
  biz_sections := TClass_biz_sections.Create;
end;

function TClass_biz_members.Add
  (
  first_name: string;
  last_name: string;
  cad_num: string;
  medical_release_code: string;
  be_driver_qualified: string;
  agency_id: string;
  email_address: string;
  enrollment_date: datetime;
  enrollment_level: string = ''
  )
  : boolean;
begin
  Add := FALSE;
  if not db_members.BeKnown(first_name,last_name,cad_num) then begin
    db_members.Add
      (
      first_name,
      last_name,
      cad_num,
      uint32.Parse(medical_release_code),
      boolean(system.object.Create).Parse(be_driver_qualified),
      uint32.Parse(agency_id),
      email_address,
      enrollment_date,
      uint32.Parse(enrollment_level)
      );
    biz_notifications.IssueForMemberAdded
      (
      db_members.IdOfFirstnameLastnameCadnum(first_name,last_name,cad_num),
      first_name,
      last_name,
      cad_num,
      biz_medical_release_levels.DescriptionOf(medical_release_code),
      be_driver_qualified,
      biz_agencies.MediumDesignatorOf(agency_id) + ' - ' + biz_agencies.LongDesignatorOf(agency_id),
      email_address,
      enrollment_date.tostring('dd MMMM yyyy'),
      biz_enrollment.DescriptionOf(enrollment_level)
      );
    Add := TRUE;
  end;
end;

function TClass_biz_members.AgencyIdOfId(id: string): string;
begin
  AgencyIdOfId := db_members.AgencyIdOfId(id);
end;

function TClass_biz_members.BeDriverQualifiedOf(e_item: system.object): string;
begin
  BeDriverQualifiedOf := db_members.BeDriverQualifiedOf(e_item);
end;

function TClass_biz_members.BeValidProfile(id: string): boolean;
begin
  BeValidProfile := db_members.BeValidProfile(id);
end;

procedure TClass_biz_members.BindRoster
  (
  member_id: string;
  sort_order: string;
  be_sort_order_ascending: boolean;
  target: system.object;
  relative_month: string;
  agency_filter: string;
  enrollment_filter: Class_biz_enrollment.filter_type = CURRENT;
  leave_filter: Class_biz_leave.filter_type = Class_biz_leave.NONE;
  med_release_level_filter: Class_biz_medical_release_levels.filter_type = ALL;
  section_filter: Class_biz_sections.filter_type = 0
  );
begin
  db_members.BindRoster
    (
    member_id,
    sort_order,
    be_sort_order_ascending,
    target,
    relative_month,
    agency_filter,
    enrollment_filter,
    leave_filter,
    med_release_level_filter,
    section_filter
    );
end;

function TClass_biz_members.CadNumOf(e_item: system.object): string;
begin
  CadNumOf := db_members.CadNumOf(e_item);
end;

function TClass_biz_members.CadNumOfMemberId(member_id: string): string;
begin
  CadNumOfMemberId := db_members.CadNumOfMemberId(member_id);
end;

function TClass_biz_members.EmailAddressOf(member_id: string): string;
begin
  EmailAddressOf := db_members.EmailAddressOf(member_id);
end;

function TClass_biz_members.EnrollmentOf(e_item: system.object): string;
begin
  EnrollmentOf := db_members.EnrollmentOf(e_item);
end;

function TClass_biz_members.FirstNameOf(e_item: system.object): string;
begin
  FirstNameOf := db_members.FirstNameOf(e_item);
end;

function TClass_biz_members.FirstNameOfMemberId(member_id: string): string;
begin
  FirstNameOfMemberId := db_members.FirstNameOfMemberId(member_id);
end;

procedure TClass_biz_members.GetProfile
  (
  id: string;
  out name: string;
  out be_valid_profile: boolean
  );
begin
  db_members.GetProfile
    (
    id,
    name,
    be_valid_profile
    );
end;

function TClass_biz_members.IdOf(e_item: system.object): string;
begin
  IdOf := db_members.IdOf(e_item);
end;

function TClass_biz_members.IdOfRoleHolderAtAgency
  (
  role_name: string;
  agency_short_designator: string
  )
  : string;
begin
  IdOfRoleHolderAtAgency := db_members.IdOfRoleHolderAtAgency(role_name,agency_short_designator);
end;

function TClass_biz_members.IdOfUserId(user_id: string): string;
begin
  IdOfUserId := db_members.IdOfUserId(user_id);
end;

function TClass_biz_members.LastNameOf(e_item: system.object): string;
begin
  LastNameOf := db_members.LastNameOf(e_item);
end;

function TClass_biz_members.LastNameOfMemberId(member_id: string): string;
begin
  LastNameOfMemberId := db_members.LastNameOfMemberId(member_id);
end;

function TClass_biz_members.MedicalReleaseLevelOf(e_item: system.object): string;
begin
  MedicalReleaseLevelOf := db_members.MedicalReleaseLevelOf(e_item);
end;

function TClass_biz_members.OfficershipOf(member_id: string): string;
begin
  OfficerShipOf := db_members.OfficershipOf(member_id);
end;

function TClass_biz_members.SectionOf(e_item: system.object): string;
begin
  SectionOf := db_members.SectionOf(e_item);
end;

procedure TClass_biz_members.SetDriverQualification
  (
  be_driver_qualified: boolean;
  e_item: system.object
  );
begin
  db_members.SetDriverQualification(be_driver_qualified,e_item);
  biz_notifications.IssueForDriverQualificationChange
    (
    IdOf(e_item),
    FirstNameOf(e_item),
    LastNameOf(e_item),
    CadNumOf(e_item),
    be_driver_qualified.tostring.ToUpper
    );
end;

procedure TClass_biz_members.SetEmailAddress
  (
  id: string;
  email_address: string
  );
begin
  db_members.SetEmailAddress(id,email_address);
end;

procedure TClass_biz_members.SetSection
  (
  section_num: string;
  e_item: system.object
  );
var
  member_id: string;
begin
  db_members.SetSection(section_num,e_item);
  member_id := IdOf(e_item);
  biz_notifications.IssueForSectionChange
    (
    member_id,
    FirstNameOf(e_item),
    LastNameOf(e_item),
    CadNumOf(e_item),
    biz_agencies.MediumDesignatorOf(AgencyIdOfId(member_id)),
    section_num
    );
end;

procedure TClass_biz_members.SetMedicalReleaseCode
  (
  code: string;
  e_item: system.object
  );
begin
  db_members.SetMedicalReleaseCode(code,e_item);
  biz_notifications.IssueForMedicalReleaseLevelChange
    (
    IdOf(e_item),
    FirstNameOf(e_item),
    LastNameOf(e_item),
    CadNumOf(e_item),
    MedicalReleaseLevelOf(e_item)
    );
end;

procedure TClass_biz_members.SetProfile
  (
  id: string;
  name: string
  );
begin
  db_members.SetProfile(id,name);
end;

function TClass_biz_members.UserIdOf(member_id: string): string;
begin
  UserIdOf := db_members.UserIdOf(member_id);
end;

end.
