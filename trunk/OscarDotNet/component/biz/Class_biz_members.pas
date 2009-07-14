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
  Class_db_users,
  kix,
  system.collections;

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
      be_driver_qualified: boolean;
      agency_id: string;
      email_address: string;
      enrollment_date: datetime;
      enrollment_level: string = '';
      phone_num: string = ''
      )
      : boolean;
    function AgencyOf(e_item: system.object): string;
    function AgencyIdOfId(id: string): string;
    function BeAuthorizedTierOrSameAgency
      (
      subject_member_id: string;
      object_member_id: string
      )
      : boolean;
    function BeDriverQualifiedOf(e_item: system.object): boolean;
    function BeUserAuthorizedToEditEnrollments
      (
      subject_member_id: string;
      e_item: system.object;
      has_edit_enrollments: boolean;
      has_edit_enrollments_nonreleased_ops_members_only: boolean
      )
      : boolean;
    function BeValidProfile(id: string): boolean;
    procedure BindCurrentDirectToListControl
      (
      target: system.object;
      agency_filter: string = EMPTY;
      unselected_literal: string = '-- Member --';
      selected_value: string = EMPTY
      );
    procedure BindRankedCoreOpsSize
      (
      target: system.object;
      do_log: boolean = TRUE
      );
    procedure BindRankedCrewShiftsForecast
      (
      target: system.object;
      do_log: boolean = TRUE
      );
    procedure BindRankedNumMembersInPipeline
      (
      target: system.object;
      do_log: boolean = TRUE
      );
    procedure BindRankedStandardEnrollment
      (
      target: system.object;
      do_log: boolean = TRUE
      );
    procedure BindRankedUtilization
      (
      target: system.object;
      do_log: boolean = TRUE
      );
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
      section_filter: Class_biz_sections.filter_type = 0;
      running_only_filter: boolean = FALSE
      );
    procedure BindSpecialForRankedLengthOfService(target: system.object);
    function CadNumOf(e_item: system.object): string;
    function CadNumOfMemberId(member_id: string): string;
    function CurrentMemberEmailAddressesQueue(agency_short_designator: string = ''): queue;  overload;
    function CurrentMemberEmailAddressesString(agency_short_designator: string = ''): string; overload;
    function EmailAddressOf(member_id: string): string;
    function EnrollmentOf(e_item: system.object): string;
    function EnrollmentOfMemberId(member_id: string): string;
    function FirstNameOf(e_item: system.object): string;
    function FirstNameOfMemberId(member_id: string): string;
    procedure GetProfile
      (
      id: string;
      out name: string;
      out be_valid_profile: boolean
      );
    function HighestTierOf(id: string): string;
    function IdOf(e_item: system.object): string;
    function IdOfAppropriateRoleHolder
      (
      role_name: string;
      agency_short_designator: string
      )
      : string;
    function IdOfUserId(user_id: string): string;
    function LastNameOf(e_item: system.object): string;
    function LastNameOfMemberId(member_id: string): string;
    function MedicalReleaseLevelOf(e_item: system.object): string;
    function MedicalReleaseLevelOfMemberId(member_id: string): string;
    function NamesSimilarTo
      (
      first_name: string;
      last_name: string;
      separator: string
      )
      : string;
    function OfficershipOf(member_id: string): string;
    function PeckCodeOf(e_item: system.object): string;
    function PhoneNumOf(member_id: string): string;
    function RetentionOf(e_item: system.object): string;
    function SectionOf(e_item: system.object): string;
    procedure SetAgency
      (
      old_agency_id: string;
      new_agency_id: string;
      e_item: system.object
      );
    function SetCadNum
      (
      cad_num: string;
      e_item: system.object
      )
      : boolean;
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
    procedure SetName
      (
      old_first: string;
      old_last: string;
      new_first: string;
      new_last: string;
      e_item: system.object
      );
    procedure SetSection
      (
      section_num: string;
      e_item: system.object
      );
    procedure SetMedicalReleaseCode
      (
      old_level: string;
      new_code: string;
      e_item: system.object
      );
    procedure SetPhoneNum
      (
      phone_num: string;
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
  be_driver_qualified: boolean;
  agency_id: string;
  email_address: string;
  enrollment_date: datetime;
  enrollment_level: string = '';
  phone_num: string = ''
  )
  : boolean;
begin
  Add := FALSE;
  if not db_members.BeKnown(first_name,last_name,cad_num) then begin
    if phone_num.Length = 7 then begin
      phone_num := '757' + phone_num;
    end;
    db_members.Add
      (
      first_name,
      last_name,
      cad_num,
      uint32.Parse(medical_release_code),
      be_driver_qualified,
      uint32.Parse(agency_id),
      email_address,
      enrollment_date,
      uint32.Parse(enrollment_level),
      phone_num
      );
    biz_notifications.IssueForMemberAdded
      (
      db_members.IdOfFirstnameLastnameCadnum(first_name,last_name,cad_num),
      first_name,
      last_name,
      cad_num,
      biz_medical_release_levels.DescriptionOf(medical_release_code),
      be_driver_qualified,
      biz_agencies.MediumDesignatorOf(agency_id) + SPACE_HYPHEN_SPACE + biz_agencies.LongDesignatorOf(agency_id),
      email_address,
      enrollment_date.tostring('dd MMMM yyyy'),
      biz_enrollment.DescriptionOf(enrollment_level),
      phone_num
      );
    Add := TRUE;
  end;
end;

function TClass_biz_members.AgencyOf(e_item: system.object): string;
begin
  AgencyOf := db_members.AgencyOf(e_item);
end;

function TClass_biz_members.AgencyIdOfId(id: string): string;
begin
  AgencyIdOfId := db_members.AgencyIdOfId(id);
end;

function TClass_biz_members.BeAuthorizedTierOrSameAgency
  (
  subject_member_id: string;
  object_member_id: string
  )
  : boolean;
begin
  BeAuthorizedTierOrSameAgency := (HighestTierOf(subject_member_id) = '1')
    or (AgencyIdOfId(subject_member_id) = AgencyIdOfId(object_member_id));
end;

function TClass_biz_members.BeDriverQualifiedOf(e_item: system.object): boolean;
begin
  BeDriverQualifiedOf := db_members.BeDriverQualifiedOf(e_item);
end;

function TClass_biz_members.BeUserAuthorizedToEditEnrollments
  (
  subject_member_id: string;
  e_item: system.object;
  has_edit_enrollments: boolean;
  has_edit_enrollments_nonreleased_ops_members_only: boolean
  )
  : boolean;
begin
  BeUserAuthorizedToEditEnrollments := BeAuthorizedTierOrSameAgency(subject_member_id,IdOf(e_item))
    and
      (
        has_edit_enrollments
      or
        (
          has_edit_enrollments_nonreleased_ops_members_only
        and
          (
            not BeDriverQualifiedOf(e_item)
          or
            not biz_medical_release_levels.BeReleased(PeckCodeOf(e_item))
          )
        )
      )
    ;
end;

function TClass_biz_members.BeValidProfile(id: string): boolean;
begin
  BeValidProfile := db_members.BeValidProfile(id);
end;

procedure TClass_biz_members.BindCurrentDirectToListControl
  (
  target: system.object;
  agency_filter: string = EMPTY;
  unselected_literal: string = '-- Member --';
  selected_value: string = EMPTY
  );
begin
  db_members.BindCurrentDirectToListControl(target,agency_filter,unselected_literal,selected_value);
end;

procedure TClass_biz_members.BindRankedCoreOpsSize
  (
  target: system.object;
  do_log: boolean = TRUE
  );
begin
  db_members.BindRankedCoreOpsSize(target,do_log);
end;

procedure TClass_biz_members.BindRankedCrewShiftsForecast
  (
  target: system.object;
  do_log: boolean = TRUE
  );
begin
  db_members.BindRankedCrewShiftsForecast(target,do_log);
end;

procedure TClass_biz_members.BindRankedNumMembersInPipeline
  (
  target: system.object;
  do_log: boolean = TRUE
  );
begin
  db_members.BindRankedNumMembersInPipeline(target,do_log);
end;

procedure TClass_biz_members.BindRankedStandardEnrollment
  (
  target: system.object;
  do_log: boolean = TRUE
  );
begin
  db_members.BindRankedStandardEnrollment(target,do_log);
end;

procedure TClass_biz_members.BindRankedUtilization
  (
  target: system.object;
  do_log: boolean = TRUE
  );
begin
  db_members.BindRankedUtilization(target,do_log);
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
  section_filter: Class_biz_sections.filter_type = 0;
  running_only_filter: boolean = FALSE
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
    section_filter,
    running_only_filter
    );
end;

procedure TClass_biz_members.BindSpecialForRankedLengthOfService(target: system.object);
begin
  db_members.BindSpecialForRankedLengthOfService(target);
end;

function TClass_biz_members.CadNumOf(e_item: system.object): string;
begin
  CadNumOf := db_members.CadNumOf(e_item);
end;

function TClass_biz_members.CadNumOfMemberId(member_id: string): string;
begin
  CadNumOfMemberId := db_members.CadNumOfMemberId(member_id);
end;

function TClass_biz_members.CurrentMemberEmailAddressesQueue(agency_short_designator: string = ''): queue;
begin
  CurrentMemberEmailAddressesQueue := db_members.CurrentMemberEmailAddresses(agency_short_designator);
end;

function TClass_biz_members.CurrentMemberEmailAddressesString(agency_short_designator: string = ''): string;
var
  current_member_email_addresses: string;
  i: cardinal;
  q: queue;
begin
  current_member_email_addresses := EMPTY;
  q := CurrentMemberEmailAddressesQueue(agency_short_designator);
  for i := 1 to q.Count do begin
    current_member_email_addresses := current_member_email_addresses + q.Dequeue.tostring + COMMA_SPACE;
  end;
  CurrentMemberEmailAddressesString := (current_member_email_addresses + SPACE).TrimEnd([',',' ']);
end;

function TClass_biz_members.EmailAddressOf(member_id: string): string;
begin
  EmailAddressOf := db_members.EmailAddressOf(member_id);
end;

function TClass_biz_members.EnrollmentOf(e_item: system.object): string;
begin
  EnrollmentOf := db_members.EnrollmentOf(e_item);
end;

function TClass_biz_members.EnrollmentOfMemberId(member_id: string): string;
begin
  EnrollmentOfMemberId := db_members.EnrollmentOfMemberId(member_id);
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

function TClass_biz_members.HighestTierOf(id: string): string;
begin
  HighestTierOf := db_members.HighestTierOf(id);
end;

function TClass_biz_members.IdOf(e_item: system.object): string;
begin
  IdOf := db_members.IdOf(e_item);
end;

function TClass_biz_members.IdOfAppropriateRoleHolder
  (
  role_name: string;
  agency_short_designator: string
  )
  : string;
begin
  if agency_short_designator <> 'EMS' then begin
    IdOfAppropriateRoleHolder := db_members.IdOfRoleHolderAtAgency(role_name,agency_short_designator);
  end else begin
    IdOfAppropriateRoleHolder := db_members.IdOfRoleHolder(role_name);
  end;
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

function TClass_biz_members.MedicalReleaseLevelOfMemberId(member_id: string): string;
begin
  MedicalReleaseLevelOfMemberId := db_members.MedicalReleaseLevelOfMemberId(member_id);
end;

function TClass_biz_members.NamesSimilarTo
  (
  first_name: string;
  last_name: string;
  separator: string
  )
  : string;
begin
  NamesSimilarTo := db_members.NamesSimilarTo(first_name,last_name,separator);
end;

function TClass_biz_members.OfficershipOf(member_id: string): string;
begin
  OfficerShipOf := db_members.OfficershipOf(member_id);
end;

function TClass_biz_members.PhoneNumOf(member_id: string): string;
begin
  PhoneNumOf := db_members.PhoneNumOf(member_id);
end;

function TClass_biz_members.PeckCodeOf(e_item: system.object): string;
begin
  PeckCodeOf := db_members.PeckCodeOf(e_item);
end;

function TClass_biz_members.RetentionOf(e_item: system.object): string;
begin
  RetentionOf := db_members.RetentionOf(e_item);
end;

function TClass_biz_members.SectionOf(e_item: system.object): string;
begin
  SectionOf := db_members.SectionOf(e_item);
end;

procedure TClass_biz_members.SetAgency
  (
  old_agency_id: string;
  new_agency_id: string;
  e_item: system.object
  );
var
  member_id: string;
begin
  db_members.SetAgency(new_agency_id,e_item);
  member_id := IdOf(e_item);
  biz_notifications.IssueForAgencyChange
    (
    member_id,
    FirstNameOf(e_item),
    LastNameOf(e_item),
    CadNumOf(e_item),
    biz_agencies.MediumDesignatorOf(old_agency_id),
    biz_agencies.MediumDesignatorOf(new_agency_id)
    );
end;

function TClass_biz_members.SetCadNum
  (
  cad_num: string;
  e_item: system.object
  )
  : boolean;
begin
  SetCadNum := FALSE;
  if not db_members.BeKnown(cad_num) then begin
    db_members.SetCadNum(cad_num,e_item);
    biz_notifications.IssueForCadNumChange
      (
      db_members.IdOf(e_item),
      db_members.FirstNameOf(e_item),
      db_members.LastNameOf(e_item),
      cad_num
      );
    SetCadNum := TRUE;
  end;
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
    be_driver_qualified
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

procedure TClass_biz_members.SetName
  (
  old_first: string;
  old_last: string;
  new_first: string;
  new_last: string;
  e_item: system.object
  );
var
  member_id: string;
begin
  db_members.SetName(new_first,new_last,e_item);
  member_id := IdOf(e_item);
  biz_notifications.IssueForMemberNameChange
    (
    member_id,
    CadNumOf(e_item),
    old_first,
    old_last,
    new_first,
    new_last
    );
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
  old_level: string;
  new_code: string;
  e_item: system.object
  );
begin
  db_members.SetMedicalReleaseCode(new_code,e_item);
  biz_notifications.IssueForMedicalReleaseLevelChange
    (
    IdOf(e_item),
    FirstNameOf(e_item),
    LastNameOf(e_item),
    CadNumOf(e_item),
    MedicalReleaseLevelOf(e_item)
    );
  if biz_medical_release_levels.BeRecruitAdminOrSpecOpsBoundByDescription(old_level)
    and not biz_medical_release_levels.BeRecruitAdminOrSpecOpsBoundByCode(new_code)
  then begin
    biz_enrollment.SetLevel
      (
      biz_enrollment.CodeOf('Regular'),
      datetime.Today,
      EMPTY,
      IdOf(e_item),
      e_item
      );
  end;
end;

procedure TClass_biz_members.SetPhoneNum
  (
  phone_num: string;
  e_item: system.object
  );
var
  member_id: string;
begin
  if phone_num.Length = 7 then begin
    phone_num := '757' + phone_num;
  end;
  db_members.SetPhoneNum(phone_num,e_item);
  member_id := IdOf(e_item);
  biz_notifications.IssueForPhoneNumChange
    (
    member_id,
    FirstNameOf(e_item),
    LastNameOf(e_item),
    CadNumOf(e_item),
    biz_agencies.MediumDesignatorOf(AgencyIdOfId(member_id)),
    phone_num
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
